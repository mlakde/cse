package cse.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "ApplicationTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ApplicationTest extends AbstractTransactionalTestNGSpringContextTests{

	@Autowired
	ApplicationDao applicationDao;
	
	@Test
	public void getApplication(){
		//assert applicationDao.getApplications().size() == 3;
	}
	
}
