import random

class Dealer:
    def __init__(self):
        self.cards = ['2','3','4','5','6','7','8','9','10','Jack',
        'Queen','King','Ace']
        
        self.winner=0
        self.winnerCard=0
        self.players=input("Rule: \nFirst player to get the highest card wins\n\n\nHow many players?\n")
        print("\n")

    def deal(self):
        for i in range (0,self.players):
            card=random.randint(0,12)
            if self.winnerCard<card:
                self.winner=i
                self.winnerCard=card
            if card!=12:
                print "Player ",i+1," got a: ",self.cards[card],"\n"
            else:
                print "Player ",i+1," got an: ",self.cards[card],"\n"
        print "Player ",self.winner+1, " won!"
# this is a standard Python thing: definitions go above, and any code that will actually
# run should go into the __main__ section. This way, if someone imports the file because
# they want to use the functions or classes you've defined, it won't start running your game
# automatically
if __name__ == '__main__':
    dealer = Dealer()
    dealer.deal()