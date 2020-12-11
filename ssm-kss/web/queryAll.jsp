<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="layui-v2.5.7/layui/layui.js"></script>
    <link rel="stylesheet" href="layui-v2.5.7/layui/css/layui.css">
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>bilibli幼稚园</legend>
    </fieldset>
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" autocomplete="off" class="layui-input">
                </div>
            </div>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">性别</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" name="sex" placeholder="" autocomplete="off" class="layui-input">--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="M" title="男" checked="">
                    <input type="radio" name="sex" value="F" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">班级</label>
                <div class="layui-input-inline">
                    <select id="className" name="classNo">
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit lay-filter="demo1">点击查询</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </div>

    </form>

    <table id="demo" lay-filter="test"></table>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加信息</button>
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">批量删除</button>
            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        </div>
    </script>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
    </script>
</body>
<script>
    layui.use(['table','form','layer'],function () {
        var table = layui.table
        ,form = layui.form
        ,layer = layui.layer
        ,$ = layui.$;

        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/classes/queryAll",
            dataType : "json",
            success: function (Classes) {
                var html ="<option value=\"\">选择班级</option>";
                for(const cls of Classes) {
                    html+="<option value='"+cls.cno+"''>"+cls.className+"</option>"
                }
                $("#className").html(html);
                layui.form.render()
            }
        });
        //表格渲染
        table.render({
            elem: '#demo'
            ,id:'testReload'
            ,url: '/user/queryAll' //数据接口
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,page: true //开启分页
            ,limit:5
            ,limits:[3,5,7]
            ,cols: [[ //表头
                {field: '', title: '', width:80, fixed: 'left',type:'checkbox'}
                ,{field: 'id', title: '编号', width:80, sort: true, type:'numbers'}
                ,{field: 'name', title: '用户名', width:80}
                ,{field: 'sex', title: '性别', width:80,templet: '#sex',align: 'center'}
                ,{field: 'age', title: '年龄', width:80, sort: true,align: 'center'}
                ,{field: 'birthday', title: '生日', width:200, sort: true,align: 'center',templet: '<div>{{layui.util.toDateString(d.birthday, \'yyyy-MM-dd\')}}</div>'}
                ,{field: 'email', title: '邮箱', width:250}
                ,{field: 'className', title: '班级', width:200,templet:'<div>{{d.classes.className}}</div>',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:250}
            ]]
        });
        //监听工具条
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                // layer.msg('ID：'+ data.id + ' 的查看操作');
                layer.alert(JSON.stringify(data));
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    layer.open({
                        type: 2,
                        title: '添加信息',
                        maxmin: true,
                        shadeClose: true, //点击遮罩关闭层
                        area : ['600px' , '700px'],
                        content: '${pageContext.request.contextPath}/add.jsp'
                    });
                break;
            };
        });
        //监听提交(查询)
        form.on('submit(demo1)', function(data){
            layer.msg(JSON.stringify(data.field));
            //执行重载
            table.reload('testReload', {
                url:'/user/queryAll',
                where: {
                    name:data.field.name,
                    sex:data.field.sex,
                    classNo:data.field.classNo
                } //设定异步数据接口的额外参数
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false
        });
    })
</script>

<script type="text/html" id="sex">
    {{#  if(d.sex == 'F'){ }}
    女
    {{#  } else if(d.sex=='M'){ }}
    男
    {{#  } }}
</script>

</html>
