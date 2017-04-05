<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="DatabaseClasses.Artigo"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%  
   //String pathBack = Utils.getPathBack(request.getRequestURI(), request.getQueryString());
   //session.setAttribute("sessionUrlPathBack", pathBack);
   
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());
  
   Carrinho carro = new Carrinho();
   
   String tituloPagina = "";
   Artigo artigo = new Artigo();
   List artigoList = new ArrayList();

   ClassFamilia auxF = new ClassFamilia();
   ClassFamilia classF = new ClassFamilia();
   String nomeFamilia = "";

   ClassSubFamilia auxSF = new ClassSubFamilia();
   ClassSubFamilia classSF = new ClassSubFamilia();
   String nomeSubFamilia = "";
   
   if (Utils.getUrlParameters(request.getQueryString()) == null) {
      artigoList = artigo.getArtigosListDestaque(Utils.userIsLoggedAsAdmin(session));
      tituloPagina = "Produtos em Destaque";
   } else {
      switch (Utils.getUrlParameters(request.getQueryString()).size()) {
         case 1:
            artigoList = artigo.getArtigosListDestaque(Utils.userIsLoggedAsAdmin(session));
            break;
         case 2:
            int idF = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
            int idSF = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(1)));
            classF = auxF.getClassFamilia(idF);
            classSF = auxSF.getClassSubFamilia(idSF);
            artigoList = artigo.getArtigosList(idSF, idF, Utils.userIsLoggedAsAdmin(session));
            break;
         default:
            artigoList = null;
            break;
      }
      tituloPagina = "Produtos";
      nomeFamilia = classF.getClassFamiliaNome();
      nomeSubFamilia = " : " + classSF.getClassSubFamiliaNome();
   }
%>
 
<script  type = "text/javascript">
   function alertaLogin(){
      alert("\n\n… necessario efectuar login para adicionar produtos ao carrinho!\n\nObrigado.");
   }
</script>

<%@include file="masterHeader.jsp"%>
<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >
   <%@include file="masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">

      <h1> <%=tituloPagina%>    <span class="myTitle" style="font-size: small"> <%=nomeFamilia%> <%=nomeSubFamilia%> </span>  </h1> 
      <hr />

      <%
      if (artigoList != null) {
         Object[] objArtigo = null;
         List objsArtigoList = (ArrayList) artigoList;
         for (int i = 0; i < artigoList.size(); i++) {
            objArtigo = (Object[]) objsArtigoList.get(i);
            int promo = (Integer)objArtigo[11];
            boolean activo = (Boolean)objArtigo[8];
            String destaque = "";
            if((Boolean) objArtigo[9]){
               destaque = "<b>(*)&nbsp;</b>";
            }            
            %>
            <div class="prodbox">
               <div class="prodbox_c">
                  <div class="prodbox_b">
                     <div class="pad_box">
                        <%
                        String nomeArtigo = (String) objArtigo[5];
                        String nomeCurto = nomeArtigo;
                        if(nomeArtigo.length() > 20){
                           nomeCurto = nomeArtigo.substring(0, 20);
                           nomeCurto += "...";
                        }
                        
                        %>
                        <span class="myProductName"><%=nomeCurto%></span>                     
                        <br />
                        <div class="p_img">  
                           
                           <!--
                           <a href="/eStore/productsListDetail.jsp?a=5" onclick="return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')" target="_blank" >
                           <img src="Images/imagesTemplate/productImg.png" height="128" width="128" alt="" class="imgcenter" />
                           </a>
                           -->
                           <%
                           if(activo){%>
                              <%= "<a href='/eStore/productsListDetail.jsp?a=" + (Integer) objArtigo[0] +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='Images/imagesArtigos/"+ objArtigo[4] +"' height='128' width='128' class='imgcenter' /> </a>" %>
                           <%}
                           else{%>
                              <%= "<a href='/eStore/productsListDetail.jsp?a=" + (Integer) objArtigo[0] +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='Images/imagesTemplate/productImgOFF.png' height='128' width='128' class='imgcenter' /> </a>" %>
                           <%}
                           %>
                           
                        </div>
                        <p class="p-text"><%=destaque%><%=(String) objArtigo[6]%> </p>
                        <center>
                        <table border="0" width="100%">
                           <tr>
                              <td>
                                 <%
                                 if( promo == 0){
                                    %>
                                    <center>
                                    <span class="p-price"> <%=(BigDecimal) objArtigo[10]%>&#8364; </span>
                                    </center>
                                    <%
                                 }
                                 else{
                                    %> 
                                    <center>
                                       <span class="s" style="font-size: small"> <%=(BigDecimal) objArtigo[10]%>&#8364; </span>                                    
                                    &nbsp;&nbsp;&nbsp;
                                    <label style=" color: red; font-size: small"> -<%=(Integer) objArtigo[11]%>&#37; </label>       
                                    <br/>
                                    <span class="p-price"> <label style="color: green;"> <%=Utils.promotionalPrice((Object)objArtigo[10], (Object)objArtigo[11])%>&#8364; </label> </span>
                                    </center>
                                    <%
                                 }
                                 %>
                              </td>
                              <td>                                 
                                 <%if (Utils.userIsLogged(session)) {
                                    if(carro.isProductOnCart((Integer) objArtigo[0], (Integer) session.getAttribute("sessionUserId"))){%>                                    
                                       <center>
                                       <%= "<a href='/eStore/AccountManage/productRemoveCart.jsp?a=" + (Integer) objArtigo[0] + "' > <img src='Images/imagesTemplate/cartRemove.png' height='32' width='32' class='imgcenter'/> </a>"   %> 
                                       </center>
                                    <%}else{%>
                                       <center>
                                          <%= "<a href='/eStore/AccountManage/productAddCart.jsp?a=" + (Integer) objArtigo[0] + "' > <img src='Images/imagesTemplate/cartAdd.png' height='32' width='32' class='imgcenter'/> </a>"   %> 
                                       </center>                                 
                                    <%}
                                 }else{%>
                                    <img src="Images/imagesTemplate/cartAdd.png" height="32" width="32" onclick="alertaLogin();" class="imgcenter" />
                                 <%}%>
                              </td>
                           </tr>
                           <%if (Utils.userIsLoggedAsAdmin(session)) {%>
                           <tr>
                              <td colspan="2">
                                 <center>
                                    <%= "<a href='/eStore/Admin/productsEdit.jsp?a=" + (Integer) objArtigo[0] +" 'onclick='return !window.open(this.href, 'Edit Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > <img src='Images/imagesTemplate/buttonEdit.png' class='imgcenter'/> </a>" %>
                                 </center>
                              </td>
                           </tr>
                           <%}%>
                        </table>
                        </center>
                     </div>
                  </div>
               </div>
            </div><!-- end prodbox -->
            <%
         }
      } 
      else {
         %>
         <br/><br/><br/>
         <h3> Produtos n„o disponiveis de momento!</h3>
         <%            
      }
      %>




   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="masterFooter.jsp"%>


