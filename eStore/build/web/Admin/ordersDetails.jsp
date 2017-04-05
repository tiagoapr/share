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
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());
   int idEnc = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));

   Encomenda enc = new Encomenda();
   Encomenda encAux = new Encomenda();
   enc = encAux.getEncomenda(idEnc);
   
   UserInfo user = new UserInfo();
   UserInfo u = new UserInfo();  
   user = u.getUser(enc.getUserInfo_UserId());

   EncomendaLinha aux = new EncomendaLinha();
   List<EncomendaLinha> orderList = new ArrayList<EncomendaLinha>();
   orderList = aux.getOrdersList(idEnc);

   float promoPrice = 0;
   String subtitulo = "";
   if(enc.getEncPagamento() && enc.getEncDataEntrega() != null){
      subtitulo = "[Encomenda fechada - Histórico]";
   }
   else{
      subtitulo = "[Encomenda em aberto]";  
   }
   
   
%>


<script type="text/javascript">  
   function pathBackVoltar(){
      var url = document.getElementById("pathBackVoltar").value;      
      window.location.replace(url);      
   } 
</script>


<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >
   <input id="pathBackVoltar" type="hidden" name="pathBackVoltar" value="<%=session.getAttribute("sessionUrlPathBackVoltar")%>">

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content_full">
      
      
      <h1>Detalhes da encomenda &nbsp;&#35;<%=idEnc%></h1>
      
      <hr />
      <div style="text-align: right;"><h4><%=subtitulo%></h4></div>
     
      
      
         <a href="#"><img src='/eStore/Images/imagesTemplate/navigate2.png' height='32' width='32' class='imgcenter2' onclick="pathBackVoltar()"/></a>

         <div class="box_cart" style="width:100%;">
            <div class="headings">
                  <ul>
                     <li class="sc-product" style="text-align:right; font-weight: bold; border:0 solid gray;">  
                        <label>Nome</label>                        
                        <br class="clr" />
                        <label>NIF</label>
                        <br class="clr" />
                        <label>Morada</label>
                        <br class="clr" />
                        <label>Codigo Postal</label>
                        <br class="clr" />
                        <label>Observações</label>
                     </li>
                     <li class="sc-product" style="text-align:left; font-weight: normal; border:0 solid gray;">
                        <%=user.getUserNome()%>
                        <br class="clr" />
                        <%=user.getUserNif()%>
                        <br class="clr" />
                        <%=enc.getEncMorada()%>
                        <br class="clr" />
                        <%=enc.getEncCpa()%>-<%=enc.getEncCpb()%>
                        <br class="clr" />
                        <%=enc.getEncObservacoes()%>
                     </li>               
                  </ul>
                  <div class="clr">
                  </div>
               </div>


            <!-- CABECALHO -->
            <div class="headings">
               <ul>
                  <li class="sc-product">Artigo</li>
                  <li class="sc-qty">QTD</li>
                  <li class="sc-price">Preço</li>
                  <li class="sc-total">Total</li>
                  <li class="sc-product">Entregar Artigo</li>
               </ul>
               <div class="clr">
               </div>
            </div>
            <!-- FIM CABECALHO -->
            
            <%
            if (orderList != null) {
               for (EncomendaLinha encLinha : orderList) {
                  String rt = "";
                  Artigo a = new Artigo();
                  Artigo artigo = a.getArtigo(encLinha.getArtigo_ArtigoId(), true);
                  promoPrice = Utils.promotionalPriceB(encLinha.getEncLinhaPreco(), encLinha.getEncLinhaPromocao());
                  %>
                  <div class="proList">
                     <ul>
                        <!-- COLUNA 01 -->
                        <li class="sc-product">
                           <span class="myProductName"> <%=artigo.getArtigoNome()%> </span>
                           <br class="clr" />
                           <span >
                              Ref. Transportadora: &nbsp;
                              <%if(encLinha.getEncLinhaRefTransporte() != null){                                 
                                 rt = encLinha.getEncLinhaRefTransporte();%>
                                 <%=encLinha.getEncLinhaRefTransporte()%>                                 
                              <%} else {%>
                                 "Não disponível"
                              <%}%>                                 
                           </span>
                           <br class="clr" />
                           <!--
                           <img src='/eStore/Images/imagesTemplate/productImg.png' height='128' width='128' class='imgcenter' />
                           -->
                           <%= "<a href='/eStore/productsListDetail.jsp?a=" + artigo.getArtigoId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='/eStore/Images/imagesArtigos/"+ artigo.getArtigoFoto() +"' height='128' width='128' class='imgcenter' /> </a>" %>
                           <br class="clr" />
                        </li>
                        
                        <!-- COLUNA 02 -->
                        <li class="sc-qty">
                           <%=encLinha.getEncLinhaQuantidade()%>
                           <br class="clr" />
                           <br class="clr" />
                           <br class="clr" />
                           (<%=artigo.getArtigoUnidadeVenda()%>)
                           <br class="clr" />
                        </li>
                        
                        <!-- COLUNA 03 -->
                        <li class="sc-price">
                           <%=promoPrice%>
                           <br class="clr" />
                           <br class="clr" />
                           <br class="clr" />
                           <%=encLinha.getEncLinhaPreco()%>&#8364;
                           <br class="clr" />
                           <%=encLinha.getEncLinhaPromocao()%>&#37;
                        </li>
                        
                        <!-- COLUNA 04 -->
                        <li class="sc-total">
                           <%=encLinha.getEncLinhaTotalLinha()%>&#8364;
                        </li>   
                        <!-- COLUNA 05 -->
                        <li class="sc-product">
                           <%if(encLinha.getEncLinhaDataEntrega() != null){%>
                              <form id="formOrderDetailsH" action="/eStore/Admin/ordersRefTransp.jsp" method="post">
                                 <input id="idArtig" type="hidden" name="idArtig" value="<%=encLinha.getArtigo_ArtigoId()%>">
                                 <input id="idEncLinha" type="hidden" name="idEncLinha" value="<%=encLinha.getEncLinhaId()%>">
                                 <img src='/eStore/Images/imagesTemplate/Ok.png' height='32' width='32' class='imgcenter2'/>
                                 <br/>
                                 <label>Enviado a:</label>&nbsp;<%=encLinha.getEncLinhaDataEntrega()%>
                                 <br/><br/><br/>
                                 <span>
                                    Ref. Transportadora: 
                                    <br/>
                                    <%if(encLinha.getEncLinhaRefTransporte() != null){                                 
                                       rt = encLinha.getEncLinhaRefTransporte();%>
                                       <%=rt%>                                 
                                    <%} else {%>
                                       "Não disponível"
                                    <%}%>                                    
                                 </span>
                                 <br/>
                                 <input id="refTransporte" type="text" name="refTransporte" value="<%=rt%>" >
                                 <input type="submit" value=""  style="border: none; width: 32px; height: 32px; background: url('/eStore/Images/imagesTemplate/refresh71.png');" >
                              </form>
                           <%} else {%>
                              <form id="formOrderDetailsA" action="/eStore/Admin/ordersSendItem.jsp" method="post">
                                 <input id="idArtig" type="hidden" name="idArtig" value="<%=encLinha.getArtigo_ArtigoId()%>">
                                 <input id="idEncLinha" type="hidden" name="idEncLinha" value="<%=encLinha.getEncLinhaId()%>">
                                 <input type="submit" value=""  style="border: none; width: 32px; height: 32px; background: url('/eStore/Images/imagesTemplate/enviarX.png');" >
                                 <br/>
                                 <label>Entregar artigo</label>
                                 <br/><br/><br/>
                                 Ref. Transportadora: &nbsp;
                                 <input id="refTransporte" type="text" name="refTransporte" >
                              </form>
                           <%}%>
                        </li>
                     </ul>
                     <div class="clr"> </div>
                  </div>          
               <%}
            } else {%>
               <br/><br/><br/><br/>
               <h3> Conteúdo não disponível! </h3>
               <br/><br/><br/><br/>
            <%}%>                      
                              
                              
            <!-- RODAPE -->
            <div class="proList_total">
               <ul>
                  <li class="txt_total">Subtotal: </li>
                  <li class="total">
                     <%DecimalFormat formatter = new DecimalFormat("#.00");%>
                     <%=formatter.format(enc.getTotalAmount(idEnc))%>&#8364;
                  </li>
               </ul>
               <div class="clr"></div>
            </div>
            <!-- FIM RODAPE -->
                              
         </div>
   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formOrderDetails').validationEngine();
</script>