<%-- 
    Document   : ManageCategories
    Created on : Feb 25, 2023, 6:22:45 PM
    Author     : admin
--%>

<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Categorie"%>
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

                <table class="order" >
                    <thead>
                        <tr>
                            <th>Category ID</th>
                            <th>Category Name</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cate" items="${requestScope.categoryList}">
                    <form action="MainController">
                        <tr>
                            <td>${cate.cateID}</td>
                            <td><input type="text" name="cateName" value="${cate.cateName}" required="" /> </td>
                            <td>
                                <input type="hidden" name="cateID" value="${cate.cateID}" />
                                <input type="submit" value="updateCategory" name="action" />
                            </td>
                        </tr>

                    </form>
                </c:forEach>
                <form action="MainController">
                    <tr>
                        <td><input type="text" name="cateName" required=""/></td>
                        <td><input type="submit" value="createCategory" name="action" /></td>

                    </tr>
                </form>
                </tbody>
            </table>

            <c:if test="${empty requestScope.categoryList}">
                <p>don't have any category</p>
            </c:if>

        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
