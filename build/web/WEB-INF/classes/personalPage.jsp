<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dto.Order"%>
<%@page import="java.util.ArrayList"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
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
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back </h3>
            <h3><a href="MainController?action=logout">Logout</a></h3>
        </section>
        <section>
            <%
                
                String orderStatus = request.getParameter("orderStatus");
                String from = request.getParameter("from");
                String to = request.getParameter("to");
                if (orderStatus != null) {
                    int orderid = Integer.parseInt(request.getParameter("orderid"));
                    if (orderStatus.equals("cancel")) {
                        OrderDAO.cancelOrder(orderid);

                    } else if (orderStatus.equals("again")) {
                        OrderDAO.orderAgain(orderid);
                    }
                }

                String check = request.getParameter("status");
                if (check == null) {
                    check = "";
                }
                int statuscheck = 0;

                String[] status = {"", "Processing", "completed", "Canceled"};

                for (int i = 0; i < status.length; i++) {
                    if (status[i].equals(check)) {
                        statuscheck = i;
                        break;
                    }
                }
                ArrayList<Order> list = OrderDAO.getOrders(email, statuscheck, from, to,"");
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
                        <th>action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=ord.getOrderID()%></td>
                        <td><%=ord.getOrderDate()%></td>
                        <td><%=ord.getShipDate()%></td>
                        <td><%=status[ord.getStatus()]%>
                            <br/><% if (ord.getStatus() == 1) {

                            %>
                            <a href="personalPage.jsp?status=<%=check%>&orderid=<%=ord.getOrderID()%>&orderStatus=cancel">cancel order</a>
                            <%                                }%> 
                            <% if (ord.getStatus() == 3) {

                            %>
                            <a href="personalPage.jsp?status=<%=check%>&orderid=<%=ord.getOrderID()%>&orderStatus=again">order again</a>
                            <%                                }%> 
                        </td>
                        <td><a href="orderDetail.jsp?orderid=<%=ord.getOrderID()%>">detail</a> </td>

                    </tr>
                </tbody>
            </table>
            <%
                }
            } else {

            %>
            <p>You don't have any order</p>

            <%      }

            %>

        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%} else {
        %>
        <c:redirect url="login.jsp"></c:redirect>
        <%
            }
        %>
    </body>
</html>
