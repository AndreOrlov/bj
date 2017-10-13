#encoding: utf-8

require 'rspec'
require_relative '../src/card'

describe Card do
  it 'should rights arguments' do
    #card = Card.new 'random_string', SUITS[0]
    expect { Card.new 'random_string', SUITS[0] }.to raise_error ArgumentError
  end

  it 'should accept suit and value when building' do
    card = Card.new FACES[0], SUITS[0]
    expect(card.value).to eq FACES[0]
    expect(card.suit).to eq SUITS[0]
  end

  it 'should have a value of 10 for facecards' do
    ['J', 'Q', 'K'].each do |facecard|
      card = Card.new facecard, SUITS[0]
      expect(card.value).to eq 10
    end
  end

  it 'should ace' do
    card = Card.new FACES[-1], SUITS[0]
    expect(card.is_ace).to be true
  end
end
