package cse.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import cse.model.Country;
import cse.model.CountrySubdivision;
import cse.model.EyeColor;
import cse.model.HairColor;
import cse.model.Race;
import cse.model.Sex;
import cse.model.dao.MiscellaneousDao;



@Controller
public class MiscController {
	ObjectMapper mapper = new ObjectMapper();


	@Autowired
	private MiscellaneousDao miscellaneousDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MiscController.class);
	
	//get all Lookup tables
	@RequestMapping(value= "/getMisc", method = RequestMethod.GET)
	public void arrivalList(ModelMap models,HttpServletResponse response) throws IOException{
	
		Map<String, Object> map = new HashMap<String,Object>();
		List<Sex> sexList = miscellaneousDao.getAllSex();
		List<Race> raceList = miscellaneousDao.getAllRace();
		List<Country> countryList = miscellaneousDao.getAllCountries();
		List<Country> USA = miscellaneousDao.getCountryByCountryCode("USA");
		List<HairColor> hairColorList = miscellaneousDao.getAllHairColor();
		List<EyeColor> eyeColorList = miscellaneousDao.getAllEyeColor();

		List<CountrySubdivision> countrySubDivsionList = new ArrayList<CountrySubdivision>();
		if(USA.size() != 0){
			 countrySubDivsionList = miscellaneousDao.getAllCountrySubdivisionsByCountryId(USA.get(0).getId());
				
				for(CountrySubdivision c:countrySubDivsionList){
					c.setCountry(null);
				}
		}
	/*	List<Sex> sexList = miscellaneousDao.getAllSex();
		List<Sex> sexList = miscellaneousDao.getAllSex();*/
		map.put("Sexes", sexList);
		map.put("Races", raceList);
		map.put("Countries", countryList);
		map.put("States", countrySubDivsionList);
		map.put("HairColors", hairColorList);
		map.put("eyeColorList", eyeColorList);
		String jsonInString= null;
			try {
				jsonInString = mapper.writeValueAsString(map);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		PrintWriter out= response.getWriter();
		out.println(jsonInString); 
	}
	
}
