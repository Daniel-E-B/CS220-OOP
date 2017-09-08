import Tkinter # built-in Python graphics library
import random
import cmath

game_objects = []

class Shape:
    def __init__(self):
        self.color = '#{0:0>6x}'.format(random.randint(00,16**6))
        self.size = random.randint(5,75)
        self.x = random.randint(0,400)
        self.y = random.randint(0,400)
        self.x_speed = random.randint(-5,5)
        self.y_speed = random.randint(-5,5)

    def update(self):
        '''Update current location by speed.'''

        self.x += self.x_speed
        self.y += self.y_speed

    def draw(self, canvas):
         canvas.create_rectangle(self.x, self.y, self.x+self.size,
        self.y+self.size, fill=self.color)
        

class Circle(Shape):
    def draw(self, canvas):
        canvas.create_oval(self.x, self.y, self.x+self.size, self.y+self.size, fill=self.color)

def addShape(event):
    global game_objects
    constructor = random.choice([Circle, Shape])
    game_objects.append(constructor())

def reset(event):
    '''Clear all game objects.'''
    global game_objects
    game_objects = []


def draw(canvas):
    '''Clear the canvas, have all game objects update and redraw, then set up the next draw.'''

    canvas.delete(Tkinter.ALL)

    global game_objects

    for l in range(0, len(game_objects)-1):
        i=game_objects[l]
        for k in range(game_objects.index(i)+1,len(game_objects)-1):
            j=game_objects[k]
            a=i.x+i.size/2-j.x+j.size/2
            b=i.y+i.size/2-j.y+i.size/2
            e=a**2+b**2
            c=cmath.sqrt(e)
            d=i.size+j.size
            if c.real<d:
                i.x_speed=i.x_speed*(-1)
                j.x_speed=j.x_speed*(-1)



                i.y_speed=i.y_speed*(-1)
                j.y_speed=j.y_speed*(-1)

        i.update()
        i.draw(canvas)
        if(i.x<0 or i.x>400 or i.y<0 or i.y>400):
             game_objects.remove(i)
             l-=1

    delay = 33 # milliseconds, so about 30 frames per second
    canvas.after(delay, draw, canvas) # call this draw function with the canvas argument again after the delay

# this is a standard Python thing: definitions go above, and any code that will actually
# run should go into the __main__ section. This way, if someone imports the file because
# they want to use the functions or classes you've defined, it won't start running your game
# automatically
if __name__ == '__main__':

    # create the graphics root and a 400x400 canvas
    root = Tkinter.Tk()
    canvas = Tkinter.Canvas(root, width=400, height=400, bg="black")
    canvas.pack()
    
    # if the user presses a key or the mouse, call our handlers
    root.bind('<Key-r>', reset)
    root.bind('<Button-1>', addShape)

    # start the draw loop
    draw(canvas)

    root.mainloop() # keep the window open

