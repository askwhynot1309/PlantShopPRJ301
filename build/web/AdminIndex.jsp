<%-- 
    Document   : AdminIndex
    Created on : Feb 22, 2023, 11:38:03 PM
    Author     : admin
--%>

<%@page import="dto.Account"%>
<%@page import="dao.AccountDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%

            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                String token = "";
                for (Cookie acookie : c) {
                    if (acookie.getName().equals("selector")) {
                        token = acookie.getValue();
                        Account acc = AccountDAO.getAccount(token);
                        if (acc != null) {
                            name = acc.getFullname();
                            email = acc.getEmail();
                            login = true;
                        }
                    }
                }

            } else {

                login = true;
            }

            if (login) {

        %>

        <header>
            <c:import url="header_loginedAdmin.jsp"></c:import>
            </header>
            <section class="right">
                <img src="images/background.jpg" style="width: 100%;height: 100%" alt=""/> 
            </section>

            <footer>
            <c:import url="footer.jsp"></c:import>
            </footer>
        <%} else {
        %>
        <c:redirect url="login.jsp"></c:redirect>
        <%
            }
        %>
    </body>
</html>
