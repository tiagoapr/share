<%@page import="DatabaseClasses.ClassSubFamilia"%>
<%@page import="DatabaseClasses.ClassFamilia"%>
<%@page isErrorPage="true" import="SupportClasses.Utils"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="DatabaseClasses.Artigo"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%
   Artigo auxA = new Artigo();
   Artigo artigo = new Artigo();

   ClassFamilia auxF = new ClassFamilia();
   ClassFamilia classF = new ClassFamilia();
   String nomeFamilia = "";

   ClassSubFamilia auxSF = new ClassSubFamilia();
   ClassSubFamilia classSF = new ClassSubFamilia();
   String nomeSubFamilia = "";

   int idA = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
   artigo = auxA.getArtigo(idA, Utils.userIsLoggedAsAdmin(session));
   int promo = artigo.getArtigoPromocao();

   classSF = auxSF.getClassSubFamilia(artigo.getClassSubFamilia_ClassSubFamiliaId());
   nomeSubFamilia = classSF.getClassSubFamiliaNome();

   classF = auxF.getClassFamilia(classSF.getClassFamilia_FamiliaId());
   nomeFamilia = classF.getClassFamiliaNome();
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
      <div id="content_full">
         <div id="description">
            <div id="product_image">
               <br class="clr" />
               <br class="clr" />
               <br class="clr" />
               <br class="clr" />
               <img src='/eStore/Images/imagesArtigos/<%=artigo.getArtigoFoto()%>' height='128' width='128' class='imgcenter'/>
               <div class="thumb">
                  <br class="clr" />
                  <br class="clr" />
                  <br class="clr" />
                  <br class="clr" />
               </div>
               <div class="padbox_small">
                  <br class="clr" />                 
                  <%
                     if (promo == 0) {
                  %>
                  <center>
                     <span class="p-price"> <%= artigo.getArtigoPreco()%>&#8364; </span>
                  </center>
                  <%
                  } else {
                  %> 
                  <center>
                     <span class="s"> <%= artigo.getArtigoPreco()%>&#8364; </span>                                    
                     &nbsp;&nbsp;&nbsp;
                     <label style=" color: red;"> -<%=artigo.getArtigoPromocao()%>&#37; </label>
                     <br/>
                     <span class="p-price"> <label style="color: green;"> 
                           <%=Utils.promotionalPriceB(artigo.getArtigoPreco(), artigo.getArtigoPromocao())%>&#8364; </label> 
                     </span>
                  </center>
                  <%
                     }
                  %>
                  <br />
                  <strong>
                     (<%=artigo.getArtigoUnidadeVenda()%>)
                  </strong>
                  <br class="clr" />
                  <br class="clr" />
                  <br class="clr" />
                  <br class="clr" />
                  <input type="button" title="" value=" Fechar / OK " onclick="fecharJanela();" />
               </div>
            </div>
            <!-- end product_image -->
            <div id="product_description">
               <div class="title_description">
                  <span class="myTitle">
                     <%=artigo.getArtigoNome()%>
                  </span>
               </div>
               <br class="clr" />
               <br class="clr" />
               <%=artigo.getArtigoDescricaoSmall()%>
               <br class="clr" />
               <br class="clr" />
               <%=artigo.getArtigoDescricaoLong()%>
               <br class="clr" />
               <br class="clr" />            

               <hr />

               <div class="row">
                  <ul>
                     <li class="col1"></li>
                     <li class="col2"><%=nomeFamilia%></li>
                  </ul>
               </div>
               <br class="clr" />
               <div class="row">
                  <ul>
                     <li class="col1"></li>
                     <li class="col2"><%=nomeSubFamilia%></li>
                  </ul>
               </div>
               <br class="clr" />
               <div class="row">
                  <ul>
                     <li class="col1">Nome</li>
                     <li class="col2"><%=artigo.getArtigoNome()%></li>
                  </ul>
               </div>
               <br class="clr" />
               <div class="row">
                  <ul>
                     <li class="col1">Referência</li>
                     <li class="col2"><%=artigo.getArtigoReferencia()%></li>
                  </ul>
               </div>
               <br class="clr" />
               <div class="row">
                  <ul>
                     <li class="col1">Unidade Venda</li>
                     <li class="col2"><%=artigo.getArtigoUnidadeVenda()%></li>
                  </ul>
               </div>
               <br class="clr" />
               <div class="row">
                  <ul>
                     <li class="col1">Preço</li>
                     <li class="col2"><%=artigo.getArtigoPreco()%>&#8364;</li>
                  </ul>
               </div>        
               <br class="clr" />
               <div class="row">
                  <ul>
                     <li class="col1">Promoção</li>
                     <li class="col2"><%=artigo.getArtigoPromocao()%>&#37;</li>
                  </ul>
               </div>
            </div>
            <!-- end product_description -->
         </div>

         <!-- end description -->
      </div>

      <!-- end content -->




   </body>
</html>

