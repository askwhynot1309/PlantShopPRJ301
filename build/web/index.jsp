

<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
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
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <ul class="container">
                <%
                    String keyword = request.getParameter("txtsearch");
                    String searchby = request.getParameter("searchby");
                    ArrayList<Plant> list;
                    if (keyword == null && searchby == null) {
                        list = PlantDAO.getPlants("", "");
                    } else {
                        list = PlantDAO.getPlants(keyword, searchby);
                    }
                    if (list != null && !list.isEmpty()) {
                        for (Plant p : list) {
                %>
                <div class="card">
                    <img src="<%=p.getImgPath()%>" style="height:228px;width: 100%" alt="Plant Image">
                    <h2><%=p.getName()%></h2>
                    <p><%=p.getPrice()%></p>
                    <p><%=p.getDescription()%></p>
                    <p><%=p.getCatename()%></p>
                    <p><a href="MainController?action=addtocart&pid=<%=p.getId()%>"><button class="add-to-cart">Add to Cart</button></a></p>
                </div>
                <% }
                    }
                %>
            </ul>
        </div>
    </section>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</body>
</html>
