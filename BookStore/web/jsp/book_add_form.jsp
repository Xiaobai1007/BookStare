<%@ page import="com.util.WebUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加书籍</title>
    <meta name="subtitle" content="新增书籍">
</head>
<body>

<%=WebUtil.popSessionMsg(request) %>

<div class="form-group">
    <label for="id">书籍ID</label>
    <input type="number" class="form-control" id="id" name="id" placeholder="id">
</div>
<div class="form-group">
    <label for="name">书籍名字</label>
    <input type="text" class="form-control" id="name" name="name" placeholder="name">
</div>
<div class="form-group">
    <label for="price">书籍价格</label>
    <input type="number" class="form-control" step="0.001" id="price" name="price" placeholder="price">
</div>
<div class="form-group">
    <label for="author">书籍作者</label>
    <input type="text" class="form-control" id="author" name="author" placeholder="author">
</div>
<div class="form-group">
    <label for="press">出版社</label>
    <input type="text" class="form-control" id="press" name="press" placeholder="press">
</div>
<div><input type="button" onclick="add()" value="提交" class="form-control"></div>

<script>
    function add() {
        $.ajax({
            type: "post",
            url: "/add",
            data: {id: $("#id").val(),name:$("#name").val(),price:$("#price").val(),author:$("#author").val(),press:$("#press").val()},
            success: function (data) {
                alert(data.msg)
                $(window).attr('location','/jsp/book_list.jsp');
            }
        })
    }
    document.querySelector("#bookadd").classList.add("active");
</script>

</body>
</html>
