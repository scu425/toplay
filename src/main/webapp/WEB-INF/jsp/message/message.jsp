<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>组队网</title>
    <script src="../../../js/jquery1.12.4.min.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/showDialog.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <script>
        $(function () {
            var boxs=$("input[type='checkbox'][id^='box_']");

            $("#checkAll").click(function () {
                boxs.attr("checked",this.checked);
            });
            $("#delete").click(function () {
                var checkedBoxs = boxs.filter(":checked");
                if(checkedBoxs.length < 1){
                    $.showErr("请选择一个需要删除的消息！");
                }else{

                    /** 得到用户选中的所有的需要删除的ids */
                    var ids = checkedBoxs.map(function(){
                        return this.value;
                    });
                    $.showConfirm("确定要删除吗？",function(){
                        window.location = "deleteMessage?ids=" + ids.get();
                    });
                    }
            })
        })
    </script>
</head>
<body style="margin: 10px;">
<table width="100%">
    <tr>
        <td width="15" height="32"><img src="../../../images/main_locleft.gif" width="15" height="32"></td>
        <td><img src="../../../images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：消息管理 &gt; 消息查询</td>
        <td width="15" height="32"><img src="../../../images/main_locright.gif" width="15" height="32"></td>
    </tr>
</table>
<table width="100%" height="90%">
    <tr>
        <td>
            <table class="table table-bordered">
                <form action="/message/selectMessage" method="post">
    <tr>
        <td>
            用户id：<input type="text" name="userId">
            标题：<input type="text" name="title">
            <input type="submit" class="btn btn-default" value="搜索">
            <input type="button" class="btn btn-default" id="delete" value="删除">
        </td>
    </tr>
                </form>
</table>
</td>
</tr>
<tr>
    <td>
        <table class="table table-bordered">
            <tr>
                <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                <td>用户id</td>
                <td>标题</td>
                <td>内容</td>
                <td align="center">操作</td>
            </tr>
            <c:forEach items="${requestScope.messages}" var="message" varStatus="stat">
                <tr>
                    <td><input type="checkbox" id="box_${stat.index}" value="${message.id}"></td>
                    <td>${message.userId}</td>
                    <td>${message.title}</td>
                    <td>${message.content}</td>
                    <td align="center"><a href="updateMessage?flag=1&id=${message.id}"><img title="修改" src="../../../images/update.gif"></a></td>
                </tr>
            </c:forEach>
        </table>
    </td>
</tr>
</table>
</body>
</html>