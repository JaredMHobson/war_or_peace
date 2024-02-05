require './lib/player'
require './lib/deck'
require './lib/card'

RSpec.describe Player do
  let(:card1) { Card.new(:diamond, 'Queen', 12) }
  let(:card2) { Card.new(:spade, '3', 3) }
  let(:card3) { Card.new(:heart, 'Ace', 14) }
  let(:card4) { Card.new(:club, '5', 5) }
  let(:cards) { [card1, card2, card3] }
  let(:deck) { Deck.new(cards) }
  let(:player) { Player.new('Clarisa', deck) }
  it 'exists' do
    expect(player).to be_an_instance_of(Player)
  end

  it 'has a name' do
    expect(player.name).to eq('Clarisa')
  end

  it 'has a deck' do
    expect(player.deck).to eq(deck)
  end

  it 'hasnt lost by default' do
    expect(player.has_lost?).to be false
  end

  it 'can lose when it has no cards' do
    player.deck.remove_card
    expect(player.has_lost?).to be false

    player.deck.remove_card
    expect(player.has_lost?).to be false
    
    player.deck.remove_card
    expect(player.has_lost?).to be true
  end
end
