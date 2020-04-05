<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="#">图书借阅管理系统-权限管理</a>
				</div>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li style="padding-top: 8px;"><%@include file="/WEB-INF/jsp/common/userinfo.jsp"%></li>
					<li style="margin-left: 10px; padding-top: 8px;">
						<button type="button" class="btn btn-default btn-danger">
							<span class="glyphicon glyphicon-question-sign"></span> 帮助
						</button>
					</li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<ul style="padding-left: 0px;" class="list-group">
						<li class="list-group-item"><span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float: right">2</span></span>
							<ul style="margin-top: 10px;">
								<li style="height: 30px;"><a href="${APP_PATH}/user/userManage" style="color: red;"><i class="glyphicon glyphicon-user"></i> 用户维护</a></li>
								<li style="height: 30px;"><a href="${APP_PATH}/information/userDescribe"><i class="glyphicon glyphicon-king"></i> 信息维护</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 图书管理 <span class="badge" style="float: right">2</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="${APP_PATH}/book/bookManage"><i class="glyphicon glyphicon-check"></i> 图书列表 </a></li>
								<li style="height: 30px;"><a href="${APP_PATH}/press/pressManage"><i class="glyphicon glyphicon-check"></i> 出版社列表 </a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float: right">2</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="${APP_PATH}/borrow/bookBorrow"><i class="glyphicon glyphicon-picture"></i> 借阅者名单 </a></li>
								<li style="height: 30px;"><a href="${APP_PATH}/borrow/repay"><i class="glyphicon glyphicon-equalizer"></i> 逾期查看</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<li><a href="#">权限管理</a></li>
					<li><a href="#">用户维护</a></li>
					<li class="active">修改</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						表单数据
						<div style="float: right; cursor: pointer;" data-toggle="modal" data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form role="form">
							<div class="form-group">
								<label for="exampleInputEmail1">图书管理权限</label> <select class="form-control" id="manageBook">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">密码重置权限</label> <select class="form-control" id="changePasswd">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</div>
							<button type="button" class="btn btn-success" id="updateButton">
								<i class="glyphicon glyphicon-pencil"></i> 修改
							</button>
							<button type="button" class="btn btn-danger" id="resetButton">
								<i class="glyphicon glyphicon-refresh"></i> 重置
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">帮助</h4>
				</div>
				<div class="modal-body">
					<div class="bs-callout bs-callout-info">
						<h4>测试标题1</h4>
						<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
					</div>
					<div class="bs-callout bs-callout-info">
						<h4>测试标题2</h4>
						<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			
			$("#resetButton").click(function () {
				$("#manageBook").val("${user.manageBook}" == 1 ? "Y" : "N");
				$("#changePasswd").val("${user.changePasswd}" == 1 ? "Y" : "N");
			});
			
			$("#manageBook").val("${user.manageBook}" == 1 ? "Y" : "N");
			$("#changePasswd").val("${user.changePasswd}" == 1 ? "Y" : "N");
			
			$("#updateButton").click(function () {
				
				var index = 0;
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/user/update",
					data : {
						"userId" : ${user.userId},
						"manageBook" : $("#manageBook").val() == 'Y' ? 1 : 0 ,
						"changePasswd" : $("#changePasswd").val() == 'Y' ? 1 : 0
					},
					beforeSend : function(){
		    			index = layer.load(2, {time: 10*1000});
		    		},
		    		success : function ( result ) {
						layer.close(index);
						if ( result.success ){
							layer.msg("修改成功",{time:1000, icon:6}, function() {
								window.location.href = "${APP_PATH}/user/userManage"
							})
						}else{
							layer.msg("修改失败",{time:1000, icon:5, shift:6}, function() {
							})
						}
					}
				});
			});
		});
	</script>
</body>
</html>
