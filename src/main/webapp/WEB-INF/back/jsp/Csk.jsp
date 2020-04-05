<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>EChars插件使用案例</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/json2.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/background/js/cheagemenu.js" type="text/javascript" charset="UTF-8"></script>


</head>
<body>
<div class="layui-container">

	<div class="layui-row">
		<div class="layui-col-xs8 layui-col-xs-offset5">
			<div class="layui-btn-group">
				<button id="zxs" type="button" class="layui-btn">咨询师</button>
				<button id="gly" type="button" class="layui-btn">后台管理员</button>
			</div>

		</div>
	</div>



	<div class="layui-row">
		<div class="layui-col-xs8 layui-col-xs-offset3">
			<div id="test1"></div>
		</div>
	</div>
	<div class="layui-row">
		<div class="layui-col-xs9 layui-col-xs-offset3">
			<i id="prm">当前为系统管理员修改权限</i>
		</div>
	</div>
	<div class="layui-row">
		<div class="layui-col-xs1 layui-col-xs-offset5">
			<button  id="tj" type="button" class="layui-btn">
				<i class="layui-icon"></i> 提交
			</button>
		</div>
	</div>
</div>
<input type="hidden" id="url" value="${pageContext.request.contextPath}">
<input type="hidden" id="roleid" value="1">
</body>
</html>