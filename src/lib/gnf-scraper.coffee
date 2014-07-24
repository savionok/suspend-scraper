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

class GasNaturalFenosaScraper extends WebScraper
  constructor: (@url) ->
    super @url
  talk: ->
    console.log "My name is #{@name}"

module.exports = GasNaturalFenosaScraper
