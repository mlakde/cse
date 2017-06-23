package cse.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cse.model.User;
import cse.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao  {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUser( Long id )
    {
        return entityManager.find( User.class, id );
    }
    @Override
    public User getUser( String email )
    {
        String query = "from User user left join fetch user.roles "
            + "where lower(email) = :email";

        List<User> users = entityManager.createQuery( query, User.class )
            .setParameter( "email", email.toLowerCase() )
            .getResultList();
        return users.size() == 0 ? null : users.get( 0 );
    }

    @Override
    @Transactional
    public User saveUser( User user )
    {
        return entityManager.merge( user );
    }

    @Override
	public List<User> getUser() {
		 return entityManager
		            .createQuery( "from User order by id asc", User.class )
		            .getResultList();
	}
    
	@Override
	public boolean authenticateUser(String email, String password) {
		Query query = entityManager.createQuery("select u from User u " + 
		   		" inner join fetch u.password p" +
						" where u.email = ?1");
		query.setParameter(1, email);		
		@SuppressWarnings("unchecked")
		List<User> list = query.getResultList();		
		
		if ( list != null && list.size() > 0 ) {
			User u = list.get(0);
			String userDBPassword = u.getPassword();
			boolean success = userDBPassword.equals(password); 
			//LOGGER.debug("RESULT : " + success);
			return success;			
		}
			
		
		return false;
	}


}
