class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

  last: ->
    lastCard = @pop()
    lastCardValue = lastCard.get 'value'
    @push lastCard
    lastCardValue

# add tests
# win condition
# win image popup
# reset on bust or win and when the game is over?
