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
@Table(name = "ClassFamilia")
public class ClassFamilia implements Serializable {

   @Id
   @GeneratedValue
   private int ClassFamiliaId;
   @Basic
   @Column(name = "ClassFamiliaNome")
   private String ClassFamiliaNome;

   //******************************************
   // GET
   //******************************************
   public int getClassFamiliaId() {
      return ClassFamiliaId;
   }

   public String getClassFamiliaNome() {
      return ClassFamiliaNome;
   }

   //******************************************
   // SET
   //******************************************
   public void setClassFamiliaId(int ClassFamiliaId) {
      this.ClassFamiliaId = ClassFamiliaId;
   }

   public void setClassFamiliaNome(String ClassFamiliaNome) {
      this.ClassFamiliaNome = ClassFamiliaNome;
   }
   
   //******************************************
   // 
   //****************************************** 
   public int insertEntity(ClassFamilia classFamilia) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         s.save(classFamilia);
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   //******************************************
   // 
   //******************************************
   
   public List getClassFamiliaList() {
      try {
         List<ClassFamilia> familia = new ArrayList<ClassFamilia>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM ClassFamilia");
         familia = quer.list();
         session.getTransaction().commit();

         if (familia.isEmpty()) {
            return null;
         }
         return familia;
      } catch (Exception e) {
         return null;
      }
   }
   
   public ClassFamilia getClassFamilia(int idFamilia) {
      try {
         List<ClassFamilia> familia = new ArrayList<ClassFamilia>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM ClassFamilia WHERE ClassFamiliaId = "+idFamilia);
         familia = quer.list();
         session.getTransaction().commit();

         if (familia.isEmpty()) {
            return null;
         }
         return familia.get(0);
      } catch (Exception e) {
         return null;
      }
   }
   
   
   
   

}
