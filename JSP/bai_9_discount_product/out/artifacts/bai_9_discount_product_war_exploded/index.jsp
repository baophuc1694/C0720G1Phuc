<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/11/2020
  Time: 10:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/discount" method="post">
    <input type="text" name="price" placeholder="Price"/>
    <input type="text" name="discount" placeholder="Discount percent"/>
    <input type = "submit" id = "submit" value = "Discount"/>
  </form>
  </body>
</html>
