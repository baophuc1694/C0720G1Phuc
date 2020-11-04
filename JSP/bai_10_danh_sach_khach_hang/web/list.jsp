<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2020
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<html>
<head>
    <title>Title</title>
    <style>
        #image {
            height: 60px;
            width: 60px;
        }
    </style>
</head>
<body>
<table class="table table-striped">
    <thead>
    <tr>
        <th>Name</th>
        <th>Birthday</th>
        <th>Address</th>
        <th>Images</th>
    </tr>
    </thead>
    <tbody>


    <c:forEach var="customer" items="${customer_list}">
        <tr>
            <td>${customer.name}</td>
            <td><c:out value="${customer.birthday}"></c:out></td>
            <td>${customer.address}</td>
            <td><img style="width: 100px" height="100px" src="<c:out value="${customer.images}"/>   "></td>
            <c:out value="${customer.images}"/>
        </tr>
    </c:forEach>

    </tbody>
</table>


<br><br>
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

</body>
</html>
