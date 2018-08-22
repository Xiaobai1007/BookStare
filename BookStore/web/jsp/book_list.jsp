<%@ page import="java.util.List" %>
<%@ page import="com.entity.Book" %>
<%@ page import="com.util.WebUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>图书列表</title>
</head>
<body>

<%= WebUtil.popSessionMsg(request) %>

<form action="/book/del" method="post">
    <table class="table table-striped" id="table">
        <tr>
            <th><input type="checkbox" onclick="alls(this)"></th>
            <th>id</th>
            <th>书名</th>
            <th>价格</th>
            <th>作者</th>
            <th>出版社</th>
            <th>其他</th>
        </tr>
    </table>
    <div style="margin-top: 2em;">
        <input type="submit" value="批量删除" class="btn btn-success">
    </div>

</form>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">书籍信息更新</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%--更新表单--%>
            <div class="modal-body" style="height: 350px">
                <input type="hidden" id="id" name="id">
                <div class="form-group">
                    <label for="Name">书籍名称</label>
                    <input type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp"
                           placeholder="请输入书籍名称">
                </div>
                <div class="form-group">
                    <label for="price">书籍价格</label>
                    <input type="number" class="form-control" step="1" name="price" id="price"
                           aria-describedby="emailHelp" value="" placeholder="请输入书籍价格">
                </div>
                <div class="form-group">
                    <label for="author">书籍作者</label>
                    <input type="text" class="form-control" name="author" id="author" aria-describedby="emailHelp"
                           placeholder="请输入书籍作者">
                </div>
                <div class="form-group">
                    <label for="press">书籍出版社</label>
                    <input type="text" class="form-control" name="press" id="press" aria-describedby="emailHelp"
                           placeholder="请输入书籍出版社">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update" onclick="aaa(this)">保存</button>
            </div>
        </div>
    </div>
</div>
<script src="/assets/js/jquery-3.3.1.min.js"></script>
<script>
    var list = function(){
        $.ajax({
            type:"get",
            url:"/bookList",
            success:function(data){
                $.each(data,function(index,obj){
                    var tr = $("<tr/>");
                    $("<td/>").append("<input name='id' value="+obj.id+" type='checkbox'>").appendTo(tr);
                    $("<td/>").append(obj.id).appendTo(tr);
                    $("<td/>").append(obj.name).appendTo(tr);
                    $("<td/>").append(obj.price).appendTo(tr);
                    $("<td/>").append(obj.author).appendTo(tr);
                    $("<td/>").append(obj.press).appendTo(tr);
                    $("<td/>").append("<button type='button' value='"+obj.id+"' onclick='update(this)' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>更新</button> <a href='/book/del?id='+obj.id class='btn btn-primary'>删除</a>").appendTo(tr);
                    $("#table").append(tr);
                })
            }
        })
    }
    list();

    function alls(e) {
        var checkboxs = document.getElementsByName("id");
        for (var i = 0; i < checkboxs.length; i++) {
            checkboxs[i].checked = e.checked
        }
    }

    function update(x) {
        var bid = x.getAttribute("value");
        $.ajax({
            type: "get",
            url: "/book/update",
            data: {id: bid},
            success: function (data) {
                console.log(data)
                $("#id").val(data.id)
                $("#name").val(data.name)
                $("#price").val(data.price)
                $("#press").val(data.press)
                $("#author").val(data.author)
            }
        })
    }

    function aaa(e){
        $.ajax({
            type: "post",
            url: "/book/update",
            data: {id: $("#id").val(),name:$("#name").val(),price:$("#price").val(),author:$("#author").val(),press:$("#press").val()},
            success: function (data) {
                alert(data.msg)
                $(window).attr('location','/jsp/detail?id='+$("#id").val());
            }
        })
    }

    document.querySelector("#booklist").classList.add("active");
</script>
</body>
</html>
