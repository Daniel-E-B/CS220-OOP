import java.util.ArrayList;
import processing.core.*;

public class LifeEngine {
    ArrayList<ArrayList<Cell>>board;
    private PApplet parent;
    private float xCells;
    private float yCells;
    private float numCells=100.f;

    LifeEngine(PApplet parent){
        this.board=new ArrayList<>();
        this.parent=parent;

        this.xCells=this.numCells;
        this.yCells=(this.numCells/this.parent.width)*this.parent.height;
        this.populateRandom();
    }

    private void populateRandom(){
        for(int i=0;i<yCells;++i){
            board.add(new ArrayList<>());
            for(int j=0;j<xCells;++j){
                board.get(i).add(new Cell(j, i,this.parent, this.numCells));

                //the chance of a cell being alive is 1 in 10:
                if(Math.ceil(Math.random()*10)==1) {
                    board.get(i).get(j).birth();
                }else{
                    board.get(i).get(j).kill();
                }
            }
        }
    }

    public void updateBoard(){

    }

    public void drawBoard(){
        for(ArrayList<Cell> outer : this.board){
            for(Cell cell:outer){
                cell.draw();
            }
        }
    }
}
