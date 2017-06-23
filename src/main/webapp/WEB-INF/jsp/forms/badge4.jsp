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
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">BADGE RECEIPT</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Application Date</label>
							<div class="col-sm-3" style="max-width: 35%;">
								<input type="text" class="form-control" id="bappdate" name="date"
									placeholder="MM/DD/YYY" />
							</div>
							<label class="col-sm-3 control-label">Fingerprint Date</label>
							<div class="col-sm-3" style="max-width: 20%;">
								<input type="text" class="form-control" id="bfindate" name="date"
									placeholder="MM/DD/YYY" />
							</div>	
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Applicant Name</label>
							<div class="col-sm-4" style="max-width: 35%;">
								<input type="text" class="form-control" id="bappname"
									placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Employee ID#</label>
							<div class="col-sm-3" style="max-width: 20%;">
								<input type="text" class="form-control" id="bempid" 
									placeholder="" />
							</div>				
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Company Name</label>
							<div class="col-sm-10" style="max-width: 80%;">
								<input type="text" class="form-control" id="cmpname"
									placeholder="" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12" style="margin-top: 20px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">REQUIRED ICONS AND TRAINING (Please put the necessary icon/training stamps on the back of this receipt)</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Employee's Job Title</label>
							<div class="col-sm-3" style="max-width: 25%;">
								<input type="text" class="form-control" id="EmpJob2"
									placeholder="" />								
							</div>
							<label class="col-sm-3 control-label">LAX Job Location(s)</label>
							<div class="col-sm-3" style="max-width: 25%;">								
								<textarea class="form-control" id="JobLoc2"
									placeholder=""></textarea>
							</div>							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Badge Color</label>
							<div class="col-sm-3" style="max-width:40%;">
								<label class="radio-inline"> <input type="radio"
									name="bdTypeRadioOptions" id="bdtype21" value="Blue">
									Blue(Ramp/Building Access)									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="bdTypeRadioOptions" id="bdtype22" value="Purple">
									Purple(Limited Ramp/Building Access)
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="bdTypeRadioOptions" id="bdtype23" value="Tan">
									Tan(Concessionaires)
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="bdTypeRadioOptions" id="bdtype24" value="Orange">
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
								<label class="radio-inline"> <input type="radio"
									name="customsRadioOptions" id="customtype11" value="Black">
									Black									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="customsRadioOptions" id="customtype12" value="Red">
									Red									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="customsRadioOptions" id="customtype13" value="No">
									No									
								</label> 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Customs Seal Approval Stamp or Customs Seal Roll-over letter from CBP must be provided for each issuance</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Weapon Star</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="weaponRadioOptions" id="weapontype11" value="Black">
									Black									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="weaponRadioOptions" id="weapontype12" value="White">
									White(Leo)									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="weaponRadioOptions" id="weapontype13" value="No">
									No									
								</label> 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Valid Fire arms permit and Guard registration card or law enforcement agency credentials required for each issuance</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Restricted Area Driver(RAD)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="radRadioOptions" id="radtype11" value="Green">
									Green									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="radRadioOptions" id="radtype12" value="Black">
									Black(Leo)									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="radRadioOptions" id="radtype13" value="No">
									No									
								</label> 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">8 hours of Practical(behind the wheel) Driver TRaining and successful completion of qualifying written exam required. Roll-over eligible for same company</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">LAX Police Drive-thru Post(s)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="laxpRadioOptions" id="laxptype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="laxpRadioOptions" id="laxptype12" value="No">
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Supplemental access allowing recipient to drive approved vehicle(s) through designated access posts-RAD icon required</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Air Traffic Control(ATC)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="atcRadioOptions" id="atctype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="atcRadioOptions" id="atctype12" value="No">
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Airfield operations for each issuance-RAD icon required</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Aircraft Surface Movement(ASM)</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="asmRadioOptions" id="asmtype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="asmRadioOptions" id="asmtype12" value="No">
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Airfield operations for each issuance-RAD icon required</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">AOA Familiarization</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="aoaRadioOptions" id="aoatype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="aoaRadioOptions" id="aoatype12" value="No">
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Airfield operations for each issuance</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Escort</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="escRadioOptions" id="esctype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="escRadioOptions" id="esctype12" value="No">
									No									
								</label>								 
							</div>
							<label class="col-sm-3" style="font-weight:normal;">Training stamp required from LAX Police(VAAU) for 1st time issuance Roll-Over eligible for same company</label>							
						</div>
						<div class="form-group">
							<label class="col-sm-5" style="font-weight:normal;">Critical Icon</label>
							<div class="col-sm-8" style="max-width:30%;">
								<label class="radio-inline"> <input type="radio"
									name="critRadioOptions" id="crittype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="critRadioOptions" id="crittype12" value="No">
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
								<label class="radio-inline"> <input type="radio"
									name="spRadioOptions" id="sptype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="spRadioOptions" id="sptype12" value="na">
									N/A									
								</label>								 
							</div>
							<label class="col-sm-2 control-label">Certified Trainer(Name)</label>
							<div class="col-sm-2" style="max-width: 35%;">
								<textarea class="form-control" id="trainame1"
									placeholder="" rows="3" ></textarea>
							</div>
							<label class="col-sm-2 control-label">Completion Date</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="cmpDate1" name="date" placeholder="MM/DD/YYY" />
							</div>
						</div>	
						<div class="form-group">
							<label class="col-sm-2 control-label">Restricted Area Driver Training</label>
							<div class="col-sm-2" style="max-width:11%;">
								<label class="radio-inline"> <input type="radio"
									name="resRadioOptions" id="restype11" value="Yes">
									Yes									
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="resRadioOptions" id="restype12" value="na">
									N/A									
								</label>								 
							</div>
							<label class="col-sm-2 control-label">Driving Instructor (Name)</label>
							<div class="col-sm-2" style="max-width: 35%;">
								<textarea class="form-control" id="driname1"
									placeholder="" rows="3" ></textarea>
							</div>
							<label class="col-sm-2 control-label">Badge#</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="badge1" name="" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Completion Date</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="cmpDate1" name="date" placeholder="MM/DD/YYY" />
							</div>
						</div>
						<label>I hereby certify that the employee named on this badge application is a direct employee of the organization listed 
						on Page 1 of this application. Further I have reviewed the information and statements on this application and signed and dated this form
						ONLY AFTER ALL THE INFORMATION WAS COMPLETED AND VERIFIED</label>
						<div class="form-group">
							<label class="col-sm-2">Authorized Signatory(Print Full Name)</label>
							<div class="col-sm-3" style="max-width: 20%;">
								<input type="text" class="form-control" id="authsign1" name="fullname" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Contact#</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="authphone1" name="contact" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Authority ID#</label>
							<div class="col-sm-2" style="max-width: 15%;">
								<input type="text" class="form-control" id="authid1" name="id" placeholder="" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2">Authorized Signature</label>
							<div class="col-sm-3" style="max-width: 45%;">
								<input type="text" class="form-control" id="authsign21" name="authsign" placeholder="" />
							</div>
							<label class="col-sm-2 control-label">Authorized Date</label>															
								<div class="col-sm-2" style="max-width: 15%;">																								
										<input type="text" class="form-control" id="authDate22" name="date" placeholder="MM/DD/YYY" />								
								</div>							  
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12" style="margin-top: 20px;">
				<p>Warning: THIS RECORD CONTAINS Sensitive Security Information that is controlled under 49 CFR parts 15 and 1520.
				No part of this record may be disclosed  to persona without a "need to know", as defined in 49 CFR parts 15 and 1520, except 
				with the written permission of the Transportation Security Administration or the Secreatary of Transportation. Unauthorized 
				release may result in civil penalty or other action. For U.S. government public disclosure is governed by 5u.s.c. 552 and 
				49 CFR parts 15 and 1520.</p>
			</div>
		<div class="col-md-12" style="margin-top: 20px;">
			<!-- Indicates a successful or positive action -->
			<div style="margin-bottom: 5%; float: right;">
				<button type="reset" class="btn btn-danger btn-lg"> Cancel </button>
				<button type="submit"  class="btn btn-success btn-lg"> Submit </button>
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