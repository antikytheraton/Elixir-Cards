defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "does not contains a card" do
    deck = Cards.create_deck
    assert Cards.contains?(deck, "kjshdfskdf") == false 
  end

  test "contains an ace of spades" do
    deck = Cards.create_deck
    assert Cards.contains?(deck, "Ace of Spades") == true
  end

  test "split maze" do
    deck = Cards.create_deck
    handSize = 5
    { hand, _maze } = Cards.deal(deck, handSize)
    assert length(hand) == handSize
  end

  test "test save and load a file" do
    { deck, filename } = { Cards.create_deck, "test_deck" }
    Cards.save(deck, filename)
    assert deck == Cards.load(filename)
  end

  test "does not exist file" do
    assert Cards.load("jhdkjlfsjdf") == "That file does not exist"
  end
end
