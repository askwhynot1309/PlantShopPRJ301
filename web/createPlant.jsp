<%-- 
    Document   : createPlant
    Created on : Feb 26, 2023, 2:41:24 AM
    Author     : admin
--%>

<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
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


                <form action="MainController" method="post"  enctype="multipart/form-data" class="form">
                    <h1> create </h1>
                    <table class="table2">
                        <tr>
                            <td>Plant Name</td>
                            <td><input type="text" name="name"  required="" /> </td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price"  required="" min="0"/> </td>
                        </tr>
                        <tr>
                            <td>image</td>
                            <td><input type="file" name="file" size="60" accept="image/*" required=""/></td>
                        </tr>
                        <tr>
                            <td>description</td>
                            <td><textarea type="text" name="description"  required="" value="${param.description}"></textarea></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td><select name="status">
                                <option value="1">available</option>
                                <option value="0">out of stock</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>   
                            <select name="cateid" >
                                <% List<Categorie> list = CategoryDAO.getCategories("");
                                    for (Categorie cate : list) {
                                %>
                                
                                <option value="<%=cate.getCateID()%>"><%=cate.getCateName()%></option>
                                
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1"></td>
                        <td><input type="submit" value="createPlant" name="action"></td>
                    </tr>
                </table>

            </form> 


        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
