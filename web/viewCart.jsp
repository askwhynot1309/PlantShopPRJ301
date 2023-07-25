<%-- 
    Document   : viewCart
    Created on : Feb 22, 2023, 11:09:46 AM
    Author     : admin
--%>

<%@page import="dto.Plant"%>
<%@page import="dto.Cart"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
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

            <%
                String name = (String) session.getAttribute("name");

                if (name != null) {


            %>
            <h3>Welcome <%= session.getAttribute("name")%> come back</h3 >
            <h3> <a href = "MainController?action=logout"> Logout </a> </h3> 
            <h3> <a href = "personalPage.jsp" > personal page</a > </h3>

            <%
                }
            %>

            <font style = 'color:red;'><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%> </font>
            <table width="100%" class="shopping" >
                <tr>
                    <td >Product id</td>
                    <td >image</td>
                    <td >price</td>
                    <td >Quantity</td>
                    <td >action</td>                     
                </tr>


                <% double totalMoney = 0;
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart != null) {

                        for (Plant pid : cart.getCart().values()) {
                            totalMoney += pid.getQuantity() * pid.getPrice();

                %>
                <form  action="MainController" method="POST">
                    <tr>
                        <td><input type="hidden" name="pid" value="<%=pid.getId()%>" />
                            <a href="GetPlantServlet?pid=<%=pid.getId()%>"><%=pid.getId()%></a> </td>
                        <td><img src="<%=pid.getImgPath()%>" alt="<%=pid.getPrice()%>"style="width: 50px;height: 50px" /></td>
                        <td><%=pid.getPrice()%> </td>
                        <td><input type="number" name="quantity" value="<%=pid.getQuantity()%>" min="1" /> </td>
                        <td>
                            <button  value="updatecart" name="action">update</button>
                            <button  value="deletecart" name="action">delete</button>
                        </td>
                    </tr>
                </form>

                <%
                    }
                } else {

                %>
                <tr><td>Your cart is empty</td></tr>
                <%                    }
                %>

                <tr><td>Total money:<%= totalMoney%> </td></tr>
                <tr><td>Order Date: <%=(new Date()).toString()%> </td></tr>
                <tr><td>Ship Date: N/A</td></tr>
            </table>
        </section>
        <section>
            <form action="MainController" method="POST">
                <button value="saveOrder" name="action"  class="add-to-cart">Order</button>
            </form>


        </section>


        <footer>
            <%@include file="footer.jsp" %>
        </footer>



    </body>
</html>
