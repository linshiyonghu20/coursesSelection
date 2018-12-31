package edu.neu.csye6220;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Repository("contentDao")
@Transactional
public class ContentDao {
	private Log log = LogFactory.getLog(ContentDao.class);

//	@Resource(name="sessionFactory")
	@Autowired
	private SessionFactory sessionFactory;	

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	
	@Transactional(readOnly=true)
	public List<News> findAll() {
		Session session;
		try 
		{
		    //Step-2: Implementation
		    session = sessionFactory.getCurrentSession();
		} 
		catch (HibernateException e) 
		{
		    //Step-3: Implementation
		    session = sessionFactory.openSession();
		}
		if(session!=null) {
			return session.createQuery("from news c").list();
		}
		else {
			return null;
		}
	}
}
