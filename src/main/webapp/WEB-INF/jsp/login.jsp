<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script type='text/javascript'
	src='//cdn.jsdelivr.net/jquery.marquee/1.4.0/jquery.marquee.min.js'></script>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />

<title> Credential System - Login </title>
</head>
<body>
	<h2> LAWA Credential System </h2>
	<div class="progress">
		<div class="progress-bar" style="width: 100%;"></div>
	</div>
	<div class="container">
		<div class="container">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Login</h3>
				</div>
				<div class="panel-body">
					<form action="login.html" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<table class="table table-striped table-hover">
							<tr>
								<th>Email:</th>
								<td><input type="text" name="email" class="form-control"/></td>
							</tr>
							<tr>
								<th>Password:</th>
								<td><input type="password" name="password" class="form-control"/></td>
							</tr>
							<tr>
								<th><br /></th>
								<td>
								<input type="submit" name="login" value="Login" class="btn btn-default" /> 
								<a href="<c:url value="/" />" class="btn btn-default">Cancel</a></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
