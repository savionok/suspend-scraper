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

class ApaCanalChisinauScraper extends WebScraper
  constructor: (@service) ->
    super @service
  get_html: (callback) ->
    request = require 'request'
    request 'http://www.acc.md/sis_apei_2.html', (error, response, body) ->
      if not error and response.statusCode == 200
        callback response
  get_suspends: (callback) ->
    console.log "My name is #{@service}"

  get_post_date: (callback, post_html) ->
    get_html (response) ->
      console.log "My name is #{response}"

  future_suspends_async: (callback) ->
    console.log "My name is #{@service}"

  # future_suspends: () =>

  talk: ->
    console.log "My name is #{@service}"

module.exports = new ApaCanalChisinauScraper('acc')
