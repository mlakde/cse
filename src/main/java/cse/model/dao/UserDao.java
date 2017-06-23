package cse.model.dao;

import java.util.List;
import cse.model.User;

public interface UserDao {

    User getUser( Long id );

    User getUser( String email );

    User saveUser( User user );
    List<User> getUser();
    
    //Ldap Security
    boolean authenticateUser(String userName, String password);

   
}
