package cse.model.dao;

import java.util.List;
import cse.model.Application;
import cse.model.ApplicationReceipt;
import cse.model.ApplicationStatus;
import cse.model.ApplicationToken;
import cse.model.ApplicationType;
import cse.model.CriminalRecord;
import cse.model.User;

public interface ApplicationDao {

	Application getApplication (Long id);
	List<Application> getApplications();
	Application saveApplication(Application application);

	CriminalRecord saveCriminalRecord(CriminalRecord criminalRecord);
	
	//save application Token and type
	ApplicationToken saveApplicationToken( ApplicationToken applicationToken );
	
	//get Applications by User
	List<Application> getApplicationsByUser(Long user);
	
	//Method to get the name of ApplicationType 
	ApplicationType getApplicationTypeByName(String type);
	
	//Method to get Application Status during process
	ApplicationStatus getApplicationStatusByName(String name);
	
	//Method to get Applications 
	List<Application> getApplicationByAuthorizedSignerAndStatus (User athorizedSigner, ApplicationStatus applicationStatus, String CompanyName, String comapnyDivision);
		
		
	//Method to get ApplicationToken by Token #
	ApplicationToken getApplicationTokenByToken (String applicationToken);
	
	//Method to get Application by ApplicationToken
	Application getApplicationByApplicationToken(ApplicationToken applicationToken);
	
	//getApplicationToken by ApplicationToken object
	ApplicationType getApplicationTypeById(Long id);
	
	//get Application Token by User(Authorized Signer)
	List<ApplicationToken> getApplicationTokenByUser(User authorizedSigner,String CompanyName, String comapnyDivision); 
	
	//get Application by ApplicationReceipt Number
	Application getApplicationByReceipt(ApplicationReceipt applicationReceipt);
	
}
