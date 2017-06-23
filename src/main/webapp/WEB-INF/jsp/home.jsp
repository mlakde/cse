<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-confirm.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//cdn.jsdelivr.net/jquery.marquee/1.4.0/jquery.marquee.min.js'></script>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular.min.js"></script>
<!-- files for table sort --> 
<script type="text/javascript" src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- end files for table sort --> 
<!-- Date formating -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/moment.js"></script>
<!-- End Date formating -->
</head>
<title> Credential System - Authorized Signer </title>
</head>
<style>
	.scheduled{
	background-color: #d8e5f3;
	cursor: pointer !important;
	}
	 .appointment-type{
	background-color: #fff;
	margin: 0 50px 0 0 ;
	color: #000;
	
	}
	.column-title{
		color: black;
		font-weight: bold;
		font-size: large;
		background-color:#fff;
	}
</style>
<script>	
$(document).ready(function () {
	$('.nav-tabs a').click(function(){	       
	   $('#tabName').text('- '+$(this).text());
	});
});

</script>
<body>
	<h2> LAWA Credential System </h2>
	<div class="progress">
		<div class="progress-bar" style="width: 100%;"></div>
	</div>
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- Start of Header -->
	<div class="col-sm-12 col-md-12 col-lg-12">
		<div class="col-sm-8 col-md-8 col-lg-8"></div>
		<div class="col-sm-4 col-md-4 col-lg-4">
		<form action="<c:url value='/logout' />" method="post">
			<div style="border: medium; float: right;">
				<p>
					 You are logged in as <em>${authenticatedUser.firstName} ${authenticatedUser.lastName}</em>. 
					<input name="_csrf" type="hidden" value="${_csrf.token}" /> <input name="submit" type="submit" value="Logout" class="btn btn-warning" />
				</p>
			</div>
		</form>  
		</div>	
	</div> 
