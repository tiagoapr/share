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
   
   artigo.setClassSubFamilia_SubFamiliaId(Integer.parseInt((String) request.getParameter("classSubFamilia")));
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

   int res = artigo.insertEntity(artigo);

   int message = 0;

   switch (res) {
      case -1:
         message = 5;//erro
         response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
         break;
      default:
         message = 4;//OK
         session.setAttribute("sessionArtigoId", res);
         response.sendRedirect("/eStore/Admin/productsFoto2.jsp");
         break;

   }

   


%>