package DatabaseClasses;

import SupportClasses.Utils;
import java.io.Serializable;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.hibernate.Query;
import org.hibernate.Session;

@Entity
@Table(name = "Encomenda")
public class Encomenda implements Serializable {

   @Id
   @GeneratedValue
   private int EncId;
   @Basic
   @Column(name = "UserInfo_UserId")
   private int UserInfo_UserId;
   @Basic
   @Column(name = "EncMorada")
   private String EncMorada;
   @Basic
   @Column(name = "EncCpa")
   private int EncCpa;
   @Basic
   @Column(name = "EncCpb")
   private int EncCpb;
   @Basic
   @Column(name = "EncFreguesia")
   private String EncFreguesia;
   @Basic
   @Column(name = "EncConcelho")
   private String EncConcelho;
   @Basic
   @Column(name = "EncDistrito")
   private String EncDistrito;
   @Basic
   @Column(name = "EncObservacoes")
   private String EncObservacoes;
   /*
    @Basic
    @Column(name = "EncDataPedido")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date EncDataPedido;   
    @Basic
    @Column(name = "EncDataEntrega")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date EncDataEntrega;
    */
   @Basic
   @Column(name = "EncDataPedido")
   private String EncDataPedido;
   @Basic
   @Column(name = "EncDataEntrega")
   private String EncDataEntrega;
   @Basic
   @Column(name = "EncPagamento")
   private Boolean EncPagamento;

   //******************************************
   // GET
   //******************************************
   public int getEncId() {
      return EncId;
   }

   public int getUserInfo_UserId() {
      return UserInfo_UserId;
   }

   public String getEncMorada() {
      return EncMorada;
   }

   public int getEncCpa() {
      return EncCpa;
   }

   public int getEncCpb() {
      return EncCpb;
   }

   public String getEncFreguesia() {
      return EncFreguesia;
   }

   public String getEncConcelho() {
      return EncConcelho;
   }

   public String getEncDistrito() {
      return EncDistrito;
   }

   public String getEncObservacoes() {
      return EncObservacoes;
   }
   /*
    public Date getEncDataPedido() {
    return EncDataPedido;
    }

    public Date getEncDataEntrega() {
    return EncDataEntrega;
    }
    */

   public String getEncDataPedido() {
      return EncDataPedido;
   }

   public String getEncDataEntrega() {
      return EncDataEntrega;
   }

   public Boolean getEncPagamento() {
      return EncPagamento;
   }

   //******************************************
   // SET
   //******************************************
   public void setEncId(int EncId) {
      this.EncId = EncId;
   }

   public void setUserInfo_UserId(int UserInfo_UserId) {
      this.UserInfo_UserId = UserInfo_UserId;
   }

   public void setEncMorada(String EncMorada) {
      this.EncMorada = EncMorada;
   }

   public void setEncCpa(int EncCpa) {
      this.EncCpa = EncCpa;
   }

   public void setEncCpb(int EncCpb) {
      this.EncCpb = EncCpb;
   }

   public void setEncFreguesia(String EncFreguesia) {
      this.EncFreguesia = EncFreguesia;
   }

   public void setEncConcelho(String EncConcelho) {
      this.EncConcelho = EncConcelho;
   }

   public void setEncDistrito(String EncDistrito) {
      this.EncDistrito = EncDistrito;
   }

   public void setEncObservacoes(String EncObservacoes) {
      this.EncObservacoes = EncObservacoes;
   }

   public void setEncDataPedido(Date EncDataPedido) throws ParseException {
      this.EncDataPedido = Utils.transformToSimpleDateTimeFormat(EncDataPedido);
   }

   public void setEncDataEntrega(Date EncDataEntrega) throws ParseException {
      this.EncDataEntrega = Utils.transformToSimpleDateFormat(EncDataEntrega);
   }

   public void setEncPagamento(Boolean EncPagamento) {
      this.EncPagamento = EncPagamento;
   }

