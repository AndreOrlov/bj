#encoding: utf-8

require 'rspec'
require_relative '../src/player'
require_relative '../src/dealer'


describe Dealer do
  let(:card) { Card.new(FACES[0], SUITS[0]) }
  let(:player) do
    player = Player.new(0, INIT_MONEY)
    player.hands[0].push card
    player
  end
  let(:players) { [player] }
  let(:dealer) { Dealer.new players }

  it 'should right ini' do
    expect { Dealer.new([]) }.to raise_error ArgumentError
  end

  it 'should reset player hands' do
    expect(player.hands[0].cards.length).to eq 1

    dealer.reset_player_hands

    expect(player.hands[0].cards.length).to eq 0
  end

  it 'should player stands with move' do
    expect(dealer.player_stands_with_move(STAND_KEY)).to be_true
    expect(dealer.player_stands_with_move(SPLIT_KEY)).to be_false
  end

  it 'should player splits with move' do
    expect(dealer.player_splits_with_move(SPLIT_KEY)).to be_true
    expect(dealer.player_splits_with_move(STAND_KEY)).to be_false
  end

  it 'should player doubles_down with move' do
    expect(dealer.player_doubles_down_with_move(DOUBLE_DOWN_KEY)).to be_true
    expect(dealer.player_doubles_down_with_move(SPLIT_KEY)).to be_false
  end

  it 'should remove bankrupt players at end of round' do
    dealer.remove_bankrupt_players_at_end_of_round

    expect(players.length).to eq 1

    player.money = 0
    dealer.remove_bankrupt_players_at_end_of_round

    expect(players.empty?).to be_true
  end

  it 'should game over because all players bankrupt' do
    player.money = 0
    dealer.remove_bankrupt_players_at_end_of_round

    expect(dealer.is_game_over?).to be_true
  end
end
