#encoding: utf-8

require 'rspec'
require_relative '../src/hand'
require_relative '../src/card'

describe Hand do
  let(:hand) { Hand.new }
  let(:card) { Card.new(FACES[0], SUITS[0]) }
  let(:card_ace) { Card.new FACES[-1], SUITS[0] }

  it 'should right ini' do
    expect(hand.cards.empty?).to be_true
    expect(hand.value).to eq 0
    expect(hand.bet).to eq 0
  end

  it 'should right push method' do
    hand.push card

    expect(hand.cards.length).to eq 1
    expect(hand.value).to eq 2
  end

  it 'should right pop method' do
    hand.push card

    expect(hand.pop).to eq card
    expect(hand.cards.empty?).to be_true
    expect(hand.value).to eq 0
  end

  it 'should new dealt' do
    expect(hand.is_newly_dealt?).to be_false

    2.times { hand.push card }

    expect(hand.is_newly_dealt?).to be_true
  end

  it 'has ace' do
    expect(hand.has_ace?).to be_false

    hand.push card_ace

    expect(hand.has_ace?).to be_true
  end

  it 'should bust' do
    expect(hand.is_bust?).to be_false

    card = Card.new FACES[8], SUITS[0] # card "10"
    3.times { hand.push card }

    expect(hand.is_bust?).to be_true
  end

  it 'should blackjack' do
    expect(hand.is_blackjack?).to be_false

    [-1, 8].each do |face|
      hand.push Card.new(FACES[face], SUITS[0])
    end

    expect(hand.is_blackjack?).to be_true
  end

  it 'should be split' do
    expect(hand.can_be_split?).to be_false

    2.times { hand.push card_ace }

    expect(hand.can_be_split?).to be_true
  end
end