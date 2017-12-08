import processing.core.*;

public class Cell {
    public int x,y;//these are on the grid, not on the screen
    public boolean alive;
    private int color;
    static final float SCALE=36;
    static final float STRETCH=3;
    private float cellSize;

    PApplet parent;

    Cell(int x, int y, PApplet parent){
        this.x=x;
        this.y=y;
        this.parent=parent;
        cellSize=parent.width/SCALE/STRETCH;

        this.color=parent.color(0,100,0);
    }

    public void birth(){
        this.alive=true;
    }
    public void kill(){
        this.alive=false;
    }
    public void draw(){
        float drawX=(parent.width / SCALE) * this.x/STRETCH;
        float drawY=(parent.width / SCALE) * this.y/STRETCH;
        if(this.alive==true) {
            parent.fill(this.color);
            parent.rect(drawX, drawY, this.cellSize, this.cellSize);//x, y, width, height
        }else{
            parent.fill(255);
            parent.rect(drawX, drawY, this.cellSize, this.cellSize);//x, y, width, height
        }
    }
}
