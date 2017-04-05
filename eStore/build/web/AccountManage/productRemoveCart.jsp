<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="SupportClasses.Utils"%>


<%
   int idA = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
   int idU = (Integer) session.getAttribute("sessionUserId");

   int resultado = -2;

   Carrinho carro = new Carrinho();

   if (carro.isProductOnCart(idA, idU)) {
      carro.setArtigo_ArtigoId(idA);
      carro.setUserInfo_UserId(idU);
      carro.setCarrinhoQuantidade(1);

      resultado = carro.removeEntity(carro);
   } else {
      resultado = 0;
   }
%>


<script  type = "text/javascript">
   switch(<%=resultado%>){
      case -1 :
         alert("Ocorreu um erro ao tentar remover o produto do carrinho!");
         break;
      case 0 :
         alert("O produto em questão não se encontra no carrinho!\n\nObrigado!");
         break;
   /*      
      case 1 :
         alert("Produto removido do carrinho!\n\n\nObrigado!");
         break;
   */   
   }
   window.location="<%=session.getAttribute("sessionUrlPathBack")%>";
</script>