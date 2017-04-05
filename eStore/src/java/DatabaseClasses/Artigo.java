package DatabaseClasses;

import SupportClasses.Utils;
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
@Table(name = "artigo")
public class Artigo implements Serializable {

   @Id
   @GeneratedValue
   private int ArtigoId;
   @Basic
   @Column(name = "ClassSubFamilia_ClassSubFamiliaId")
   private int ClassSubFamilia_ClassSubFamiliaId;
   @Basic
   @Column(name = "ArtigoReferencia")
   private String ArtigoReferencia;
   @Basic
   @Column(name = "ArtigoUnidadeVenda")
   private String ArtigoUnidadeVenda;
   @Basic
   @Column(name = "ArtigoFoto")
   private String ArtigoFoto;
   @Basic
   @Column(name = "ArtigoNome")
   private String ArtigoNome;
   @Basic
   @Column(name = "ArtigoDescricaoSmall")
   private String ArtigoDescricaoSmall;
   @Basic
   @Column(name = "ArtigoDescricaoLong")
   private String ArtigoDescricaoLong;
   @Basic
   @Column(name = "ArtigoActivo")
   private Boolean ArtigoActivo;
   @Basic
   @Column(name = "ArtigoDestaque")
   private Boolean ArtigoDestaque;
   @Basic
   @Column(name = "ArtigoPreco")
   private float ArtigoPreco;
   @Basic
   @Column(name = "ArtigoPromocao")
   private int ArtigoPromocao;

   //******************************************
   // GET
   //****************************************** 
   public int getArtigoId() {
      return ArtigoId;
   }

   public int getClassSubFamilia_ClassSubFamiliaId() {
      return ClassSubFamilia_ClassSubFamiliaId;
   }

   public String getArtigoReferencia() {
      return ArtigoReferencia;
   }

   public String getArtigoUnidadeVenda() {
      return ArtigoUnidadeVenda;
   }

   public String getArtigoFoto() {
      return ArtigoFoto;
   }

   public String getArtigoNome() {
      return ArtigoNome;
   }

   public String getArtigoDescricaoSmall() {
      return ArtigoDescricaoSmall;
   }

   public String getArtigoDescricaoLong() {
      return ArtigoDescricaoLong;
   }

   public Boolean getArtigoActivo() {
      return ArtigoActivo;
   }

   public Boolean getArtigoDestaque() {
      return ArtigoDestaque;
   }

   public float getArtigoPreco() {
      return ArtigoPreco;
   }

   public int getArtigoPromocao() {
      return ArtigoPromocao;
   }

   //******************************************
   // SET
   //****************************************** 
   public void setArtigoId(int ArtigoId) {
      this.ArtigoId = ArtigoId;
   }

   public void setClassSubFamilia_SubFamiliaId(int ClassSubFamilia_ClassSubFamiliaId) {
      this.ClassSubFamilia_ClassSubFamiliaId = ClassSubFamilia_ClassSubFamiliaId;
   }

   public void setArtigoReferencia(String ArtigoReferencia) {
      this.ArtigoReferencia = ArtigoReferencia;
   }

   public void setArtigoUnidadeVenda(String ArtigoUnidadeVenda) {
      this.ArtigoUnidadeVenda = ArtigoUnidadeVenda;
   }

   public void setArtigoFoto(String ArtigoFoto) {
      this.ArtigoFoto = ArtigoFoto;
   }

   public void setArtigoNome(String ArtigoNome) {
      this.ArtigoNome = ArtigoNome;
   }

   public void setArtigoDescricaoSmall(String ArtigoDescricaoSmall) {
      this.ArtigoDescricaoSmall = ArtigoDescricaoSmall;
   }

   public void setArtigoDescricaoLong(String ArtigoDescricaoLong) {
      this.ArtigoDescricaoLong = ArtigoDescricaoLong;
   }

   public void setArtigoActivo(Boolean ArtigoActivo) {
      this.ArtigoActivo = ArtigoActivo;
   }

   public void setArtigoDestaque(Boolean ArtigoDestaque) {
      this.ArtigoDestaque = ArtigoDestaque;
   }

   public void setArtigoPreco(float ArtigoPreco) {
      this.ArtigoPreco = ArtigoPreco;
   }

   public void setArtigoPromocao(int ArtigoPromocao) {
      this.ArtigoPromocao = ArtigoPromocao;
   }

