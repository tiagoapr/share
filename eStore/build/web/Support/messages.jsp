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
            messageBody = "Utilizador inserido com sucesso! Acabou de ser enviado um email com a iformação de registo";
            break;
         case 3:
            messageTitle = "Registo";
            messageBody = "Não foi possivel efectuar o registo com o email indicado.";
            break;
         case 4:
            messageTitle = "Artigo";
            messageBody = "Artigo foi inserido com sucesso!";
            break;
         case 5:
            messageTitle = "Artigo";
            messageBody = "Não foi possivel inserir o artigo pretendido";
            break;
         case 6:
            messageTitle = "Actualizar Informação";
            messageBody = "Informação actualizada com sucesso!";
            break;
         case 7:
            messageTitle = "Actualizar Informação";
            messageBody = "Ocorreu uma situação inesperada ao tentar actualizar a informação pretendida.";
            break;
         case 8:
            messageTitle = "Encomenda validada!";
            messageBody = "Pode consultar o resumo da encomenda na sua Conta Membro";
            break;
         case 9:
            messageTitle = "Carrinho de Compras";
            messageBody = "Ocorreu um erro na validação da sua encomenda!";
            break;
         case 10:
            messageTitle = "Acesso bloqueado";
            messageBody = "A sua conta encontra-se bloqueada. <br/><br/> Para a reactivar, por favor contacte a administração através do email geral@estore.com";
            break;
         case 11:
            messageTitle = "Activação";
            messageBody = "A sua conta ainda nao foi activada pela administração";
            break;
         case 12:
            messageTitle = "Alteração de estado";
            messageBody = "Ocorreu um erro ao tentar alterar o estado do utilizador!";
            break;
         case 13:
            messageTitle = "Newsletter";
            messageBody = "Não foi possivel adicionar o endereço de email à Newsletter!";
            break;
         case 14:
            messageTitle = "Newsletter";
            messageBody = "Endereço de email adicionado com sucesso à Newsletter!";
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
            messageBody = "De momento não foi possivel enviar um email com a nova palavra-chave!";
            break;
         case 18:
            messageTitle = "Newsletter";
            messageBody = "Emails enviados com sucesso!";
            break;
         case 999:
            messageTitle = "Atenção";
            messageBody = "Ops, algo de errado aconteceu! <br/> A página pretendida não se encontra disponível.";
            break;
         case 998:
            messageTitle = "Atenção";
            messageBody = "Ops, algo de errado aconteceu! <br/> Erro interno do servidor.";
            break;
         case 997:
            messageTitle = "Atenção";
            messageBody = "Ops, algo de errado aconteceu! <br/> Proibido.";
            break;
         case 996:
            messageTitle = "Atenção";
            messageBody = "O nível de acesso não lhe permite aceder ao recurso pretendido.";
            break;
         default:
            messageTitle = "Atenção";
            messageBody = "Não foi possível realizar a operação pretendida!";
            break;
      }
   } else {
      messageTitle = "Atenção";
      messageBody = "Não foi possível realizar a operação pretendida!";
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