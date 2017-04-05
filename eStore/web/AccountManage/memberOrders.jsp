<%@page import="java.text.DecimalFormat"%>
<%@page import="DatabaseClasses.Encomenda"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="org.apache.catalina.User"%>
<%@include file="../masterHeader.jsp"%>



<%
   List<Encomenda> ordersList = new ArrayList<Encomenda>(); 
   Encomenda enc = new Encomenda();

   int idUser = (Integer) session.getAttribute("sessionUserId");
   ordersList = enc.getOrdersList(idUser);

%>



<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

   <%@include file="../masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">

      <h1>Encomendas</h1>
      <hr />
      
      <form id="formCart" action="/eStore/AccountManage/memberCartEnd.jsp" method="post">
      
      <div class="box_cart">
         <!-- CABECALHO -->
         <div class="headings">
            <ul>
               <li class="sc-custom">Nº Encomenda</li>
               <li class="sc-custom">Data Pedido</li>
               <li class="sc-custom">Valor Total</li>
               <li class="sc-custom">Estado</li>
            </ul>
            <div class="clr"> </div>
         </div>
         <!-- FIM CABECALHO -->
         
         <br/>         

         <%
         if (ordersList != null ) {
            for (Encomenda encomenda : ordersList) {
               %>
               <div class="headings">
                  <ul>
                     <li class="sc-custom2">
                        &#35;<%=encomenda.getEncId()%>
                     </li>
                     <li class="sc-custom2">
                        <%=encomenda.getEncDataPedido()%>
                     </li>
                     <li class="sc-custom2">
                        <%DecimalFormat formatter = new DecimalFormat("#.00");%>
                        <%=formatter.format(encomenda.getTotalAmount(encomenda.getEncId()))%>&#8364;
                     </li>
                     <li class="sc-custom2">
                        <%=encomenda.qualEstadoDaEncomenda(encomenda.getEncPagamento(), encomenda.getEncDataEntrega())%>
                     </li>
                     <li class="sc-customSearch">
                        <%= "<a href='/eStore/AccountManage/memberOrdersDetails.jsp?a=" + encomenda.getEncId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='/eStore/Images/imagesTemplate/Details1.png' height='32' width='32' /> </a>" %>
                     </li>                     
                  </ul>
                  <div class="clr"> </div>
               </div>
               <br/>            
               
            <%}
         } else {%>
            <br/><br/><br/><br/>
            <h3> Ainda não efectuou nenhuma encomenda até ao momento! </h3>
            <br/><br/><br/><br/>
         <%}%>       

        
        

      </div>
      <!-- end box_cart -->


   </form>
   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formCart').validationEngine();
</script>