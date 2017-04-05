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
@Table(name = "carrinho")
public class Carrinho implements Serializable {

   @Id
   @GeneratedValue
   private int CarrinhoId;
   @Basic
   @Column(name = "Artigo_ArtigoId")
   private int Artigo_ArtigoId;
   @Basic
   @Column(name = "UserInfo_UserId")
   private int UserInfo_UserId;
   @Basic
   @Column(name = "CarrinhoQuantidade")
   private int CarrinhoQuantidade;

   //******************************************
   // GET
   //******************************************
   public int getCarrinhoId() {
      return CarrinhoId;
   }

   public int getArtigo_ArtigoId() {
      return Artigo_ArtigoId;
   }

   public int getUserInfo_UserId() {
      return UserInfo_UserId;
   }

   public int getCarrinhoQuantidade() {
      return CarrinhoQuantidade;
   }

   //******************************************
   // SET
   //******************************************
   public void setCarrinhoId(int CarrinhoId) {
      this.CarrinhoId = CarrinhoId;
   }

   public void setArtigo_ArtigoId(int Artigo_ArtigoId) {
      this.Artigo_ArtigoId = Artigo_ArtigoId;
   }

   public void setUserInfo_UserId(int UserInfo_UserId) {
      this.UserInfo_UserId = UserInfo_UserId;
   }

   public void setCarrinhoQuantidade(int CarrinhoQuantidade) {
      this.CarrinhoQuantidade = CarrinhoQuantidade;
   }

   //******************************************
   // 
   //****************************************** 
   public int insertEntity(Carrinho carro) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
            s.save(carro);
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int removeEntity(Carrinho carro) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("DELETE FROM Carrinho WHERE "
                 + "Artigo_ArtigoId = " + carro.getArtigo_ArtigoId() + " AND "
                 + "UserInfo_UserId = " + carro.getUserInfo_UserId());
         quer.executeUpdate();

         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int removeEntityFromUser(int idUser) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("DELETE FROM Carrinho WHERE "
                 + "UserInfo_UserId = " + idUser);
         quer.executeUpdate();

         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int refreshQuantity(Carrinho carro) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("UPDATE Carrinho SET "
                 + " CarrinhoQuantidade = " + carro.getCarrinhoQuantidade() + " WHERE "
                 + "Artigo_ArtigoId = " + carro.getArtigo_ArtigoId() + ", AND"
                 + "UserInfo_UserId = " + carro.getUserInfo_UserId());
         quer.executeUpdate();

         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   //******************************************
   // 
   //****************************************** 
   public boolean isProductOnCart(int idArtigo, int idUser) {
      try {
         List<Carrinho> carro = new ArrayList<Carrinho>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;
         quer = session.createQuery("FROM Carrinho WHERE Artigo_ArtigoId = " + idArtigo + " AND UserInfo_UserId = " + idUser);
         carro = quer.list();
         session.getTransaction().commit();
         if (carro.isEmpty()) {
            return false;
         }
         return true;
      } catch (Exception e) {
         return true;
      }
   }

   public List getItemsOnCart(int idUser) {
      try {
         List<Carrinho> carro = new ArrayList<Carrinho>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;
         quer = session.createQuery("FROM Carrinho WHERE UserInfo_UserId = " + idUser);
         carro = quer.list();
         session.getTransaction().commit();

         if (carro.isEmpty()) {
            return null;
         }
         return carro;
      } catch (Exception e) {
         return null;
      }
   }
}
