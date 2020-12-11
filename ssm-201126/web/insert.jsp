<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui-v2.5.6/layui/css/layui.css">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui-v2.5.6/layui/layui.js"></script>
<script type="text/javascript" src="jquery-3.4.1.js"></script>
<body>
    <form class="layui-form" action="${pageContext.request.contextPath}/insert">
        <div class="layui-form-item">
            <label class="layui-form-label">id</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="gender" value="男" title="男">
                <input type="radio" name="gender" value="女" title="女" checked>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择框</label>
            <div class="layui-input-block">
                <select name="classes" id="classes" lay-verify="required">

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit >立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form;
        //各种基于事件的操作，下面会有进一步介绍
    });
    $(function () {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/queryClasses",
            dataType : "json",
            success: function (Classes) {
                var html ="<option value=\"\">选择班级</option>";
                for(const cls of Classes) {
                    html+="<option value='"+cls.cid+"''>"+cls.className+"</option>"
                }
                $("#classes").html(html);
                layui.form.render()
            }
        })
    });
</script>
</html>
