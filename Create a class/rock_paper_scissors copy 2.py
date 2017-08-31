import random

CHOICES = ['rock', 'paper', 'scissors']

class Action:
    def __init__(self, prompt):
        '''Create an action instance, either by randomly choosing the action or prompting the user.'''

        # if an action hasn't been named, choose it randomly
        if prompt is False:
            self.name = random.choice(CHOICES)
        else:
            while True:
                self.name = raw_input('Choose {}\n'.format(', '.join(CHOICES)))
                if self.name in CHOICES:
                    # the user made a valid choice, so we can stop the loop
                    break
                else:
                    # the user picked something else, so make them choose again
                    print 'Invalid action {}.'.format(self.name)

        # get the position of the choice in the list
        self.id = CHOICES.index(self.name)


    def compete(self, other_action):
        '''Compete against another action. Print out who won.'''

        if other_action.id == self.id:
            print 'Tie! Both chose {}!'.format(self.name)

        # each action is beaten by the action after it in the list
        # modulo makes it wrap around to the beginning of the list
        elif ((other_action.id + 1) % len(CHOICES)) == self.id:
            print '{} beats {}! I win!'.format(self.name.capitalize(), other_action.name)

        else:
            print '{} beats {}! You win!'.format(other_action.name.capitalize(), self.name)


# this is a standard Python thing: definitions go above, and any code that will actually
# run should go into the __main__ section. This way, if someone imports the file because
# they want to use the functions or classes you've defined, it won't start running your game
# automatically
if __name__ == '__main__':

        # Create actions for the two players, computer and user
        computer_action = Action(prompt=False)
        user_action = Action(prompt=True)

        # Have the actions play against one another
        computer_action.compete(user_action)
