<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/11/2020
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body{
            background-color: aliceblue;
            background-image: url("../anh_ip.jpg");
        }
    </style>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/products?action=create">Create New Product</a>
</p>
<table border="1" class="table table-striped" style="color: aliceblue">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Produce</td>
        <td>Description</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${products}' var="product">
        <tr>
            <td>${product.getId()}</td>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getProduce()}</td>
            <td>${product.getDescription()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}" class="btn btn-primary">Edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}" class="btn btn-danger">Delete</a></td>
        </tr>
    </c:forEach>

</table>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
        integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
        crossorigin="anonymous"></script>
</body>
</html>
