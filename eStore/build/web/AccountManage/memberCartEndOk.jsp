
<%@page import="java.util.Iterator"%>
<%@page import="DatabaseClasses.Artigo"%>
<%@page import="DatabaseClasses.EncomendaLinha"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DatabaseClasses.Encomenda"%>
<%@page import="java.util.Date"%>


<%
   int idUser = (Integer) session.getAttribute("sessionUserId");

   Artigo a = new Artigo();
   Artigo auxA = new Artigo();


   ArrayList<EncomendaLinha> linhasEncomenda = new ArrayList<EncomendaLinha>();

   Carrinho carro = new Carrinho();
   List<Carrinho> items = new ArrayList<Carrinho>();

   items = carro.getItemsOnCart(idUser);

   for (Carrinho c : items) {
      EncomendaLinha encLinha = new EncomendaLinha();
      a = auxA.getArtigo(c.getArtigo_ArtigoId(), true);
      int xpto = a.getArtigoId();
      encLinha.setArtigo_ArtigoId(xpto);
      encLinha.setEncLinhaPreco(a.getArtigoPreco());
      encLinha.setEncLinhaPromocao(a.getArtigoPromocao());
      encLinha.setEncLinhaQuantidade(c.getCarrinhoQuantidade());
      encLinha.setEncLinhaTotalLinha(a.getPrecoFinal(c.getCarrinhoQuantidade()));
      linhasEncomenda.add(encLinha);
   }

   Encomenda enc = new Encomenda();
   Date now = new Date();

   enc.setUserInfo_UserId(idUser);
   enc.setEncMorada((String) request.getParameter("morada"));
   enc.setEncCpa(Integer.parseInt((String) request.getParameter("cpa")));
   enc.setEncCpb(Integer.parseInt((String) request.getParameter("cpb")));
   enc.setEncFreguesia((String) request.getParameter("freguesia"));
   enc.setEncConcelho((String) request.getParameter("concelho"));
   enc.setEncDistrito((String) request.getParameter("distrito"));
   enc.setEncObservacoes((String) request.getParameter("observacoes"));
   enc.setEncDataPedido(now);
   enc.setEncPagamento(false);

   int resultado = enc.insertEntity(enc, linhasEncomenda);

   int message = 0;

   switch (resultado) {
      case -1:
         message = 9;//erro
         break;
      case 1:
         message = 8;//OK
         break;
   }

   response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);

%>