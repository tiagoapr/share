package DatabaseClasses;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.Query;
import org.hibernate.Session;

@Entity
@Table(name = "Newsletter")
public class Newsletter implements Serializable{
   
   @Id
   @GeneratedValue
   private int NewsletterId;
   @Basic
   @Column(name = "NewsletterEmail")
   private String NewsletterEmail;
   @Basic
   @Column(name = "NewsletterActivo")
   private Boolean NewsletterActivo;
   
   
   //******************************************
   // GET
   //******************************************

   public int getNewsletterId() {
      return NewsletterId;
   }

   public String getNewsletterEmail() {
      return NewsletterEmail;
   }

   public Boolean getNewsletterActivo() {
      return NewsletterActivo;
   }
   
   //******************************************
   // SET
   //******************************************

   public void setNewsletterId(int NewsletterId) {
      this.NewsletterId = NewsletterId;
   }

   public void setNewsletterEmail(String NewsletterEmail) {
      this.NewsletterEmail = NewsletterEmail;
   }

   public void setNewsletterActivo(Boolean NewsletterActivo) {
      this.NewsletterActivo = NewsletterActivo;
   }
   
   //******************************************
   // 
   //****************************************** 
   
   public int insertEntity(Newsletter newsletter) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         s.save(newsletter);
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   //******************************************
   // 
   //****************************************** 
   
   public List getEmailsList(boolean activo){
      try {
         List<Newsletter> emailsList = new ArrayList<Newsletter>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         

         Query quer = session.createQuery("FROM Newsletter WHERE newsletterActivo = " + activo);

         emailsList = quer.list();
         session.getTransaction().commit();

         if (emailsList.isEmpty()) {
            return null;
         }
         return emailsList;
      } catch (Exception e) {
         return null;
      }
   }
   
   public List asEmailOnList(String email){
      try {
         List<Newsletter> emailsList = new ArrayList<Newsletter>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         

         Query quer = session.createQuery("FROM Newsletter WHERE NewsletterEmail like '" + email + "' ");

         emailsList = quer.list();
         session.getTransaction().commit();

         if (emailsList.isEmpty()) {
            return null;
         }
         return emailsList;
      } catch (Exception e) {
         return null;
      }
   }
   
   
   
   public int activateEmail(int idEmail) {
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         Query quer = null;
         quer = s.createQuery("UPDATE Newsletter SET NewsletterActivo = " + true + " WHERE NewsletterId = " + idEmail);
         quer.executeUpdate();
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
   
   public int deactivateEmail(int idEmail) {
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         Query quer = null;
         quer = s.createQuery("UPDATE Newsletter SET NewsletterActivo = " + false + " WHERE NewsletterId = " + idEmail);
         quer.executeUpdate();
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   
   
   
}
