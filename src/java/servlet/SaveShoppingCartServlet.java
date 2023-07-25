/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.OrderDAO;
import dto.Cart;
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
 * @author admin
 */
public class SaveShoppingCartServlet extends HttpServlet {

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

            HttpSession session = request.getSession(false);
            if (session != null) {
                String name = (String) session.getAttribute("name");
                String email = (String) session.getAttribute("email");
               Cart cart = (Cart) session.getAttribute("cart");
                if (cart != null ) {
                    if (name == null || name.equals("")) {
                        request.setAttribute("WARNING", "you must login to finish the shopping");
                        request.getRequestDispatcher("viewCart.jsp").forward(request, response);
                    } else {
                        boolean result = OrderDAO.insertOrder(email, cart.getCart());
                        if (result) {
                            session.setAttribute("cart", null);
                            request.setAttribute("WARNING", "save your cart sucessfully");
                            request.getRequestDispatcher("viewCart.jsp").forward(request, response);
                        } 
                    }
                } else {

                    request.setAttribute("WARNING", "your cart is empty");
                    request.getRequestDispatcher("viewCart.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
