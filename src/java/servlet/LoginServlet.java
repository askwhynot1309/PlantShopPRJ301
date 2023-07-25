/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import dto.Account;
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
 * @author SHD
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
    private static final String ERROR = "invalid.html";
    private static final String US = "FPTU";
    private static final String USER_PAGE = "welcome.html";
    private static final String AD = "ADMIN";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String USER_PAGE_INFO = "personalPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String savelogin = request.getParameter("savelogin");

            Account acc = null;
            try {
                if (email == null || email.equals("") || password == null || password.equals("")) {
                    Cookie[] c = request.getCookies();
                    String token = "";
                    if (c != null) {
                        for (Cookie acookie : c) {
                            if (acookie.getName().equals("selector")) {
                                token = acookie.getValue();
                            }
                        }
                    }
                    if (token.equals("ADMIN")) {
                        response.sendRedirect("MainController?action=manageAccounts");
                    } else if (token.equals("USER")) {
                        response.sendRedirect("personalPage.jsp");
                    } else {
                        response.sendRedirect("errorpage.html");
                    }
                } else {
                    acc = AccountDAO.checkLogin(email, password);

                    if (acc != null) {
                        if (acc.getStatus()==0) {
                            response.sendRedirect("errorpage.html");
                        }
                        if (acc.getRole() == 1) {

                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("name", acc.getFullname());
                                session.setAttribute("user", acc);
                                session.setAttribute("email", email);

                                if (savelogin != null) {
                                    String token = "ADMIN";
                                    AccountDAO.updateToken(token, email);
                                    Cookie cookies = new Cookie("selector", token);
                                    cookies.setMaxAge(60 * 2);
                                    response.addCookie(cookies);
                                }
                                response.sendRedirect("MainController?action=manageAccounts");
                            }

                        } else {
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("name", acc.getFullname());
                                session.setAttribute("user", acc);
                                session.setAttribute("email", email);

                                if (savelogin != null) {
                                    String token = "USER";
                                    AccountDAO.updateToken(token, email);
                                    Cookie cookies = new Cookie("selector", token);
                                    cookies.setMaxAge(60 * 2);
                                    response.addCookie(cookies);
                                }
                                response.sendRedirect("personalPage.jsp");
                            }

                        }
                    } else {

                        response.sendRedirect("errorpage.html");
                    }

                }

            } catch (Exception e) {
                e.printStackTrace();
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
