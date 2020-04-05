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
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 用户列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询用户</div>
									<input class="form-control has-success" id="queryText" type="text" placeholder="输入用户名">
								</div>
							</div>
							<button type="button" class="btn btn-warning" id="queryButton">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger" onclick="deleteDatas()" style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary" style="float: right;" onclick="window.location.href='${APP_PATH}/user/add'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox" id="selAllBox"></th>
										<th width="500">用户名</th>
										<th>图书管理权限</th>
										<th>密码重置权限</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody id="dataBody"></tbody>
								<tfoot>
									<tr>
										<td colspan="6" align="center">
											<ul class="pagination">
											</ul>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
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
		var likeFlg = false;
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
			pageQuery(1);
			$("#queryButton").click(function() {
				var queryText = $("#queryText").val();
				if (queryText != "") {
					likeFlg = true;
				} else {
					likeFlg = false;
				}
				pageQuery(1);
			});
			
			$("#selAllBox").click(function () {
				var that = this;
				var boxes = $("#dataBody :checkbox");
				$.each(boxes, function (i, box) {
					box.checked = that.checked;
				});
			});
		});

		function deleteDatas() {
			var boxes = $("#dataBody :checked");
			if (boxes.length != 0){
				layer.confirm("您确认要删除选择的用户吗？",  {icon: 3, title:'提示'}, function(cindex){
					
					var jsonData = {};
					$.each(boxes, function (i, box) {
					//	jsonData.ids[i] = box.value;
					//  jsonData["users["+i+"]"].userId = box.value; 
						jsonData["ids["+i+"]"] = box.value; 
					});
					
					$.ajax({
						type : "POST",
						url : "${APP_PATH}/user/deletes",
						data : jsonData,
						beforeSend : function() {
							index = layer.load(2, {
								time : 10 * 1000
							});
						},
						success : function ( result ) {
							layer.close(index);
							if (result.success){
								layer.msg("删除成功", {
									time : 2000,
									icon : 6,
								}, function() {
									pageQuery(1);
								});
							}else{
								layer.msg("删除失败", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {
									
								});
							}
						}
					});
				    layer.close(cindex);
				}, function(cindex){
				    layer.close(cindex);
				});
			}else{
				layer.msg("请选择用户", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {
					
				});
			}
		}
		
		var index = 0;
		function deleteUser(userId) {
			layer.confirm("您确认要删除用户，"+userId+"吗？",  {icon: 3, title:'提示'}, function(cindex){
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/user/delete",
					data : {
						"userId" : userId
					},
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function ( result ) {
						layer.close(index);
						if (result.success){
							layer.msg("删除成功", {
								time : 2000,
								icon : 6,
							}, function() {
								pageQuery(1);
							});
						}else{
							layer.msg("删除失败", {
								time : 2000,
								icon : 5,
								shift : 6
							}, function() {
								
							});
						}
					}
				});
			    layer.close(cindex);
			}, function(cindex){
			    layer.close(cindex);
			});
		}

		function pageQuery(pageNo) {
			var jsonData = {
				"pageNo" : pageNo,
				"pageSize" : 10
			};

			if (likeFlg == true) {
				jsonData.queryText = $("#queryText").val();
			}
			$
					.ajax({
						type : "POST",
						url : "${APP_PATH}/user/userManage/pageQuery",
						data : jsonData,
						beforeSend : function() {
							index = layer.load(2, {
								time : 10 * 1000
							});
						},
						success : function(result) {
							layer.close(index);
							if (result.success) {
								var pageObj = result.data;
								var datas = pageObj.datas;

								var context = ""
								for (var i = 0; i < datas.length; i++) {
									var data = datas[i];
									context += '<tr>';
									context += '	<td>' + (i + 1) + '</td>';
									context += '	<td><input type="checkbox" value="'+ data.userId +'"></td>';
									context += '	<td>' + data.userId + '</td>';
									if (data.manageBook == 1) {
										context += '	<td>Y</td>';
									} else {
										context += '	<td>N</td>';
									}
									if (data.changePasswd == 1) {
										context += '	<td>Y</td>';
									} else {
										context += '	<td>N</td>';
									}
									context += '	<td>';
									context += '		<button type="button" class="btn btn-primary btn-xs" onclick="window.location.href=\'${APP_PATH}/user/edit?userId='
											+ data.userId + '\'">';
									context += '			<i class=" glyphicon glyphicon-pencil"></i>';
									context += '		</button>';
									context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deleteUser(\''
											+ data.userId + '\')">';
									context += '			<i class=" glyphicon glyphicon-remove"></i>';
									context += '		</button>';
									context += '	</td>';
									context += '</tr>';
								}
								$("#dataBody").html(context);

								var pageFoot = "";
								var totalNo = pageObj.totalNo;
								if (pageNo > 1) {
									pageFoot += '<li><a href="#" onclick="pageQuery('
											+ (pageNo - 1) + ')">上一页</a></li>';
								}
								for (var i = 1; i <= totalNo; i++) {
									if (pageNo == i) {
										pageFoot += '<li class="active" ><a href="#"> '
												+ i + '</a></li>';
									} else {
										pageFoot += '<li><a href="#" onclick="pageQuery('
												+ i + ')"> ' + i + '</a></li>';
									}
								}
								if (pageNo < totalNo) {
									pageFoot += '<li><a href="#" onclick="pageQuery('
											+ (pageNo + 1) + ')">下一页</a></li>';
								}
								$(".pagination").html(pageFoot);
							} else {
								layer.msg("查询失败", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {
									// 消息关闭后执行的逻辑
								});
							}
						}
					});
		}
	</script>
</body>
</html>
