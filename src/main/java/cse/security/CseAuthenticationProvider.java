package cse.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.ldap.authentication.LdapAuthenticationProvider;
import org.springframework.security.ldap.search.LdapUserSearch;

import cse.model.dao.UserDao;
import cse.model.User;

/**
 * It is a Spring Security authentication provider than can be used by an
 * application using spring security to plug-in user authentication against
 * LDAP.
 * 
 * This is to be used for authentication against LDAP by a web application
 * 
 * @author Mohit Lakde
 * 
 */
public class CseAuthenticationProvider implements AuthenticationProvider {

	private static final Logger LOGGER = LoggerFactory.getLogger(CseAuthenticationProvider.class);

	private LdapAuthenticationProvider ldapAuthenticationProvider;

	private LdapUserSearch ldapSearch;

	private UserDao userDao;
	
	private UserDetailsService userDetailsService;
	
	/**
	 * {@inheritDoc}<br>
	 * 
	 * @see org.acegisecurity.providers.AuthenticationProvider#authenticate(org.acegisecurity.Authentication)
	 */
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
		//check if patient or provider user
		String username = authentication.getName();
		return authenticateUser(authentication);
		
	}

	public Authentication authenticateUser(Authentication authentication) throws AuthenticationException {
		Authentication result = null;
		UserDetails userDetails = userDetailsService.loadUserByUsername(String.valueOf(authentication.getName()));
		if(userDetails!=null){		
			User fiscUser = (User)userDetails;
			boolean isPasswordValid = userDao.authenticateUser(fiscUser.getUsername(), String.valueOf(authentication.getCredentials()));			
			if(isPasswordValid){
				LOGGER.debug("User authenticated");
				System.out.println(" User Authenticated ");
				result = new UsernamePasswordAuthenticationToken(userDetails, authentication.getCredentials(), userDetails.getAuthorities());
			}else{
				throw new BadCredentialsException("Invalid username / password.");
			}
		}else{
			throw new UsernameNotFoundException("User not found.");
		}
		return result;
	}

	/**
	 * {@inheritDoc}<br>
	 * 
	 * @see org.acegisecurity.providers.AuthenticationProvider#supports(java.lang.Class)
	 */
	@SuppressWarnings("unchecked")
	public boolean supports(Class authentication) {
		return (UsernamePasswordAuthenticationToken.class
				.isAssignableFrom(authentication));
	}

	/**
	 * Sets the ldapAuthenticationProvider.
	 * 
	 * @param ldapAuthenticationProvider
	 *            the ldapAuthenticationProvider to set
	 */
	@Required
	public void setLdapAuthenticationProvider(
			LdapAuthenticationProvider ldapAuthenticationProvider) {
		this.ldapAuthenticationProvider = ldapAuthenticationProvider;
	}

	/**
	 * Sets the userSearch.
	 * 
	 * @param ldapSearch
	 *            the userSearch to set
	 */
	@Required
	public void setLdapSearch(LdapUserSearch ldapSearch) {
		this.ldapSearch = ldapSearch;
	}
		public void setUserDetailsService(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService;
	}

		public UserDao getUserDao() {
			return userDao;
		}

		public void setUserDao(UserDao userDao) {
			this.userDao = userDao;
		}


}
