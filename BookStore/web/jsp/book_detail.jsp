<%@ page import="com.entity.Book" %>
<%@ page import="com.util.WebUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍详情</title>
    <style>
        .msg {
            font-size: 2em;
            color: greenyellow;
        }
    </style>
</head>
<body>

<%= WebUtil.popSessionMsg(request) %>

<h1>${requestScope.book.name}</h1>
<ul class="list-group">
    <li class="list-group-item">${requestScope.book.author}</li>
    <li class="list-group-item">${requestScope.book.price}</li>
    <li class="list-group-item">${requestScope.book.press}</li>
</ul>
</body>
</html>
