'use strict'

suspend_scraper = require('../lib/acc-scraper')

nock = require('nock')
apacanal_response = nock('http://www.acc.md')
  .defaultReplyHeaders({
    'X-Powered-By': 'Rails',
    'Content-Type': 'text/html'
  })
  .get('/sis_apei_2.html')
  .replyWithFile(200, __dirname + '/support/apacanal.html')

describe 'Apa Canal Chisinau scraper', ()->
  describe '#get_html()', ()->
    it 'download page from oficial site', (done)->
      suspend_scraper.get_html (res)->
        res.should.be.html
        done()
  describe '#get_suspends()', ()->
    it 'returns array o', (done)->
      suspend_scraper.get_html (res)->
        res.should.be.html
        done()
  describe '#talk()', ()->
    it 'returns array o pula', ()->
      suspend_scraper.talk.should.be.ok
      s = suspend_scraper.talk()
      console.log "Object Dump=#{JSON.stringify(suspend_scraper.talk())}"
  describe '#GET()', ()->
    it 'returns array o pula', ()->
      suspend_scraper.talk.should.be.ok
      # s = suspend_scraper.get_suspends()
      console.log "ObjectDump=#{JSON.stringify(suspend_scraper.get_suspends())}"
