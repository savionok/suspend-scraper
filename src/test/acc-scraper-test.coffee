'use strict'

suspend_scraper = require('../lib/acc-scraper')

# nock = require('nock')
# apacanal_response = nock('http://www.acc.md/sis_apei_2.html')
#   .get('/').replyWithFile(200, __dirname + '/support/apacanal.html')

describe 'Apa Canal Chisinau scraper', ()->
  describe '#get_html()', ()->
    it 'download page from oficial site', (done)->
      suspend_scraper.get_html (res)->
        res.should.be.html
        done()
