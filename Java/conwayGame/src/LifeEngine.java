import java.util.ArrayList;
import processing.core.*;

public class LifeEngine {
    private ArrayList<ArrayList<Cell>> board;
    private PApplet parent;
    private float xCells;
    private float yCells;
    private float numCells;

    LifeEngine(PApplet parent, float numCells){
        this.board=new ArrayList<>();
        this.parent=parent;
        this.numCells=numCells;

        this.xCells=this.numCells;
        this.yCells=(this.numCells/this.parent.width)*this.parent.height;
        this.addGlider(1,1);
        //this.populateRandom();
    }

    public void addGlider(int x, int y){
        //coordinate is top left corner
        if(x<this.board.get(y).size()-3&&x>1&&y<this.board.get(y).size()-3&&y>1){
            this.board.get(y+2).get(x).birth();//bottom left
            this.board.get(y+2).get(x+1).birth();//bottom middle
            this.board.get(y+2).get(x+2).birth();//bottom right
            this.board.get(y+1).get(x+2).birth();//middle right
            this.board.get(y).get(x+1).birth();//top middle
        }else{
            this.parent.println("Bad coordinates for glider");
        }
    }

    private void populateRandom(){
        for(int i=0;i<this.yCells;++i){
            this.board.add(new ArrayList<>());
            for(int j=0;j<this.xCells;++j){
                this.board.get(i).add(new Cell(j, i,this.parent, this.numCells));

                //the chance of a cell being alive is 1 in 10:
                if(Math.ceil(Math.random()*10)==1) {
                    this.board.get(i).get(j).birth();
                }else{
                    this.board.get(i).get(j).kill();
                }
            }
        }
    }

    public void updateBoard (){
        //using indexes instead of for each in, because we need to access the members next to the cell
        //rule: B3 S23
        int neighbors = 0;
        //ignore edges--its one way of doing it. flooring because stuff might not be a whole #
        //its y then x
        for(int i=1;i<this.board.size()-1;++i){
            for(int j=1;j<this.board.get(i).size()-1;++j){
                //System.out.println(j+" "+this.board.get(i).size()+" "+i+" "+this.board.size());
                neighbors=0;
                //check top
                if(this.board.get(i-1).get(j).alive==true){
                    ++neighbors;
                }
                //check right
                if(this.board.get(i).get(j+1).alive==true){
                    ++neighbors;
                }
                //check bottom
                if(this.board.get(i+1).get(j).alive==true){
                    ++neighbors;
                }
                //check left
                if(this.board.get(i).get(j-1).alive==true){
                    ++neighbors;
                }
                if(neighbors==3){
                    this.board.get(i).get(j).birth();
                }else if(neighbors==0||neighbors==1||neighbors==4){
                    this.board.get(i).get(j).kill();
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
}
