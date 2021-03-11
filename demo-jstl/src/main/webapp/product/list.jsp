<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/3/2021
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:out value="${product.id}"></c:out>
<c:out value="${product.name}"></c:out>
<c:out value="${product.price}"></c:out>
<p>${username}</p>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Age</th>
        <th></th>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>
                <button>Update</button>
                <button>Delete</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
