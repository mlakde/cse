<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LAX Security Badge Application</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/css/bootstrap-grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-datepicker.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-iso.css"/>
<body>	
	
	<div class="container" style="width: 100%;">
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:10px;width:100%;">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="margin-bottom:5px;margin-right:55px;">
					<img  src="<%=request.getContextPath()%>/resources/images/LAWA_logo_Display.png" alt="LAWA" style="height:150px;width:400px; float: left;" >
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="text-align: center !important;  margin-top:20px;">
					<label style="font-size: 24px;">LAX SECURITY BADGE APPLICATION</label><br /> 
					<label style="font-size: 18px;">SENSITIVE SECURITY INFORMATION</label><br />
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="float: right;">
					<label style="font-size: 20px; float: right;">Application Number</label><br />
					<label style="font-size: 20px; float: right;">8b1c5d11-d1c1-49f2-bead-8e4510118757</label><br />
				</div>
			</div>
	</div>
			
	
	<form:form class="form-horizontal" role="form" modelAttribute="accessInformation">
		<!-- ************************ START of EMPLOYER AND SECURITY ACCESS INFORMATION******************************* -->
			<div class="col-md-12" style="margin-top: 20px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">SECURITY BADGE OFFICE USE ONLY</h3>
					</div>
					<div class="panel-body">
					<div class="form-group">
					<label class="col-sm-3 control-label">Identification Verification</label>					
						<div class="col-sm-3" style="max-width: 50%;">										
							<input type="checkbox" name="" value="">State Driver's License<br>
							<input type="checkbox" name="" value="">State ID<br>
							<input type="checkbox" name="" value="">US Passport<br>
							<input type="checkbox" name="" value="">Unexpired Foreign Passport(VISA)<br>
							<input type="checkbox" name="" value="">Social Security Card<br>
							<input type="checkbox" name="" value="">Birth Certificate<br>
							<input type="checkbox" name="" value="">Marriage License<br>
							<input type="checkbox" name="" value="">Permanent Resident Card<br>
							<input type="checkbox" name="" value="">Naturalization Certificate<br>
						</div>						
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label">Driver Test Information</label>
							<label class="col-sm-4 control-label">1st Attempt</label>
							<label class="col-sm-4 control-label">2nd Attempt</label>
					</div>
					<div class="form-group">							
							<div class="col-sm-4" style="max-width: 65%;">								
								<textarea class="form-control" id="drinfo"
									placeholder="" rows=13" ></textarea>
							</div>
							<div class="col-sm-4">
								<label>Test Booklet#</label>
								<input type="text" name="" id="bletno" class="form-control">
								<label>Test Date</label>
								<input type="text" class="form-control" id="bletDate" name="date" placeholder="MM/DD/YYY" />
								<label class="radio-inline"> <input type="radio"
									name="RadioOptions" id="blettype1" value="Yes">
									Pass									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="RadioOptions" id="blettype2" value="no">
									Fail								
								</label><br>
								<label>Score</label>
								<input type="text" name="" id="bletscr" class="form-control">
								<label>Proctor</label>
								<input type="text" name="" id="bletproc" class="form-control">	
							</div>	
							<div class="col-sm-4">
								<label>Test Booklet#</label>
								<input type="text" name="" id="bletno2" class="form-control">
								<label>Test Date</label>
								<input type="text" class="form-control" id="bletDate2" name="date" placeholder="MM/DD/YYY" />
								<label class="radio-inline"> <input type="radio"
									name="RadioOptions" id="blettype3" value="Yes">
									Pass									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="RadioOptions" id="blettype4" value="no">
									Fail								
								</label><br>
								<label>Score</label>
								<input type="text" name="" id="bletscr2" class="form-control">
								<label>Proctor</label>
								<input type="text" name="" id="bletproc2" class="form-control">	
							</div>							
					</div>
					<label class="col-sm-3">Additional Information/Training Stamps</label>
					<div class="col-sm-12">								
								<textarea class="form-control" id="ainfo"
									placeholder="" rows=20" ></textarea><br>
					</div>									
					<div class="form-group">
							<label class="col-sm-3 control-label">Returned Badge#</label>
							<div class="col-sm-3" style="max-width: 20%;">
								<input type="text" class="form-control" id="redbadnum"
									placeholder="" />
							</div>
							<label class="col-sm-3 control-label">New Badge#</label>
							<div class="col-sm-3" style="max-width: 20%;">
								<input type="text" class="form-control" id="nbadnum"
									placeholder="" />
							</div>							
					</div>
					<div class="form-group">
							<label class="col-sm-3 control-label">SBO Agent Name</label>
							<div class="col-sm-4" style="max-width: 35%;">
								<input type="text" class="form-control" id="sboname"
									placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Date</label>
							<div class="col-sm-3" style="max-width: 20%;">
								<input type="text" class="form-control" id="bdate" name="date"
									placeholder="MM/DD/YYY" />
							</div>							
					</div>																
					</div>
				</div>
			</div>
		<div class="col-md-12" style="margin-top: 20px;">
			<!-- Indicates a successful or positive action -->
			<div style="margin-bottom: 5%; float: right;">
				<button type="submit"  class="btn btn-success btn-lg"> Next </button>
				<button type="reset" class="btn btn-danger btn-lg"> Cancel </button>
			</div>			
		</div>		
	</form:form>
		
</div>
<script>

</script>
</body>
</html>