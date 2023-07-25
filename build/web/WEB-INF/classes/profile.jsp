<%-- 
    Document   : profile
    Created on : Feb 20, 2023, 10:22:43 AM
    Author     : admin
--%>

<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            Account acc = (Account) session.getAttribute("user");

            if (acc == null) {
        %>
        <p><font color="red">You must login to view personal page</font></p>
        <p></p>
        <%
        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= acc.getFullname()%> come back </h3>
            <h3><a href="MainController?action=logout">Logout</a></h3>
        </section>

        <section>

            <form action="MainController" method="POST" class="form">
                <h1> Update </h1>
                <table class="table2">
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="txtemail" required="" value="<%=acc.getEmail()%>" readonly="" ></td>
                    </tr>
                    <tr>
                        <td>Full name</td>
                        <td><input type="text" name="txtfullname" required="" value="<%=acc.getFullname()%>" ></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword" required="" value="<%=acc.getPassword()%>" readonly="" ></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="txtphone" required="" value="<%=acc.getPhone()%>"></td>
                    </tr>
                    <tr>
                        <td colspan="1"></td>
                        <td>
                            <button value="updateProfile" name="action">update</button>
                        </td>
                    </tr>
                </table>

            </form> 

            ${requestScope.MESSAGE}
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%}%>


    </body>
</html>
