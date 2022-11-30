<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/11/22
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@page import="com.mysql.xiaomi.pojo.*" %>--%>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script type="text/javascript">
        if ("${msg}" != "") {
            alert("${msg}");
        }
    </script>
    <c:remove var="msg"></c:remove>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bright.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addBook.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <title></title>
</head>

<body>

<div id="brall">
    <div id="nav">
        <p>商品类型管理>商品类型列表</p>
    </div>
    <div id="table">

        <div id="top">
            <a href="${pageContext.request.contextPath}/admin/addproducttype.jsp">

                <input type="button" class="btn btn-warning" id="btn1"
                       value="新增商品类型">
            </a>
        </div>
        <!--显示分页后的商品-->
        <div id="middle">
            <table class="table table-bordered table-striped">
                <tr>
                    <th></th>
                    <th>商品类名</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${list}" var="p">
                    <tr>
                        <td valign="center" align="center"><input type="checkbox" name="ck" id="ck" value="${p.typeId}" onclick="ckClick()"></td>
                        <td>${p.typeName}</td>
                        <td>
                            <button type="button" class="btn btn-info "
                                    onclick="one(${p.typeId})">编辑
                            </button>
                            <button type="button" class="btn btn-warning" id="mydel"
                                    onclick="del(${p.typeId})">删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


    </div>
</div>

</body>

<script type="text/javascript">
    function mysubmit() {
        $("#myform").submit();
    }


    //单个删除
    function del(typeId) {
        if(confirm("您确定删除吗？"))
        {
            // 取出查询条件
            var typeName=$("#typeName").val();

            $.ajax({
                url : "${pageContext.request.contextPath}/producttype/delete.do",
                data : {
                    "typeId" : typeId,
                    "typeName" : typeName,
                },
                type : "post",
                dataType : "text",
                success : function (msg)
                {
                    // alert(msg);
                    $("#table").load("http://localhost:8080${pageContext.request.contextPath}/admin/producttype.jsp #table");
                }
            })
        }

    }


    function one(typeId) {
        var typeName=$("#typeName").val();

        var param = "?";
        param += "typeId="+typeId;
        param += "&typeName="+typeName;

        location.href = "${pageContext.request.contextPath}/producttype/one.do"+param ;
    }
</script>

</html>
