var app = angular.module('eForm');
app.factory('stateListFactory', function(){
    return {
        stateList: function(){
            return data  = {
                "AL": "Alabama",
                "AK": "Alaska",
                "AS": "American Samoa",
                "AZ": "Arizona",
                "AR": "Arkansas",
                "CA": "California",
                "CO": "Colorado",
                "CT": "Connecticut",
                "DE": "Delaware",
                "DC": "District Of Columbia",
                "FM": "Federated States Of Micronesia",
                "FL": "Florida",
                "GA": "Georgia",
                "GU": "Guam",
                "HI": "Hawaii",
                "ID": "Idaho",
                "IL": "Illinois",
                "IN": "Indiana",
                "IA": "Iowa",
                "KS": "Kansas",
                "KY": "Kentucky",
                "LA": "Louisiana",
                "ME": "Maine",
                "MH": "Marshall Islands",
                "MD": "Maryland",
                "MA": "Massachusetts",
                "MI": "Michigan",
                "MN": "Minnesota",
                "MS": "Mississippi",
                "MO": "Missouri",
                "MT": "Montana",
                "NE": "Nebraska",
                "NV": "Nevada",
                "NH": "New Hampshire",
                "NJ": "New Jersey",
                "NM": "New Mexico",
                "NY": "New York",
                "NC": "North Carolina",
                "ND": "North Dakota",
                "MP": "Northern Mariana Islands",
                "OH": "Ohio",
                "OK": "Oklahoma",
                "OR": "Oregon",
                "PW": "Palau",
                "PA": "Pennsylvania",
                "PR": "Puerto Rico",
                "RI": "Rhode Island",
                "SC": "South Carolina",
                "SD": "South Dakota",
                "TN": "Tennessee",
                "TX": "Texas",
                "UT": "Utah",
                "VT": "Vermont",
                "VI": "Virgin Islands",
                "VA": "Virginia",
                "WA": "Washington",
                "WV": "West Virginia",
                "WI": "Wisconsin",
                "WY": "Wyoming"
            }
        },
        eyeColorList: function(){
            return data =[
            	"BLACK", "BLUE", "BROWN", "GREEN", "GRAY", "HAZEL"
            	
            ]
        },
        hairColorList:function(){
        	return data =[
        		{HairColorCode : "BLD", HairColorDescription : "BALD", isActive: 1},
        		{HairColorCode : "BLK", HairColorDescription : "BLACK", isActive: 1},
        		{HairColorCode : "BLN", HairColorDescription : "BLOND", isActive: 1},
        		{HairColorCode : "BLU", HairColorDescription : "BLUE", isActive: 0},
        		{HairColorCode : "BRO", HairColorDescription : "BROWN", isActive: 1},
        		{HairColorCode : "GRN", HairColorDescription : "GREEN", isActive: 0},
        		{HairColorCode : "GRY", HairColorDescription : "GRAYISH", isActive: 1},
        		{HairColorCode : "ONG", HairColorDescription : "ORANGE", isActive: 0},
        		{HairColorCode : "PLE", HairColorDescription : "PURPLE", isActive: 0},
        		{HairColorCode : "PINK", HairColorDescription : "PINK", isActive: 0},
        		{HairColorCode : "RED", HairColorDescription : "RED", isActive: 1},
        		{HairColorCode : "SDY", HairColorDescription : "SANDY", isActive: 0},
        		{HairColorCode : "WHI", HairColorDescription : "WHITE", isActive: 1},
        		{HairColorCode : "XXX", HairColorDescription : "UNKNOWN", isActive: 0},
        		
        	]
        },
        ethnicityList : function(){
        	return data = [
        		"OTHER", "AMERICAN INDIAN", "ASIAN", "BLACK", "CAUCASIAN", "HISPANIC"
        	]
        },
        idTypeList : function(){
        	return data = [
        		{}
        	]
        },
        documentList : function(){
        	return data = [
        		{documentTypeCode : "A1", documentTypeDescription:"A1. PASSPORT/PASSPORT CARD"},
        		{documentTypeCode: "A2", documentTypeDescription:"A2. PERMANENT RESIDENT CARD OR ALIEN REGISTRATION RECEIPT CARD (I-551)"},
        		{documentTypeCode : "A3", documentTypeDescription:"A3. FOREIGN PASSPORT W/(TEMP I-551)"},
        		{documentTypeCode : "A4", documentTypeDescription:"A4. EMPLOYMENT AUTHORIZATION DOCUMENT W/PHOTO (I-766)"},
        		{documentTypeCode : "A5", documentTypeDescription:"A5. FOREIGN PASSPORT W/(I-94 OR I-94A)"},
        		{documentTypeCode : "A6", documentTypeDescription:"A6. PASSPORT FROM FEDERATED STATES OF MICRONESIA OF REPUBLIC OF THE MARSHALL ISLANDS"},
        		{documentTypeCode : "B1", documentTypeDescription:"B1. DRIER'S LICENSE"},
        		{documentTypeCode : "B2", documentTypeDescription:"B2. ID CARD"},
        		{documentTypeCode : "B3", documentTypeDescription:"B3. SCHOOL ID W/PHOTO"},
        		{documentTypeCode : "B4", documentTypeDescription:"B4. VOTER REGISTRATION CARD"},
        		{documentTypeCode : "B5", documentTypeDescription:"B5. U.S. MILITARY CARD OR DRAFT RECORD"},
        		{documentTypeCode : "B6", documentTypeDescription:"B6. MILITARY DEPENDENT'S ID CARD"},
        		{documentTypeCode : "B7", documentTypeDescription:"B7. U.S. COAST GUARD MERCHANT MARINER CARD"},
        		{documentTypeCode : "B8", documentTypeDescription:"B8. NATIVE AMERICAN TRIBAL DOCUMENT"},
        		{documentTypeCode : "B9", documentTypeDescription:"B9. CANADIAN DRIVER'S LICENSE"},
        		{documentTypeCode : "B10", documentTypeDescription:"B10. SCHOOL RECORD OR REPORT CARD"},
        		{documentTypeCode : "B11", documentTypeDescription:"B11. CLINIC, DOCTOR, OR HOSPITAL CARD"},
        		{documentTypeCode: "B12", documentTypeDescription:"B12. DAY-CARE OR NURSERY SCHOOL RECORD"},
        		{documentTypeCode : "B1T", documentTypeDescription:"B1. TEMPORARY OR RESTRICTED LICENSE"},
        	]
        },
        secondaryDocumentList : function(){
        	return data = [
        		{documentTypeCode : "C1", documentTypeDescription:"C1.  SOCIAL SECURITY NUMBER CARD"},
        		{documentTypeCode : "C2", documentTypeDescription:"C2.  CERTIFICATION OF BIRTH ABROAD (FS-545)"},
        		{documentTypeCode : "C3", documentTypeDescription:"C3.  CERTIFICATION OF REPORT OF BIRTH (DS-1350)"},
        		{documentTypeCode : "C4", documentTypeDescription:"C4.  BIRTH CERTIFICATE"},
        		{documentTypeCode : "C5", documentTypeDescription:"C5.  NATIVE AMERICAN TRIBAL DOCUMENT"},
        		{documentTypeCode : "C6", documentTypeDescription:"C6.  U.S. CITIZEN ID CARD (I-197)"},
        		{documentTypeCode : "C7", documentTypeDescription:"C7.  RESIDENT CITIZEN IN THE U.S. IDENTIFICATION CARD (I-179)"},
        		{documentTypeCode : "C8", documentTypeDescription:"C8.  EMPLOYMENT AUTHORIZATION DOCUMENT(EAD) ISSUED BY DHS"},
        
        	]
        }
    }               
});