<%@page import="java.text.DecimalFormat"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="org.apache.catalina.User"%>
<%@include file="../masterHeader.jsp"%>



<%
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());
   
   Carrinho carro = new Carrinho();
   Artigo a = new Artigo();
   Artigo auxA = new Artigo();

   List<Carrinho> items = new ArrayList<Carrinho>();
   List<Artigo> artigosList = new ArrayList<Artigo>();

   int idUser = (Integer) session.getAttribute("sessionUserId");
   items = carro.getItemsOnCart(idUser);
   
   float promoPrice = 0;
   float totalCarrinho = 0;
   float totalParcela = 0;
%>

<script type="text/javascript">   
   function validaCarrinho(){
      window.location.replace("/eStore/AccountManage/memberCartEnd.jsp")
   }
</script>

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

   <%@include file="../masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">

      <h1>Carrinho de Compras</h1>
      <hr />
      
      
      
      <div class="box_cart">
         <!-- CABECALHO -->
         <div class="headings">
            <ul>
               <li class="sc-product">Artigo</li>
               <li class="sc-qty">QTD</li>
               <li class="sc-price">Preço</li>
               <li class="sc-total">Total</li>
               <li class="sc-remove">Remover</li>
            </ul>
            <div class="clr"> </div>
         </div>
         <!-- FIM CABECALHO -->

         <%
         if (artigosList != null && items != null) {
            for (Carrinho c : items) {
               a = auxA.getArtigo(c.getArtigo_ArtigoId(), true);
               promoPrice = Utils.promotionalPriceB(a.getArtigoPreco(), a.getArtigoPromocao());
               if(a.getArtigoPromocao() > 0){
                  totalCarrinho = totalCarrinho + (promoPrice * c.getCarrinhoQuantidade());
                  totalParcela = promoPrice * c.getCarrinhoQuantidade();
               }
               else{
                  totalCarrinho = totalCarrinho + (a.getArtigoPreco() * c.getCarrinhoQuantidade());
                  totalParcela = a.getArtigoPreco() * c.getCarrinhoQuantidade();
               }
               %>
               <form id="formMembCart" action="/eStore/AccountManage/memberCartRefresh.jsp" method="post">
               <div class="proList">
                  <ul>
                     <li class="sc-product">
                        <br class="clr" />
                        <span class="myProductName"> <%=a.getArtigoNome()%>  </span>
                        <br class="clr" />
                        
                        <%= "<a href='/eStore/productsListDetail.jsp?a=" + c.getArtigo_ArtigoId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='/eStore/Images/imagesArtigos/"+ a.getArtigoFoto() +"' height='128' width='128' class='imgcenter' /> </a>" %>
                     </li>
                     <li class="sc-qty">
                        <br class="clr" />
                        <%=c.getCarrinhoQuantidade()%>
                        <br class="clr" />
                        (<%=a.getArtigoUnidadeVenda()%>)
                        <br class="clr" />
                        <br class="clr" />
                        
                        <br/>
                        <input id="idArtig" type="hidden" name="idArtig" value="<%=c.getArtigo_ArtigoId()%>">
                        <input type="submit" value=""  style="border: none; width: 32px; height: 32px; background: url('/eStore/Images/imagesTemplate/refresh71.png');" >
                        <br class="clr" />
                        <input id="quantidadeZ" type="text" name="quantidadeZ" style="width: 24px;" maxlength="2" value="<%=c.getCarrinhoQuantidade()%>" class="validate[required,custom[integer]]">
                        
                        
                     </li>
                     <%if(a.getArtigoPromocao() > 0){%>
                        <li class="sc-price">
                           <br class="clr" />
                           <%=promoPrice%>&#8364;
                           <br class="clr" />
                           <br class="clr" />
                           <br class="clr" />
                           <%=a.getArtigoPreco()%>&#8364;
                           <br class="clr" />
                           -<%=a.getArtigoPromocao()%>&#37;
                        </li>
                     <%} else{%>
                        <li class="sc-price">
                           <br class="clr" />
                           <%=a.getArtigoPreco()%>&#8364;
                           <br class="clr" />
                           <br class="clr" />
                           <br class="clr" /> 
                           <br class="clr" />
                           <br class="clr" />
                           <br class="clr" />
                        </li>
                     <%}%>
                     <li class="sc-total">
                        <br class="clr" />
                        <%=totalParcela%>&#8364;
                     </li>
                     <li class="sc-remove">
                        <br class="clr" />
                        <!--
                        <a href="#"><img src='/eStore/Images/imagesTemplate/cartRemove.png' height='32' width='32' class='imgcenter' onclick="removeItem()"/></a>
                        -->
                        <%= "<a href='/eStore/AccountManage/productRemoveCart.jsp?a=" + c.getArtigo_ArtigoId() + "' > <img src='/eStore/Images/imagesTemplate/cartRemove.png' height='32' width='32' class='imgcenter'/> </a>"   %> 
                     </li>
                  </ul>
                  <div class="clr"> </div>
               </div>
               </form>
            <%}
         } else {%>
            <br/><br/><br/><br/>
            <h3> O carrinho de compras encontra-se vazio de momento!</h3>
            <br/><br/><br/><br/>
         <%}%>       

         <!-- RODAPE -->
         <div class="proList_total">
            <ul>
               <li class="txt_total">
                  Subtotal:
               </li>
               <li class="total">
                  <%DecimalFormat formatter = new DecimalFormat("#.00");%>
                  <%=formatter.format(totalCarrinho)%>&#8364;
               </li>
            </ul>
            <div class="clr"> </div>
         </div>
         <!-- FIM RODAPE -->


         <!-- RODAPE VALIDAR-->
         <div class="proList_total">
            <ul>
               <li class="txt_total" style=" border:none;">
                  <br class="clr" />
               </li>
               <li class="total" style="border:none; text-align:right;">
                  <%if(totalCarrinho > 0){%>
                  <input type="button" onclick="validaCarrinho();" value=" Validar encomenda "/>
                  <%}%>
               </li>
            </ul>
            <div class="clr"> </div>
         </div>
         <!-- FIM RODAPE VALIDAR-->

      </div>
      <!-- end box_cart -->


  
   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formMembCart').validationEngine();
</script>