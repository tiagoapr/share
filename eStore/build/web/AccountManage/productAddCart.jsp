<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="SupportClasses.Utils"%>



<%
   int idA = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
   int idU = (Integer) session.getAttribute("sessionUserId");
   int qtd = 1;
   int resultado = -2;

   Carrinho carro = new Carrinho();

   if (carro.isProductOnCart(idA, idU)) {
      resultado = 0;
   } else {
      carro.setArtigo_ArtigoId(idA);
      carro.setUserInfo_UserId(idU);
      carro.setCarrinhoQuantidade(qtd);

      resultado = carro.insertEntity(carro);
   }

%>


<script  type = "text/javascript">
   switch(<%=resultado%>){
      case -1 :
         alert("Ocorreu um erro ao tentar adicionar o produto ao carrinho!");
         break;
      case 0 :
         alert("O produto em questão já se encontra no carrinho!\n\nObrigado!");
         break;
      case 1 :
         alert("Produto adicionado ao carrinho!\n\n\nObrigado!");
         break;
      }
      window.location="<%=session.getAttribute("sessionUrlPathBack")%>";
</script>