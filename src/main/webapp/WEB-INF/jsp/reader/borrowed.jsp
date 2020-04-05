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
					<a class="navbar-brand" style="font-size: 32px;" href="#">图书借阅管理系统-业务管理</a>
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
					<ul style="padding-left: 50px;" class="list-group">
						<li style="height: 40px;"><a href="${APP_PATH}/reader/lookBooks"><i class="glyphicon glyphicon-check"></i> 查看图书 </a></li>
						<li style="height: 40px;"><a href="${APP_PATH}/reader/borrowed"><i class="glyphicon glyphicon-check"></i> 已借书单 </a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 书单列表
						</h3>
					</div>
					<hr style="clear: both;">
					<div class="table-responsive">
						<table class="table  table-bordered">
							<thead>
								<tr>
									<th width="30">#</th>
									<th>借阅号</th>
									<th>借阅日期</th>
									<th>借阅人</th>
									<th>图书编号</th>
									<th width="90">归还图书</th>
								</tr>
							</thead>
							<tbody id="dataBody"></tbody>
						</table>
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
			pageQuery(1);
		});

		function returnBook(bookId) {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/reader/ajaxReturnBook",
				data : {
					"bookId" : bookId,
					"userId" : ${loginUser.userId}
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("归还成功", {
							time : 2000,
							icon : 6,
						}, function() {
							pageQuery(1);
						});
					} else {
						layer.msg("归还失败", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {
						});
					}
				}
			});
		}
		function pageQuery(pageNo) {
			$
					.ajax({
						type : "POST",
						url : "${APP_PATH}/reader/borrowed/pageQuery",
						data : {
							"userId" : ${loginUser.userId}
						},
						beforeSend : function() {
							index = layer.load(2, {
								time : 10 * 1000
							});
						},
						success : function(result) {
							layer.close(index);
							if (result.success) {
								var datas = result.data;
								var context = ""
								for (var i = 0; i < datas.length; i++) {
									var data = datas[i];
									context += '<tr>';
									context += '	<td>' + (i + 1) + '</td>';
									context += '	<td>' + data.borrowId
											+ '</td>';
									context += '	<td>' + data.borrowDate
											+ '</td>';
									context += '	<td>' + data.userId + '</td>';
									context += '	<td>' + data.bookId + '</td>';
									context += '	<td>';
									context += '		<button type="button" class="btn btn-primary btn-xs" onclick="returnBook(\''+data.bookId+'\')">';
									context += '			<i class=" glyphicon glyphicon-pencil"></i>';
									context += '		</button>';
									context += '	</td>';
									context += '</tr>';
								}
								$("#dataBody").html(context);
							}
						}
					});
		}
	</script>
</body>
</html>
