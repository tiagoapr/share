<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="SupportClasses.Utils"%>


<%
   //int idA = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
   //int qtd = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(1)));
   
   int idU = (Integer) session.getAttribute("sessionUserId");
   int qtd = Integer.parseInt((String) request.getParameter("quantidadeZ"));
   int idA = Integer.parseInt((String) request.getParameter("idArtig"));


 
   int resultado = -2;

   Carrinho carro = new Carrinho();

   if (qtd == 0) {
      response.sendRedirect("/eStore/AccountManage/productRemoveCart.jsp?a=" + idA);
   } else {
      if (carro.isProductOnCart(idA, idU)) {
         carro.setArtigo_ArtigoId(idA);
         carro.setUserInfo_UserId(idU);
         carro.setCarrinhoQuantidade(qtd);
         resultado = carro.refreshQuantity(carro);
      } else {
         resultado = 0;
      }

      

      response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));

   }
   
   
   
%>

