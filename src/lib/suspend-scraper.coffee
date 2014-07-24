###

suspend-scraper
https://github.com/savionok/suspend-scraper

Copyright (c) 2014 Sava Virtosu
Licensed under the MIT license.

###

'use strict'

WebScraper = require "./web-scraper"

###
Gives you a list of planed suspend for diferent services poviders
'acc' - Apa Canal Chisinau - http://www.acc.md/
'gnf' - Gas Natural Fenosa - http://www.gasnaturalfenosa.md/
'all' - All avalable services in scraper
@param  {String} ['acc' || 'gnf' || 'all']
@return {String}
###
exports.future_suspends = (@service = 'all')->
  web_scraper = WebScraper(@service)
  web_scraper.get_future_suspends
###
Gives a list of avalable services
@return {String}
###
exports.avalable_services = (@for = 'all')->
  [ "acc - Apa Canal Chisinau - http://www.acc.md/",
  "gnf - Gas Natural Fenosa - http://www.gasnaturalfenosa.md/",
  "all - All avalable services in scraper"]
