#encoding: utf-8

require 'rspec'
require_relative '../src/deck'

describe Deck do
  let(:deck) { Deck.new }

  it 'should right ini' do
    expect(deck.cards.length).to eq 52
  end

  it 'new should not empty' do
    expect(deck.empty?).to be_false
  end

  it 'should pop method' do
    deck.pop
    expect(deck.cards.length).to eq 51
  end

  it 'should pop to emtpy deck' do
    until deck.cards.empty?
      deck.pop
    end

    expect(deck.empty?).to be_true
    expect(deck.pop).not_to be_nil
  end
end
