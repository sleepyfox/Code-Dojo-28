should = require('chai').should()

describe 'An empty pint glass', ->
  it 'should contain no liquid', ->
    glass.volume.should.equal EMPTY
