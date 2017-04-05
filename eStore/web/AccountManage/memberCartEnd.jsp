<%@page import="java.text.DecimalFormat"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="org.apache.catalina.User"%>
<%@include file="../masterHeader.jsp"%>



<%
   UserInfo user = (UserInfo)session.getAttribute("sessionUserObject");
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
      
      <form id="formCartEnd" action="/eStore/AccountManage/memberCartEndOk.jsp" method="post">
      
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
               <div class="proList">
                  <ul>
                     <li class="sc-product">
                        <br class="clr" />
                        <span class="myProductName"> <%=a.getArtigoNome()%>  </span>
                        <br class="clr" />
                        <!--
                        <img src='/eStore/Images/imagesTemplate/productImg.png' height='128' width='128' class='imgcenter' />
                        -->
                        <%= "<a href='/eStore/productsListDetail.jsp?a=" + c.getArtigo_ArtigoId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='/eStore/Images/imagesArtigos/"+ a.getArtigoFoto() +"' height='128' width='128' class='imgcenter' /> </a>" %>
                     </li>
                     <li class="sc-qty">
                        <br class="clr" />
                        <%=c.getCarrinhoQuantidade()%>
                        <br class="clr" />
                        (<%=a.getArtigoUnidadeVenda()%>)
                        <br class="clr" />
                        <br class="clr" /> 
                        <br class="clr" />
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
                        <br class="clr" />
                     </li>
                  </ul>
                  <div class="clr"> </div>
               </div>
            <%}
         } else {%>
            <br/><br/><br/>
            <h3> O carrinho de compras encontra-se vazio de momento!</h3>
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
         
         
         <br class="clr" />
         <br class="clr" />

      
         <span class="myTitle">Dados Pessoais</span> &nbsp;&nbsp;&nbsp;&nbsp; (Para entrega da encomenda)
         <hr />   
         <table cellpadding="4" cellspacing="4">
            <tr>
               <td align="right" class="myCol">
                  <label for="nome">Nome:</label>
               </td>
               <td align="left">
                  <%=user.getUserNome()%>
               </td>
            </tr>
            <tr>
               <td align="right" class="myCol">
                  <label for="nif">NIF:</label>
               </td>
               <td align="left">
                  <%=user.getUserNif()%>
               </td>
            </tr>    
            <tr>
               <td align="right" class="myCol">
                  <label for="morada">Morada:</label>
               </td>
               <td align="left">
                  <input id="morada" type="text" name="morada" value="<%=user.getUserMorada()%>" style="width: 350px;" class="validate[required]">
               </td>
            </tr>
            <tr>
               <td align="right" class="myCol">
                  <label for="codPostal">Código Postal:</label>
               </td>
               <td align="left">
                  <input id="cpa" type="text" maxlength="4" value="<%=user.getUserCpa()%>" name="cpa" style="width: 35px;" class="validate[required,custom[integer]]">
                  &nbsp;-&nbsp;
                  <input id="cpb" type="text" maxlength="3" value="<%=user.getUserCpb()%>" name="cpb" style="width: 25px;" class="validate[required,custom[integer]]">
               </td>
            </tr>
            <tr>
               <td align="right" class="myCol">
                  <label for="freguesia">Freguesia:</label>
               </td>
               <td align="left">
                  <input id="freguesia" type="text" value="<%=user.getUserFreguesia()%>" name="freguesia" style="width: 200px;" class="validate[required]">
               </td>
            </tr>
            <tr>
               <td align="right" class="myCol">
                  <label for="concelho">Concelho:</label>  
               </td>
               <td align="left">
                  <input id="concelho" type="text" value="<%=user.getUserConcelho()%>" name="concelho" style="width: 200px;" class="validate[required]">
               </td>
            </tr>
            <tr>
               <td align="right" class="myCol">
                  <label for="distrito">Distrito:</label>
               </td>
               <td align="left">
                  <input id="distrito" type="text" value="<%=user.getUserDistrito()%>" name="distrito" style="width: 200px;" class="validate[required]">
               </td>
            </tr>            
            <tr>
               <td align="right" class="myCol" valign="top">
                  <label for="observacoes">Observações:</label>
               </td>
               <td align="left">
                  <textarea id="observacoes" name="observacoes" rows="6" cols="60" maxlength="250"></textarea>
               </td>
            </tr>         
         </table>


         <br class="clr" />
         
         
         <!-- RODAPE VALIDAR-->
         <div class="proList_total">
            <ul>
               <li class="txt_total" style=" border:none; text-align: left">
                  <input type="button" title="" value=" Voltar " onclick="window.location.href='/eStore/AccountManage/memberCart.jsp'"/>
               </li>
               <li class="total" style="border:none; text-align:right;">
                  <input type="submit" title="" value=" Finalizar compra "/>
               </li>
            </ul>
            <div class="clr"> </div>
         </div>
         <!-- FIM RODAPE VALIDAR-->

      </div>
      <!-- end box_cart -->


   </form>
   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formCartEnd').validationEngine();
</script>