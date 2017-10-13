#encoding: utf-8

require 'rspec'
require_relative '../src/card'
require_relative '../src/player'

describe Player do
  let(:card) { Card.new(FACES[0], SUITS[0]) }
  let(:player) { Player.new(0, INIT_MONEY) }
  let(:hand) { player.hands[0] }

  it 'should right ini' do
    expect(player.position).to eq 0
    expect(player.hands.length).to eq 1
    expect(player.money).to eq INIT_MONEY
  end

  it 'should bankrupt' do
    expect(player.is_bankrupt?).to be_false

    player.money = 0

    expect(player.is_bankrupt?).to be_true
  end

  it 'should set bet' do
    bet_amount = 20
    player.set_bet hand, bet_amount

    expect(hand.bet).to eq bet_amount
  end

  it 'should double down with hand' do
    expect(player.can_double_down_with_hand?(hand)).to be_false

    hand.bet = 20
    2.times { hand.push card }

    expect(player.can_double_down_with_hand?(hand)).to be_true

    hand.reset
    hand.bet = 2*INIT_MONEY
    2.times { hand.push card }

    expect(player.can_double_down_with_hand?(hand)).to be_false
  end

  it 'should reset hands' do
    player.hands.push Hand.new

    expect(player.hands.length).to eq 2

    player.reset_hands

    expect(player.hands.length).to eq 1
  end

  it 'should double down on hand' do
    expect { player.double_down_on_hand(player.hands[0]) }.to raise_error ArgumentError
  end

  it 'can split hand' do
    expect(player.can_split_hand?(hand)).to be_false

    hand.bet = 20
    2.times { hand.push card }

    expect(player.can_split_hand?(hand)).to be_true

    hand.reset
    hand.bet = player.money + 1
    2.times { hand.push card }

    expect(player.can_double_down_with_hand?(hand)).to be_false
  end

  it 'should split hand' do
    expect { player.split_hand(hand) }.to raise_error ArgumentError

    bet_amount = 20
    hand.bet = bet_amount
    2.times{ hand.push card }
    new_hand = player.split_hand hand

    expect(player.money).to eq INIT_MONEY - bet_amount
    expect(hand.bet).to eq bet_amount
    expect(new_hand.bet).to eq bet_amount
    expect(hand.cards.length).to eq 1
    expect(player.hands.length).to eq 2
  end
end