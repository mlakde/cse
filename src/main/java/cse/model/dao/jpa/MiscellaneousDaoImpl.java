package cse.model.dao.jpa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import cse.model.Country;
import cse.model.CountrySubdivision;
import cse.model.EyeColor;
import cse.model.HairColor;
import cse.model.NamePrefix;
import cse.model.NameSuffix;
import cse.model.Race;
import cse.model.Sex;
import cse.model.dao.MiscellaneousDao;

@Repository
public class MiscellaneousDaoImpl implements MiscellaneousDao  {

    @PersistenceContext
    private EntityManager entityManager;


	@Override
	public List<Country> getAllCountries() {
		return entityManager
	            .createQuery( "from Country where isActive = :active order by sortOrder asc", Country.class )
	            .setParameter("active", true)
	            .getResultList();
	}

	@Override
	public List<Country> getCountryByCountryCode(String countryCode) {
		return entityManager
	            .createQuery( "from Country where countryCode = :countryCode" , Country.class )
	            .setParameter("countryCode",countryCode)
	            .getResultList();
	}
	@Override
	public List<CountrySubdivision> getAllCountrySubdivisionsByCountryId(Long countryId) {
		String query = "from CountrySubdivision where country_id = :countryId";
		List<CountrySubdivision> results = entityManager
	            .createQuery( query, CountrySubdivision.class )
	            .setParameter( "countryId", countryId )
	            .getResultList();
		return results;
	}


	@Override
	public Country getCountry(Long id) {
		String query = "from Country where id = :id";
		List<Country> results = entityManager
	            .createQuery( query, Country.class )
	            .setParameter( "id", id )
	            .getResultList();
		return (results.size() == 0) ?null:results.get(0);
	}
	@Override
	public List<Sex> getAllSex() {
		// TODO Auto-generated method stub
		return entityManager
	            .createQuery( "from Sex where isActive = :active order by sortOrder asc", Sex.class )
	            .setParameter("active", true)
	            .getResultList();
	}

	@Override
	public List<EyeColor> getAllEyeColor() {
		// TODO Auto-generated method stub

		return entityManager
	            .createQuery( "from EyeColor where isActive = :active order by sortOrder asc", EyeColor.class )
	            .setParameter("active", true)
	            .getResultList();
	}

	@Override
	public List<NameSuffix> getAllNameSuffix() {
		// TODO Auto-generated method stub
		return entityManager
	            .createQuery( "from NameSuffix where isActive = :active order by sortOrder asc", NameSuffix.class )
	            .setParameter("active", true)
	            .getResultList();
	}

	@Override
	public List<NamePrefix> getAllNamePrefix() {
		// TODO Auto-generated method stub
		return entityManager
	            .createQuery( "from NamePrefix where isActive = :active order by sortOrder asc", NamePrefix.class )
	            .setParameter("active", true)
	            .getResultList();
	}

	@Override
	public List<Race> getAllRace() {
		// TODO Auto-generated method stub
		return entityManager
	            .createQuery( "from Race where isActive = :active order by sortOrder asc", Race.class )
	            .setParameter("active", true)
	            .getResultList();
	}

	@Override
	public List<HairColor> getAllHairColor() {
		// TODO Auto-generated method stub
		return entityManager
	            .createQuery( "from HairColor where isActive = :active order by sortOrder asc", HairColor.class )
	            .setParameter("active", true)
	            .getResultList();
	}









	
	
}
