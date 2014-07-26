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
jsdom = require("jsdom")

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
      jsdom.env html, ["http://code.jquery.com/jquery.js"], (errors, window) ->
        # console.log("contents of a.the-link:", window.$("a.the-link").text())
        created_at = 2#window.$(".submitted").text()
        content = 2#window.$(".node .content p").html()
        suspends = []
        s = new Suspend(content)
        s.created_at = created_at
        s.type = "HHH"
        suspends.push s
        suspends
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
