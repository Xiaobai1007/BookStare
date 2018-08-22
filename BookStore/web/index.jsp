<%@ page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%
    List arr = new ArrayList();
    arr.add("1sdfsdf");
    arr.add("2sdfsdf");
    arr.add("3sdfsdf");
    arr.add("4sdfsdf");
    session.setAttribute("Arr",arr);

  %>
    <c:forEach items="${Arr}" var="ss">
      <c:out value="${ss}"></c:out>
    </c:forEach>
  </body>
</html>
