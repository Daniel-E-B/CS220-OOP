import java.util.ArrayList;
import processing.core.*;
import java.lang.Math.*;

public class LifeEngine {
    ArrayList<ArrayList<Cell>>board;
    PApplet parent;
    private float xCells;
    private float yCells;

    LifeEngine(PApplet parent){
        this.board=new ArrayList<>();
        this.parent=parent;

        this.xCells=parent.width/Cell.SCALE*Cell.STRETCH;
        this.yCells=parent.height/Cell.SCALE*Cell.STRETCH;
        this.populateRandom();
    }

    private void populateRandom(){
        for(int i=0;i<yCells;++i){
            board.add(new ArrayList<>());
            for(int j=0;j<xCells;++j){
                board.get(i).add(new Cell(j, i,this.parent));

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