<!-- End of Header -->
<div class="container" ng-app="myApp" ng-controller="authorizedSignerCtrl">
  <h2>Authorized Signer Dashboard <span id="tabName"> - Start Application </span></h2>
  <ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#token" data-ng-click="getTabName('token')"> Start New Application </a></li>
	<li><a data-toggle="tab" href="#TG" data-ng-click="getTabName('TG')">Token Generated</a></li>
    <li><a data-toggle="tab" href="#AR" data-ng-click="getTabName('AR')">Approval Required</a></li>
    <li><a data-toggle="tab" href="#SA" data-ng-click="getTabName('SA')">Signer Approved</a></li>
    <li><a data-toggle="tab" href="#SR" data-ng-click="getTabName('SR')">Signer Rejected</a></li>
    <li><a data-toggle="tab" href="#AA" data-ng-click="getTabName('AA')">Agent Approved</a></li>
    <li><a data-toggle="tab" href="#AD" data-ng-click="getTabName('AD')">Agent Denied</a></li>
  </ul>

  <div class="tab-content">

	<!-- Modal to display success message--> 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="smallModal" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">Application Created!!</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" onClick="window.location.reload()">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
 
  
    <!--Token Generate begin -->
    <div id="token" class="tab-pane fade in active">
		<form class="form-horizontal" role="form" id="tokenGeneratorForm" name="myForm">

		<!-- ************************ START of Applicationt******************************* -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="col-md-12" style="margin-top: 20px;">
				
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title"> Start Application </h3>
					</div>
					<div class="panel-body">
				
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="col-sm-6 col-md-6 col-lg-6">
						<select class="btn btn-primary dropdown-toggle" data-toggle="dropdown" ng-model="companyName" id="companyName" onchange="ChangecompList()" name="companyName" required="required">
							  <option value="">-- Company Name --</option> 
							  <option value="Birdi">Birdi And Associates</option> 
							  <option value="BMC"> BMC </option> 
							  <option value="WDC"> WDC </option> 
						</select> 
						<span style="color:Red" ng-show="myForm.companyName.$error.required">Select Company</span>
					</div>
					 	
					<div class="col-sm-6 col-md-6 col-lg-6">
						<select id="companyDivision" class="btn btn-primary dropdown-toggle" ng-model="companyDivision" data-toggle="dropdown" name="companyDivision" required="required">
						 <option value="{{companyDivision}}"> -- Company Division --</option> 
						</select>
						<span style="color:Red" ng-show="myForm.companyDivision.$error.required">Select Division</span>   
					</div>
				</div> 
				
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="col-sm-6 col-md-6 col-lg-6">	
						<label class="control-label">Application Type</label> <br />
						<label class="radio-inline"> <input type="radio" ng-model="applType" name="applType"  id="FingerPrint" value="FingerPrint" required="required" > New (FingerPrint)</label> 
						<label class="radio-inline"> <input type="radio" ng-model="applType" name="applType" id="Badge" value="Badge" /> Badge </label>
						<label class="radio-inline"> <input type="radio" ng-model="applType" name="applType" id="Renewal" value="Renewal" /> Renewal </label> 
						<label class="radio-inline"> <input type="radio" ng-model="applType" name="applType" id="update" value="Update" /> Update </label>
						<label class="radio-inline"> <input type="radio" ng-model="applType" name="applType" id="LostStolen" value="LostStolen" /> Lost/Stolen </label>  	
					 </div>
					 <div class="col-sm-6 col-md-6 col-lg-6" ng-class="{ 'has-error' : myForm.companyCode.$error.required}">
						<label class="control-label">Code</label> 	
						<input type="text" class="form-control" ng-model="companyCode" name="companyCode" id="companyCode" required="required"/>
					</div>
				</div>
				
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="col-sm-6 col-md-6 col-lg-6" ng-class="{ 'has-error' : myForm.firstName.$error.required}">	
						<label class="control-label">First Name</label> 	
						<input class="form-control" ng-model="firstName"  type="text" name="firstName" ng-pattern ="/^[a-zA-Z\s]*$/" required="required"/>
						<span style="color:Red" ng-show="myForm.firstName.$invalid&&myForm.firstName.$error.pattern">Please Enter Valid First Name</span>
					</div>
					 	
					<div class="col-sm-6 col-md-6 col-lg-6" ng-class="{ 'has-error' : myForm.lastName.$error.required}">
						<label class="control-label">Last Name</label> 	
						<input class="form-control" type="text" ng-model="lastName" ng-pattern ="/^[a-zA-Z\s]*$/" name="lastName" required="required"/>
						<span style="color:Red" ng-show="myForm.lastName.$invalid&&myForm.lastName.$error.pattern">Please Enter Valid Last Name</span>
					</div>
				</div> 
				
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="col-sm-6 col-md-6 col-lg-6" ng-class="{ 'has-error' : myForm.ssn.$error.required}">	
						<label class="control-label">Social Security Number (Last four digit)</label> 
						<input type="number" name="ssn" class="form-control" ng-model="ssn" placeholder="enter last 4 digits of SSN" ng-minlength="1" ng-maxlength="4" min="0" max="9999" required="required"/>	
						<span style="color:Red" ng-show="myForm.ssn.$invalid">Please Enter Valid SSN</span>
					</div>
					 					 	
					<div class="col-sm-6 col-md-6 col-lg-6" ng-class="{ 'has-error' : myForm.email.$error.required}">
						<label class="control-label">Email</label> 	
						<input class="form-control" type="text" name="email" ng-model="email" ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" required />
						<span style="color:Red" ng-show="myForm.email.$dirty&&myForm.email.$error.pattern">Please Enter Valid Email</span>	
                    </div>
				</div>	
								
			</div>
		</div>
	</div>	
	
		<!-- ************************ End of Application and Company Information******************************* -->	
	 		<div class="col-md-12" style="margin-top: 20px;">
				<!-- Indicates a successful or positive action -->
				<div style="margin-bottom: 5%; float: right;">
					<button type="reset" class="btn btn-danger btn-lg"> Cancel </button>
					<button type="submit" data-ng-disabled="myForm.$invalid"
				   data-ng-click="submit(myForm)" class="btn btn-success btn-lg example2"> Submit </button>
				</div>			
			</div>
	    </form>		
	</div>

