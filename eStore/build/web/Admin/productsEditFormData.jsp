<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Artigo"%>


<%



   Artigo artigo = new Artigo();
   Boolean varDestaque = false;
   Boolean varActivo = false;

   if (request.getParameter("destaque") != null) {
      varDestaque = true;
   }

   if (request.getParameter("activo") != null) {
      varActivo = true;
   }

   if (request.getParameter("classSubFamilia") == null) {
      Artigo a = new Artigo();
      Artigo aux = new Artigo();
      a = aux.getArtigo(Integer.parseInt((String) request.getParameter("idArt")), Utils.userIsLoggedAsAdmin(session));
      artigo.setClassSubFamilia_SubFamiliaId(a.getClassSubFamilia_ClassSubFamiliaId());
   } else {
      artigo.setClassSubFamilia_SubFamiliaId(Integer.parseInt((String) request.getParameter("classSubFamilia")));
   }

   artigo.setArtigoId(Integer.parseInt((String) request.getParameter("idArt")));
   artigo.setArtigoPreco(Float.parseFloat((String) request.getParameter("preco")));
   artigo.setArtigoPromocao(Integer.parseInt((String) request.getParameter("promocao")));
   artigo.setArtigoDestaque(varDestaque);   
   artigo.setArtigoFoto("xxx.jpg");
   artigo.setArtigoActivo(varActivo);
   /*
   artigo.setArtigoNome((String) request.getParameter("nome"));
   artigo.setArtigoReferencia((String) request.getParameter("referencia"));
   artigo.setArtigoUnidadeVenda((String) request.getParameter("unidadeVenda"));
   artigo.setArtigoDescricaoSmall((String) request.getParameter("descricaoBreve"));
   artigo.setArtigoDescricaoLong((String) request.getParameter("descricaoDetalhada"));
   */   
   artigo.setArtigoNome(Utils.parseStringSpecialChars((String) request.getParameter("nome")));
   artigo.setArtigoReferencia(Utils.parseStringSpecialChars((String) request.getParameter("referencia")));
   artigo.setArtigoUnidadeVenda(Utils.parseStringSpecialChars((String) request.getParameter("unidadeVenda")));
   artigo.setArtigoDescricaoSmall(Utils.parseStringSpecialChars((String) request.getParameter("descricaoBreve")));
   artigo.setArtigoDescricaoLong(Utils.parseStringSpecialChars((String) request.getParameter("descricaoDetalhada")));
   
   
   

   int res = artigo.updateEntity(artigo);

   int message = 0;
   response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));

%>


<script  type = "text/javascript">
   if((<%=res%>)==1){
      alert("Actualização do produto realizada com sucesso!\n\nObrigado.");
   }
   else{
      alert("Ocorreu um erro ao tentar actualizar a informação do produto!");
   }   
   window.close();
</script>