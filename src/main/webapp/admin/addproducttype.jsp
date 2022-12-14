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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
</head>
<script type="text/javascript">
    function fileChange(){//注意：此处不能使用jQuery中的change事件，因此仅触发一次，因此使用标签的：onchange属性
        $.ajaxFileUpload({
            url: "${pageContext.request.contextPath}/product/ajaxImg.do", //用于文件上传的服务器端请求地址
            secureuri: false, //安全协议，一般设置为false
            fileElementId: "pimage",//文件上传控件的id属性  <input type="file" id="pimage" name="pimage" />
            dataType: "json",
            success: function(obj)
            {
                $("#imgDiv").empty();  //清空原有数据
                //创建一个图片的标签
                var imgObj = $("<img>");
                //给img标签对象追加属性
                imgObj.attr("src", "${pageContext.request.contextPath}/image_big/"+obj.imgurl);
                imgObj.attr("width", "100px");
                imgObj.attr("height", "100px");
                //将图片img标签追加到imgDiv末尾
                $("#imgDiv").append(imgObj);
                // 将图片的名称赋值给文本框
                $("#imgName").html(obj.imgurl);
            },
            error: function (e)
            {
                alert(e.message);
            }
        });
    }
</script>
<body>
<!--取出上一个页面上带来的page的值-->

<div id="addAll">
    <div id="nav">
        <p>商品类型管理>新增商品类型</p>
    </div>

    <div id="table">
        <form action="${pageContext.request.contextPath}/producttype/save.do" enctype="multipart/form-data"
              method="post" id="myform">
            <table>
                <tr>
                    <td class="one">商品类型名称</td>
                    <td><input type="text" name="typeName" class="two"></td>
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
                        <input type="reset" value="取消" class="btn btn-default" onclick="myclose(${param.page})">
                        <script type="text/javascript">
                            function myclose(ispage) {
                                window.location="${pageContext.request.contextPath}/producttype/getAll.do;"
                            }
                        </script>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>

</html>