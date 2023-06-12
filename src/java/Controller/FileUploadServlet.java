/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import MyDAO.CategoryDAO;
import MyDAO.PlantDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author User
 */
public class FileUploadServlet extends HttpServlet {

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
            
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            
            if (isMultipart){

                // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // Configure a repository (to ensure a secure temp location is used)
                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // Parse the request
                List<FileItem> items = upload.parseRequest( request);
                String itemName = "";
                Iterator<FileItem> iter = items.iterator();
                HashMap<String, String> formFieldList = new HashMap();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();

                    if (item.isFormField()) {
                        formFieldList.put(item.getFieldName(), item.getString());
                    } else {
                        itemName = item.getName();
                        String fileName = itemName.substring(itemName.lastIndexOf("\\") + 1);
                        System.out.println("name" + itemName);
                        System.out.println("path " + fileName);
                        
                        String realPathTemp = getServletContext().getRealPath("/") + "image\\" + fileName;
                        String realPathPerm = "D:\\code\\PRJ\\PlantShop\\web\\image\\" + fileName;
                        
                        if (!itemName.isEmpty()){
                            File savedFile = new File(realPathTemp);
                            item.write(savedFile);
                            savedFile = new File(realPathPerm);
                            item.write(savedFile);
                        }
                        
                    }
                    System.out.println("Running");
                }
            String action = formFieldList.get("action");
            String name = formFieldList.get("Pname");
            String imagePath = formFieldList.get("PimagePath");
            String des = formFieldList.get("Pdescription");
            int price = Integer.parseInt(formFieldList.get("Pprice"));
            String cate = formFieldList.get("Pcategory");
            int status = Integer.parseInt(formFieldList.get("Pstatus"));
            int cateID = CategoryDAO.getCateIDByName(cate);
                System.out.println("data saved");
            if ("UpdatePlant".equals(action)){
                int pid = Integer.parseInt(formFieldList.get("pid"));
                int rs = PlantDAO.updatePlant(pid, name, price, imagePath, des, status, cateID);
            } else {
                int rs = PlantDAO.createPlant(name, price, imagePath, des, status, cateID);
            }
                System.out.println("redirecting");
            request.getRequestDispatcher("ManagePlantsServlet").forward(request, response);
            }
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
