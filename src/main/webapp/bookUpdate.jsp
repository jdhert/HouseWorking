<%--
  Created by IntelliJ IDEA.
  User: kitri
  Date: 2023-11-16
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String keyString = request.getParameter("key");
    Long key = Long.parseLong(keyString);
    System.out.println(key);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>도서 업데이트!!</title>
</head>
<body>
<h1>도서업데이트 페이지</h1>
<form action="book-update" method="post">
    <input type="hidden" name="key" value="<%= key %>">
    <label for = "BN">업데이트할 도서명 : </label>
    <input type = "text" name = "bookName1" id = "BN">
    <br>
    <label for = "at">업데이트할 저자 : </label>
    <input type = "text" name = "author1" id = "at">
    <br>
    <label for = "publish">업데이트할 출간일 : </label>
    <input type = "date" name = "publishDate1" id = "publish">
    <br>
    <input type = "submit" value = "등록">
</form>

</body>
</html>
