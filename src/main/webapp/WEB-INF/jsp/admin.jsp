<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script type='text/javascript'
	src='//cdn.jsdelivr.net/jquery.marquee/1.4.0/jquery.marquee.min.js'></script>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />


</head>
<body>
	<h2>LAWA Credential System</h2>

	<div class="progress">
		<div class="progress-bar" style="width: 100%;"></div>
	</div>
	

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="container" style="float: centre; width: 50%;">
		<div class="panel panel-primary">
			
			<div class="panel-body">
			
				<div style="text-align: center; width:100%; font-size: 80px;">
					<a href="<c:url value='/admin/adminHome' />" class="btn btn-primary btn-lg"> Waiting Area Display Editor </a>
				</div>
				
			</div>
			
			
					
			
		</div>
	</div>


</body>
</html>
