<%@page import="java.math.BigDecimal"%>
<%@page import="DatabaseClasses.Artigo"%>
<%@page import="DatabaseClasses.EncomendaLinha"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DatabaseClasses.Encomenda"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="org.apache.catalina.User"%>
<%@include file="../masterHeader.jsp"%>



<%

   String tituloPagina = "";
   String subtitulo = "";
   List<EncomendaLinha> openRequests = new ArrayList<EncomendaLinha>();
   EncomendaLinha encLinha = new EncomendaLinha();
   
   if (Utils.getUrlParameters(request.getQueryString()) == null) {
      
         
      openRequests = encLinha.getOpenRequestsLight();
      tituloPagina = "Artigos Encomendados";
   } else {
     
      
      openRequests = encLinha.getClosedRequestsLight();
      tituloPagina = "Histórico de Artigos Encomendados";
   }







   



%>


<script type="text/javascript">      
   function encomendasDoArtigo(){      
      //a = Tipo de visualização na pagina Orders
      var b = document.getElementById("idArtig").value;
      var url = "/eStore/Admin/orders.jsp";
          url = url + "?a=3";
          url = url + "&b=";
          url = url + b;     
      window.location.replace(url);       
   }
   
   function encomendasHistoricoDoArtigo(){
      //a = Tipo de visualização na pagina Orders
      var b = document.getElementById("idArtig").value;
      var url = "/eStore/Admin/orders.jsp";
          url = url + "?a=4";
          url = url + "&b=";
          url = url + b;     
      window.location.replace(url);  
   }
   
   
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
<div id="main_content">
   <div id="content_full">
      <h1><%=tituloPagina%></h1>
      <hr />
      <%@include file="ordersMenus.jsp"%>
      
      <br/>
     
      <%
      /*
         0 - Id do Artigo
         1 - Quantidade encomendada
         2 - Nome Artigo
         3 - Referencia do artigo
         4 - Unidade de Venda
         5 - Foto
      */
      
      if (openRequests != null) {
         Object[] objItem = null;
         List objOpenRequests = (ArrayList) openRequests;
         for (int i=0; i<openRequests.size(); i++) {
            objItem = (Object[])objOpenRequests.get(i);
                       
            %>
            <div class="proList">
               <ul>
                  <li class="sc-product">
                     <br class="clr" />
                     <%= "<a href='/eStore/productsListDetail.jsp?a=" + (Integer) objItem[0] +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='/eStore/Images/imagesTemplate/productImg.png' height='128' width='128' class='imgcenter2' /> </a>" %>
                     <br class="clr" />
                     <label>Referência: &nbsp;</label>
                     <label> <%=(String) objItem[3]%> </label>
                  </li>

                  <li class="sc-product">   
                     <br class="clr" />               
                     <span class="myProductName"> <label> <%=(String) objItem[2]%> </label> </span>
                     <br class="clr" />
                     <span style="font-size:medium;">
                        <label>Quantidade Encomendada: &nbsp;</label>
                        <label> <%=(BigDecimal) objItem[1]%> </label>
                     </span>
                     <br class="clr" />
                     <br class="clr" />
                     <label>Unidade Venda: &nbsp;</label>
                     <br class="clr" />
                     <label> <%=(String) objItem[4]%> </label>
                  </li>

                  <li class="sc-total">
                     <%if (Utils.getUrlParameters(request.getQueryString()) == null) {%>
                        <br class="clr" />
                        <input id="idArtig" type="hidden" name="idArtig" value="<%=(Integer) objItem[0]%>">
                        <a href="#"><img src='/eStore/Images/imagesTemplate/pagamento.png' height='32' width='32' class='imgcenter2' onclick="encomendasDoArtigo()" /></a>
                        <br class="clr" />
                        <label>Verificar encomendas em aberto para este artigo</label>
                        <br />
                        <br class="clr" />
                     <%} else{%>
                        <br class="clr" />
                        <input id="idArtig" type="hidden" name="idArtig" value="<%=(Integer) objItem[0]%>">
                        <a href="#"><img src='/eStore/Images/imagesTemplate/a.png' height='32' width='32' class='imgcenter2' onclick="encomendasHistoricoDoArtigo()" /></a>
                        <br class="clr" />
                        <label>Verificar histórico de encomendas para este artigo</label>
                        <br />
                        <br class="clr" />
                     <%}%>
                  </li>
               </ul>
               <div class="clr"> </div>
            </div>
         <%}
      }%>

   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>
