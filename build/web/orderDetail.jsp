<%-- 
    Document   : orderDetail.jsp
    Created on : Feb 19, 2023, 3:11:11 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Account"%>
<%@page import="dto.OrderDetail"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            if (name == null) {
        %>
        <p><font color="red">You must login to view this page</font></p>
        <p></p>
        <%
        } else {
        %>
        <c:if test="${sessionScope.user.role == 0}">
            <header>
                <%@include file="header_loginedUser.jsp" %>
            </header>
            <section>
                <h3>Welcome <%= name%> come back </h3>
                <h3><a href="MainController?action=logout">Logout</a></h3>
                <h3><a href="personalPage.jsp">View all orders</a></h3>
            </section>
        </c:if>
        <c:if test="${sessionScope.user.role == 1}">
            <header>
                <c:import url="header_loginedAdmin.jsp"></c:import>
                </header>
                <section>
                    <h3>Welcome <%= name%> come back </h3>
                <h3><a href="ManagerOrders.jsp">View all orders</a></h3>
            </section>
        </c:if>

        <section>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);

                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail ord : list) {

            %>

            <table  class="order" >
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Plant ID</th>
                        <th>Plant Name</th>
                        <th>Image</th>
                        <th>quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=ord.getOrderID()%></td>
                        <td><%=ord.getPlantID()%></td>
                        <td><%=ord.getPlantName()%></td>
                        <td> <img src="<%=ord.getImgPath()%>" class="plantimg" /> <br> <%=ord.getPrice()%> </td>
                        <td><%=ord.getQuantity()%></td>

                    </tr>
                </tbody>
            </table>
            <%
                    money = money + ord.getPrice() * ord.getQuantity();
                }
            %>
            <h3>Total money: <%=money%></h3>

            <%    } else {

            %>
            <p>You don't have any order</p>

            <%      }
                }

            %>

        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%}%>
    </body>
</html>
