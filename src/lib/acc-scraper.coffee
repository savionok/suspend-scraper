###

suspend-scraper
https://github.com/savionok/suspend-scraper

Copyright (c) 2014 Sava Virtosu
Licensed under the MIT license.

###
###

  ApaCanalChisinau Scrapper
  base_url: http://www.acc.md/

###

'use strict'

WebScraper = require "./web-scraper"
Suspend = require "./suspend"
request = require 'request'

class ApaCanalChisinauScraper extends WebScraper
  constructor: (@service) ->
    @service = service
  get_html: (callback) ->
    request 'http://www.acc.md/sis_apei_2.html', (error, response, body) ->
      if not error and response.statusCode == 200
        callback response
  get_suspends: (callback) ->
    @get_html (html) ->
      @suspends = []
      s = new Suspend(html.host)
      s.type = "HHH"
      @suspends.push s
      @suspends

  get_post_date: (callback, post_html) ->
    get_html (response) ->
      console.log "My name is #{response}"

  future_suspends_async: (callback) ->
    console.log "My name is #{@service}"

  future_suspends: () =>
    console.log "My name is #{@service}"

  talk: ->
    new Suspend('OLOLOLO')

module.exports = new ApaCanalChisinauScraper('acc')
