<%@include file="../masterHeader.jsp"%>

<%
   String messageBody = new String();
   String messageTitle = new String();

   if (Utils.getUrlParameters(request.getQueryString()).size() == 1) {
      switch (Integer.parseInt((String) request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)))) {
         case 1:
            messageTitle = "Registo";
            messageBody = "Erro ao tentar registar o utilizador!";
            break;
         case 2:
            messageTitle = "Registo";
            messageBody = "Utilizador inserido com sucesso! Acabou de ser enviado um email com a iforma��o de registo";
            break;
         case 3:
            messageTitle = "Registo";
            messageBody = "N�o foi possivel efectuar o registo com o email indicado.";
            break;
         case 4:
            messageTitle = "Artigo";
            messageBody = "Artigo foi inserido com sucesso!";
            break;
         case 5:
            messageTitle = "Artigo";
            messageBody = "N�o foi possivel inserir o artigo pretendido";
            break;
         case 6:
            messageTitle = "Actualizar Informa��o";
            messageBody = "Informa��o actualizada com sucesso!";
            break;
         case 7:
            messageTitle = "Actualizar Informa��o";
            messageBody = "Ocorreu uma situa��o inesperada ao tentar actualizar a informa��o pretendida.";
            break;
         case 8:
            messageTitle = "Encomenda validada!";
            messageBody = "Pode consultar o resumo da encomenda na sua Conta Membro";
            break;
         case 9:
            messageTitle = "Carrinho de Compras";
            messageBody = "Ocorreu um erro na valida��o da sua encomenda!";
            break;
         case 10:
            messageTitle = "Acesso bloqueado";
            messageBody = "A sua conta encontra-se bloqueada. <br/><br/> Para a reactivar, por favor contacte a administra��o atrav�s do email geral@estore.com";
            break;
         case 11:
            messageTitle = "Activa��o";
            messageBody = "A sua conta ainda nao foi activada pela administra��o";
            break;
         case 12:
            messageTitle = "Altera��o de estado";
            messageBody = "Ocorreu um erro ao tentar alterar o estado do utilizador!";
            break;
         case 13:
            messageTitle = "Newsletter";
            messageBody = "N�o foi possivel adicionar o endere�o de email � Newsletter!";
            break;
         case 14:
            messageTitle = "Newsletter";
            messageBody = "Endere�o de email adicionado com sucesso � Newsletter!";
            break;
         case 15:
            messageTitle = "Newsletter";
            messageBody = "Ocorreu um erro ao tentar alterar o estado do email da newsletter!";
            break;
         case 16:
            messageTitle = "Recuperar Palavra-Chave";
            messageBody = "Foi enviado com sucesso um email com a nova password!";
            break;
         case 17:
            messageTitle = "Recuperar Palavra-Chave";
            messageBody = "De momento n�o foi possivel enviar um email com a nova palavra-chave!";
            break;
         case 18:
            messageTitle = "Newsletter";
            messageBody = "Emails enviados com sucesso!";
            break;
         case 999:
            messageTitle = "Aten��o";
            messageBody = "Ops, algo de errado aconteceu! <br/> A p�gina pretendida n�o se encontra dispon�vel.";
            break;
         case 998:
            messageTitle = "Aten��o";
            messageBody = "Ops, algo de errado aconteceu! <br/> Erro interno do servidor.";
            break;
         case 997:
            messageTitle = "Aten��o";
            messageBody = "Ops, algo de errado aconteceu! <br/> Proibido.";
            break;
         case 996:
            messageTitle = "Aten��o";
            messageBody = "O n�vel de acesso n�o lhe permite aceder ao recurso pretendido.";
            break;
         default:
            messageTitle = "Aten��o";
            messageBody = "N�o foi poss�vel realizar a opera��o pretendida!";
            break;
      }
   } else {
      messageTitle = "Aten��o";
      messageBody = "N�o foi poss�vel realizar a opera��o pretendida!";
   }
%>

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

   <%@include file="../masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">
      <h1><%=messageTitle%></h1>

      <hr />

      <br /> <br /> <br />

      <h3><%=messageBody%></h3>

   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>