<form name="myForm2" id="myForm2">
<div class="col-sm-3 col-md-3 col-lg-3">
	<label id="companyNameDivision" name="companyNameDivision">Select Company Name and Division </label>
</div>
<div class="container"style="height:50px; margin-top:10px;">
 	<div class="col-sm-2 col-md-2 col-lg-2">
  		<select class="btn btn-primary dropdown-toggle" data-toggle="dropdown" ng-model="companyName1" id="companyName1" onchange="ChangecompList1()" name="companyName1" required="required">
		 	<option value="">-- Company Name --</option> 
			<option value="Birdi">Birdi And Associates</option> 
			<option value="BMC"> BMC </option> 
			<option value="WDC"> WDC </option> 
		</select>
	</div>
	<div class="col-sm-2 col-md-2 col-lg-2">	
	 	<select id="companyDivision1" class="btn btn-primary dropdown-toggle" ng-model="companyDivision1" data-toggle="dropdown" name="companyDivision1" required="required" ng-change="selectedResult(companyName1,companyDivision1)">
			<option value="{{companyDivision1}}"> -- Company Division --</option>		 
  		</select>
  	</div>		
</div>
</form>
<!-- TG begin -->
<div id="TG" class="tab-pane fade" ng-app="sortApp">
 	<form>
 	
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search Application" ng-model="Search">
      </div>      
    </div>
  	</form>
  	
				
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <td>
          <a href="#" ng-click="sortType = 'firstName'; sortReverse = !sortReverse"> First Name
            <span ng-show="sortType == 'firstName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'firstName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'lastName'; sortReverse = !sortReverse"> Last Name
            <span ng-show="sortType == 'lastName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'lastName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'emailAddress_Primary'; sortReverse = !sortReverse"> Email
            <span ng-show="sortType == 'emailAddress_Primary' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'emailAddress_Primary' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#" ng-click="sortType = 'expiryDate'; sortReverse = !sortReverse"> Expire On
            <span ng-show="sortType == 'expiryDate' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'expiryDate' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#"> Action </a>
        </td>		
      </tr>
    </thead>
    <tbody>
       <tr ng-repeat="tg in TokenGeneratedApplications | orderBy:sortType:sortReverse | filter:Search">
		<td>{{tg.firstName}}</td>
		<td>{{tg.lastName}}</td>
		<td>{{tg.emailAddress_Primary}}</td>
		 <td>{{tg.expiryDate}}</td>
		<td><a href="<c:url value='/forms/form.html?id={{appl.id}}' /> " class="badge" target="_blank"> Send Token </a></td>
      </tr>
    </tbody>
  </table>
 </div>
<!-- End of TG begin --> 

	   
<!-- AR begin -->
<div id="AR" class="tab-pane fade" ng-app="sortApp">
 	<form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search Application" ng-model="Search">
      </div>      
    </div>
  	</form>
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <td>
          <a href="#" ng-click="sortType = 'personBiographic.firstName'; sortReverse = !sortReverse"> First Name
            <span ng-show="sortType == 'personBiographic.firstName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.firstName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.lastName'; sortReverse = !sortReverse"> Last Name
            <span ng-show="sortType == 'personBiographic.lastName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.lastName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.emailAddress_Primary'; sortReverse = !sortReverse"> Email
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a href="#"> Action </a>
        </td>		
      </tr>
    </thead>
    <tbody>
       <tr ng-repeat="appl in ApplicationsUnderReview | orderBy:sortType:sortReverse | filter:Search">
		<td>{{appl.personBiographic.firstName}}</td>
		<td>{{appl.personBiographic.lastName}}</td>
		<td>{{appl.personBiographic.emailAddress_Primary}}</td>
		<td><a href="<c:url value='/forms/form.html?id={{appl.id}}' /> " class="badge" target="_blank"> Review </a></td>
      </tr>
    </tbody>
  </table>
 </div>
