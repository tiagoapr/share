/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseClasses;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 */
public class NewHibernateUtil {

   private static final SessionFactory sessionFactory;

   static {
      try {
         // Create the SessionFactory from standard (hibernate.cfg.xml) 
         // config file.
         sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
      } catch (Throwable ex) {
         // Log the exception. 
         System.err.println("Initial SessionFactory creation failed." + ex);
         throw new ExceptionInInitializerError(ex);
      }
   }

   public static Session getSessionFactory() {
      Session sess;
      try {
         sess = sessionFactory.getCurrentSession();
      } catch (org.hibernate.HibernateException he) {
         sess = sessionFactory.openSession();
      }
      return sess;
   }
}


