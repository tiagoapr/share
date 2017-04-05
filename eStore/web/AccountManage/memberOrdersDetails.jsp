<%@page import="java.text.DecimalFormat"%>
<%@page import="DatabaseClasses.Artigo"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="DatabaseClasses.EncomendaLinha"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Encomenda"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>



<%

   UserInfo user = new UserInfo();
   user = (UserInfo) session.getAttribute("sessionUserObject");

   int idUser = (Integer) session.getAttribute("sessionUserId");
   int idEnc = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));

   Encomenda enc = new Encomenda();
   Encomenda encAux = new Encomenda();
   enc = encAux.getEncomenda(idEnc);

   EncomendaLinha aux = new EncomendaLinha();
   List<EncomendaLinha> orderList = new ArrayList<EncomendaLinha>();
   orderList = aux.getOrdersList(idEnc);

   float promoPrice = 0;
   
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Script-Type" content="text/javascript" /> 
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="robots" content="index, follow" />
      <meta name="keywords" content="" />
      <meta name="title" content="" />
      <meta name="description" content="" />
      <title>eStore</title>
      <!-- ////////////////////////////////// -->
      <!-- //      Start Stylesheets       // -->
      <!-- ////////////////////////////////// -->
      <link href="/eStore/Styles/inner.css" rel="stylesheet" type="text/css" />
      <link href="/eStore/Styles/style.css" rel="stylesheet" type="text/css" />
      <link href="/eStore/Styles/main.css" rel="stylesheet" type="text/css" />
      <link href="/eStore/Styles/stylexxx.css" rel="stylesheet" type="text/css" />

      <!-- ////////////////////////////////// -->
      <!-- //      Javascript Files        // -->
      <!-- ////////////////////////////////// -->
      <script type="text/javascript" src="/eStore/Scripts/template/cufon-yui.js"></script>
      <script type="text/javascript" src="/eStore/Scripts/template/Tuffy_500-Tuffy_700-Tuffy_italic_500.font.js"></script>
      <script type="text/javascript">
         Cufon.replace('h1') ('h1 a') ('h2')  ('h3') ('h4') ('h5') ('h6') ('.desc')  ('.slide-text')
      </script>

      <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
      <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
      <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

      <script type="text/javascript" charset="utf-8" src="/eStore/Scripts/jquery/jquery.validationEngine.js"  ></script>
      <script type="text/javascript" charset="utf-8" src="/eStore/Scripts/jquery/jquery.ValidationEngine-pt.js"  ></script>
      <link rel="stylesheet" type="text/css" href="/eStore/Styles/jquery/validationEngine.jquery.css" />
      <script type="text/javascript" src="/eStore/Scripts/jquery/arial.js"></script>

      <script type="text/javascript">
         var $ = jQuery.noConflict();
         $(document).ready(function() {
            /* for top navigation */
            $(" #nav ul ").css({display: "none"}); // Opera Fix
            $(" #nav li").hover(function(){
               $(this).find('ul:first').css({visibility: "visible",display: "none"}).slideDown(400);
            },function(){
               $(this).find('ul:first').css({visibility: "hidden"});
            });				
         });	
      </script>
      <!--[if IE 6]>
      <script src="/eStore/Scripts/template/DD_belatedPNG.js"></script>
      <script>
        DD_belatedPNG.fix('img, #navigation ul li a:hover');
      </script>
      <![endif]--> 
      <script  type = "text/javascript">
         function fecharJanela(){
            window.close();
         }
      </script>
   </head>

   <body>
      <form id="form1" >
         <div id="content_full">
            <span class="myTitle">Detalhes da Encomenda</span>&nbsp;&nbsp; &#35;<%=enc.getEncId()%>
            <br class="clr" />
            <br class="clr" />
            <div class="box_cart">
               <div class="headings">
                  <ul>
                     <li class="sc-product" style="text-align:right; font-weight: bold; border:0 solid gray;">  
                        Nome
                        <br class="clr" />
                        NIF
                        <br class="clr" />
                        Morada
                        <br class="clr" />
                        Codigo Postal
                        <br class="clr" />
                        Observações
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
                     <li class="sc-remove">Enviado</li>
                  </ul>
                  <div class="clr">
                  </div>
               </div>
               <!-- FIM CABECALHO -->

               <%
               if (orderList != null && orderList != null) {
                  for (EncomendaLinha encLinha : orderList) {
                     Artigo a = new Artigo();
                     Artigo artigo = a.getArtigo(encLinha.getArtigo_ArtigoId(), true);
                     promoPrice = Utils.promotionalPriceB(encLinha.getEncLinhaPreco(), encLinha.getEncLinhaPromocao());
                     %>
                     <div class="proList">
                        <ul>
                           <!-- COLUNA 01 -->
                           <li class="sc-product">
                              <span class="myProductName">
                                 <%=artigo.getArtigoNome()%>
                              </span>
                              <br class="clr" />
                              <span >
                                 Ref. Transportadora: &nbsp;
                                 <%if(encLinha.getEncLinhaRefTransporte() != null){%>
                                    <%=encLinha.getEncLinhaRefTransporte()%>
                                 <%} else {%>
                                    "Não disponível"
                                 <%}%>                                 
                              </span>
                              <br class="clr" />
                              <!--
                              <img src='/eStore/Images/imagesTemplate/productImg.png' height='128' width='128' class='imgcenter' />
                              -->
                              <%= "<a href='/eStore/productsListDetail.jsp?a=" + artigo.getArtigoId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_self' > <img src='/eStore/Images/imagesArtigos/"+ artigo.getArtigoFoto() +"' height='128' width='128' class='imgcenter' /> </a>" %>
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
                           <li class="sc-remove">
                              <%if(encLinha.getEncLinhaDataEntrega() != null){%>
                                 <%=encLinha.getEncLinhaDataEntrega()%>
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
               <div style="text-align: right;">
                  <input type="button" title="" value=" Fechar / OK " onclick="fecharJanela();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </div>
               
            </div>
         </div>
      </form>
   </body>

</html>