/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import MyDAO.AccountDAO;
import Obj.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class LoginServlet extends HttpServlet {

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
            String url = "login.jsp";
            try {
                HttpSession session = request.getSession();
                Account acc = (Account) session.getAttribute("acc");
                //check session for login
                if (acc != null) {
                    //session has login info -> forward by role to page
                    request.setAttribute("mess", "Login Sucessfully");
                    if (acc.getRole() == 1) {
                        //request.getRequestDispatcher("admin.jsp").forward(request, response);
                        url = "admin.jsp";
                    } else {
                        //request.getRequestDispatcher("PlantListServlet").forward(request, response);
                        url = "PlantListServlet";
                    }

                } else {
                    //check cookie
                    Cookie c[] = request.getCookies();
                    String token = "";
                    if (c != null) {
                        //got cookies check if there is this website's cookie?
                        for (Cookie cookie : c) {
                            if (cookie.getName().equals("PlantShopLogin")) {
                                token = cookie.getValue();
                            }
                        }

                        //check if token match?
                        if (token != "") {
                            acc = AccountDAO.getAccount(token);
                            if (acc != null && acc.getStatus() == 1) {
                                //token matches -> login success
                                session.setAttribute("acc", acc);
                                request.setAttribute("mess", "Login Sucessfully");
                                if (acc.getRole() == 1) {
                                    url = "admin.jsp";
                                }
                            } else {
                                url = "PlantListServlet";
                            }
                        }
                    }

                    //no token or invalid token
                    //
                    String email = request.getParameter("txtemail");
                    String password = request.getParameter("txtpassword");
                    String rememberme = request.getParameter("rememberme");
                    if (email == null || password == null) {

                    } else {
                        request.setAttribute("temail", email);
                        String mess = "Incorrect Username and/or Password";
                        acc = AccountDAO.getAccount(email, password);
                        if (acc != null) {
                            //login success
                            if (acc.getStatus() == 1) {
                                mess = "Login Sucessfully";
                                session.setAttribute("acc", acc);
                                request.setAttribute("mess", mess);
                                if (rememberme != null) {
                                    //create token and set token in db and client
                                    token = "" + acc.getAccID() + System.currentTimeMillis();
                                    int rs = AccountDAO.setAccountToken(acc.getAccID(), token);
                                    Cookie cookie = new Cookie("PlantShopLogin", token);
                                    cookie.setMaxAge(24 * 3600);
                                    response.addCookie(cookie);
                                }
                                if (acc.getRole() == 1) {
                                    //request.getRequestDispatcher("admin.jsp").forward(request, response);
                                    url = "admin.jsp";
                                } else {
                                    //request.getRequestDispatcher("PlantListServlet").forward(request, response);
                                    url = "PlantListServlet";
                                }
                            } else {
                                mess = "This account is banned";
                                request.setAttribute("mess", mess);
                            }
                        } else {
                            request.setAttribute("mess", mess);
                            //request.getRequestDispatcher("login.jsp").forward(request, response);

                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher(url).forward(request, response);
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
