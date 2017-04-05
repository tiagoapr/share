package DatabaseClasses;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "nivelacesso")
public class NivelAcesso implements Serializable {

   @Id
   @GeneratedValue
   private int NivelAcessoId;
   @Basic
   @Column(name = "NivelAcessoNome")
   private String NivelAcessoNome;
   @Basic
   @Column(name = "NivelAcessoActivo")
   private Boolean NivelAcessoActivo;

   //******************************************
   // GET
   //******************************************
   public int getNivelAcessoId() {
      return NivelAcessoId;
   }

   public String getNivelAcessoNome() {
      return NivelAcessoNome;
   }

   public Boolean getNivelAcessoActivo() {
      return NivelAcessoActivo;
   }

   //******************************************
   // SET
   //******************************************
   public void setNivelAcessoId(int NivelAcessoId) {
      this.NivelAcessoId = NivelAcessoId;
   }

   public void setNivelAcessoNome(String NivelAcessoNome) {
      this.NivelAcessoNome = NivelAcessoNome;
   }

   public void setNivelAcessoActivo(Boolean NivelAcessoActivo) {
      this.NivelAcessoActivo = NivelAcessoActivo;
   }
}
