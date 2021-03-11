<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/3/2021
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/users?ac=login" method="post">
        <input type="text" name="username" />
        <input type="password" name="password"/>
        <button type="submit">Login</button>
        <a href="/users?ac=register">Register</a>
    </form>
</body>
</html>
