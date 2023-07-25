<%-- 
    Document   : header
    Created on : Nov 7, 2022, 4:13:25 AM
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
    <li><a href=""><img src="images/logo.jpg" id="logo"></a> </li>
    <li><a href="MainController?action=">Home</a></li>
    <li><a href="registration.jsp">Register</a></li>
    <li><a href="login.jsp" >Login</a></li>
    <li><a href="MainController?action=viewcart" >view cart</a></li>
    <li><form action="MainController" method="post" class="form">
            <input type="text" name="txtsearch" value="${param.txtsearch}">
            <select name="searchby">
                <option value="byname">by name</option>
                <option value="bycate">by category</option>
            </select>
            <input type="submit" value="search" name="action" >
        </form></li>
</body>
</html>
