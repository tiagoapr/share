<%@page import="DatabaseClasses.Artigo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DatabaseClasses.Encomenda"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="org.apache.catalina.User"%>
<%@include file="../masterHeader.jsp"%>



<%
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());
   Utils.setPathBackVoltar(session, request.getRequestURI(), request.getQueryString());

   List<Encomenda> ordersList = new ArrayList<Encomenda>();
   Encomenda enc = new Encomenda();
   int idArtigo;
   Artigo a = new Artigo();
   Artigo aux = new Artigo();
   
   String tituloPagina = "";
   String subtitulo = "";

   if (Utils.getUrlParameters(request.getQueryString()) == null) {
      ordersList = enc.getOrdersList();
      tituloPagina = "Encomendas em aberto";
   } else {
      int opcao = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
      switch (opcao) {
         case 1: //Encomendas em Aberto
            ordersList = enc.getOrdersList();
            tituloPagina = "Encomendas em aberto";
            break;
         case 2: //Historico Encomendas
            ordersList = enc.getClosedOrdersList();
            tituloPagina = "Histórico de Encomendas";
            break;
         case 3: //Encomendas em Aberto para o artigo X
            idArtigo = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(1)));
            ordersList = enc.getOrdersListItem(idArtigo);
            a = aux.getArtigo(idArtigo, true);
            tituloPagina = "Encomendas em aberto";
            subtitulo = "<b>Artigo</b>&#58;&nbsp;"+a.getArtigoNome()+"&nbsp;&nbsp;<b>Referencia</b>&#58;&nbsp;"+a.getArtigoReferencia();
            break;
         case 4: //Encomendas Historico para o artigo X
            idArtigo = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(1)));
            ordersList = enc.getClosedOrdersListItem(idArtigo);
            a = aux.getArtigo(idArtigo, true);
            tituloPagina = "Historico de Encomendas";
            subtitulo = "<b>Artigo</b>&#58;&nbsp;"+a.getArtigoNome()+"&nbsp;&nbsp;<b>Referencia</b>&#58;&nbsp;"+a.getArtigoReferencia();
            break;
      }
   }
%>


<script type="text/javascript">
      
   function historicoArtigos(){
      var url = "/eStore/Admin/ordersArtigos.jsp";
      url = url + "?a=1";
      window.location.replace(url);
   } 
     
   function historicoEncomendas(){
      var url = "/eStore/Admin/orders.jsp";
      url = url + "?a=2";
      window.location.replace(url);
   }
   
   function encomendasAberto(){
      var url = "/eStore/Admin/orders.jsp";
      url = url + "?a=1";
      window.location.replace(url);
   }
   
   function artigosEncomendados(){
      var url = "/eStore/Admin/ordersArtigos.jsp";
      window.location.replace(url);
   }
</script>


<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >


   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content_full">

      <h1><%=tituloPagina%></h1>
      <hr />
      <div style="text-align: center;"><h2><%=subtitulo%></h2></div>
      

         <%@include file="ordersMenus.jsp"%>


         <br/>

         <div class="box_cart2">
            <!-- CABECALHO -->
            <div class="headings">
               <ul>
                  <li class="sc-customT">Nº Encomenda</li>
                  <li class="sc-customT">Data Pedido</li>
                  <li class="sc-customT">Valor Total</li>
                  <li class="sc-customT">Estado</li>
               </ul>
               <div class="clr"> </div>
            </div>
            <!-- FIM CABECALHO -->

            <br/>         

            <%
            if (ordersList != null) {
               for (Encomenda encomenda : ordersList) {
            %>
            <div class="headings">
               <ul>
                  <li class="sc-custom2x">
                     &#35;<%=encomenda.getEncId()%>
                  </li>
                  <li class="sc-custom2x">
                     <%=encomenda.getEncDataPedido()%>
                  </li>
                  <li class="sc-custom2x">
                     <%DecimalFormat formatter = new DecimalFormat("#.00");%>
                     <%=formatter.format(encomenda.getTotalAmount(encomenda.getEncId()))%>&#8364;
                     <br/>
                     <br/>
                     <%=encomenda.qualEstadoDaEncomenda(encomenda.getEncPagamento(), encomenda.getEncDataEntrega())%>
                  </li>
                  <li class="sc-custom2x">                        
                     <%if (!encomenda.getEncPagamento()) {%>
                        <form id="formOrdersVP" action="/eStore/Admin/ordersPayment.jsp" method="post">
                           <input id="idEncomenda" type="hidden" name="idEncomenda" value="<%=encomenda.getEncId()%>">
                           <input type="submit" value=""  style="border: none; width: 32px; height: 32px; background: url('/eStore/Images/imagesTemplate/notification1.png');" >
                           <br/>
                           <label style=" color: darkorange" >Validar Pagamento</label>
                        </form>
                     <%} else if (encomenda.getEncDataEntrega() == null || encomenda.getEncDataEntrega().isEmpty()) {%>
                        <form id="formOrdersFE" action="/eStore/Admin/ordersClose.jsp" method="post">
                           <input id="idEncomenda" type="hidden" name="idEncomenda" value="<%=encomenda.getEncId()%>">
                           <input type="submit" value=""  style="border: none; width: 32px; height: 32px; background: url('/eStore/Images/imagesTemplate/finish1.png');" >
                           <br/>
                           <label style=" color: darkgreen" >Fechar Encomenda</label>                           
                        </form>
                     <%} else {%>  
                        <img src='/eStore/Images/imagesTemplate/Ok.png' height='32' width='32' class='imgcenter2'/>
                        <br/><label style=" color: darkgreen" >Enviada</label>
                     <%}%>
                  </li>
                  <li class="sc-customSearch2">
                  <center>
                     <%= "<a href='/eStore/Admin/ordersDetails.jsp?a=" + encomenda.getEncId() + "' > <img src='/eStore/Images/imagesTemplate/navigate.png' height='32' width='32' class='imgcenter2'/> </a>"%> 
                     <br/>
                     <label style=" color: darkblue" >Artigos</label>                     
                  </center>
                  </li>
                  <!--
                  <li class="sc-customSearch2">
                  <center>
                     <%= "<a href='/eStore/AccountManage/productRemoveCart.jsp?a=" + encomenda.getEncId() + "' > <img src='/eStore/Images/imagesTemplate/Details1.png' height='32' width='32' class='imgcenter2'/> </a>"%> 
                     <br/>
                     Detalhes
                  </center>
                  </li>
                  -->
               </ul>
               <div class="clr"> </div>
            </div>
            <hr/>            

            <%}
            } else {%>
               <br/><br/><br/><br/>
               <h3> Sem encomendas de momento! </h3>
               <br/><br/><br/><br/>
            <%}%>       

         </div>
         <!-- end box_cart -->

   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formCart').validationEngine();
</script>