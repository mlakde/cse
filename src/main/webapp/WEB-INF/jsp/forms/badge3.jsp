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
						<h3 class="panel-title">STEP 3 - EMPLOYER AND SECURITY ACCESS INFORMATION</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<div class="col-sm-12"><form:checkbox path="directCompanyEmployee" name="directCompanyEmployee" value="yes" />APPLICANT IS A DIRECT EMPLOYEE OF THE COMPANY LISTED ON PAGE 1 OF THIS APPLICATION</div>
							<div class="col-sm-12"><form:checkbox path="SponsoredEmployeeOfCONCESSIONAIRE" name="SponsoredEmployeeOfCONCESSIONAIRE" value="yes" />APPLICANT IS A SPONSORED EMPLOYEE OF THE CONCESSIONAIRE LISTED AND IS EMPLOYED BY <input type="text" class="form-control" id="sponserd" placeholder="" style="max-width: 30%;"/></div>
							<div class="col-sm-12"><form:checkbox path="directCompanyEmployeeOfLAWA" name="directCompanyEmployeeOfLAWA" value="yes" />APPLICANT IS A DIRECT EMPLOYEE OF LOS ANGELES WORLD AIRPORTS(LAWA)</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Employee's Job Title</label>
							<div class="col-sm-3" style="max-width: 25%;">
								<form:input path="employeeJobTitle" class="form-control" id="employeeJobTitle"
									placeholder="" />								
							</div>
							<label class="col-sm-3 control-label">LAX Job Location(s)</label>
							<div class="col-sm-3" style="max-width: 25%;">								
								<form:textarea path="lawaJobLocation" class="form-control" id="JobLoc"
									placeholder=""></form:textarea>
							</div>							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Badge Color</label>
							<div class="col-sm-3" style="max-width:40%;">
								<form:radiobutton path="badgeColor" name="bdTypeRadioOptions" id="bdtype1" value="Blue" />
									Blue(Ramp/Building Access)									
								 
								<label class="radio-inline"> <form:radiobutton path="badgeColor" 
									name="bdTypeRadioOptions" id="bdtype2" value="Purple" />
									Purple(Limited Ramp/Building Access)
								</label> 
								<label class="radio-inline"> <form:radiobutton path="badgeColor" 
									name="bdTypeRadioOptions" id="bdtype3" value="Tan" />
									Tan(Concessionaires)
								</label> 
								<label class="radio-inline"> <form:radiobutton path="badgeColor" 
									name="bdTypeRadioOptions" id="bdtype4" value="Orange" />
									Orange(ID only)
								</label> 
							</div>							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Security Access Icons</label>
							<label class="col-sm-4 control-label">Approved</label>
							<label class="col-sm-4 control-label">Requirements</label>
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">U.S. Customs Seal</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal" 
									name="customsRadioOptions" id="customtype1" value="Black" />
									Black									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="customsRadioOptions" id="customtype2" value="Red" />
									Red									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="customsRadioOptions" id="customtype3" value="No" />
									No									
								</label> 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Customs Seal Approval Stamp or Customs Seal Roll-over letter from CBP must be provided for each issuance</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Weapon Star</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="weaponRadioOptions" id="weapontype1" value="Black" />
									Black									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="weaponRadioOptions" id="weapontype2" value="White" />
									White(Leo)									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="weaponRadioOptions" id="weapontype3" value="No" />
									No									
								</label> 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Valid Fire arms permit and Guard registration card or law enforcement agency credentials required for each issuance</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Restricted Area Driver(RAD)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="radRadioOptions" id="radtype1" value="Green" />
									Green									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="radRadioOptions" id="radtype2" value="Black" />
									Black(Leo)									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="radRadioOptions" id="radtype3" value="No" />
									No									
								</label> 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">8 hours of Practical(behind the wheel) Driver TRaining and successful completion of qualifying written exam required. Roll-over eligible for same company</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">LAX Police Drive-thru Post(s)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="laxpRadioOptions" id="laxptype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="laxpRadioOptions" id="laxptype2" value="No" />
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Supplemental access allowing recipient to drive approved vehicle(s) through designated access posts-RAD icon required</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Air Traffic Control(ATC)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="atcRadioOptions" id="atctype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="atcRadioOptions" id="atctype2" value="No" />
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Airfield operations for each issuance-RAD icon required</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Aircraft Surface Movement(ASM)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="asmRadioOptions" id="asmtype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="asmRadioOptions" id="asmtype2" value="No" />
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Airfield operations for each issuance-RAD icon required</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">AOA Familiarization</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="aoaRadioOptions" id="aoatype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="aoaRadioOptions" id="aoatype2" value="No" />
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Airfield operations for each issuance</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Escort</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="escRadioOptions" id="esctype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="escRadioOptions" id="esctype2" value="No" />
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Police(VAAU) for 1st time issuance Roll-Over eligible for same company</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Critical Icon</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="critRadioOptions" id="crittype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="critRadioOptions" id="crittype2" value="No" />
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Approval stamp required from LAWA Emergency Preparedness Roll-Over eligible for same company</label>							
						</div>
						<label class="col-sm-3">Special Instructions</label><br/>	
						<label style="font-weight:normal;"><b>Security Training Information:</b> Training required for all new employees and those who have allowed their access to lapse and have gone without airport access for more than 6 months</label>
						<div class="form-group">
							<label class="col-sm-2 control-label">Airport Security Training</label>
							<div class="col-sm-2" style="max-width:11%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="spRadioOptions" id="sptype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="spRadioOptions" id="sptype2" value="na" />
									N/A									
								</label>								 
							</div>
							<label class="col-sm-2 control-label">Certified Trainer(Name)</label>
							<div class="col-sm-2" style="max-width: 35%;">
								<form:textarea path="" class="form-control" id="trainame"
									placeholder="" rows="3" ></form:textarea>
							</div>
							<label class="col-sm-2 control-label">Completion Date</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<form:input path="authorizedDate" class="form-control" id="authorizedDate" name="authorizedDate" placeholder="MM/DD/YYY" />
							</div>
						</div>	
						<div class="form-group">
							<label class="col-sm-2 control-label">Restricted Area Driver Training</label>
							<div class="col-sm-2" style="max-width:11%;">
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="resRadioOptions" id="restype1" value="Yes" />
									Yes									
								</label> 
								<label class="radio-inline"> <form:radiobutton path="USCustomsSeal"
									name="resRadioOptions" id="restype2" value="na" />
									N/A									
								</label>								 
							</div>
							<label class="col-sm-2 control-label">Driving Instructor (Name)</label>
							<div class="col-sm-2" style="max-width: 35%;">
								<textarea class="form-control" id="driname"
									placeholder="" rows="3" ></textarea>
							</div>
							<label class="col-sm-2 control-label">Badge#</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="badge" name="" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Completion Date</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="cmpDate" name="date" placeholder="MM/DD/YYY" />
							</div>
						</div>
						<label>I hereby certify that the employee named on this badge application is a direct employee of the organization listed 
						on Page 1 of this application. Further I have reviewed the information and statements on this application and signed and dated this form
						ONLY AFTER ALL THE INFORMATION WAS COMPLETED AND VERIFIED</label>
						<div class="form-group">
							<label class="col-sm-2">Authorized Signatory(Print Full Name)</label>
							<div class="col-sm-3" style="max-width: 20%;">
								<input type="text" class="form-control" id="authsign" name="fullname" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Contact#</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="authphone" name="contact" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Authority ID#</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="authid" name="id" placeholder="" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2">Authorized Signature</label>
							<div class="col-sm-3" style="max-width: 45%;">
								<input type="text" class="form-control" id="authsign2" name="authsign" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Authorized Date</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="authDate2" name="date" placeholder="MM/DD/YYY" />
							</div>
						</div>						
					</div>
				</div>
			</div>
			<div class="col-md-12" style="margin-top: 20px;">
			<!-- Indicates a successful or positive action -->
			<div style="margin-bottom: 5%; float: right;">
				<button type="reset" class="btn btn-danger btn-lg"> Cancel </button>
				<button type="submit"  class="btn btn-success btn-lg"> Next </button>
			</div>			
		</div>
		
		
	</form:form>
		
</div>
<script>
	$(document).ready(function () {
        var date_input = $('input[name="date"]'); //our date input has the name "date"
        var date_exp=$('input[name="expDate"]');
        //var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
        var options = {
            format: 'mm/dd/yyyy',
            //container: container,
            todayHighlight: true,
            autoclose: true,
        };
        date_input.datepicker(options);
        date_exp.datepicker(options);
    })    
</script>
</body>
</html>