<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/11/2020
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  </head>
  <body>

  <h1>Calculator</h1>
  <form action="/action" method="get">
    <fieldset>
      <legend>Calculator</legend>
      <table>
        <tr>
          <td>First operand: </td>
          <td><input name="first" type="text"/></td>
        </tr>
        <tr>
          <td>Operator: </td>
          <td>
            <select name="operator">
              <option value="+">Addition</option>
              <option value="-">Subtraction</option>
              <option value="*">Multiplication</option>
              <option value="/">Division</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Second operand: </td>
          <td><input name="second" type="text"/></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="Calculate"/></td>
        </tr>
      </table>
    </fieldset>
  </form>
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
