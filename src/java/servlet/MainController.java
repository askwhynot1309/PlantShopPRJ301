/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHD
 */
@MultipartConfig 
public class MainController extends HttpServlet {

    private String url = "errorpage.html";

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            if (action == null || action.equals("") || action.equals("search")) {
                url = "index.jsp";
            } else if (action.equals("login")) {
                url = "LoginServlet";
            } else if (action.equals("register")) {
                url = "registerServlet";
            } else if (action.equals("logout")) {
                url = "LogoutServlet";
            } else if (action.equals("updateProfile")) {
                url = "UpdateAccountServlet";
            } else if (action.equals("addtocart")) {
                url = "AddToCartServlet";
            } else if (action.equals("viewcart")) {
                url = "viewCart.jsp";
            } else if (action.equals("updatecart")) {
                url = "UpdateCartServlet";
            } else if (action.equals("deletecart")) {
                url = "DeleteCartServlet";
            } else if (action.equals("saveOrder")) {
                url = "SaveShoppingCartServlet";
            } else if (action.equals("searchCategory")) {
                url = "ManageCategoriesServlet";
            } else if (action.equals("managePlants")) {
                url = "ManagePlantsServlet";
            } else if (action.equals("searchPlants")) {
                url = "ManagePlantsServlet";
            } else if (action.equals("updatePlant")) {
                url = "UpdatePlantsServlet";
            } else if (action.equals("createPlant")) {
                url = "CreatePlantsServlet";
            } else if (action.equals("manageAccounts")) {
                url = "ManageAccountsServlet";
            } else if (action.equals("updateStatusAccount")) {
                url = "UpdateStatusAccount";
            } else if (action.equals("searchAccount")) {
                url = "ManageAccountsServlet";
            } else if (action.equals("updateCategory")) {
                url = "UpdateCategoryServlet";
            } else if (action.equals("createCategory")) {
                url = "CreateCategoryServlet";
            } else if (action.equals("manageCategories")) {
                url = "ManageCategoriesServlet";
            }
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
