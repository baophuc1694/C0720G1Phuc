package controller;

import model.Operator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/action")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numberOne=request.getParameter("first");
        String numberTwo=request.getParameter("second");
        String action=request.getParameter("operator");
        Operator operator=new Operator(action, Double.parseDouble(numberOne),Double.parseDouble(numberTwo));
        try{
            double result=operator.calculator();
            request.setAttribute("result",String.valueOf(result));
            request.getRequestDispatcher("display.jsp").forward(request,response);
        }catch (Exception e){
            request.setAttribute("result",e.getMessage());
            request.getRequestDispatcher("display.jsp").forward(request,response);
        }
    }

}
