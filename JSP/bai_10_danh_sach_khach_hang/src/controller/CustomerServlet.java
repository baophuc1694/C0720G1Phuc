package controller;

import customer.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"", "/listCustomer"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Sunni Hạ Linh", "01/01/1995", "HCM", "/img/h1s.jpg"));
        customerList.add(new Customer("Hoàng Yến Chibi", "04/10/1996", "HN", "/img/anh_hoang_yen.jpg"));
        customerList.add(new Customer("Amee", "10/08/2000", "HN", "/img/anh_amee.jpg"));
        customerList.add(new Customer("R Tee", "06/07/1996", "HN", "/img/anh_Rtee.jpg"));
        request.setAttribute("customer_list", customerList);
        request.getRequestDispatcher("list.jsp").forward(request,response);

    }
}
