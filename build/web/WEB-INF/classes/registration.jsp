<%-- 
    Document   : registration
    Created on : Nov 7, 2022, 4:15:55 AM
    Author     : SHD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>

            <form action="MainController" method="POST" class="form">
                <h1> Register </h1>
                <table class="table2">
                    <tr>
                        <td>Email</td>
                        <td><input type="text" value="${requestScope.txtemail}" name="txtemail" required="" pattern="[a-zA-Z0-9]+@[a-zA-Z]+[.]+[a-zA-Z]+"  ></td>
                    </tr>
                    <tr>
                        <td>Full name</td>
                        <td><input type="text" value="${requestScope.txtfullname}" name="txtfullname" required ></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword" required ></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" value="${requestScope.txtphone}" name="txtphone" required >
                            ${requestScope.ERROR}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1"></td>
                        <td><input type="submit" value="register" name="action"></td>
                    </tr>
                </table>

            </form> 


        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>



    </body>
</html>
