package DatabaseClasses;

import SupportClasses.Utils;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
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
@Table(name = "UserInfo")
public class UserInfo implements Serializable {

   @Id
   @GeneratedValue
   private int UserId;
   @Basic
   @Column(name = "NivelAcesso_NivelAcessoId")
   private int NivelAcesso_NivelAcessoId;
   @Basic
   @Column(name = "UserNome")
   private String UserNome;
   @Basic
   @Column(name = "UserMorada")
   private String UserMorada;
   @Basic
   @Column(name = "UserCpa")
   private int UserCpa;
   @Basic
   @Column(name = "UserCpb")
   private int UserCpb;
   @Basic
   @Column(name = "UserFreguesia")
   private String UserFreguesia;
   @Basic
   @Column(name = "UserConcelho")
   private String UserConcelho;
   @Basic
   @Column(name = "UserDistrito")
   private String UserDistrito;
   @Basic
   @Column(name = "UserContacto")
   private int UserContacto;
   @Basic
   @Column(name = "UserNif")
   private int UserNif;
   @Basic
   @Column(name = "UserEmail")
   private String UserEmail;
   @Basic
   @Column(name = "UserPasswd")
   private String UserPasswd;
   @Basic
   @Column(name = "UserActivo")
   private Boolean UserActivo;

   //******************************************
   // GET
   //****************************************** 
   public int getUserId() {
      return UserId;
   }

   public int getNivelAcesso_NivelAcessoId() {
      return NivelAcesso_NivelAcessoId;
   }

   public String getUserNome() {
      return UserNome;
   }

   public String getUserMorada() {
      return UserMorada;
   }

   public int getUserCpa() {
      return UserCpa;
   }

   public int getUserCpb() {
      return UserCpb;
   }

   public String getUserFreguesia() {
      return UserFreguesia;
   }

   public String getUserConcelho() {
      return UserConcelho;
   }

   public String getUserDistrito() {
      return UserDistrito;
   }

   public int getUserContacto() {
      return UserContacto;
   }

   public int getUserNif() {
      return UserNif;
   }

   public String getUserEmail() {
      return UserEmail;
   }

   public String getUserPasswd() {
      return UserPasswd;
   }

   public Boolean getUserActivo() {
      return UserActivo;
   }

   //******************************************
   // SET
   //****************************************** 
   public void setUserId(int UserId) {
      this.UserId = UserId;
   }

   public void setNivelAcesso_NivelAcessoId(int NivelAcesso_NivelAcessoId) {
      this.NivelAcesso_NivelAcessoId = NivelAcesso_NivelAcessoId;
   }

   public void setUserNome(String UserNome) {
      this.UserNome = UserNome;
   }

   public void setUserMorada(String UserMorada) {
      this.UserMorada = UserMorada;
   }

   public void setUserCpa(int UserCpa) {
      this.UserCpa = UserCpa;
   }

   public void setUserCpb(int UserCpb) {
      this.UserCpb = UserCpb;
   }

   public void setUserFreguesia(String UserFreguesia) {
      this.UserFreguesia = UserFreguesia;
   }

   public void setUserConcelho(String UserConcelho) {
      this.UserConcelho = UserConcelho;
   }

   public void setUserDistrito(String UserDistrito) {
      this.UserDistrito = UserDistrito;
   }

   public void setUserContacto(int UserContacto) {
      this.UserContacto = UserContacto;
   }

   public void setUserNif(int UserNif) {
      this.UserNif = UserNif;
   }

   public void setUserEmail(String UserEmail) {
      this.UserEmail = UserEmail;
   }

   public void setUserPasswd(String UserPasswd) throws UnsupportedEncodingException, NoSuchAlgorithmException {
      this.UserPasswd = UserPasswd;
   }

   public void setUserActivo(Boolean UserActivo) {
      this.UserActivo = UserActivo;
   }

