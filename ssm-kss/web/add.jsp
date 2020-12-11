<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui-v2.5.7/layui/css/layui.css">
    <script src="layui-v2.5.7/layui/layui.js"></script>
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title site-demo-button" style="margin-top: 30px;">
        <legend>学生信息</legend>
    </fieldset>
    <form class="layui-form" id="formAdd">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="M" title="男" checked="">
                <input type="radio" name="sex" value="F" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="text" name="age" lay-verify="title" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">生日</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="birthday" name="birthday" placeholder="yyyy-MM-dd">
                </div>
            </div>

        <div class="layui-form-item">
            <label class="layui-form-label">班级</label>
            <div class="layui-input-inline">
                <select id="className" name="classNo">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">email</label>
            <div class="layui-input-block">
                <input type="text" name="email" lay-verify="title" autocomplete="off" placeholder="邮箱" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="submits">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</body>
<script>
    layui.use(['form','layer','laydate'],function () {
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate
        ,$ = layui.$

        //时间（生日）
        laydate.render({
            elem: '#birthday'
        });

        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/classes/queryAll",
            dataType : "json",
            success: function (Classes) {
                var html ="<option value=''>选择班级</option>";
                for(const cls of Classes) {
                    html+="<option value='"+cls.cno+"''>"+cls.className+"</option>"
                }
                $("#className").html(html);
                layui.form.render()
            }
        });

        //监听提交
        form.on('submit(submits)', function(data){
            var params=$('#formAdd').serialize(); //把id为login的form表单里的参数自动封装为参数传递
            console.log(params);
            //将数据转json串格式显示
            // layer.msg(JSON.stringify(data.field));
            $.ajax({
                type:'get',
                url:"/user/add",
                data:params,
                success:function (data) {
                    if (data==1){
                        layer.msg('添加成功', {icon: 6});
                    }else {
                        layer.msg('添加失败', {icon: 5});
                    }
                }
            })
            return false
        });
    })
</script>
</html>
