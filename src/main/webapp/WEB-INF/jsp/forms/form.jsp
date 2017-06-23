<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LAX Security Badge Application</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/angular.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/mask.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/moment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/angularApp/app.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/angularApp/lookup.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/angularApp/documentValidation.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/resources/css/bootstrap-grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-datepicker.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-iso.css"/>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-confirm.js"></script> --%>
</head>

<!-- <body data-ng-app="eForm">	
	<div data-ng-include="/jsp/forms/b1.jsp"></div>


</body> -->
<body data-ng-app="eForm" data-ng-controller = "formCtrl" >
<!-- 	
<div data-ng-include src="'b1.html'"></div>  -->
<!-- <input class="form-control" type="text" ng-model="phonenumber" ui-mask="(999) 999-9999"  ui-mask-placeholder ui-mask-placeholder-char="_"/> -->
 <div data-ng-show="isFirstForm"> 
<%@ include file="/WEB-INF/jsp/forms/b1.html" %>

 </div> 
<div data-ng-show="isSecondForm">
<%@ include file="/WEB-INF/jsp/forms/badge2.jsp" %>
</div>  



</body>
<style>
div.required .control-label:after {
  content:" *";
  color:red;
}
/* .required {
    position: absolute;
    margin-left: -10px;
    color: #FB0000;
    font-size: 15px;
} */
	.fieldWidth {
		width:25%;
	}
	fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}

    legend.scheduler-border {
        font-size: 1.2em !important;
        font-weight: bold !important;
        text-align: left !important;
        width:auto;
        padding:0 10px;
        border-bottom:none;
    }
    .form-group{
    	margin-left:-10% !imrportant;
    }
    .customPanelHeading{
    	font-weight:900;
    }
</style>

<script>

