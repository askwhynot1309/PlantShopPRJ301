
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dto.Categorie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <c:import url="header_loginedAdmin.jsp"></c:import>         
        </header>
        <section class="right">


            <form action="MainController" method="post"  enctype="multipart/form-data" class="form">
                <h1> update  </h1>
                <table class="table2">
                    <tr>
                        <td>Plant Name</td>
                        <td><input type="text" name="name" value="${param.name}" required="" /></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="number" name="price" value="${param.price}" required="" min="0"/> </td>
                    </tr>
                    <tr>
                        <td>image</td>
                        <td><img src="${param.imgPath}" alt="alt" style="width: 50px;height: 50px"/>
                            <input type="file" name="file" size="60" accept="image/*" /></td>
                    </tr>
                    <tr>
                        <td>description</td>
                        <td><textarea type="text" name="description" value="${param.description}" required="" ></textarea></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>
                            <select name="status">
                                <option value="${param.status}">${param.status == 1 ? 'available' : 'out of stock'}</option>
                                <option value="${param.status == 1 ? '0' : '1'}">${param.status == 0 ? 'available' : 'out of stock'}</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>   
                            <select name="cateid" >
                                <% List<Categorie> list = CategoryDAO.getCategories("");
                                    for (Categorie cate : list) {
                                %>
                                <c:set var="ca" value="<%=cate.getCateID() %>" />
                                <option ${ca == param.cateid ? 'selected' :'' }  value="<%=cate.getCateID()%>"><%=cate.getCateName()%></option>

                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1"></td>
                        <td>
                            <input type="hidden" name="id" value="${param.id}" />
                            <input type="hidden" name="imgPath" value="${param.imgPath}" />
                            <input type="submit" value="updatePlant" name="action" />
                        </td>
                    </tr>
                </table>

            </form> 


        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
