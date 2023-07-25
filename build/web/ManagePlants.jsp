<%-- 
    Document   : ManagePlants
    Created on : Feb 25, 2023, 7:35:43 PM
    Author     : admin
--%>

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
                <h1></h1>
                <a  href="createPlant.jsp">Create</a>


                <table class="order" >
                    <thead>
                        <tr>
                            <th>Plant ID</th>
                            <th>Plant Name</th>
                            <th>Price</th>
                            <th>image</th>
                            <th>description</th>
                            <th>Status</th> 
                            <th>Category</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>    
                    <c:forEach var="plant" items="${requestScope.plantsList}">
                        <tr>
                            <td>${plant.id}</td>
                            <td>${plant.name}</td>
                            <td>${plant.price}</td>
                            <td><img src="${plant.imgPath}" alt="alt" style="width: 100px;height: 100px"/></td>
                            <td>${plant.description}</td>    
                            <td>${plant.status == 1 ? 'available' : 'out of stock'}</td>    
                            <td>${plant.cateid}</td>    
                            <td>
                                <c:url var="updateLink" value="updatePlant.jsp">
                                    <c:param name="id" value="${plant.id}"/>
                                    <c:param name="imgPath" value="${plant.imgPath}"/>
                                    <c:param name="name" value="${plant.name}"/>
                                    <c:param name="price" value="${plant.price}"/>
                                    <c:param name="description" value="${plant.description}"/>
                                    <c:param name="status" value="${plant.status}"/>
                                    <c:param name="cateid" value="${plant.cateid}"/>
                                </c:url>
                                <a href="${updateLink}">update</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <c:if test="${empty requestScope.plantsList}">
                <p>don't have any plants</p>
            </c:if>
        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
