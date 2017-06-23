package cse.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "UserTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserTest extends AbstractTransactionalTestNGSpringContextTests{

	@Autowired
	UserDao userDao;
	
	@Test
	public void getUser(){
		assert userDao.getUser().size() == 3;
	}
	
}
