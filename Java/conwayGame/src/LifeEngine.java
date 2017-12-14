import java.util.ArrayList;
import processing.core.*;

public class LifeEngine {
    private ArrayList<ArrayList<Cell>> board;
    private PApplet parent;
    private float xCells;
    private float yCells;
    private float numCells;
    public boolean pause=false;

    LifeEngine(PApplet parent, float numCells){
        this.board=new ArrayList<>();
        this.parent=parent;
        this.numCells=numCells;

        this.xCells=this.numCells;
        this.yCells=(this.numCells/this.parent.width)*this.parent.height;

        //initialize board:
        this.init();
    }

    public void addGlider(int x, int y){
        this.board.get(y+2).get(x).birth();//bottom left
        this.board.get(y+2).get(x+1).birth();//bottom middle
        this.board.get(y+2).get(x+2).birth();//bottom right
        this.board.get(y+1).get(x+2).birth();//middle right
        this.board.get(y).get(x+1).birth();//top middle
    }

    private void init(){
        for(int i=0;i<this.yCells;++i){
            this.board.add(new ArrayList<>());
            for(int j=0;j<this.xCells;++j){
                this.board.get(i).add(new Cell(j, i,this.parent, this.numCells));
            }
        }
    }

    public void populateRandom() {
        for(ArrayList<Cell> outer : this.board){
            for(Cell cell : outer){
                //the chance of a cell being alive is 1 in 10:
                if(Math.floor(Math.random()*10)==1) {
                    cell.birth();
                }else{
                    cell.kill();
                }
            }
        }
    }

    public void updateBoard() {
        if(!pause) {
            //these are for making the game wrap around the screen
            Cell top=null, bottom=null, right=null, left=null, topRight=null, bottomRight=null,
                    topLeft=null, bottomLeft=null;
            //rule: B3 S23
            //its y then x
            Cell checkCell;
            for (int i = 1; i < this.board.size()-1; ++i) {
                for (int j = 1; j < this.board.get(i).size()-1; ++j) {

                    checkCell=this.board.get(i).get(j);
                    checkCell.neighbors=0;
                    //check top
                    if (this.board.get(i-1).get(j).alive) {
                        ++checkCell.neighbors;
                    }
                    //check bottom
                    if (this.board.get(i+1).get(j).alive) {
                        ++checkCell.neighbors;
                    }
                    //check right
                    if (this.board.get(i).get(j+1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check left
                    if (this.board.get(i).get(j-1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check top left
                    if (this.board.get(i-1).get(j-1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check top right
                    if (this.board.get(i-1).get(j+1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check bottom left
                    if (this.board.get(i+1).get(j-1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check bottom right
                    if (this.board.get(i+1).get(j+1).alive) {
                        ++checkCell.neighbors;
                    }
                }
            }
            for (ArrayList<Cell> outer : this.board) {
                for (Cell cell : outer) {
                    cell.update();
                }
            }
        }
    }

    public void drawBoard(){
        for(ArrayList<Cell> outer : this.board){
            for(Cell cell:outer){
                cell.draw();
            }
        }
    }

    public void drawInput(){
        this.board.get((int)Math.floor((this.parent.mouseY*this.numCells)/this.parent.width))
                .get((int)Math.floor((this.parent.mouseX*this.numCells)/this.parent.width)).birth();

    }

    public void deleteInput(){
        this.board.get((int)Math.floor((this.parent.mouseY*this.numCells)/this.parent.width))
                .get((int)Math.floor((this.parent.mouseX*this.numCells)/this.parent.width)).kill();
    }

    public void killAll(){
        for(ArrayList<Cell> outer : this.board){
            for(Cell cell:outer){
                cell.kill();
            }
        }
    }

}