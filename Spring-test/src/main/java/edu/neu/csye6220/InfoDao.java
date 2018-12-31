package edu.neu.csye6220;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;



@Repository("infodao")
@Transactional
public class InfoDao {
	private Log log = LogFactory.getLog(InfoDao.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly=true)
	public Userinfo findByname(String username) {
		return (Userinfo) sessionFactory.getCurrentSession().getNamedQuery("Userinfo.findByName").
				setParameter("username", username).uniqueResult();
	}
	
	public Course findById(long id) {
		return (Course) sessionFactory.getCurrentSession().getNamedQuery("Course.findById").
				setParameter("id", id).uniqueResult();
	}
	
	public void saveUser(Userinfo userinfo) {
		sessionFactory.getCurrentSession().saveOrUpdate(userinfo);
		log.info("userinfo saved with id: " + userinfo.getId());
	}
	public void saveCourse(Course course) {
		sessionFactory.getCurrentSession().saveOrUpdate(course);
		log.info("course saved with id: " + course.getId());		
	}
	
	
	public List<Course> findAllCourse() {
		return sessionFactory.getCurrentSession().createQuery("from course c").list();
	}
	
	
	
//	@Transactional(rollbackFor = Exception.class)
//    public Object saveCourse(Object obj){
//         Session session = sessionFactory.getCurrentSession();
//         Transaction tx = null;
//         try {
//             tx = session.beginTransaction();
//             session.saveOrUpdate(obj);
//             tx.commit();
//         } catch (RuntimeException e) {
//             if (tx != null) {
//                 tx.rollback();
//             }
//             throw e;
//         } finally {
//             session.close();
//         }
//         return obj;
//     }
}
