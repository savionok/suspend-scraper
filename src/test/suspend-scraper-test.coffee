'use strict'

suspend_scraper = require('../lib/suspend-scraper')

describe 'Gives a list of avalabel services', ()->
  describe '#avalable_services()', ()->
    it 'returns an array with size 3', ()->
      suspend_scraper.avalable_services().should.be.
      instanceof(Array).and.have.lengthOf(3)