<!-- End of AR begin --> 

<!-- SA begin -->
<div id="SA" class="tab-pane fade" ng-app="sortApp">
 	<form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search Application" ng-model="Search">
      </div>      
    </div>
  	</form>
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <td>
          <a href="#" ng-click="sortType = 'personBiographic.firstName'; sortReverse = !sortReverse"> First Name
            <span ng-show="sortType == 'personBiographic.firstName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.firstName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.lastName'; sortReverse = !sortReverse"> Last Name
            <span ng-show="sortType == 'personBiographic.lastName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.lastName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.emailAddress_Primary'; sortReverse = !sortReverse"> Email
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>	
      </tr>
    </thead>
    <tbody>
       <tr ng-repeat="sa in SignerApprovedApplications | orderBy:sortType:sortReverse | filter:Search">
		<td>{{sa.personBiographic.firstName}}</td>
		<td>{{sa.personBiographic.lastName}}</td>
		<td>{{sa.personBiographic.emailAddress_Primary}}</td>
      </tr>
    </tbody>
  </table>
 </div>
<!-- End of SA begin --> 


<!-- SR begin -->
<div id="SR" class="tab-pane fade" ng-app="sortApp">
 	<form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search Application" ng-model="Search">
      </div>      
    </div>
  	</form>
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <td>
          <a href="#" ng-click="sortType = 'personBiographic.firstName'; sortReverse = !sortReverse"> First Name
            <span ng-show="sortType == 'personBiographic.firstName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.firstName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.lastName'; sortReverse = !sortReverse"> Last Name
            <span ng-show="sortType == 'personBiographic.lastName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.lastName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.emailAddress_Primary'; sortReverse = !sortReverse"> Email
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>		
      </tr>
    </thead>
    <tbody>
       <tr ng-repeat="sr in SignerRejectedApplications | orderBy:sortType:sortReverse | filter:Search">
		<td>{{sr.personBiographic.firstName}}</td>
		<td>{{sr.personBiographic.lastName}}</td>
		<td>{{sr.personBiographic.emailAddress_Primary}}</td>
      </tr>
    </tbody>
  </table>
 </div>
<!-- End of SR begin --> 


<!-- AA begin -->
<div id="AA" class="tab-pane fade" ng-app="sortApp">
 	<form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search Application" ng-model="Search">
      </div>      
    </div>
  	</form>
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <td>
          <a href="#" ng-click="sortType = 'personBiographic.firstName'; sortReverse = !sortReverse"> First Name
            <span ng-show="sortType == 'personBiographic.firstName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.firstName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.lastName'; sortReverse = !sortReverse"> Last Name
            <span ng-show="sortType == 'personBiographic.lastName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.lastName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.emailAddress_Primary'; sortReverse = !sortReverse"> Email
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>		
      </tr>
    </thead>
    <tbody>
       <tr ng-repeat="aa in AgentApprovedApplications | orderBy:sortType:sortReverse | filter:Search">
		<td>{{aa.personBiographic.firstName}}</td>
		<td>{{aa.personBiographic.lastName}}</td>
		<td>{{aa.personBiographic.emailAddress_Primary}}</td>
      </tr>
    </tbody>
  </table>
 </div>
