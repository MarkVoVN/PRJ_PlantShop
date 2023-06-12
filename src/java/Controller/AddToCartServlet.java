/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class AddToCartServlet extends HttpServlet {

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
            int pid = Integer.parseInt(request.getParameter("pid"));
            HttpSession session = request.getSession();
            HashMap<Integer, Integer> cart =(HashMap<Integer, Integer>) session.getAttribute("cart");
            if (request.getParameter("quantity")!=null){
                int quan = Integer.parseInt(request.getParameter("quantity"));
                if (quan > 0){
                    
                    if (cart == null){
                        //has never purchased before
                        //create new cart for this user
                        cart = new HashMap();
                        cart.put(pid, quan);
                    } else {
                        //has a cart
                        Integer t = cart.get(pid);
                        if (t==null){
                            //cart has no item with id pid
                            cart.put(pid, quan);
                        } else {
                            //cart already has item pid, increment counter
                            cart.put(pid, t+quan);
                        }
                        
                    }
                }
            } else {
                if (cart == null){
                    //has never purchased before
                    //create new cart for this user
                    cart = new HashMap();
                    cart.put(pid, 1);
                } else {
                    //has a cart
                    Integer t = cart.get(pid);
                    if (t==null){
                        //cart has no item with id pid
                        cart.put(pid, 1);
                    } else {
                        //cart already has item pid, increment counter
                        cart.put(pid, t+1);
                    }

                }
                
            }
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("PlantListServlet").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
