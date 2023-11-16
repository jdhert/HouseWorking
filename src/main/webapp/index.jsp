<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.library.Book" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: kitri
  Date: 2023-11-16
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HashMap<Long, Book> books = (HashMap<Long, Book>) request.getAttribute("books");
    Set<Long> keys = books.keySet();
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>도서관리 프로그램</title>
</head>
<body>
<h3>도서관리 프로그램</h3>
<div id="container">
    <% for (long key : keys) { %>
    <div class="book">
        제목 : <%= books.get(key).getName()%><br>
        저자 : <%= books.get(key).getAuthor()%><br>
        출판일 : <%= books.get(key).getPublishedDate()%><br>
        <form action="bookUpdate.jsp" method="post" >
            <input type="hidden" name="key" value="<%=key%>">
            <button type="submit">수정</button>
        </form>
        <a href="/book-delete">삭제</a>
    </div>
    <% } %>
</div>
<form action="bookInsert.html" method="post">
    <div>
        <input type="submit" value="등록하기">
    </div>
</form>
</body>
<style>
    html {
        height: 100%;
    }
    body {
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100%;
    }
    h3 {
        margin-top: 0px;
        padding-top: 0px;
        height: 10%;
    }
    #container {
        width: 50%;
        height: 70%;
    }
    form {
        height: 10%;
    }
    input[type="number"] {
        width: 50px;
        margin-bottom: 10px;
    }
    .book {
        padding: 3px 3px;
        border-style: solid;
    }
</style>
</html>