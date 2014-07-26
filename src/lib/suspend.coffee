###

suspend-scraper
https://github.com/savionok/suspend-scraper

Copyright (c) 2014 Sava Virtosu
Licensed under the MIT license.

###
###

  Suspend Object

###

'use strict'

class Suspend
  # Default initialization
  constructor: (@raw_text='') ->
    # Original text from service provider site
    @raw_text = @raw_text
    @type = ''
    # Suspend perdiod and then was publicated
    @created_at = new Date
    @from = new Date('02/01/2011')
    @to = new Date('02/06/2011')

    # Address details of
    @region = 'Region'
    @city = 'City'
    @address = 'Str. Stefan Cel Mare, 132'
    @street = 'Stefan Cel Mare'
    @house_number = '132'

  suspend_period: () ->
    DAY = 1000 * 60 * 60  * 24
    Math.round((@to.getTime() - @from.getTime()) / DAY)

module.exports = Suspend
