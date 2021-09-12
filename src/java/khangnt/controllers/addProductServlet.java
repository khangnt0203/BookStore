/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangnt.controllers;

import com.sun.org.apache.bcel.internal.generic.F2D;
import khangnt.DAO.ProductDAO;
import khangnt.DTO.ProductDTO;
import khangnt.DTO.ProductErrorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "addProductServlet", urlPatterns = {"/addProductServlet"})
public class addProductServlet extends HttpServlet {

    private final String ERROR = "ProductController";
    private final String SUCCESS = "ProductController";

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
        throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR;
        boolean isERROR = false;
        ProductErrorDTO error = new ProductErrorDTO();
        try {
            String idproduct = request.getParameter("idproduct");
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String priceString = request.getParameter("price");
            String quantityString = request.getParameter("quantity");
            float price = Float.parseFloat(priceString);
            int quantity = Integer.parseInt(quantityString);
            String author = request.getParameter("author");
            String description = request.getParameter("description");
            String categoryID = request.getParameter("idcategory");
            
            if(idproduct.length() < 3 || idproduct.length() > 10){
                isERROR = true;
                error.setProductIDError("Product ID must [3..10]!");
            }
            
            if(!name.matches("^[a-zA-Z]+$")){
                isERROR = true;
                error.setProductNameError("Product name can not number!");
            }
            
            if(name.length() < 2 || name.length() > 50){
                isERROR = true;
                error.setProductNameError("Full name musst be []2..50");
            }
            
            if(image.length() < 5 || image.length() >200){
                isERROR = true;
                error.setImgError("Image must not exceed 200 charac");
            }
            
            if(price < 0){
                isERROR = true;
                error.setPriceError("Product ID must [3..10]!");
            }
            
            if(quantity < 0 || quantity > 100)
            {
                isERROR = true;
                error.setQuantityError("Quantity can't be negative and should be more 100");
            }
            
            if(author.length() < 2 || author.length() > 50){
                isERROR = true;
                error.setAuthorError("Autor must [2..50]");
            }
            if(description.length() < 3 || description.length() > 200){
                isERROR = true;
                error.setDescriptionError("description musst [3..200]");
            }
            
            if(isERROR){
                request.setAttribute("ERROR_PRODUCT", error);
            }else{
                ProductDAO dao = new ProductDAO();
                ProductDTO dto = new ProductDTO(idproduct, name, image, author, description, price, quantity, categoryID);
                dao.insertProduct(dto);
                url = SUCCESS;
            }
            
            
        } catch (Exception e) {
            if (e.toString().contains("duplicate")){
                error.setProductIDError("Product ID is existed!");
                request.setAttribute("ERROR_PRODUCT", error);
            }
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
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
