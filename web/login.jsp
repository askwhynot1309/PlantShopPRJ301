<%-- 
    Document   : login
    Created on : Nov 7, 2022, 4:15:19 AM
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
            <%@include file="header.jsp" %>
        </header>
        <section>
            <form action="MainController" method="POST">
                <font style = 'color:red;'>${requestScope.WARNING}</font>
                <table >
                    <tr>
                        <td style="padding: 10px">Email</td>
                        <td style="padding: 10px"> <input type="text" name="txtemail"/></td>
                    </tr>
                    <tr>
                        <td style="padding: 10px">Password</td>
                        <td style="padding: 10px"> <input type="password" name="txtpassword"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" ><input type="submit" name="action" value="login"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" ><input type="checkbox" name="savelogin" value="savelogin"/>Stayed signed in</td>
                    </tr>
                </table>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>

    </body>
</html>
