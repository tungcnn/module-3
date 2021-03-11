<%--
  Created by IntelliJ IDEA.
  User: SonTung
  Date: 5/03/2021
  Time: 9:15 am
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <style>
        button {
            margin-right: 5px;
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <h1 style="margin-left: auto; margin-right: auto;">Employee List</h1>
    </div>
    <div class="row">
        <div class="col-md-10 offset-1">
            <div class="input-group mb-3" style="width: 40%;float: right;">
                <form action="/persons?action=search" method="post">
                    <input type="text" name="idSearch" class="form-control">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary">Copy</button>
                    <button type="button" class="btn btn-secondary">CSV</button>
                    <button type="button" class="btn btn-secondary">Print</button>
                </div>
            </div>
            <br>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 offset-1">
            <table class="table table-bordered table-striped" style="text-align: center;">
                <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col"><input type="checkbox"></th>
                    <th scope="col">ID</th>
                    <th scope="col">Actions</th>
                    <th scope="col">Name</th>
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address1</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${persons}" var="person">
                    <tr>
                        <td>+</td>
                        <td><input type="checkbox"></td>
                        <th scope="row">${person.id}</th>
                        <td>
                            <a href="/persons?action=edit&id=${person.id}" class="btn btn-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path
                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd"
                                          d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                </svg>
                                Edit
                            </a>
                            <a href="/persons?action=delete&id=${person.id}" class="btn btn-danger">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path
                                            d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                </svg>
                                Delete
                            </a>
                        </td>
                        <td><a href="/persons?action=view&id=${person.id}">${person.name}</a></td>
                        <td><a href="/persons?action=view&id=${person.id}">${person.username}</a></td>
                        <td><a href="/persons?action=view&id=${person.id}">${person.email}</a></td>
                        <td><a href="/persons?action=view&id=${person.id}">${person.address}</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="row">
                <div class="col-md-4">
                    <p>Showing 0 to 0 of 0 entries</p>
                </div>
                <div class="col-md-4">
                    <form class="form-inline">
                        <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Preference</label>
                        <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                            <option selected value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                        <label class="my-1 mr-2" for="inlineFormCustomSelectPref">entries</label>
                    </form>
                </div>
                <div class="col-md-4">
                    <nav aria-label="Page navigation example" style="float: right">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="row">
                <a href="/persons?action=create">
                    <button type="button" class="btn btn-primary btn-lg">Create new person</button>
                </a>
            </div>
        </div>
    </div>
</div>
</body>

</html>