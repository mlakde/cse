package cse.model.dao.jpa;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cse.model.PersonBiographic;
import cse.model.dao.PersonBiographicDao;


@Repository
public class PersonBiographicDaoImpl implements PersonBiographicDao  {

    @PersistenceContext
    private EntityManager entityManager;


	@Override
	@Transactional
	public PersonBiographic savePersonBiographics(PersonBiographic person) {
		 return entityManager.merge( person );
	}

}
