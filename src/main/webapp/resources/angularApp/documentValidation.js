var app = angular.module('eForm');
app.factory('documentFactory', function(){
	return {
		validateDocument : function(documentType,$scope){
		
	    	if(documentType == "PASSPORT/PASSPORT CARD" ){
	    		$scope.isPrimaryIdStateRequired = false;
	    	}
	    	if(documentType == "PERMANENT RESIDENT CARD OR ALIEN REGISTRATION RECEIPT CARD (I-551)" ){
	    		$scope.isPrimaryIdStateRequired = false;
	    		
	    	}
	    	/*if(documentType == "PASSPORT/PASSPORT CARD" ){
	    		$scope.isPrimaryIdStateRequired = false;
	    	}*/
		}
		
	}
});