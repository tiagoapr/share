<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page isErrorPage="true" import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




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
      <link href="/eStore/Styles/main.css" rel="stylesheet" type="text/css" />
      <link href="/eStore/Styles/style.css" rel="stylesheet" type="text/css" />


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
      <!--
      <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
      -->
      <script type="text/javascript" src="/eStore/Scripts/jquery/arial.js"></script>
      
      
      <!--
      <script type="text/javascript">
         $(function(){     
            $('#slideshow').cycle({
               timeout: 9000,  // milliseconds between slide transitions (0 to disable auto advance)
               fx:      'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...            
               pager:   '#pager',  // selector for element to use as pager container
               pause:   0,	  // true to enable "pause on hover"
               pauseOnPagerHover: 0 // true to pause when hovering over pager link
            });
         });
      </script>
      -->
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
   </head>




   <body>
      <!-- BEGIN CONTAINER -->
      <div id="container">
         <!-- centercolumn -->
         <div id="centercolumn">
            <div id="top">
               <ul>
                  <li class="store">Online Store</li>                                   
                  <li>+351 123 456 789</li>             
                  <li>geral@eStore.com</li>			
               </ul>
            </div>
            <!-- end top-->


            <div id="box-cont-r">
               <div id="box-cont-t">
                  <div id="box-cont-b">
                     <div id="box-cont">

                        <!-- -------------------------------------------------------------- -->
                        <!-- BEGIN HEADER -->
                        <!-- -------------------------------------------------------------- -->
                        <div id="header" >
                           <!--### TOPO DA PAGINA ### -->
                           <div id="header-top">								
                              <div id="header-left">
                                 <!--### Logotipo ### -->
                                 <div id="logo">
                                    <a href="/eStore/index.jsp"><img src="/eStore/Images/imagesTemplate/logo.gif" alt="" /></a>									
                                 </div>
                              </div>								
                              <div id="header-right">
                                 <!--### Carrinho ### -->
                                 <div id="topsearch">
                                    <%if (Utils.userIsLogged(session)) {%>
                                       <a  href="/eStore/AccountManage/memberCart.jsp"><img src="/eStore/Images/imagesTemplate/cartFull.png" alt="Carrinho" style="width: 32px; height: 32px;"/></a>
                                    <%}else{%>
                                       <img src="/eStore/Images/imagesTemplate/cart.png" alt="Carrinho" style="width: 32px; height: 32px;"/>
                                    <%}%>
                                 </div>									
                                 <!--### Iniciar de sessão e Registar ### -->
                                 <div id="langandcurr">
                                    <%if (Utils.userIsLogged(session)) {%>
                                    <%= session.getAttribute("sessionUserEmail")%>
                                    &nbsp; | &nbsp;
                                    <a href="/eStore/AccountManage/logout.jsp"> Terminar Sessão </a>
                                    <%} else {%>
                                    <a  href="/eStore/Account/login.jsp">Iniciar Sessão</a> 
                                    &nbsp; | &nbsp; 
                                    <a  href="/eStore/Account/registo.jsp">Registar</a>
                                    <%}%>
                                    <!--
                                    <div id="lang" >											
                                       <a  href="#">Iniciar Sessão</a>
                                    </div>
                                    <div id="curr">
                                       <a href="#">Registar</a>
                                    </div>
                                    -->										
                                 </div>									
                              </div>
                           </div>

                           <!--### MENU HORIZONTAL ### -->
                           <div id="navigation">      
                              <ul id="nav">
                                 <li><a href="/eStore/index.jsp">Inicio</a></li>
                                 <li><a href="/eStore/about.jsp">Quem Somos</a></li>
                                 <li><a href="/eStore/contacts.jsp">Contactos</a></li>
                                 <li><a href="/eStore/productsList.jsp">Artigos</a></li>

                                 <%if (Utils.userIsLogged(session)) {%>
                                 <li><a href="#">Conta Membro</a>
                                    <ul>
                                       <li><a href="/eStore/AccountManage/memberEdit.jsp">Dados</a></li>                                                                       
                                       <li><a href="/eStore/AccountManage/memberOrders.jsp?a=1">Encomendas</a></li>
                                       <li><a href="/eStore/AccountManage/memberCart.jsp">Carrinho de Compras</a></li>
                                    </ul>
                                 </li>
                                 <%}%>

                                 <%if (Utils.userIsLoggedAsAdmin(session)) {%>
                                 <li> <a href="#">Administração</a>
                                    <ul>
                                       <li><a href="/eStore/Admin/users.jsp">Utilizadores</a></li>
                                       <li><a href="/eStore/Admin/orders.jsp">Encomendas</a></li>
                                       <li><a href="/eStore/Admin/products.jsp">Artigos</a></li>
                                       <li><a href="/eStore/Admin/newsletter.jsp">Newsletter</a></li>
                                    </ul>
                                 </li>
                                 <%}%>

                              </ul>
                           </div>

                        </div>
                        <!-- end header -->