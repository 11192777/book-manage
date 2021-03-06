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
					<a class="navbar-brand" style="font-size: 32px;" href="#">图书借阅管理系统-图书管理</a>
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
							<i class="glyphicon glyphicon-th"></i> 图书列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询用户</div>
									<input class="form-control has-success" id="queryText" type="text" placeholder="输入图书名">
								</div>
							</div>
							<button type="button" class="btn btn-warning" id="queryButton">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox"></th>
										<th>图书编号</th>
										<th width="230">书名</th>
										<th width="200">出版社</th>
										<th width="120">作者</th>
										<th width="100">出版日期</th>
										<th width="100">价格（元）</th>
										<th width="100">库存</th>
										<th width="100">借阅</th>
									</tr>
								</thead>
								<tbody id="dataBody"></tbody>
								<tfoot>
									<tr>
										<td colspan="10" align="center">
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
			})
		});

		function ChangeDateFormat(cellval) {
			var date = new Date(parseInt(cellval.replace("/Date(", "").replace(
					")/", ""), 10));
			var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1)
					: date.getMonth() + 1;
			var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date
					.getDate();
			var hours = date.getHours() < 10 ? "0" + date.getHours() : date
					.getHours();
			var min = date.getMinutes() < 10 ? "0" + date.getMinutes() : date
					.getMinutes();
			return date.getFullYear() + "-" + month + "-" + currentDate + " "
					+ hours + ":" + min;
		}

		function BorrowBook( bookId) {
			var userId = ${loginUser.userId}
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/reader/borrowed/borrowBook",
				data : {
					"userId" : userId,
					"bookId" : bookId
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("借阅成功", {
							time : 2000,
							icon : 6,
						}, function() {
							pageQuery(1)
						});
					} else {
						layer.msg("借阅失败，库存不足或您已借过该图书", {
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
			var jsonData = {
				"pageNo" : pageNo,
				"pageSize" : 100
			};

			if (likeFlg == true) {
				jsonData.queryText = $("#queryText").val();
			}

			$
					.ajax({
						type : "POST",
						url : "${APP_PATH}/book/bookManage/pageQuery",
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
									context += '	<td><input type="checkbox"></td>';
									context += '	<td>' + data.bookIssn
											+ '</td>';
									context += '	<td>' + data.bookName
											+ '</td>';
									context += '	<td>' + data.bookPress
											+ '</td>';
									context += '	<td>' + data.bookAuthor
											+ '</td>';
									context += '	<td>' + data.publicationDate
											+ '</td>';
									context += '	<td>' + data.bookPrice
											+ '</td>';
									context += '	<td>' + data.bookRepertory
											+ '</td>';
									context += '	<td>';
									context += '		<button type="button" class="btn btn-primary btn-xs" onclick="BorrowBook(\''+ data.bookId+ '\')">';
									context += '			<i class=" glyphicon glyphicon-pencil"></i>';
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
