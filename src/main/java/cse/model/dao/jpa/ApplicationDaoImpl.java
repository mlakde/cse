package cse.model.dao.jpa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cse.model.Application;
import cse.model.ApplicationReceipt;
import cse.model.ApplicationStatus;
import cse.model.ApplicationToken;
import cse.model.ApplicationType;
import cse.model.CriminalRecord;
import cse.model.User;
import cse.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao  {

    @PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public Application getApplication(Long id) {
		return entityManager.find( Application.class, id );
	}

	@Override
	public List<Application> getApplications() {
		return entityManager
	            .createQuery( "from Application order by id asc", Application.class )
	            .getResultList();
	}
	@Override
	@Transactional
	public Application saveApplication(Application application) {
		 return entityManager.merge( application );
	}

	@Override
	@Transactional
	public CriminalRecord saveCriminalRecord(CriminalRecord criminalRecord) {
		return entityManager.merge( criminalRecord );
	}

	@Override
	@Transactional
	public ApplicationToken saveApplicationToken(ApplicationToken applicationToken) {
		 return entityManager.merge( applicationToken );
	}

	@Override
	public List<Application> getApplicationsByUser(Long authorizedSigner) {
		String query = "from Application where authorizedSigner = :authorizedSigner";
		List<Application> results = entityManager
	            .createQuery( query, Application.class )
	            .setParameter( "authorizedSigner", authorizedSigner )
	            .getResultList();
		return results;
	}

	@Override
	public ApplicationType getApplicationTypeByName(String type) {
		String query = "from ApplicationType where type = :type";
		ApplicationType results = entityManager
	            .createQuery( query, ApplicationType.class )
	            .setParameter( "type", type )
	            .getSingleResult();
		return results;
	}

	@Override
	public ApplicationStatus getApplicationStatusByName(String status) {
		String query = "from ApplicationStatus where status = :status";
		ApplicationStatus results = entityManager
	            .createQuery( query, ApplicationStatus.class )
	            .setParameter( "status", status )
	            .getSingleResult();
		return results;
	}

	@Override
	public List<Application> getApplicationByAuthorizedSignerAndStatus(User authorizedSigner, ApplicationStatus applicationStatus, String companyName, String companyDivision) {
		String query = "from Application where authorizedSigner = :authorizedSigner and applicationStatus = :applicationStatus and "
				+ "applicationToken.companyName = :companyName and applicationToken.companyDivision = :companyDivision";
		List<Application> results = entityManager
	            .createQuery( query, Application.class )
	            .setParameter( "authorizedSigner", authorizedSigner )
	            .setParameter( "applicationStatus", applicationStatus )
	            .setParameter( "companyName", companyName )
	            .setParameter( "companyDivision", companyDivision )
	            .getResultList();
		return results;
	}

	@Override
	public ApplicationToken getApplicationTokenByToken(String applicationToken) {
		String query = "from ApplicationToken where applicationToken = :applicationToken";
		List<ApplicationToken> results = entityManager
	            .createQuery( query, ApplicationToken.class )
	            .setParameter( "applicationToken", applicationToken )
	            .getResultList();
		return (results.size() == 0) ?null:results.get(0);
	}

	@Override
	public Application getApplicationByApplicationToken(ApplicationToken applicationToken) {
		String query = "from Application where applicationToken = :applicationToken";
		List<Application> results = entityManager
	            .createQuery( query, Application.class )
	            .setParameter( "applicationToken", applicationToken )
	            .getResultList();
		return (results.size() == 0) ?null:results.get(0);
	}

	@Override
	public ApplicationType getApplicationTypeById(Long id) {
		 return entityManager.find( ApplicationType.class, id );
	}

	@Override
	public List<ApplicationToken> getApplicationTokenByUser(User authorizedSigner,String companyName, String companyDivision) {
		String query = "from ApplicationToken where authorizedSigner = :authorizedSigner and "
				+ "companyDivision = :companyDivision and companyName = :companyName";
		List<ApplicationToken> results = entityManager
	            .createQuery( query, ApplicationToken.class )
	            .setParameter( "authorizedSigner", authorizedSigner )
	            .setParameter( "companyDivision", companyDivision )
	            .setParameter( "companyName", companyName )
	            .getResultList();
		return results;
	}

	@Override
	public Application getApplicationByReceipt(ApplicationReceipt applicationReceipt) {
		String query = "from Application where applicationReceipt = :applicationReceipt";
		List<Application> results = entityManager
	            .createQuery( query, Application.class )
	            .setParameter( "applicationReceipt", applicationReceipt )
	            .getResultList();
		return (results.size() == 0) ?null:results.get(0);
	}


}
