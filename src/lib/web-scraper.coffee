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

GasnaturalfenosaScrapper = require "./gnf-scraper"
ApaCanalChisinauScraper = require "./acc-scraper"

class WebScraper
  constructor: (@service) ->
    # makeScrapper(@service)
    # @request = require("request")
    @response_html = ""

  parse: () ->
    console.log('parse')
  parse_url: () ->
    console.log('parse '+@url)
  get_html: ->
    console.log "My name is #{@service}"
  future_suspends: () ->
    gnf = new GasnaturalfenosaScrapper(service)
    acc = new ApaCanalChisinauScraper(service)

    services = [ gnf, acc ]

    suspends = (s.future_suspends() for s in services)
    return suspends

  # ScraperFactory
  makeScraper: (service) ->
    switch service
      when "gnf" then new GasnaturalfenosaScrapper(service)
      when "acc" then new ApaCanalChisinauScraper(service)
      when "all" then self

module.exports = WebScraper
