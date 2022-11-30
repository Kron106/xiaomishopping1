<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String base = request.getContextPath()+"/";
    String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+base;
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=url%>">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addBook.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
</head>

<body>
<div id="addAll">
    <div id="nav">
        <p>商品类型管理>更新商品类型</p>
    </div>
    <script type="text/javascript">

        function myclose(ispage) {
            /*window.location="${pageContext.request.contextPath}/admin/product?flag=split&ispage="+ispage;*/
            window.location="${pageContext.request.contextPath}/producttype/getAll.do;"
            //window.close();
        }

    </script>
    <div id="table">
        <form action="${pageContext.request.contextPath}/producttype/update.do" enctype="multipart/form-data" method="post" id="myform">
            <input type="hidden" value="${productType.typeId}" name="typeId">
            <table>
                <tr>
                    <td class="one">商品名称</td>
                    <td><input type="text" name="typeName" class="two" value="${productType.typeName}"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="pnameerr"></span></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="提交" class="btn btn-success">
                    </td>
                    <td>
                        <input type="reset" value="取消" class="btn btn-default" onclick="myclose(1)">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>

</html>