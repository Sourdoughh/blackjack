# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # deckLength = @get 'deck'
    # console.log deckLength.length

  # if this.collection.scores()[1] < this.collection.scores()[0]

  # result: ->


  finishGame: ->
    dealer = @get 'dealerHand'
    player = @get 'playerHand'
    dealer.models[0].flip()
    # console.log(dealer.scores()[2] < player.scores()[2])
    while dealer.scores()[2] < player.scores()[3] && dealer.scores()[3] < player.scores()[3]
      break if dealer.scores()[3] > 17 && dealer.scores()[3]>player.scores()[3]
      dealer.hit()
