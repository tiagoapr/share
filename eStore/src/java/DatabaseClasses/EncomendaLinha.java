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
@Table(name = "EncomendaLinha")
public class EncomendaLinha implements Serializable {

   @Id
   @GeneratedValue
   private int EncLinhaId;
   @Basic
   @Column(name = "Encomenda_EncId")
   private int Encomenda_EncId;
   @Basic
   @Column(name = "Artigo_ArtigoId")
   private int Artigo_ArtigoId;
   @Basic
   @Column(name = "EncLinhaPreco")
   private float EncLinhaPreco;
   @Basic
   @Column(name = "EncLinhaPromocao")
   private int EncLinhaPromocao;
   @Basic
   @Column(name = "EncLinhaQuantidade")
   private int EncLinhaQuantidade;
   @Basic
   @Column(name = "EncLinhaTotalLinha")
   private float EncLinhaTotalLinha;
   @Basic
   @Column(name = "EncLinhaDataEntrega")
   private String EncLinhaDataEntrega;
   @Basic
   @Column(name = "EncLinhaRefTransporte")
   private String EncLinhaRefTransporte;

   //******************************************
   // GET
   //******************************************
   public int getEncLinhaId() {
      return EncLinhaId;
   }

   public int getEncomenda_EncId() {
      return Encomenda_EncId;
   }

   public int getArtigo_ArtigoId() {
      return Artigo_ArtigoId;
   }

   public float getEncLinhaPreco() {
      return EncLinhaPreco;
   }

   public int getEncLinhaPromocao() {
      return EncLinhaPromocao;
   }

   public int getEncLinhaQuantidade() {
      return EncLinhaQuantidade;
   }

   public float getEncLinhaTotalLinha() {
      return EncLinhaTotalLinha;
   }

   public String getEncLinhaDataEntrega() {
      return EncLinhaDataEntrega;
   }

   public String getEncLinhaRefTransporte() {
      return EncLinhaRefTransporte;
   }

   //******************************************
   // SET
   //******************************************
   public void setEncLinhaId(int EncLinhaId) {
      this.EncLinhaId = EncLinhaId;
   }

   public void setEncomenda_EncId(int Encomenda_EncId) {
      this.Encomenda_EncId = Encomenda_EncId;
   }

   public void setArtigo_ArtigoId(int Artigo_ArtigoId) {
      this.Artigo_ArtigoId = Artigo_ArtigoId;
   }

   public void setEncLinhaPreco(float EncLinhaPreco) {
      this.EncLinhaPreco = EncLinhaPreco;
   }

   public void setEncLinhaPromocao(int EncLinhaPromocao) {
      this.EncLinhaPromocao = EncLinhaPromocao;
   }

   public void setEncLinhaQuantidade(int EncLinhaQuantidade) {
      this.EncLinhaQuantidade = EncLinhaQuantidade;
   }

   public void setEncLinhaTotalLinha(float EncLinhaTotalLinha) {
      this.EncLinhaTotalLinha = EncLinhaTotalLinha;
   }

   public void setEncLinhaDataEntrega(Date EncLinhaDataEntrega) throws ParseException {
      this.EncLinhaDataEntrega = Utils.transformToSimpleDateFormat(EncLinhaDataEntrega);
   }

   public void setEncLinhaRefTransporte(String EncLinhaRefTransporte) {
      this.EncLinhaRefTransporte = EncLinhaRefTransporte;
   }

