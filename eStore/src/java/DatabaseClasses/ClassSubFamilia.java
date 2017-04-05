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
@Table(name = "ClassSubFamilia")
public class ClassSubFamilia implements Serializable {

   @Id
   @GeneratedValue
   private int ClassSubFamiliaId;
   @Basic
   @Column(name = "ClassFamilia_FamiliaId")
   private int ClassFamilia_FamiliaId;
   @Basic
   @Column(name = "ClassSubFamiliaNome")
   private String ClassSubFamiliaNome;

   //******************************************
   // GET
   //******************************************
   public int getClassSubFamiliaId() {
      return ClassSubFamiliaId;
   }

   public int getClassFamilia_FamiliaId() {
      return ClassFamilia_FamiliaId;
   }

   public String getClassSubFamiliaNome() {
      return ClassSubFamiliaNome;
   }

   //******************************************
   // SET
   //******************************************
   public void setClassSubFamiliaId(int ClassSubFamiliaId) {
      this.ClassSubFamiliaId = ClassSubFamiliaId;
   }

   public void setClassFamilia_FamiliaId(int ClassFamilia_FamiliaId) {
      this.ClassFamilia_FamiliaId = ClassFamilia_FamiliaId;
   }

   public void setClassSubFamiliaNome(String ClassSubFamiliaNome) {
      this.ClassSubFamiliaNome = ClassSubFamiliaNome;
   }

   //******************************************
   // 
   //****************************************** 
   public int insertEntity(ClassSubFamilia classSubFamilia) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         s.save(classSubFamilia);
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
   
   
   //******************************************
   // 
   //******************************************
   
   static public List getClassSubFamiliaList(int idFamilia){      
      try {
         List<ClassSubFamilia> subfamilia = new ArrayList<ClassSubFamilia>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM ClassSubFamilia WHERE ClassFamilia_FamiliaId = "+idFamilia);
         subfamilia = quer.list();
         session.getTransaction().commit();

         if (subfamilia.isEmpty()) {
            return null;
         }
         return subfamilia;
      } catch (Exception e) {
         return null;
      }
   }
 
   
   public ClassSubFamilia getClassSubFamilia(int idSubFamilia) {
      try {
         List<ClassSubFamilia> subFamilia = new ArrayList<ClassSubFamilia>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM ClassSubFamilia WHERE ClassSubFamiliaId = " + idSubFamilia);
         subFamilia = quer.list();
         session.getTransaction().commit();

         if (subFamilia.isEmpty()) {
            return null;
         }
         return subFamilia.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   
}