<!-- End of AA begin --> 
 
 
<!-- AD begin -->
<div id="AD" class="tab-pane fade" ng-app="sortApp">
 	<form>
    <div class="form-group">
      <div class="input-group">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
        <input type="text" class="form-control" placeholder="Search Application" ng-model="Search">
      </div>      
    </div>
  	</form>
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <td>
          <a href="#" ng-click="sortType = 'personBiographic.firstName'; sortReverse = !sortReverse"> First Name
            <span ng-show="sortType == 'personBiographic.firstName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.firstName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.lastName'; sortReverse = !sortReverse"> Last Name
            <span ng-show="sortType == 'personBiographic.lastName' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.lastName' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
		<td>
          <a href="#" ng-click="sortType = 'personBiographic.emailAddress_Primary'; sortReverse = !sortReverse"> Email
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'personBiographic.emailAddress_Primary' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>		
      </tr>
    </thead>
    <tbody>
       <tr ng-repeat="ad in AgentDeniedApplications | orderBy:sortType:sortReverse | filter:Search">
		<td>{{ad.personBiographic.firstName}}</td>
		<td>{{ad.personBiographic.lastName}}</td>
		<td>{{ad.personBiographic.emailAddress_Primary}}</td>
      </tr>
    </tbody>
  </table>
 </div>
<!-- End of AD begin -->     
     
 </div> <!-- End of tab-content -->
</div> <!--  End of container -->
</body>

<script type="text/javascript">
document.getElementById('myForm2').style.display = 'none';

var companyDivision = {};
companyDivision['Birdi'] = ['Software', 'Hardware', 'Support'];
companyDivision['BMC'] = ['ABC', 'Software', 'Technical', 'AD'];
companyDivision['WDC'] = ['xyz', 'Software', 'TechSupport'];

//for generating Token
function ChangecompList() {
    var compList = document.getElementById("companyName");
    var modelList = document.getElementById("companyDivision");
    var selCom = compList.options[compList.selectedIndex].value;
    while (modelList.options.length) {
        modelList.remove(0);
    }
    var companies = companyDivision[selCom];
    if (companies) {
        var i;
        for (i = 0; i < companies.length; i++) {
            var com = new Option(companies[i], i);
            modelList.options.add(com);
        }
    }
} 

//for other tabs
var companyDivision1 = {};
companyDivision1['Birdi'] = ['Software', 'Hardware', 'Support'];
companyDivision1['BMC'] = ['ABC', 'Software', 'Technical', 'AD'];
companyDivision1['WDC'] = ['xyz', 'Software', 'TechSupport'];


function ChangecompList1() {
    var compList = document.getElementById("companyName1");
    var modelList = document.getElementById("companyDivision1");
    var selCom = compList.options[compList.selectedIndex].value;
    while (modelList.options.length) {
        modelList.remove(0);
    }
    var companies = companyDivision1[selCom];
    if (companies) {
        var i;
        for (i = 0; i < companies.length; i++) {
            var com = new Option(companies[i], i);
            modelList.options.add(com);
        }
    }
} 
</script>


