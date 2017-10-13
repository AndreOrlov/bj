#encoding: utf-8

$:.unshift("#{File.dirname(__FILE__)}") # add source directory to path
require 'deck'
require 'constants'
include Constants

=begin rdoc
This class represents a playing card. It has a value as per
standard Blackjack rules, as well as a string representation for
printing.
=end

class Card
  attr_reader :value, :suit, :is_ace
  attr_accessor :is_hole_card

  def initialize(faceval, suit)
    raise ArgumentError.new("Face value must be one of: #{FACES * ', '}") unless Deck::FACES.include? faceval
    
    raise ArgumentError.new("Suit must be one of: #{SUITS * ', '}") unless Deck::SUITS.include? suit


    @face         = "#{faceval.to_s} #{suit}"
    @is_ace       = false
    @is_hole_card = false

    case faceval
      when 2..10
        @value = faceval
      when 'J', 'Q', 'K'
        @value = 10
      when 'A'
        @is_ace = true
        @value  = 1
    end

    @suit = suit
  end

  def to_s
    if @is_hole_card
      HOLE_CARD
    else
      @face
    end
  end
end
