<%-- 
    Document   : header_loginedUser
    Created on : Nov 7, 2022, 9:07:21 PM
    Author     : SHD
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
        <header>
            <ul>
                <li><a href="index.jsp"> Home </li>
                <li><a href="profile.jsp"> Change Profile </li>
                <li><a href="personalPage.jsp?status=completed"> Complete Orders </li>
                <li><a href="personalPage.jsp?status=Canceled"> Canceled Orders </li>
                <li><a href="personalPage.jsp?status=Processing"> Processing Orders</a>  </li>
                <li>
                    <form action="personalPage.jsp" method="POST">
                        from<input type="date" name="from" required=""> to <input type="date" name="to" required="">
                        <input type="submit" value="search">
                    </form>
                </li>
            </ul>
        </header>
    </body>
</html>
