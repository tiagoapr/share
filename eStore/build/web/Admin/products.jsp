
<%@page import="SupportClasses.Utils"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DatabaseClasses.ClassFamilia"%>
<%@page import="DatabaseClasses.ClassSubFamilia"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());
%>


<%@include file="../masterHeader.jsp"%>


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
   
   
   
   
   function showData2(value){ 
      xmlHttp=GetXmlHttpObject2()
      var url="/eStore/Admin/productsAJAX2.jsp";
      url=url+"?id="+value;
      xmlHttp.onreadystatechange=stateChanged2 
      xmlHttp.open("GET",url,true)
      xmlHttp.send(null)
   }
   function stateChanged2() { 
      if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
         var showdata = xmlHttp.responseText; 
         document.getElementById("listSubFamilia").innerHTML= showdata;
      } 
   }
   function GetXmlHttpObject2(){
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

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >


   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content_full">

      <h1>Inserir Artigo &nbsp;&nbsp;&nbsp; (Passo 1/2)</h1>
      <hr />
      


      <form id="formInsertProduct" action="/eStore/Admin/productsFormData.jsp" method="post">
         <center>
            <table border="0" cellpadding="6" cellspacing="6"  width="630px">
               <tr>
                  <td colspan="2">
                     <h3>Inserir Artigo</h3>
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <p>Todos os campos são de preenchimento obrigatório!</p>
                  </td>
               </tr>
               <tr>                  
                  <td align="right">
                     <label for="nome">Nome:</label>
                  </td>
                  <td align="left">
                     <input id="nome" type="text" name="nome" style="width: 350px;" class="validate[required]">
                  </td>
               </tr>
               <tr>
                  <td align="right">
                     <label for="referencia">Referência:</label>
                  </td>
                  <td align="left">
                     <input id="referencia" type="text" name="referencia" style="width: 350px;" class="validate[required]">
                  </td>
               </tr>
               <tr>
                  <td align="right">
                     <label for="familia">Família:</label>
                  </td>
                  <td align="left">
                     <select id="classFamilia" name="classFamilia" onchange="showData(this.value)" style="width: 350px;" class="validate[required,custom[ddlValidate]]">
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
                  <td align="left">
                     <div id="ddlClassSubFamilia"> </div>
                  </td>
               </tr>
               <tr>
                  <td align="right">
                     <label for="unidadeVenda">Unidade Venda:</label>
                  </td>
                  <td align="left">
                     <input id="unidadeVenda" type="text" name="unidadeVenda" style="width: 200px;" class="validate[required]"/>
                  </td>
               </tr>
               <tr>
                  <td align="right">
                     <label for="preco">Preço:</label>  
                  </td>
                  <td align="left">
                     <input id="preco" type="text" name="preco" style="width: 100px;" class="validate[required,custom[onlyNumber]]">(ex: 1234567<b style="color: #FF0000">.</b>89)
                  </td>
               </tr>
               <tr>
                  <td align="right">
                     <label for="promocao">Promoção:</label>  
                  </td>
                  <td align="left">
                     <input id="promocao" type="text" name="promocao" value="0" style="width: 100px;" class="validate[required,custom[integer]]">(%)
                  </td>
               </tr>
               <tr>
                  <td align="right">
                     <label for="destaque">Destaque:</label>
                  </td>
                  <td align="left">
                     <input id="destaque" type="checkbox" name="destaque" value="0"/>
                  </td>
               </tr>
               <tr>
                  <td align="right">
                     <label for="destaque">Activo:</label>
                  </td>
                  <td align="left">
                     <input id="activo" type="checkbox" name="activo" value="1" checked="1"/>
                  </td>
               </tr> 
               <tr>
                  <td align="left" colspan="2">
                     <label for="descricaoBreve">Descrição Breve:</label>
                     <br/>
                     <textarea id="descricaoBreve" name="descricaoBreve" rows="3" cols="60" maxlength="100" class="validate[required]"></textarea>
                  </td>
               </tr>
               <tr>
                  <td align="left" colspan="2">
                     <label for="descricaoDetalhada">Descrição Detalhada:</label>
                     <br/>
                     <textarea id="descricaoDetalhada" name="descricaoDetalhada" rows="6" cols="60" maxlength="250" class="validate[required]"></textarea>
                  </td>
               </tr>
               <tr>
                  <td align="right" colspan="2">
                     <input type="submit" value=" Inserir Artigo ">
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <br/>
                     <hr/>
                  </td>
               </tr>
            </table>
         </center>         
      </form>

      
                  
      <form id="formInsertClassF" action="/eStore/Admin/productsInsertClassFormData.jsp" method="post">
         <center>
            <table border="0" cellpadding="6" cellspacing="6"  width="630px">
               <tr>
                  <td colspan="2">
                     <h3>Inserir Classificação Família</h3>
                  </td>
               </tr>
               <tr>
                  <td>
                     <%
                        for (ClassFamilia lista : listaClassFamilia) {
                           out.print(lista.getClassFamiliaNome()+"<br/>");
                        }
                        
                     %>
                  </td>
                  <td style="vertical-align: bottom; text-align: right;">
                     <input id="novaClassF" type="text" name="novaClassF" style="width: 200px;" maxlength="25" class="validate[required]"/>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" style="text-align: right;">
                     <input type="submit" value=" Inserir Classificacao ">
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <br/>
                     <hr/>
                  </td>
               </tr>
            </table>
         </center>
      </form>         
                  
                  
      <form id="formInsertClassSubF" action="/eStore/Admin/productsInsertClassSubFormData.jsp" method="post">
         <center>
            <table border="0" cellpadding="6" cellspacing="6"  width="630px">
               <tr>
                  <td colspan="2">
                     <h3>Inserir Classificação Sub Família</h3>
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <select id="classFamilia2" name="classFamilia2" onchange="showData2(this.value)" style="width: 350px;" class="validate[required,custom[ddlValidate]]">
                        <%                           
                           listaClassFamilia = aux.getClassFamiliaList();
                           selected = "";
                           %><option selected value="xxx"> [Selecione uma familia] </option><%
                           if (listaClassFamilia == null) {
                              %> <option value="0"> </option> 
                           <%} else {
                              for (ClassFamilia lista : listaClassFamilia) {%>
                                 <option value="<%=lista.getClassFamiliaId()%>"> <%= lista.getClassFamiliaNome()%> </option>
                              <%}
                           }%>
                     </select> ${classFamilia}
                  </td>
               </tr>
               <tr>
                  <td>                
                     <div id="listSubFamilia"> </div>
                  </td>
                  <td style="vertical-align: bottom; text-align: right;">
                     <input id="novaClassSubF" type="text" name="novaClassSubF" style="width: 200px;" maxlength="25" class="validate[required]"/>
                  </td>                  
               </tr>
               <tr>
                  <td colspan="2" align="right">
                     <input type="submit" value=" Inserir Sub Classificacao ">
                  </td>
               </tr>
            </table>
         </center>
      </form>       
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  

   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formInsertProduct').validationEngine();
   $('#formInsertClassF').validationEngine();
   $('#formInsertClassSubF').validationEngine();
</script>
