<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/login.css">
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" href="index.html" style="font-size: 32px;">图书借阅管理系统</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">

		<form id="loginForm" method="post" action="user/doLogin" class="form-signin" role="form">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-education"></i> 用户登录
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="请输入登录账号" autofocus> <span class="glyphicon glyphicon-yen form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="请输入登录密码" style="margin-top: 10px;"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<select class="form-control" id="userType">
					<option value="0">读者</option>
					<option value="1">管理员</option>
				</select>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me"> 记住我
				</label> <br> <label> 忘记密码 </label> <label style="float: right"> <a href="reg.html">我要注册</a>
				</label>
			</div>
			<a class="btn btn-lg btn-success btn-block" onclick="dologin()"> 登录</a>
		</form>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script>
    function dologin() {
    	//页面非空校验
		var userId = $("#userId").val()
		if (userId == ""){
			layer.msg("登陆账号不能为空，请输入",{time:1000, icon:5, shift:6}, function() {
				//消息关闭执行此逻辑
			})
			return
		}
    	
    	var userPassword = $("#userPassword").val()
    	if (userPassword == ""){
    		layer.msg("登陆密码不能为空，请输入",{time:1000, icon:5, shift:6}, function() {
				//消息关闭执行此逻辑
			})
			return
    	}
    	
		var index = 0;
    	$.ajax({
    		type : "POST",
    		url  : "user/login",
    		data : {
    			"userId" : userId,
    			"userPassword"  : userPassword,
    			"manageBook" : $("#userType").val()
    		},
    		beforeSend : function(){
    			index = layer.load(2, {time: 10*1000});
    		},
    		success : function(result){
    			layer.close(index);
    			if ( result.success ){
    				if ( result.data == "0" ){
    					window.location.href = "readerMain";
    				}else if ( result.data == "1" ){
    					window.location.href = "main";
    				}else{
    					layer.msg("您没有权限", {time:2000, icon:5, shift:6}, function(){
        	    			// 消息关闭后执行的逻辑
        	    		});
    				}
    			}else{
    				layer.msg("登陆账号或密码不正确，请重新输入", {time:2000, icon:5, shift:6}, function(){
    	    			// 消息关闭后执行的逻辑
    	    		});
    			}
    		}
    	});
        
    }
    </script>
</body>
</html>