var app = angular.module('eForm');
app.controller('formCtrl', function($rootScope,$scope,$http, stateListFactory, documentFactory,$timeout) {
	console.log(stateListFactory.hairColorList());
	var csrfToken = "${_csrf.token}";
	/* jQuery(document).ready(function() {
		 jQuery("[required]").after("<span class='require'>*</span>");
		}); */
	$scope.hairColorList = stateListFactory.hairColorList();
    $scope.documentList = stateListFactory.documentList();
    $scope.secondaryDocumentList = stateListFactory.secondaryDocumentList();
    console.log($scope.documentList);
    $scope.secondaryIdRequired = false;
    $scope.isPrimaryIdStateRequired = true;
	$scope.PrimaryIdNoReqruied = true;
    $scope.isFirstForm = true;
    $scope.PrimaryExpDate = true;
    $scope.isSecondForm = false;
    $scope.PrimaryCountryRequired = true;
    $scope.PersonBioInfo = {};
    $scope.PersonBioInfo.CountryCode_Citizenship = "";
    $scope.PersonBioInfo.CountryCode_Birth = "";
    $scope.PersonBioInfo.CountrySubdivisionCode = "";
    $scope.PersonBioInfo.HairColorCode = "";
    $scope.PersonBioInfo.EyeColorCode = "";
    $scope.PersonBioInfo.RaceCode = "";
    $scope.PersonBioInfo.SexCode = "";
    $scope.Question = {};
    $scope.authorizedSigner = {};
    $scope.applicationType = {};
    
    
var initialApp = '${dataJson}'; /* This Object is returned when user click on the link in E-mail */
var submittedApp = '${test}' ;/* This Object is returned when AS review the application  */
var appToken = null;
var personBioObj = null;
if(initialApp){
  appToken = eval('('+'${dataJson}'+')'); 
}
else if(submittedApp){    
	personBioObj = eval('('+'${test}'+')');
}

    console.log(appToken);
	console.log(personBioObj);
 if(appToken){
	//When User click on the link 
		$scope.token = appToken;
		$scope.token.createdDate = moment($scope.token.createdDate).format("YYYY-MM-DD");
		$scope.token.expiryDate = moment($scope.token.expiryDate).format("YYYY-MM-DD");
	    $scope.PersonBioInfo.FirstName = appToken.FirstName;
	    $scope.PersonBioInfo.LastName = appToken.LastName;
	    $scope.PersonBioInfo.EmailAddress_Primary = appToken.EmailAddress_Primary;
	    $scope.PersonBioInfo.SocialSecurityNumber = appToken.SocialSecurityNumber;
	  	
	    //Mohit Code
	    $scope.authorizedSigner.id = appToken.authorizedSigner.id;
    	$scope.applicationType.id= appToken.applicationType.id;
    	
}
 
if(personBioObj){
	$scope.PersonBioInfo = personBioObj;
	console.log(moment($scope.PersonBioInfo.DateOfBirth).format("MM/DD/YYYY"));
	//$scope.PersonBioInfo.DateOfBirth = moment($scope.PersonBioInfo.DateOfBirth).format("MM/DD/YYYY");
	$scope.PersonBioInfo.DateOfBirth = new Date($scope.PersonBioInfo.DateOfBirth);
	$scope.PersonBioInfo.WeightInPounds = parseInt($scope.PersonBioInfo.WeightInPounds);
	$scope.PersonBioInfo.PostalCode = parseInt($scope.PersonBioInfo.PostalCode);
	 if($scope.PersonBioInfo.HeightInInches )
 	{
 		$scope.feet = parseInt($scope.PersonBioInfo.HeightInInches) / 12;
 		$scope.inch = parseInt($scope.PersonBioInfo.HeightInInches) % 12;
 	}
	    
}
    if($scope.personBiographic === "" ){
    	/* $scope.PersonBioInfo.FirstName = "${applicationToken.firstName}";
    	$scope.PersonBioInfo.LastName = "${applicationToken.lastName}";
    	$scope.PersonBioInfo.SocialSecurityNumber = "${applicationToken.socialSecurityNumber}";
    	$scope.PersonBioInfo.EmailAddress_Primary= "${applicationToken.emailAddress_Primary}";
    	console.log("${applicationToken.authorizedSigner.email}");
    	
    	
    	//Ivan Code - To create JSON
    	$scope.token.id = "${applicationToken.id}";
    	$scope.token.EmailAddress_Primary = "${applicationToken.emailAddress_Primary}";
    	$scope.token.FirstName = "${applicationToken.firstName}";
    	$scope.token.LastName = "${applicationToken.lastName}";
    	$scope.token.SocialSecurityNumber = "${applicationToken.socialSecurityNumber}";
    	$scope.token.active ="${applicationToken.active}";
    	$scope.token.applicationToken = "${applicationToken.applicationToken}";
    	$scope.token.companyCode = "${applicationToken.companyCode}";
    	$scope.token.companyDivion = "${applicationToken.companyDivision}";
    	$scope.token.companyName ="${applicationToken.companyName}";
    	$scope.token.createdDate = "${applicationToken.createdDate}";
    	$scope.token.expiryDate = "${applicationToken.expiryDate}";
    	$scope.token.application_id = "${applicationToken.applicationType.id}";
    	$scope.token.authorizedSinger_id = "${applicationToken.authorizedSigner.id}";  
    	 */
    }
    
  //End of Code to display the fileds on form
  //author : mlakde	
    $scope.testBadge = function(){
	  /* $scope.Question.que1 = true; */
	  	console.log($scope.Question);
	  angular.forEach()
	  
  	}
   
   $scope.addAlias = function(){
	 
   }
    $http({
    	  method: 'GET',
    	  url: '/cse/getMisc'
    	}).then(function successCallback(response) {
    		console.log(response.data);
    		$scope.countryList = response.data.Countries;
    		$scope.hairColorList = response.data.HairColors;
    		$scope.eyeColorList = response.data.eyeColorList;
    		$scope.ethnicityList = response.data.Races;
    		$scope.genderList = response.data.Sexes;
    		$scope.stateList = response.data.States;
    	
    		
    	    // this callback will be called asynchronously
    	    // when the response is available
    	  }, function errorCallback(response) {
    	    // called asynchronously if an error occurs
    	    // or server returns response with an error status.
   	});
    
    $scope.validateFeet = function(data){
    	if(data == null)
    		return;
    	$scope.feet = parseInt($scope.feet.toString().slice(0,1));
    }
    $scope.validateInch = function(data){
    	if(data == null)
    		return;
    	$scope.inch = parseInt($scope.inch.toString().slice(0,2));
    }
    
    $scope.validateWeight = function(data){
    /* 	console.log(data);
    	if(data == null)
    		return; */
    		console.log($scope.PersonBioInfo.WeightInPounds);
    	$scope.PersonBioInfo.WeightInPounds = parseInt($scope.PersonBioInfo.WeightInPounds.toString().substring(0,3));
    }
    
    function convertToIn(feet, inch){
    	return parseInt(feet) * 12 + parseInt(inch);
    }
    $scope.next = function($form){
    	if($form.$valid){
    		$scope.PersonBioInfo.DateOfBirth = moment($scope.PersonBioInfo.DateOfBirth).format("YYYY-MM-DD");
    		$scope.PersonBioInfo.primaryIdExpDate = moment($scope.PersonBioInfo.primaryIdExpDate).format("YYYY-MM-DD");
    		
    		
    		$scope.PersonBioInfo.HeightInInches = convertToIn($scope.feet, $scope.inch);
    		var obj = {
    				"token" : JSON.stringify($scope.token),
    				"personBioInfo" : JSON.stringify($scope.PersonBioInfo),
    				"authorizedSignerInfo" : JSON.stringify($scope.authorizedSigner),
    				"applicationTypeInfo":JSON.stringify($scope.applicationType)
    				
    		};
			console.log(obj);
    		$http({
    		    method: 'POST',
    		    url: '/cse/forms/badge1/test', 
    		    data: obj,
    		    headers: { 
    		    			'X-CSRF-TOKEN' : csrfToken	
    		   			}
    		    
    		
    		}).then(
    		    function(res) {
    		        console.log('succes !', res.data);
    		     /*    deferred.resolve(res.data); */
    		        $scope.PersonBioInfo.DateOfBirth = moment($scope.PersonBioInfo.DateOfBirth).format("YYYY-MM-DD");
    	    		$scope.PersonBioInfo.primaryIdExpDate = moment($scope.PersonBioInfo.primaryIdExpDate).format("YYYY-MM-DD");
    		    },
    		    function(err) {
    		        console.log('error...', err);
    		    /*     deferred.resolve(err); */
    		    }
    		);
    		console.log(obj);
    	}else{
    		
    		/* $form.comit(); */
    		
    	}
    	 $scope.isFirstForm = false;
    	    $scope.isSecondForm = true; 
    }
    $scope.back= function(){
    	   $scope.isFirstForm = true;
   	    $scope.isSecondForm = false;
    }
    $scope.selectPrimaryId = function(item){
  
    	validateDocument(item);	
    		
    }
    
    
    
    
    var validateDocument = function(documentType){
    	console.log(documentType);
     	if(documentType == "A1" || documentType == "A2" || documentType == "A5" ){
     		
    		$scope.isPrimaryIdStateRequired = false;
    		$scope.PrimaryCountryRequired = true;
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		if(documentType == "A5"){
    			$scope.primaryCountry = "";
        		$scope.PrimaryCountryDisabled = false;
    		}else{
	    		$scope.primaryCountry = "USA";
	    		$scope.PrimaryCountryDisabled = true;
    		}
    		$scope.secondIdRequired = false;
    	}else
    	if(documentType == "A6" ){
    	
    		$scope.isPrimaryIdStateRequired = false;
    		$scope.PrimaryCountryRequired = true;
    		$scope.primaryIdNo = "";
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "FSM";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = false;
    
    	}else
    	if(documentType == "A3" || documentType == "A4"){
    		$scope.isPrimaryIdStateRequired = false;
    		$scope.PrimaryCountryRequired = true;
    		$scope.primaryIdNo = "";
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "";
    		$scope.PrimaryCountryDisabled = false;
    		$scope.secondIdRequired = false;
    	
    	}else
    	if(documentType == "B1" || documentType == "B2"){
    		$scope.isPrimaryIdStateRequired = true;
    		$scope.PrimaryCountryRequired = true;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.primaryCountry = "USA";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = true;
    	
    	}else
    	if(documentType == "B3" || documentType == "B5" || documentType == "B6" ){
    		$scope.isPrimaryIdStateRequired = false;
    		$scope.PrimaryCountryRequired = true;
    		$scope.PrimaryIdNoReqruied = false;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "USA";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = true;
    	
    	}else
    	if(documentType == "B4" ){
    		$scope.isPrimaryIdStateRequired = true;
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.PrimaryCountryRequired = true;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "USA";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = false;
    	
    	}else
    	if(documentType == "B7" ){
    		$scope.isPrimaryIdStateRequired = false;
    		$scope.PrimaryCountryRequired = true;
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "USA";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = true;
    	
    	}else
    	if(documentType == "B8" ){
    		$scope.isPrimaryIdStateRequired = true;
    		$scope.PrimaryCountryRequired = false;
    		$scope.PrimaryIdNoReqruied = false;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "";
    		$scope.PrimaryCountryDisabled = false;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = false;
    	
    	}else
    	if(documentType == "B9" ){
    		$scope.isPrimaryIdStateRequired = true;
    		$scope.PrimaryCountryRequired = true;
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "CAN";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = true;
    	
    	}else
    	if(documentType == "B10" || documentType == "B11" || documentType == "B12" ){
    		$scope.isPrimaryIdStateRequired = false;
    		$scope.PrimaryCountryRequired = true;
    		$scope.PrimaryIdNoReqruied = false;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "USA";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = false;
    	
    	}else
    	if(documentType == "B1T" ){
    		$scope.isPrimaryIdStateRequired = true;
    		$scope.PrimaryCountryRequired = true;
    		$scope.PrimaryIdNoReqruied = true;
    		$scope.primaryIdNo = "";
    		$scope.primaryIdExpDate = "";
    		$scope.primaryCountry = "USA";
    		$scope.PrimaryCountryDisabled = true;
    		$scope.secondIdRequired = true;
    		$scope.PrimaryExpDate = true;
    	
    	}
    	
    } 
    
})
.directive('numberOnly',function(){
	return {
	    require: 'ngModel',
	    link: function (scope, element, attr, ngModelCtrl) {
	      function fromUser(text) {
	        var transformedInput = text.replace(/[^0-9]/g, '');
	        if(transformedInput !== text) {
	            ngModelCtrl.$setViewValue(transformedInput);
	            ngModelCtrl.$render();
	        }
	        return transformedInput;  // or return Number(transformedInput)
	      }
	      ngModelCtrl.$parsers.push(fromUser);
	    }
	  }; 
})
.directive('textOnly', function() {
	  return {
		    require: 'ngModel',
		    link: function (scope, element, attr, ngModelCtrl) {
		      function fromUser(text) {
		        var transformedInput = text.replace(/[^A-Za-z ]/g, '');
		    
		        if(transformedInput !== text) {
		            ngModelCtrl.$setViewValue(transformedInput);
		            ngModelCtrl.$render();
		        }
		        return transformedInput;
		      }
		      ngModelCtrl.$parsers.push(fromUser);
		    }
		  }; 
}).
directive('validEmail', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attrs, control) {
            control.$parsers.push(function (viewValue) {
                var newEmail = control.$viewValue;
                control.$setValidity("invalidEmail", true);
                if (typeof newEmail === "object" || newEmail == "") return newEmail;  // pass through if we clicked date from popup
                if (!newEmail.match(/^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+([;,.](([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+)*$/))
                    control.$setValidity("invalidEmail", false);
                return viewValue;
            });
        }
    };
});
</script>
</html>