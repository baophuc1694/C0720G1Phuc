package model;

public class Operator {
    String action;
    double numberOne;
    double numberTwo;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public double getNumberOne() {
        return numberOne;
    }

    public void setNumberOne(double numberOne) {
        this.numberOne = numberOne;
    }

    public double getNumberTwo() {
        return numberTwo;
    }

    public void setNumberTwo(double numberTwo) {
        this.numberTwo = numberTwo;
    }

    public Operator(String action, double numberOne, double numberTwo) {
        this.action = action;
        this.numberOne = numberOne;
        this.numberTwo = numberTwo;
    }

    public double calculator() throws Exception {
        double result=0;
        if (this.action.equals("+")) result= this.numberOne+this.numberTwo;
        else if (this.action.equals("-")) result= this.numberOne-this.numberTwo;
        else if (this.action.equals("*")) result= this.numberOne*this.numberTwo;
        else {
            if (this.numberTwo==0) throw new Exception("by Zero") ;
            else result=this.numberOne/this.numberTwo;
        }
        return result;
    }
}
