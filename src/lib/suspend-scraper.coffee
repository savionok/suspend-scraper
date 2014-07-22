###

suspend-scraper
https://github.com/savionok/suspend-scraper

Copyright (c) 2014 Sava Virtosu
Licensed under the MIT license.

###

'use strict'


class WebScraper
  constructor: (@url) ->
    makeScrapper(@url)

  parse: () ->
    console.log('parse')
  parse_url: () ->
    console.log('parse '+@url)

  # ScraperFactory
  makeScraper: (url) ->
    base_url = filename.match /\.(\w*)$/ #GET URL BASE
    switch base_url
      when "gasnaturalfenosa.md" then new GasnaturalfenosaScrapper
      when "apa.md" then new GasnaturalfenosaScrapper


###
Gives you a list of planed suspend for diferent services poviders
'acc' - Apa Canal Chisinau - http://www.acc.md/
'gnf' - Gas Natural Fenosa - http://www.gasnaturalfenosa.md/
'all' - All avalable services in scraper
@param  {String} ['acc' || 'gnf' || 'all']
@return {String}
###
exports.future_suspends = (@for = 'all')->
  WebScraper.get_future_suspends_for(@all)
###
Gives a list of avalable services
@return {String}
###
exports.avalable_services = (@for = 'all')->
  [ "'acc' - Apa Canal Chisinau - http://www.acc.md/",
  "'gnf' - Gas Natural Fenosa - http://www.gasnaturalfenosa.md/",
  "'all' - All avalable services in scraper"]
