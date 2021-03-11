<%--
  Created by IntelliJ IDEA.
  User: SonTung
  Date: 8/03/2021
  Time: 2:52 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row" style="margin-top: 150px">
        <h1 style="text-align: center; width: 100%">UPDATE INFORMATION</h1>
    </div>
    <div class="row">
        <div class="col-md-6 offset-3">
            <p>
                <c:if test='${requestScope["message"] != null}'>
                    <span class="message">${requestScope["message"]}</span>
                </c:if>
            </p>
            <form method="post">
                <div class="form-row">
                    <label for="id">ID</label>
                    <input type="text" name="id" class="form-control" id="id" disabled value="${requestScope["person"].getId()}">
                </div>
                <div class="form-row">
                    <label for="name">Name</label>
                    <input type="text" name="name" class="form-control" id="name" value="${requestScope["person"].getName()}">
                </div>
                <div class="form-row">
                    <label for="username">User Name</label>
                    <input type="text" name="username" class="form-control" id="username" value="${requestScope["person"].getUsername()}">
                </div>
                <div class="form-row">
                    <label for="email">Email</label>
                    <input type="email" name="email" class="form-control" id="email" value="${requestScope["person"].getEmail()}">
                </div>
                <div class="form-row">
                    <label for="address">Address</label>
                    <input type="text" name="address" class="form-control" id="address" value="${requestScope["person"].getAddress()}">
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="/persons" class="btn btn-primary">Back to list</a>
            </form>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
</html>
