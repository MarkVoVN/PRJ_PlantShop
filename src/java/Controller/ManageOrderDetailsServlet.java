/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import MyDAO.OrderDAO;
import MyDAO.OrderDetailDAO;
import MyDAO.PlantDAO;
import Obj.Order;
import Obj.OrderDetail;
import Obj.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class ManageOrderDetailsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int OrderID = Integer.parseInt(request.getParameter("OrderID"));
            ArrayList<OrderDetail> list = OrderDetailDAO.getOrderDetails(OrderID);
            Order o = OrderDAO.getOrderByID(OrderID);
            
            HashMap<Plant, Integer> orderDetails = new HashMap();
            int totalMoney = 0;
            int totalQuantity = 0;
            if (list==null || list.isEmpty()){
                
            } else {
                for (OrderDetail od : list) {
                    Plant p = PlantDAO.searchPlantByID(od.getPID());
                    totalMoney+= p.getPrice() * od.getQuantity();
                    totalQuantity+=od.getQuantity();
                    orderDetails.put(p, od.getQuantity());
                }
                
                
            }
            //CURRENT ISSUE: cannot compare sql DAte to java util Date
//            Date today = new Date(System.currentTimeMillis()).;
//            System.out.println("ORDER DATE: " + o.getOrderDate());
//            System.out.println("TODAY: " + today);
            String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            Boolean schedulable = o.getStatus()==1&&(o.getShipDate()==null||o.getShipDate().toString().compareTo(today)!=0);
//            Boolean reorderable = (o.getStatus()==0&&o.getOrderDate().compareTo(today)==0);
//            Boolean reorderable = (o.getStatus()==0);
            request.setAttribute("schedulable", schedulable);
//            request.setAttribute("reorderable", reorderable
            request.setAttribute("min", today);
            request.setAttribute("totalMoney", totalMoney);
            request.setAttribute("totalQuantity", totalQuantity);
            request.setAttribute("order", o);
            request.setAttribute("orderDetails", orderDetails);
            request.getRequestDispatcher("manageOrderDetails.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
