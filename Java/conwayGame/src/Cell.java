import processing.core.*;

public class Cell {
    private int x,y;//these are on the grid, not on the screen
    public boolean alive;
    private int color;
    private float cellSize;
    private float numCells;
    public int neighbors=0;

    private PApplet parent;

    Cell(int x, int y, PApplet parent, float numCells){
        this.x=x;
        this.y=y;
        this.parent=parent;
        cellSize=this.parent.width/numCells;
        this.numCells=numCells;
        this.kill();

        this.color=parent.color(0,100,0);
    }

    public void birth(){
        this.alive=true;
    }
    public void kill(){
        this.alive=false;
    }
    public void draw(){
        float drawX=(this.parent.width / this.numCells) * this.x;
        float drawY=(this.parent.width / this.numCells) * this.y;
        if(this.alive==true) {
            parent.fill(this.color);
            parent.rect(drawX, drawY, this.cellSize, this.cellSize);//x, y, width, height
        }else{
            parent.fill(255);
            parent.rect(drawX, drawY, this.cellSize, this.cellSize);//x, y, width, height
        }
    }
    public void update(){
        if (this.neighbors==3) {
            this.birth();
        } else if(this.neighbors<=1||this.neighbors>=4) {
            this.kill();
        }
    }
}