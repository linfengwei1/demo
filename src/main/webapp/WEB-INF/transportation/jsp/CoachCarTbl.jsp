<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/9
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教练车表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .layui-table-cell {
            height: 100%;
            max-width: 100%;
        }
    </style>
</head>
<body>
<form class="layui-form" action=""  >
    <div class="layui-form-item">
        <label class="layui-form-label">车牌号：</label>
        <div class="layui-input-inline">
            <input type="text"  id="name" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${userName}">
        </div>

        <label class="layui-form-label">所属驾校：</label>
        <div class="layui-input-inline">
            <select name="school" id="school" lay-filter="aihao">
                <option value=""></option>
                <c:forEach items="${schools}" begin="" var="school">
                    <option value="${school.id}" <c:if test="${school}==${school.name}">selected="selected"</c:if> >${school.name}</option>--%>
                </c:forEach>
            </select>
        </div>

        <label class="layui-form-label">车辆状态：</label>
        <div class="layui-input-inline">
            <select name="type" id="type" lay-filter="aihao">
                <option value=""></option>
                <c:forEach items="${stateMap}" begin="" var="ss">
                    <option value="${ss.key}" <c:if test="${type}==${ss.key}">selected="selected"</c:if> >${ss.value}</option>
                </c:forEach>
            </select>
        </div>

        <button class="layui-btn" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" >查询</button>

    </div>

</form>

<table id="demo" lay-filter="test"></table>
</body>
<script type="text/html" id="barDemo">

    {{#  if(d.student_state_id == 5){ }}

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="examine">审核</a>
    {{#  } else { }}

    {{#  } }}


</script>

<script>
    layui.use(['table','laydate','form','jquery'], function(){
        var table = layui.table,
            laydate=layui.laydate,
            form=layui.form,
            $=layui.jquery;
        //表格实例
        table.render({
            elem: '#demo'
            ,height: 470
            ,id:'testReload'
            ,url: '${pageContext.request.contextPath}/TM/getCoachCarTbl' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field:'pic', title: '车辆图片',  width:'auto',templet:'<div><img src="${pageContext.request.contextPath}/static/{{d.picture}}"></div>'}
                ,{field: 'carnumber', title: '车牌号', width:100}
                ,{field: 'schoolName', title: '驾校名', width:100}
                ,{field: 'coachName', title: '驾驶教练名', width:50}
                ,{field: 'state', title: '状态', width: 100}
                ,{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
        });


        //阻止表单提交
        form.on('submit(formDemo)', function(data){
            return false;//阻止表单跳转
        });

        //表格数据重载
        $('#button').on('click',function () {

            var type=$(this).data('type');

            if(type == 'reload'){

                table.reload('testReload',{
                    page:{
                        curr:1
                    }
                    ,where:{
                        name:$("#name").val(),
                        school:$("#school").val(),
                        type:$("#type").val(),
                    }
                });
            }

        });


        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'detail'){ //查看
                //do somehing
            } else if(layEvent === 'lookMsg'){ //查看信息


            } else if(layEvent === 'examine'){ //审核通过
                //do something
                console.log(data);
                var sub=JSON.stringify(data);


                //prompt层
                layer.prompt({title: '审核信息', formType: 1}, function(pass, index){
                    layer.close(index);

                    layer.confirm('是否通过审核?', function(index){
                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        layer.close(index);
                        var sub=JSON.stringify(data);

                        $.ajax({
                            async:true,
                            method : "POST",
                            url :'${pageContext.request.contextPath}/TM/examineStudent',
                            data: data,
                            dataType : {"data":data,"text":pass},
                            success:function(data){
                                if ("success"==data){
                                    layer.alert("审核通过",{icon:6},function () {
                                        //修改信息
                                        window.parent.location.reload();
                                    });
                                }else {
                                    layer.alert("审核未通过",{icon:2});
                                }
                            }
                        });

                    });

                });

            }
        });

    });
</script>
</html>