<script>
var app = angular.module('myApp', []);
app.controller('authorizedSignerCtrl', function($scope, $http) {
	var csrfToken = "${_csrf.token}"; 
	 
	 $scope.sortType     = 'id'; // set the default sort type
	 $scope.sortReverse  = true;  // set the default sort order
	 $scope.Search = '';     // set the default search/filter term
	  
	 $scope.newApplication = {};
	 $scope.applicationTypeObj = {};
	 
	
	//Logic to get which tab is selected
	$scope.getTabName= function(tabName){
		$scope.tabName = tabName;		
		if(tabName == 'token'){
			 document.getElementById('myForm2').style.display = 'none';
		}
		if(tabName == 'TG' || tabName == 'AR' || tabName == 'SA' || tabName == 'SR' || tabName == 'AP' || tabName == 'AD'){
			document.getElementById('myForm2').style.display = 'block';
		}
	}
	
	
	$scope.selectedResult = function(companyName1,companyDivision1) {
		var companyDetailObj = {
			"companyName" : companyName1,
			"companyDivision" : companyDivision1,
			"tabName" : $scope.tabName
		};		
		if(companyDetailObj.tabName === 'TG'){
		//Logic to get Applications which sent to Applicant
		$http({
			method : 'POST',
			url : "getTokenGeneratedApplications",
			data : JSON.stringify(companyDetailObj),
			headers : {
				'X-CSRF-TOKEN' : csrfToken
					}
			}).then(function success(data) {
				console.log(data.data);
				$scope.TokenGeneratedApplications = data.data;
				angular.forEach($scope.TokenGeneratedApplications,function(item){
					item.expiryDate = moment(item.expiryDate).format("YYYY-MM-DD");
				});
			}, function error() {
		 });	
		}		
		if(companyDetailObj.tabName === 'AR'){
		//Logic to get Applications which are pending for Review	
			$http({
				method : 'POST',
				url : "getApplicationsUnderReview",
				data : JSON.stringify(companyDetailObj),
				headers : {
					'X-CSRF-TOKEN' : csrfToken
				}
			}).then(function success(data) {
					$scope.ApplicationsUnderReview = data.data;
					console.log(data);
				}, function error() {
			});	
		}
		if(companyDetailObj.tabName === 'SA'){
		//Logic to get Applications which are Reviewed/Approved	
			 $http({
					method : 'POST',
					url : "getSignerApprovedApplications",
					data : JSON.stringify(companyDetailObj),
					headers : {
						'X-CSRF-TOKEN' : csrfToken
					}
				}).then(function success(data) {
						$scope.SignerApprovedApplications = data.data;
						console.log(data);
					}, function error() {
				});			
		}
		if(companyDetailObj.tabName === 'SR'){
		//Logic to get Applications which are Signer Rejected	
			 $http({
					method : 'POST',
					url : "getSignerRejectedApplications",
					data : JSON.stringify(companyDetailObj),
					headers : {
						'Content-Type' : 'application/json',
						'X-CSRF-TOKEN' : csrfToken
					}
				}).then(function success(data) {
						$scope.SignerRejectedApplications = data.data;
						console.log(data);
					}, function error() {
				});			
		}
		if(companyDetailObj.tabName === 'AA'){
		//Logic to get Applications which are Approved by Agent	
			 $http({
					method : 'POST',
					url : "getAgentApprovedApplications",
					data : JSON.stringify(companyDetailObj),
					headers : {
						'X-CSRF-TOKEN' : csrfToken
					}
				}).then(function success(data) {
						$scope.AgentApprovedApplications = data.data;
						console.log(data);
					}, function error() {
				});			
		}
		if(companyDetailObj.tabName === 'AD'){
		//Logic to get Applications which are Agent Denied	
			 $http({
					method : 'POST',
					url : "getAgentDeniedApplications",
					data : JSON.stringify(companyDetailObj),
					headers : {
						'X-CSRF-TOKEN' : csrfToken
					}
				}).then(function success(data) {
						$scope.AgentDeniedApplications = data.data;
						console.log(data);
					}, function error() {
				});			
		}
     };
	 
     
     $scope.submit = function () {
		$scope.applicationTypeObj.type=this.applType;//set application type
		
		$scope.newApplication.FirstName= this.firstName;
		$scope.newApplication.LastName=this.lastName;
		$scope.newApplication.EmailAddress_Primary=this.email;
		$scope.newApplication.SocialSecurityNumber=this.ssn;
		$scope.newApplication.companyName=this.companyName;
		$scope.newApplication.companyDivision=this.companyDivision;
		$scope.newApplication.companyCode=this.companyCode;
		$scope.newApplication.applicationType= $scope.applicationTypeObj;// add application type object into application token object
		
		var obj = {
			"newApplication" : JSON.stringify($scope.newApplication),
		};
		console.log($scope.newApplication);
		  $http({
	    	method: 'POST',
	    	url: '/cse/getNewApplication', 
	    	data: $scope.newApplication,
	    		headers: { 
	    		  'X-CSRF-TOKEN' : csrfToken	
	    		   		}
	    		}).then(
	    		    function(res) {
	    		        console.log(res.data);
 						$('#myModal').modal('show');
	    		    },
	    		    function(err) {
	    		        console.log('error...', err);
	    		    }
	    		); 
	  }
	
});
</script>
</html>
 
 
 