   //******************************************
   // 
   //****************************************** 
   public int insertEntity(UserInfo user) {
      //returns 1 if success
      //return -1 if error

      try {
         List<UserInfo> users = new ArrayList<UserInfo>();
         Session s = NewHibernateUtil.getSessionFactory();

         s.beginTransaction();
         Query quer = s.createQuery("FROM UserInfo WHERE UserEmail like '" + user.getUserEmail() +"' ");
         users = quer.list();
         s.getTransaction().commit();

         if (users == null || users.size() != 0) {
            return -2;
         }

         s.beginTransaction();
         s.save(user);
         s.getTransaction().commit();

         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int updateEntity(UserInfo user, Boolean updatePassword) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         Query quer = null;
         if (updatePassword) {
            quer = s.createQuery("UPDATE UserInfo SET "
                    + "UserNome = '" + user.getUserNome() + "', "
                    + "UserMorada = '" + user.getUserMorada() + "', "
                    + "UserCpa = " + user.getUserCpa() + ", "
                    + "UserCpb = " + user.getUserCpb() + ", "
                    + "UserFreguesia = '" + user.getUserFreguesia() + "', "
                    + "UserConcelho = '" + user.getUserConcelho() + "', "
                    + "UserDistrito = '" + user.getUserDistrito() + "', "
                    + "UserContacto = " + user.getUserContacto() + ", "
                    + "UserNif = " + user.getUserNif() + ", "
                    + "UserEmail = '" + user.getUserEmail() + "', "
                    + "UserActivo = " + user.getUserActivo() + ", "
                    + "UserPasswd = '" + user.getUserPasswd() + "' "
                    + "WHERE UserId = " + user.getUserId());
         } else {
            quer = s.createQuery("UPDATE UserInfo SET "
                    + "UserNome = '" + user.getUserNome() + "', "
                    + "UserMorada = '" + user.getUserMorada() + "', "
                    + "UserCpa = " + user.getUserCpa() + ", "
                    + "UserCpb = " + user.getUserCpb() + ", "
                    + "UserFreguesia = '" + user.getUserFreguesia() + "', "
                    + "UserConcelho = '" + user.getUserConcelho() + "', "
                    + "UserDistrito = '" + user.getUserDistrito() + "', "
                    + "UserContacto = " + user.getUserContacto() + ", "
                    + "UserNif = " + user.getUserNif() + ", "
                    + "UserEmail = '" + user.getUserEmail() + "', "
                    + "UserActivo = " + user.getUserActivo() + " "
                    + "WHERE UserId = " + user.getUserId());
         }
         quer.executeUpdate();
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
   
   public UserInfo getUserByEmail(String loginEmail) throws UnsupportedEncodingException {
      List<UserInfo> users = new ArrayList<UserInfo>();
      try {
         if (loginEmail.isEmpty()) {
            return null;
         }
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM UserInfo WHERE UserEmail like '" + loginEmail + "' ");
         users = quer.list();
         session.getTransaction().commit();

         if (users.isEmpty()) {
            return null;
         }
         return users.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   //***************************************************************************
   // Se existir, retorna os dados do utilizador que fez login 
   public UserInfo getUserInfo(String loginEmail, String LoginPassword) throws UnsupportedEncodingException {
      List<UserInfo> users = new ArrayList<UserInfo>();
      try {
         if (loginEmail.isEmpty() || LoginPassword.isEmpty()) {
            return null;
         }
         Session session = NewHibernateUtil.getSessionFactory();
         String encodedPassword = Utils.convertToMd5(LoginPassword);
         session.beginTransaction();
         Query quer = session.createQuery("FROM UserInfo WHERE UserEmail like '" + loginEmail + "' AND UserPasswd like '" + encodedPassword + "' ");
         users = quer.list();
         session.getTransaction().commit();

         if (users.isEmpty()) {
            return null;
         }
         return users.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   public UserInfo getUserInfoV2(String loginEmail, String LoginPassword) throws UnsupportedEncodingException {
      List<UserInfo> users = new ArrayList<UserInfo>();
      try {
         if (loginEmail.isEmpty() || LoginPassword.isEmpty()) {
            return null;
         }
         Session session = NewHibernateUtil.getSessionFactory();
         String encodedPassword = Utils.convertToMd5(LoginPassword);
         session.beginTransaction();
         Query quer = session.createQuery("FROM UserInfo WHERE UserEmail like '" + loginEmail + "' AND UserPasswd like '" + encodedPassword);
         users = quer.list();
         session.getTransaction().commit();

         if (users.isEmpty()) {
            return null;
         }
         return users.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   public UserInfo getUser(int idUser) {
      List<UserInfo> users = new ArrayList<UserInfo>();
      try {
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM UserInfo WHERE UserId = " + idUser);
         users = quer.list();
         session.getTransaction().commit();
         if (users.isEmpty()) {
            return null;
         }
         return users.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   public List getActiveUsers(boolean estado) {
      List<UserInfo> users = new ArrayList<UserInfo>();
      try {

         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM UserInfo WHERE UserActivo = " + estado + " AND NivelAcesso_NivelAcessoId BETWEEN 2 AND 10 ");
         users = quer.list();
         session.getTransaction().commit();

         if (users.isEmpty()) {
            return null;
         }
         return users;
      } catch (Exception e) {
         return null;
      }
   }
   
   public List getBlockedUsers(){
      List<UserInfo> users = new ArrayList<UserInfo>();
      try {

         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = session.createQuery("FROM UserInfo WHERE UserActivo = " + false + " AND NivelAcesso_NivelAcessoId > 10 ");
         users = quer.list();
         session.getTransaction().commit();

         if (users.isEmpty()) {
            return null;
         }
         return users;
      } catch (Exception e) {
         return null;
      }
   }

   public int blockUser(int idU) {
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         Query quer = null;
         int bloqueio = 999;
         quer = s.createQuery("UPDATE UserInfo SET "
                 + "NivelAcesso_NivelAcessoId = " + bloqueio + ", "
                 + "UserActivo = " + false + " "
                 + "WHERE UserId = " + idU);
         quer.executeUpdate();
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
   
   public int deactivateUser(int idU) {
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         Query quer = null;
         int nivelAcesso = 2;
         quer = s.createQuery("UPDATE UserInfo SET "
                 + "NivelAcesso_NivelAcessoId = " + nivelAcesso + ", "
                 + "UserActivo = " + false + " "
                 + "WHERE UserId = " + idU);
         quer.executeUpdate();
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
   
   public int activateUser(int idU) {
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         Query quer = null;
         int nivelAcesso = 2;
         quer = s.createQuery("UPDATE UserInfo SET "
                 + "NivelAcesso_NivelAcessoId = " + nivelAcesso + ", "
                 + "UserActivo = " + true + " "
                 + "WHERE UserId = " + idU);
         quer.executeUpdate();
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
}
