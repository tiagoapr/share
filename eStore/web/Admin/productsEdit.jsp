<%@page import="com.sun.corba.se.impl.logging.UtilSystemException"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.ClassSubFamilia"%>
<%@page import="DatabaseClasses.ClassFamilia"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="DatabaseClasses.Artigo"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());
   
   Artigo auxA = new Artigo();
   Artigo artigo = new Artigo();

   ClassFamilia auxF = new ClassFamilia();
   ClassFamilia classF = new ClassFamilia();
   String nomeFamilia = "";

   ClassSubFamilia auxSF = new ClassSubFamilia();
   ClassSubFamilia classSF = new ClassSubFamilia();
   String nomeSubFamilia = "";

   int idA = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
   session.setAttribute("sessionArtigoId", idA);
   artigo = auxA.getArtigo(idA, Utils.userIsLoggedAsAdmin(session));
   int promo = artigo.getArtigoPromocao();
   
   String destaqueOK = "";
   if(artigo.getArtigoDestaque()){
      destaqueOK = "checked";
   }
   String activoOK = "";
   if(artigo.getArtigoActivo() == true){
      activoOK = "checked";
   }

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

      <script type="text/javascript">
         function showData(value){ 

            xmlHttp=GetXmlHttpObject()
            var url="/eStore/Admin/productsAJAX.jsp";
            url=url+"?id="+value;
            xmlHttp.onreadystatechange=stateChanged 
            xmlHttp.open("GET",url,true)
            xmlHttp.send(null)
         }
         function stateChanged() { 
            if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
               var showdata = xmlHttp.responseText; 
               document.getElementById("ddlClassSubFamilia").innerHTML= showdata;
            } 
         }
         function GetXmlHttpObject(){
            var xmlHttp=null;
            try {
               xmlHttp=new XMLHttpRequest();
            }
            catch (e) {
               try  {
                  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
               }
               catch (e)  {
                  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
               }
            }
            return xmlHttp;
         }
      </script>
      
      
      
<script type="text/javascript">
   var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];

   function Validate(oForm) {
       var arrInputs = oForm.getElementsByTagName("input");
       for (var i = 0; i < arrInputs.length; i++) {
           var oInput = arrInputs[i];
           if (oInput.type == "file") {
               var sFileName = oInput.value;
               //if (sFileName.length > 0) {
                   var blnValid = false;
                   for (var j = 0; j < _validFileExtensions.length; j++) {
                       var sCurExtension = _validFileExtensions[j];
                       if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                           blnValid = true;
                           break;
                       }
                   }

                   if (!blnValid) {
                       alert("\n\nAtenção!\n\n\nO ficheiro é invalido!\n" + sFileName + " \n\nAs extensões permitidas são: " + _validFileExtensions.join(", "));
                       return false;
                   }
               //}
           }
       }

       return true;
   }

