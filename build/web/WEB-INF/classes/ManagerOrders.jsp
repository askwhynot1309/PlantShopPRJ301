<%-- 
    Document   : ManagerOrders
    Created on : Feb 25, 2023, 5:33:32 PM
    Author     : admin
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="dto.Order"%>
<%@page import="java.util.ArrayList"%>
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
        <header>
            <c:import url="header_loginedAdmin.jsp"></c:import>
            </header>
            <section class="right">
                <form action="ManagerOrders.jsp" method="get">
                    from<input type="date" name="from" value="${param.from}" > to <input type="date" name="to" value="${param.to}" ><br>
                    Account ID <input type="text" name="txtSearch" value="${param.txtSearch}" />
                <input type="submit" value="search">
            </form>
            <h1></h1>

            <%
                String from = request.getParameter("from");
                String to = request.getParameter("to");
                String txtSearch = request.getParameter("txtSearch");
                String[] status = {"", "Processing", "completed", "Canceled"};
                ArrayList<Order> list = OrderDAO.getOrders("%%", 0, from, to, txtSearch);
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {

            %>

            <table class="order" >
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Ship Date</th>
                        <th>Order's Status</th>
                        <th>Account ID</th>
                        <th>action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=ord.getOrderID()%></td>
                        <td><%=ord.getOrderDate()%></td>
                        <td><%=ord.getShipDate()%></td>
                        <td><%=status[ord.getStatus()]%></td>
                        <td><%=ord.getAccID()%></td>
                        <td><a href="orderDetail.jsp?orderid=<%=ord.getOrderID()%>">detail</a> </td>

                    </tr>
                </tbody>
            </table>
            <%
                }
            } else {

            %>
            <p>don't have any order</p>

            <%      }

            %>
        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