   //******************************************
   // 
   //****************************************** 
   public int insertEntity(Artigo artigo) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();
         s.save(artigo);
         s.getTransaction().commit();
         return artigo.getArtigoId();
      } catch (Exception e) {
         return -1;
      }
   }

   public int updateEntity(Artigo artigo) {
      //returns 1 if success
      //return -1 if error
      try {
         Session s = NewHibernateUtil.getSessionFactory();
         s.beginTransaction();

         Query quer = s.createQuery("UPDATE Artigo SET "
                 + "ClassSubFamilia_ClassSubFamiliaId = " + artigo.getClassSubFamilia_ClassSubFamiliaId() + ", "
                 + "ArtigoReferencia = '" + artigo.getArtigoReferencia() + "', "
                 + "ArtigoUnidadeVenda = '" + artigo.getArtigoUnidadeVenda() + "', "
                 + "ArtigoFoto = '" + artigo.getArtigoFoto() + "', "
                 + "ArtigoNome = '" + artigo.getArtigoNome() + "', "
                 + "ArtigoDescricaoSmall = '" + artigo.getArtigoDescricaoSmall() + "', "
                 + "ArtigoDescricaoLong = '" + artigo.getArtigoDescricaoLong() + "', "
                 + "ArtigoActivo = " + artigo.getArtigoActivo() + ", "
                 + "ArtigoDestaque = " + artigo.getArtigoDestaque() + ", "
                 + "ArtigoPreco = " + artigo.getArtigoPreco() + ", "
                 + "ArtigoPromocao = " + artigo.getArtigoPromocao() + " "
                 + "WHERE ArtigoId = " + artigo.getArtigoId());
         quer.executeUpdate();

         s.getTransaction().commit();
         return 1;
      } catch (Exception e) {
         return -1;
      }
   }

   /*
    * 0 - ID 
    * 1 - ClassSubFamilia_ClassSubFamiliaId
    * 2 - referencia
    * 3 - unidadeVenda
    * 4 - foto
    * 5 - nome
    * 6 - descSmall
    * 7 - descLong
    * 8 - activo
    * 9 - destaque
    * 10 - preco
    * 11 - promocao
    * 12 - ClassSubFamiliaId
    * 13 - ClassFamilia_FamiliaId
    * 14 - ClassSubFamiliaNome
    * 15 - ClassFamiliaId
    * 16 - ClassFamiliaNome
    */
   public List getArtigosList(int idSubf, int idf, boolean showInactivo) {
      try {
         List artigos = new ArrayList<Artigo>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();

         Query quer = null;
         if (showInactivo) {
            quer = session.createSQLQuery("SELECT * FROM artigo "
                    + "INNER JOIN classsubfamilia ON artigo.classSubFamilia_ClassSubFamiliaId = classsubfamilia.ClassSubFamiliaId "
                    + "INNER JOIN classfamilia ON classsubfamilia.ClassFamilia_FamiliaId = classfamilia.ClassFamiliaId "
                    + "WHERE (classfamilia.ClassFamiliaId = " + idf + ") AND (classsubfamilia.ClassSubFamiliaId = " + idSubf + ") ORDER BY ArtigoActivo DESC");
         } else {
            quer = session.createSQLQuery("SELECT * FROM artigo "
                    + "INNER JOIN classsubfamilia ON artigo.classSubFamilia_ClassSubFamiliaId = classsubfamilia.ClassSubFamiliaId "
                    + "INNER JOIN classfamilia ON classsubfamilia.ClassFamilia_FamiliaId = classfamilia.ClassFamiliaId "
                    + "WHERE (classfamilia.ClassFamiliaId = " + idf + ") AND (classsubfamilia.ClassSubFamiliaId = " + idSubf + ") AND (ArtigoActivo = 1)");
         }
         artigos = quer.list();
         session.getTransaction().commit();

         if (artigos.isEmpty()) {
            return null;
         }
         return artigos;
      } catch (Exception e) {
         return null;
      }
   }

   public List getArtigosListDestaque(boolean showInactivo) {
      try {
         List artigos = new ArrayList<Artigo>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();

         Query quer = null;
         if (showInactivo) {
            quer = session.createSQLQuery("SELECT * FROM artigo "
                    + "INNER JOIN classsubfamilia ON artigo.classSubFamilia_ClassSubFamiliaId = classsubfamilia.ClassSubFamiliaId "
                    + "INNER JOIN classfamilia ON classsubfamilia.ClassFamilia_FamiliaId = classfamilia.ClassFamiliaId "
                    + "WHERE ArtigoDestaque = 1 "
                    + "ORDER BY ArtigoActivo DESC");
         } else {
            quer = session.createSQLQuery("SELECT * FROM artigo "
                    + "INNER JOIN classsubfamilia ON artigo.classSubFamilia_ClassSubFamiliaId = classsubfamilia.ClassSubFamiliaId "
                    + "INNER JOIN classfamilia ON classsubfamilia.ClassFamilia_FamiliaId = classfamilia.ClassFamiliaId "
                    + "WHERE ArtigoDestaque = 1 AND ArtigoActivo = 1");
         }
         artigos = quer.list();
         session.getTransaction().commit();

         if (artigos.isEmpty()) {
            return null;
         }
         return artigos;
      } catch (Exception e) {
         return null;
      }
   }

   public Artigo getArtigo(int idArtigo, boolean showInactivo) {
      try {
         List<Artigo> artigos = new ArrayList<Artigo>();
         Session session = NewHibernateUtil.getSessionFactory();
         session.beginTransaction();
         Query quer = null;
         if (showInactivo) {
            quer = session.createQuery("FROM Artigo WHERE ArtigoId = " + idArtigo);
         } else {
            quer = session.createQuery("FROM Artigo WHERE ArtigoId = " + idArtigo + " AND ArtigoActivo = 1");
         }
         artigos = quer.list();
         session.getTransaction().commit();

         if (artigos.isEmpty()) {
            return null;
         }
         return artigos.get(0);
      } catch (Exception e) {
         return null;
      }
   }

   public List getArtigoClassification() {
      List<String> classes = new ArrayList<String>();
      ClassSubFamilia auxSF = new ClassSubFamilia();
      ClassFamilia auxF = new ClassFamilia();

      ClassSubFamilia sf = auxSF.getClassSubFamilia(this.getClassSubFamilia_ClassSubFamiliaId());
      if (sf == null) {
         return null;
      }

      ClassFamilia f = auxF.getClassFamilia(sf.getClassFamilia_FamiliaId());
      if (f == null) {
         return null;
      }

      classes.add(f.getClassFamiliaNome());
      classes.add(sf.getClassSubFamiliaNome());

      return classes;
   }

   public float getPrecoFinal(int qtd) {
      float totalParcela = 0;
      if (this.getArtigoPromocao() > 0) {
         totalParcela = (Utils.promotionalPriceB(this.getArtigoPreco(), this.getArtigoPromocao())) * qtd;
      } else {
         totalParcela = this.getArtigoPreco() * qtd;
      }
      return totalParcela;
   }
}
