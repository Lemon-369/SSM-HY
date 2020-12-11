<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>学生信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.6/layui/css/layui.css">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui-v2.5.6/layui/layui.js"></script>
<script type="text/javascript" src="jquery-3.4.1.js"></script>

<style>
    td{
        text-align: center;
    }
</style>
<body>
    <div align="center">
        <h1>学生信息表</h1>
    </div>
    <div align="center">
        <form action="${pageContext.request.contextPath}/queryBy">
            <div>
                ID：<input type="text" name="id" placeholder="根据id查询" >
                姓名：<input type="text" name="name">
                班级：<input type="text" name="className">
                <input value="查询" type="submit" 	class="layui-btn layui-btn-sm layui-btn-warm">
            </div>
        </form>
        <a href="${pageContext.request.contextPath}/insert.jsp" target="_blank">
            <input type="button"  value="添加" class="layui-btn layui-btn-sm layui-btn-warm">
        </a>

    </div>
    <div>
        <form action="${pageContext.request.contextPath}/queryAll" id="myForm">
            <table border="1" class="layui-table" lay-skin="lg">
                <thead>
                    <td>全选<input type="checkbox" onclick="swapCheck()"></td>
                    <td>编号</td>
                    <td>ID</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>班级</td>
                    <td>操作</td>
                </thead>
                <c:forEach items="${stuList}" var="item" varStatus="status">
                    <tr>
                        <td><input type="checkbox" value="${item.id}" name="stu"></td>
                        <td>${status.index+1}</td>
                        <td id>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.gender}</td>
                        <td>${item.classes.className}</td>
                        <td>
                            <input class="layui-btn layui-btn-sm layui-btn-normal" type="button" value="修改" onclick="update()">
                            <input class="layui-btn layui-btn-sm layui-btn-danger" id="delete" type="button" value="删除" onclick="deletes(${item.id})">
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>

</body>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;
        layer.msg('hello');
    });

    function update(){
        //iframe层-父子操作
        layer.open({
            type: 2,
            title: 'iframe父子操作',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['800px' , '520px'],
            content: '${pageContext.request.contextPath}/ifram.jsp'
        });
    }
    //添加

    //删除
    function deletes(data) {
        $.ajax({
            type: "get",
            url:"${pageContext.request.contextPath}/delete",
            data:{id:data}
        });

    }

    //checkbox 全选/取消全选
    var isCheckAll = false;
    function swapCheck() {
        if (isCheckAll) {
            $("input[type='checkbox']").each(function() {
                this.checked = false;
            });
            isCheckAll = false;
        } else {
            $("input[type='checkbox']").each(function() {
                this.checked = true;
            });
            isCheckAll = true;
        }
    }

</script>
</html>
