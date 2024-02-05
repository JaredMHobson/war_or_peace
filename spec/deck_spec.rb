require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  let(:card1) { Card.new(:diamond, 'Queen', 12) }
  let(:card2) { Card.new(:spade, '3', 3) }
  let(:card3) { Card.new(:heart, 'Ace', 14) }
  let(:card4) { Card.new(:club, '5', 5) }
  let(:cards) { [card1, card2, card3] }
  let(:deck) { Deck.new(cards) }
  it 'exists' do
    expect(deck).to be_an_instance_of(Deck)
  end

  it 'can have cards' do
    expect(deck.cards).to eq([card1, card2, card3])
  end

  it 'can tell the rank of a specific card in your deck' do
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it 'can tell you which cards have a value of 11 or greater' do
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it 'can tell you the percent of high ranking cards in the deck' do
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it 'can remove the top card from the deck' do
    deck.remove_card

    expect(deck.cards).to eq([card2, card3])
  end

  it 'can add a card to the bottom of the deck' do
    deck.add_card(card4)

    expect(deck.cards).to eq([card1, card2, card3, card4])
  end
end