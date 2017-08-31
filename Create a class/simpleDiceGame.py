import random

class Roller:
    def __init__(self):
        
        self.winner=0
        self.winnerRoll=0
        self.players=input("Rule: \nFirst player to roll the highest number wins\n\n\nHow many players?\n")
        self.dieSides=input("How many sides on the die?\n")
        print("\n")

    def roll(self):
        for i in range (0,self.players):
            roll=random.randint(0,self.dieSides)
            if self.winnerRoll<roll:
                self.winner=i
                self.winnerRoll=roll
            if roll!=12:
                print "Player ",i+1," rolled a: ",roll,"\n"
        
        print "Player ",self.winner+1, " won!"
# this is a standard Python thing: definitions go above, and any code that will actually
# run should go into the __main__ section. This way, if someone imports the file because
# they want to use the functions or classes you've defined, it won't start running your game
# automatically
if __name__ == '__main__':
    roller = Roller()
    roller.roll()