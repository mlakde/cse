package cse.model.dao;

import java.util.List;
import cse.model.Country;
import cse.model.CountrySubdivision;
import cse.model.EyeColor;
import cse.model.HairColor;
import cse.model.NamePrefix;
import cse.model.NameSuffix;
import cse.model.Race;
import cse.model.Sex;

public interface MiscellaneousDao {
	
	//get Country by id
	Country getCountry (Long id);
	
	//get List of Countries
	List<Country> getAllCountries();
	List<Country> getCountryByCountryCode(String countryCode);
	//get List of Country Sub Division
	List<CountrySubdivision> getAllCountrySubdivisionsByCountryId(Long long1);

	
	List<Sex> getAllSex();
	List<EyeColor> getAllEyeColor();
	List<NameSuffix> getAllNameSuffix();
	List<NamePrefix> getAllNamePrefix();
	List<Race> getAllRace();
	List<HairColor> getAllHairColor();


	
}
