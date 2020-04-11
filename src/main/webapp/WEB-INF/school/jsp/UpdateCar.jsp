<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>车辆人员变更</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/static/jquery-3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/static/json2.js"></script>
</head>
<body>

<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login" >
    <form class="layui-form" action="" onsubmit="return false;">
        <div> <input type="hidden" id="id" name="id"></div>
<%--        <div> <input type="hidden" id="coach_id" name="coach_id"></div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">车牌号码</label>
            <div class="layui-input-inline">
                <input type="text"  id="carNumber" name="carNumber" required lay-verify="carNumber"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教练名</label>
            <div class="layui-input-block" style="width: 190px;">
                <select  name="coach_id" id="coach_id" lay-verify="required">
                    <c:forEach items="${Coach}" begin="" var="ss">
                        <option value="${ss.id}" <c:if test="${name}==${ss.id}">selected="selected"</c:if> >${ss.name}</option>
                    </c:forEach>
                </select>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            var path = $("#path").val();
            $.ajax({
                url:path+'/school/UpdateCar',
                type:'post',
                data:data.field,
                success:function(data){
                    if ("2222"==data){
                        layer.alert("更新失败",{icon:2});
                    }else if ("1111"==data) {
                        layer.alert("更新成功",{icon:6},function () {
                            window.parent.location.reload();
                        });
                    }
                }, error: function () {
                    layer.alert("网络繁忙！")
                }
            });
            return false;
        });
    });
</script>
</html>