   //******************************************
   // 
   //****************************************** 
   public int insertEntity(Encomenda encomenda, List linhasEncomenda) {
      //returns 1 if success
      //return -1 if error
      Carrinho carro = new Carrinho();
      Encomenda enc = new Encomenda();
      EncomendaLinha encLinha = new EncomendaLinha();

      try {
         Session s = NewHibernateUtil.getSessionFactory();

         s.beginTransaction();
         s.save(encomenda);
         s.getTransaction().commit();

         enc = this.getEncomenda(encomenda.getEncDataPedido(), encomenda.getUserInfo_UserId());
         int resultado = encLinha.insertEntity(enc.getEncId(), linhasEncomenda);
         if (resultado == -1) {
            //Falhou inserir Linhas de encomenda
            removeEncomenda(enc.getEncId());
         } else {
            //Limpa carrinho
            carro.removeEntityFromUser(encomenda.getUserInfo_UserId());
         }
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int removeEncomenda(int encId) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("DELETE FROM Encomenda WHERE "
                 + "EncId = " + encId);
         quer.executeUpdate();

         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int closeOrder(int idEnc) throws ParseException {
      //returns 1 if success
      //return -1 if error
      Date now = new Date();
      String dateStr = Utils.transformToSimpleDateFormat(now);
      EncomendaLinha encLinha = new EncomendaLinha();

      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("UPDATE Encomenda SET "
                 + "EncDataEntrega = '" + dateStr + "', "
                 + "EncPagamento = " + true + " "
                 + "WHERE EncId = " + idEnc);
         quer.executeUpdate();

         int resultado = encLinha.closeOrderItem(idEnc, dateStr);
         if (resultado == -1) {
            return -1;
         }

         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int payOrder(int idEnc) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("UPDATE Encomenda SET "
                 + "EncPagamento = " + true + " "
                 + "WHERE EncId = " + idEnc);
         quer.executeUpdate();

         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   public int insertEntityV2(Encomenda encomenda) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         Query quer = null;

         quer = s.createSQLQuery("INSERT INTO encomenda VALUES ("
                 + encomenda.getUserInfo_UserId() + ", "
                 + "'" + encomenda.getEncMorada() + "', "
                 + encomenda.getEncCpa() + ", "
                 + encomenda.getEncCpb() + ", "
                 + "'" + encomenda.getEncFreguesia() + "', "
                 + "'" + encomenda.getEncConcelho() + "', "
                 + "'" + encomenda.getEncDistrito() + "', "
                 + "'" + encomenda.getEncObservacoes() + "', "
                 + "'" + encomenda.getEncDataPedido() + "')");

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
   public Encomenda getEncomenda(String dataPedido, int idUser) {
      try {
         List<Encomenda> encomenda = new ArrayList<Encomenda>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;

         quer = session.createQuery("FROM Encomenda WHERE EncDataPedido like '" + dataPedido + "' AND UserInfo_UserId =" + idUser);

         encomenda = quer.list();
         session.getTransaction().commit();

         if (encomenda.isEmpty()) {
            return null;
         }
         return encomenda.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   public Encomenda getEncomenda(int idEnc) {
      try {
         List<Encomenda> encomenda = new ArrayList<Encomenda>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;

         quer = session.createQuery("FROM Encomenda WHERE EncId = " + idEnc);

         encomenda = quer.list();
         session.getTransaction().commit();

         if (encomenda.isEmpty()) {
            return null;
         }
         return encomenda.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   public List getOrdersList(int idUser) {
      try {
         List<Encomenda> encomendas = new ArrayList<Encomenda>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;

         quer = session.createQuery("FROM Encomenda WHERE UserInfo_UserId =" + idUser);

         encomendas = quer.list();
         session.getTransaction().commit();

         if (encomendas.isEmpty()) {
            return null;
         }
         return encomendas;
      } catch (Exception e) {
         return null;
      }
   }

   public List getOrdersList() {
      try {
         List<Encomenda> encomendas = new ArrayList<Encomenda>();
         Session session = NewHibernateUtil.getSessionFactory();

         session.beginTransaction();
         Query quer = null;
         quer = session.createQuery("FROM Encomenda WHERE EncDataEntrega IS NULL");
         encomendas = quer.list();
         session.getTransaction().commit();

         if (encomendas.isEmpty()) {
            return null;
         }
         return encomendas;
      } catch (Exception e) {
         return null;
      }
   }

   public List getOrdersListItem(int idArtigo) {

      List<Encomenda> encomendas = new ArrayList<Encomenda>();
      List<EncomendaLinha> items = new ArrayList<EncomendaLinha>();
      EncomendaLinha el = new EncomendaLinha();

      items = el.getOpenRequests(idArtigo);

      for (EncomendaLinha item : items) {
         Encomenda e = new Encomenda();
         encomendas.add(e.getEncomenda(item.getEncomenda_EncId()));
      }      
      return encomendas;
   }
   
   public List getClosedOrdersListItem(int idArtigo) {

      List<Encomenda> encomendas = new ArrayList<Encomenda>();
      List<EncomendaLinha> items = new ArrayList<EncomendaLinha>();
      EncomendaLinha el = new EncomendaLinha();

      items = el.getClosedRequests(idArtigo);

      for (EncomendaLinha item : items) {
         Encomenda e = new Encomenda();
         encomendas.add(e.getEncomenda(item.getEncomenda_EncId()));
      }      
      return encomendas;
   }

   public List getClosedOrdersList() {
      try {
         List<Encomenda> encomendas = new ArrayList<Encomenda>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;

         quer = session.createQuery("FROM Encomenda WHERE EncDataEntrega like '%' AND EncPagamento = true");

         encomendas = quer.list();
         session.getTransaction().commit();

         if (encomendas.isEmpty()) {
            return null;
         }
         return encomendas;
      } catch (Exception e) {
         return null;
      }
   }

   public float getTotalAmount(int idEnc) {
      float totalAmount = 0;
      EncomendaLinha encL = new EncomendaLinha();
      List<EncomendaLinha> encLinhas = new ArrayList<EncomendaLinha>();
      encLinhas = encL.getOrdersList(idEnc);

      if (encLinhas == null) {
         return 0;
      }

      for (EncomendaLinha el : encLinhas) {
         totalAmount += el.getEncLinhaTotalLinha();
      }
      return totalAmount;
   }

   public String qualEstadoDaEncomenda(boolean pagamento, String dataEntrega) {
      String estado = "";

      if (!pagamento) {
         estado = "Aguarda Pagamento";
      } else if (dataEntrega == null || dataEntrega.isEmpty()) {
         estado = "Em tratamento";
      } else {
         estado = "Enviada";
      }

      return estado;
   }
}
