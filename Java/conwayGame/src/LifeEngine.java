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
            ArrayList<Cell>above=new ArrayList<>();
            ArrayList<Cell>below=new ArrayList<>();
            ArrayList<Cell>left=new ArrayList<>();
            ArrayList<Cell>right=new ArrayList<>();
            //rule: B3 S23
            //its y then x
            Cell checkCell;
            for (int i = 0; i < this.board.size(); ++i) {
                for (int j = 0; j < this.board.get(i).size(); ++j) {

                    right.clear();
                    left.clear();
                    above.clear();
                    below.clear();

                    if(i>0&&i<this.board.size()-1){//above and below are normal
                        above=this.board.get(i-1);//at y=i-1, get all x
                        below=this.board.get(i+1);
                    } else if (i==this.board.size()-1){//if the cell is on the bottom
                        above=this.board.get(i-1);//the row above is is just the row above it
                        below = this.board.get(0);//the row below it is the top of the screen
                    } else if (i==0){//if the cell is on the top
                        above = this.board.get(this.board.size()-1);//the row above it is on the bottom
                        below = this.board.get(i+1);//the row below it is just the row below it
                    }

                    if(j > 0 && j < this.board.get(i).size()-1){//if there is space to right and left
                        for(int k = 0; k<this.board.get(j).size();++k) {
                            right.add(this.board.get(k).get(j+1));//at x=i+1, get all y
                            left.add(this.board.get(k).get(j-1));
                        }
                    } else if (j==this.board.get(i).size()-1){//if the cell is on the right
                        for(int k = 0; k<this.board.get(j).size();++k) {
                            right.add(this.board.get(k).get(0));//the column on the far left of the screen. for x=0, get all y
                            left.add(this.board.get(k).get(j-1));//just the column to the left
                        }
                    } else if (j==0){//if the cell is on the left
                        for(int k = 0; k<this.board.get(j).size();++k) {
                            right.add(this.board.get(k).get(j+1));//just the column to the right
                            left.add(this.board.get(k).get(this.board.get(k).size()));//the column on the far right of the screen.
                        }
                    }

                    //System.out.println(j+" "+this.board.get(i).size()+" "+i+" "+this.board.size());
                    checkCell=this.board.get(i).get(j);
                    checkCell.neighbors=0;
                    //check top
                    if (this.board.get(i - 1).get(j).alive) {
                        ++checkCell.neighbors;
                    }
                    //check bottom
                    if (this.board.get(i + 1).get(j).alive) {
                        ++checkCell.neighbors;
                    }
                    //check right
                    if (this.board.get(i).get(j + 1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check left
                    if (this.board.get(i).get(j - 1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check top left
                    if (this.board.get(i - 1).get(j - 1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check top right
                    if (this.board.get(i - 1).get(j + 1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check bottom left
                    if (this.board.get(i + 1).get(j - 1).alive) {
                        ++checkCell.neighbors;
                    }
                    //check bottom right
                    if (this.board.get(i + 1).get(j + 1).alive) {
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