/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class MainController extends HttpServlet {

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
            String ac = request.getParameter("action");
            String url = "PlantListServlet";
            switch (ac){
                case "View all Plants":
                case "Home":
                    url = "PlantListServlet";
                    break;
                case "Login":
                    url = "LoginServlet";
                    break;
                case "Logout":
                    url = "LogoutServlet";
                    break;
                case "admin":
                    url = "admin.jsp";
                    break;
                case "RegisterAccount":
                    url = "RegisterAccountServlet";
                    break;
                case "Add Category":
                    url="AddCategory";
                    break;
                case "Update Category":
                    url="UpdateCategory";
                    break;
                case "Remove Category":
                    url="RemoveCategory";
                    break;
                case "Search":
                    url="SearchPlantServlet";
                    break;
                case "ViewPlantDetail":
                    url="ViewPlantDetailServlet";
                    break;
                case "AddToCart":
                    url="AddToCartServlet";
                    break;
                case "ViewCart":
                    url="ViewCartServlet";
                    break;
                case "UpdateItemFromCart":
                    url="UpdateCartQuantityServlet";
                    break;
                case "DeleteItemFromCart":
                    url="DeleteItemFromCartServlet";
                    break;
                case "Checkout":
                    url="CheckoutServlet";
                    break;
                case "ViewOrderHistory":
                case "FilterOrderHistoryByDate":
                    url="ViewOrderHistoryServlet";
                    break;
                case "ViewOrderDetails":
                    url="ViewOrderDetailsServlet";
                    break;
                case "CancelOrder":
                    url = "CancelOrderServlet";
                    break;
                case "Reorder":
                    url = "ReorderServlet";
                    break;
                case "Complete":
                    url = "CompleteOrderServlet";
                    break;
                case "UpdateItemFromReorder":
                    url ="UpdateItemFromOrderServlet";
                    break;
                case "DeleteItemFromReorder":
                    url = "DeleteItemFromOrderServlet";
                    break;
                case "CheckoutReorder":
                    url = "CheckoutReorderServlet";
                    break;
                case "ViewProfile":
                    url = "profile.jsp";
                    break;
                case "UpdateAccount":
                    url = "UpdateAccountServlet";
                    break;
                case "ManageAccounts":
                    url = "ManageAccountsServlet";
                    break;
                case "manageAccountDetail":
                    url = "ManageAccountDetailServlet";
                    break;
                case "ManageOrders":
                case "FilterOrdersByDate":
                case "FilterOrdersByStatus":
                case "FilterOrdersByAccID":
                    url = "ManageOrdersServlet";
                    break;
                case "ManagePlants":
                    url = "ManagePlantsServlet";
                    break;
                case "ManageCategories":
                    url = "ManageCategoriesServlet";
                    break;
                case "BlockAccount":
                case "UnblockAccount":
                    url = "BlockUnblockAccountServlet";
                    break;
                case "EditPlant":
                    url = "EditPlantServlet";
                    break;
                case "UpdatePlant":
                    url = "UpdatePLantServlet";
                    break;
                case "AddPlant":
                    url = "AddPlantServlet";
                    break;
                case "CreatePlant":
                    url = "CreatePlantServlet";
                    break;
                case "UpdateCategory":
                    url = "UpdateCategoryServlet";
                    break;
                case "CreateCategory":
                    url = "CreateCategoryServlet";
                    break;
                case "ScheduleShippingDate":
                    url = "UpdateShippingDateServlet";
                    break;
                case "ManageOrderDetails":
                    url = "ManageOrderDetailsServlet";
                    break;
            }
            System.out.println("Redirecting to: " + url);
            request.getRequestDispatcher(url).forward(request, response);
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
