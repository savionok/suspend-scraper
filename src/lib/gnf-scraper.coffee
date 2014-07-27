###

suspend-scraper
https://github.com/savionok/suspend-scraper

Copyright (c) 2014 Sava Virtosu
Licensed under the MIT license.

###
###

  Gasnaturalfenosa Scrapper
  url: http://www.gasnaturalfenosa.md/

###

'use strict'

WebScraper = require "./web-scraper"
Suspend = require "./suspend"
request = require 'request'
cheerio = require 'cheerio'

target_url = "http://www.gasnaturalfenosa.md/news/pentru-mbun-t-
irea-serviciilor-prestate-clien-ilor-cs-red-union-fenosa-sa-anun-c-miercuri-30-iu"

class GasNaturalFenosaScraper extends WebScraper
  constructor: (service) ->
    @service = service
  get_html: (callback) ->
    request target_url , (error, response, body) ->
      if not error and response.statusCode == 200
        callback response
      else
        callback error
  get_suspends: (callback) ->
    @get_html (html) ->
      # callback html
      $ = cheerio.load(html.body)

      # hack around to make a date from string
      created_at = $(".submitted").text()
      dateParts = created_at.split(".")
      created_at = new Date(dateParts[2], (dateParts[1] - 1), dateParts[0])

      content = $(".node .content p").html()
      suspends = []
      $(".node .content p").html().match(/(<strong>[1-9].)(?:[^])*?(<br>)/gi).forEach (title_of_entry) ->

        title = title_of_entry.match("(</strong><strong>)(?:[^])*?(:)")
        title = title[0] if title

        details_per_entity = $(".node .content p").html().match("(#{title})(?:[^])*?(<br>\\n&#xA0)", "gi")
        details_per_entity = details_per_entity[0] if details_per_entity

        region = title_of_entry.match("(</strong><strong>)(?:[^])*?(,|:)")
        region = region[0].toString().replace("</strong><strong>", "").replace(",","").replace(":","") if region

        locality = title_of_entry.match(/\.\s{1}(.+):/)
        locality = locality[1] if locality


        details_per_entity.split("s.").forEach (village) ->
          #streets of the title
          if village and village.indexOf("<strong>") > -1
            index = 0
            village.split("str.").forEach (street) ->
              if index == 0
                return
              # street.split(",")

              s = new Suspend(details_per_entity)

              s.region = region
              s.locality = locality || region
              s.created_at = created_at
              # |(str-le)|(str\s)
              #  str-le str -le str str.
              s.test = village.match(/(.+)(-)|(.+)(,)|(.+)(:)/)
              s.type = "gnf"
              suspends.push s
          else
            s = new Suspend(details_per_entity)

            s.region = region
            s.locality = locality || region
            s.created_at = created_at
            # |(str-le)|(str\s)
            #  str-le str -le str str.
            s.test = village.match(/(.+)(-)|(.+)(,)|(.+)(:)/)
            s.type = "gnf"
            suspends.push s

      callback suspends

  get_post_date: (callback, post_html) ->
    get_html (response) ->
      console.log "My name is #{response}"

  future_suspends_async: (callback) ->
    console.log "My name is #{@service}"

  future_suspends: () =>
    console.log "My name is #{@service}"

  talk: ->
    new Suspend('OLOLOLO')

module.exports = new GasNaturalFenosaScraper('gnf')