</script>
      
      
      

   </head>

   <body>
      <div id="content_full">

         
         <br/><br/><br/>
         
         


         <form id="form69" name="formFoto" class="foto" action="/eStore/Admin/productsFotoEnd.jsp" enctype="multipart/form-data" method="post" onsubmit="return Validate(this);">
             <center>
                <table border="0" cellpadding="6" cellspacing="6" width="630px">
                   <tr>
                      <td colspan="2">
                        <h1>Carregar Fotografia</h1>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="hidden" name="MAX_FILE_SIZE" value="500" />
                        <input type="file" name="photo" id="photo"/>
                     </td>
                     <td style="text-align: right;">
                        <input id="saveForm" name="saveForm" class="saveForm" type="submit" value=" Actualizar Fotografia "/>
                     </td>
                  </tr>
               </table>
             </center>             
         </form>  
         
         <br/>
         <hr/>

         
         <form id="formEditProduct" action="/eStore/Admin/productsEditFormData.jsp" method="post">
            <input id="idArt" type="hidden" name="idArt" value="<%=idA%>"/>
            <center>
               <table border="0" cellpadding="6" cellspacing="6" width="60px">
                  <tr>
                     <td colspan="3">
                        <h1>Editar Artigo</h1>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                        <p>Todos os campos são de preenchimento obrigatório!</p>
                     </td>
                  </tr>
                  <tr>
                     <td rowspan="9">
                        &nbsp;&nbsp;&nbsp;
                        <img src='/eStore/Images/imagesArtigos/<%=artigo.getArtigoFoto()%>' height='128' width='128' class='imgcenter' />
                        &nbsp;&nbsp;&nbsp;
                     </td>
                     <td align="right">
                        <label for="nome">Nome:</label>
                     </td>
                     <td align="left">
                        <input id="nome" type="text" name="nome" style="width: 350px;" value="<%=artigo.getArtigoNome()%>" class="validate[required]">
                     </td>
                     
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="referencia">Referência:</label>
                     </td>
                     <td align="left">
                        <input id="referencia" type="text" name="referencia" style="width: 350px;" value="<%=artigo.getArtigoReferencia()%>" class="validate[required]">
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="familia">Família:</label>
                     </td>
                     <td align="left">
                        (<%=nomeFamilia%>)<br/>
                        <select id="classFamilia" name="classFamilia" onchange="showData(this.value)" style="width: 350px;" >
                           <%
                              List<ClassFamilia> listaClassFamilia = new ArrayList<ClassFamilia>();
                              ClassFamilia aux = new ClassFamilia();
                              listaClassFamilia = aux.getClassFamiliaList();
                              String selected = "";

                           %><option selected value="xxx"> [Selecione uma familia] </option><%

                              if (listaClassFamilia == null) {
                           %> <option value="0"> </option> <%                        } else {
                           for (ClassFamilia lista : listaClassFamilia) {%>
                           <option value="<%=lista.getClassFamiliaId()%>"> <%= lista.getClassFamiliaNome()%> </option>
                           <%}
                           }%>
                        </select> ${classFamilia}
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="subFamilia">Sub-Família:</label>
                     </td>
                     <td align="left">&nbsp;(<%=nomeSubFamilia%>)
                        <div id="ddlClassSubFamilia"> </div> 
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="unidadeVenda">Unidade Venda:</label>
                     </td>
                     <td align="left">
                        <input id="unidadeVenda" type="text" name="unidadeVenda" style="width: 200px;" value="<%=artigo.getArtigoUnidadeVenda()%>" class="validate[required]"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="preco">Preço:</label>  
                     </td>
                     <td align="left">
                        <input id="preco" type="text" name="preco" style="width: 100px;" value="<%=artigo.getArtigoPreco()%>" class="validate[required,custom[onlyNumber]]">(ex: 1234567<b style="color: #FF0000">.</b>89)
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="promocao">Promoção:</label>  
                     </td>
                     <td align="left">
                        <input id="promocao" type="text" name="promocao" style="width: 100px;" value="<%=artigo.getArtigoPromocao()%>" class="validate[required,custom[integer]]">(%)
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="destaque">Destaque:</label>
                     </td>
                     <td align="left">
                        <input id="destaqueX" type="checkbox" name="destaque" <%=destaqueOK%>/>
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <label for="destaque">Activo:</label>
                     </td>
                     <td align="left">
                        <input id="activoX" type="checkbox" name="activo" <%=activoOK%> />
                     </td>
                  </tr> 
                  <tr>
                     <td align="left" colspan="3">
                        <label for="descricaoBreve">Descrição Breve:</label>
                        <br/>
                        <textarea id="descricaoBreve" name="descricaoBreve" rows="3" cols="74" maxlength="100" class="validate[required]"><%=artigo.getArtigoDescricaoSmall()%></textarea>
                     </td>
                  </tr>
                  <tr>
                     <td align="left" colspan="3">
                        <label for="descricaoDetalhada">Descrição Detalhada:</label>
                        <br/>
                        <textarea id="descricaoDetalhada" name="descricaoDetalhada" rows="6" cols="74" maxlength="250" class="validate[required]"><%=artigo.getArtigoDescricaoLong()%></textarea>
                     </td>
                  </tr>
                  <tr>
                     <td align="right" colspan="3">
                        <input type="button" title="" value=" Fechar " onclick="fecharJanela();" />
                        &nbsp;&nbsp;&nbsp;
                        <input type="submit" value=" Actualizar Dados ">
                     </td>
                  </tr>
               </table>
            </center>         
         </form>
      </div>
      <!-- end content -->
        
      
   </body>
</html>

<script type="text/javascript">
   $('#formEditProduct').validationEngine();
</script>