   //******************************************
   // 
   //******************************************  
   public int insertEntity(int idEncomenda, List linhasEncomenda) {
      //returns 1 if success
      //return -1 if error
      List<EncomendaLinha> linhasEnc = new ArrayList<EncomendaLinha>();
      linhasEnc = (ArrayList) linhasEncomenda;
      
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         for (EncomendaLinha el : linhasEnc) {
            el.setEncomenda_EncId(idEncomenda);
            s.save(el);
         }
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }      
   }
   
   
   public int closeOrderItem(int idEnc, String dateStr) throws ParseException{
      //returns 1 if success
      //return -1 if error      
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("UPDATE EncomendaLinha SET "
                 + "EncLinhaDataEntrega = '" + dateStr + "' "
                 + "WHERE Encomenda_EncId = " + idEnc + "AND EncLinhaDataEntrega IS NULL ");
         quer.executeUpdate();        
         
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
   
   public int updateRefTransporte(int idEncLinha, int idArtig, String refTransporte){
      //returns 1 if success
      //return -1 if error
      EncomendaLinha encLinha = new EncomendaLinha();
      
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("UPDATE EncomendaLinha SET "
                 + "EncLinhaRefTransporte = '" + refTransporte + "' "
                 + "WHERE EncLinhaId = " + idEncLinha + "AND Artigo_ArtigoId =" + idArtig );
         quer.executeUpdate();        
         
         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }
   
   public int sendItem(int idEncLinha, int idArtig, String refTransporte) throws ParseException{
      //returns 1 if success
      //return -1 if error
      EncomendaLinha encLinha = new EncomendaLinha();
      Date now = new Date();
      String nowStr = Utils.transformToSimpleDateFormat(now);
      
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         Query quer = null;
         s.beginTransaction();
         if(refTransporte == null || refTransporte.isEmpty() || refTransporte == ""){
            quer = s.createQuery("UPDATE EncomendaLinha SET "
                 + "EncLinhaDataEntrega = '" + nowStr + "' "
                 + "WHERE EncLinhaId = " + idEncLinha + "AND Artigo_ArtigoId =" + idArtig );
         }else{
            quer = s.createQuery("UPDATE EncomendaLinha SET "
                 + "EncLinhaDataEntrega = '" + nowStr + "', "
                 + "EncLinhaRefTransporte = '" + refTransporte + "' "
                 + "WHERE EncLinhaId = " + idEncLinha + "AND Artigo_ArtigoId =" + idArtig );
         }
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
   public List getOrdersList(int idEnc) {
      try {
         List<EncomendaLinha> encLinhas = new ArrayList<EncomendaLinha>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;

         quer = session.createQuery("FROM EncomendaLinha WHERE Encomenda_EncId =" + idEnc);

         encLinhas = quer.list();
         session.getTransaction().commit();

         if (encLinhas.isEmpty()) {
            return null;
         }
         return encLinhas;
      } catch (Exception e) {
         return null;
      }
   }
   
   public List getOpenRequests() {
      try {
         List<EncomendaLinha> encLinhas = new ArrayList<EncomendaLinha>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;
         quer = session.createQuery("FROM EncomendaLinha WHERE EncLinhaDataEntrega IS NULL");
         encLinhas = quer.list();
         session.getTransaction().commit();
         if (encLinhas.isEmpty()) {
            return null;
         }
         return encLinhas;
      } catch (Exception e) {
         return null;
      }
   }
   
   public List getOpenRequests(int idArtigo) {
      try {
         List<EncomendaLinha> encLinhas = new ArrayList<EncomendaLinha>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;
         quer = session.createQuery("FROM EncomendaLinha WHERE EncLinhaDataEntrega IS NULL AND Artigo_ArtigoId = " + idArtigo);
         encLinhas = quer.list();
         session.getTransaction().commit();
         if (encLinhas.isEmpty()) {
            return null;
         }
         return encLinhas;
      } catch (Exception e) {
         return null;
      }
   }
   
   public List getClosedRequests(int idArtigo) {
      try {
         List<EncomendaLinha> encLinhas = new ArrayList<EncomendaLinha>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;
         quer = session.createQuery("FROM EncomendaLinha WHERE EncLinhaDataEntrega IS NOT NULL AND Artigo_ArtigoId = " + idArtigo);
         encLinhas = quer.list();
         session.getTransaction().commit();
         if (encLinhas.isEmpty()) {
            return null;
         }
         return encLinhas;
      } catch (Exception e) {
         return null;
      }
   }
   
   /*
      0 - Id do Artigo
      1 - Quantidade encomendada
      2 - Nome Artigo
      3 - Referencia do artigo
      4 - Unidade de Venda
      5 - Foto
   */
   public List getOpenRequestsLight() {
      try {
         List<EncomendaLinha> encLinhas = new ArrayList<EncomendaLinha>();
         Session session = NewHibernateUtil.getSessionFactory();
         Query quer = null;
         
         session.beginTransaction();         
         quer = session.createSQLQuery(" SELECT EncomendaLinha.Artigo_ArtigoID, SUM(EncomendaLinha.EncLinhaQuantidade) AS qtyArtigo, "
               + "Artigo.ArtigoNome, Artigo.ArtigoReferencia, Artigo.ArtigoUnidadeVenda, Artigo.ArtigoFoto "
               + "FROM EncomendaLinha "
               + "INNER JOIN Artigo ON EncomendaLinha.Artigo_ArtigoId = Artigo.ArtigoId "
               + "WHERE (EncomendaLinha.EncLinhaDataEntrega IS NULL) "
               + "GROUP BY EncomendaLinha.Artigo_ArtigoId, Artigo.ArtigoNome, Artigo.ArtigoReferencia, Artigo.ArtigoUnidadeVenda, Artigo.ArtigoFoto");         
         encLinhas = quer.list();
         session.getTransaction().commit();
         
         if (encLinhas.isEmpty()) {
            return null;
         }
         return encLinhas;
      } catch (Exception e) {
         return null;
      }
   }
   
   
   public List getClosedRequestsLight() {
      try {
         List<EncomendaLinha> encLinhas = new ArrayList<EncomendaLinha>();
         Session session = NewHibernateUtil.getSessionFactory();
         Query quer = null;
         
         session.beginTransaction();         
         quer = session.createSQLQuery(" SELECT EncomendaLinha.Artigo_ArtigoID, SUM(EncomendaLinha.EncLinhaQuantidade) AS qtyArtigo, "
               + "Artigo.ArtigoNome, Artigo.ArtigoReferencia, Artigo.ArtigoUnidadeVenda, Artigo.ArtigoFoto "
               + "FROM EncomendaLinha "
               + "INNER JOIN Artigo ON EncomendaLinha.Artigo_ArtigoId = Artigo.ArtigoId "
               + "WHERE (EncomendaLinha.EncLinhaDataEntrega IS NOT NULL) "
               + "GROUP BY EncomendaLinha.Artigo_ArtigoId, Artigo.ArtigoNome, Artigo.ArtigoReferencia, Artigo.ArtigoUnidadeVenda, Artigo.ArtigoFoto "
               + "ORDER BY qtyArtigo DESC");         
         encLinhas = quer.list();
         session.getTransaction().commit();
         
         if (encLinhas.isEmpty()) {
            return null;
         }
         return encLinhas;
      } catch (Exception e) {
         return null;
      }
   }
   
   
   
   
   
   
}
