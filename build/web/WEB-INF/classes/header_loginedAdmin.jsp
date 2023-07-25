<%-- 
    Document   : header_loginedAdmin
    Created on : Feb 22, 2023, 11:39:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <ul>
            <li><a href="MainController?action=manageAccounts"> Manage Accounts </li>
            <li><a href="ManagerOrders.jsp"> Manage Orders </li>
            <li><a href="MainController?action=managePlants"> Manage Plants </li>
            <li><a href="MainController?action=manageCategories"> Manage categories </li>
            <li>
                Welcome ${sessionScope.name} | <a href="MainController?action=logout">logout</a>
            </li>
        </ul>




    </body>
</html>
