<%-- 
    Document   : ManageAccounts
    Created on : Feb 22, 2023, 11:51:08 PM
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
                <table class="order">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>status</th>
                            <th>phone</th>
                            <th>role</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="acc" items="${requestScope.accountList}">
                        <tr>
                            <td><c:out value="${acc.accID}"></c:out></td>
                            <td><c:out value="${acc.email}"></c:out></td>
                            <td><c:out value="${acc.fullname}"></c:out></td>    
                                <td>
                                <c:choose>
                                    <c:when test="${acc.status eq 1}">active</c:when>
                                    <c:otherwise>inActive</c:otherwise>
                                </c:choose>         
                            </td>
                            <td><c:out value="${acc.phone}"></c:out></td>
                                <td>
                                <c:choose>
                                    <c:when test="${acc.role eq 1}">admin</c:when>
                                    <c:otherwise>user</c:otherwise>
                                </c:choose>    

                            </td>
                            <td>
                                <c:if test="${acc.role eq 0}">
                                    <c:url var="mylink" value="MainController"> 
                                        <c:param name="email" value="${acc.email}"></c:param>
                                        <c:param name="status" value="${acc.status}"></c:param>
                                        <c:param name="action" value="updateStatusAccount"></c:param>
                                    </c:url>
                                    <a href="${mylink}">Block/Unlock</a>                                      
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
