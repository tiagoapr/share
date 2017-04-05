<%@page import="DatabaseClasses.Newsletter"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="org.apache.catalina.User"%>
<%@include file="../masterHeader.jsp"%>



<%
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());


  
   Newsletter newsletter = new Newsletter();
   List<Newsletter> activeEmails = new ArrayList<Newsletter>();
   List<Newsletter> inactiveEmails = new ArrayList<Newsletter>();

   activeEmails = newsletter.getEmailsList(true);
   inactiveEmails = newsletter.getEmailsList(false);


%>

<script type="text/javascript">
   
   
   var _validFileExtensions = [".pdf"];
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

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

  
   
   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content_full">

      <h1>Newsletter</h1>
      <hr />
      
   
      
      
      <form id="form691" name="form691" class="foto" action="/eStore/Admin/newsletterUpload.jsp" enctype="multipart/form-data" method="post" onsubmit="return Validate(this);">
            <center>
               <table border="0" cellpadding="6" cellspacing="6" width="630px">
                  <tr>
                     <td colspan="2">
                       <h3>Carregar Catálogo para Download</h3> 
                    </td>
                  </tr>
                  <tr>
                     <td>
                        <input type="hidden" name="MAX_FILE_SIZE" value="500" />
                        <input type="file" name="photo" id="photo"/>
                     </td>
                     <td style="text-align: right;">
                        <input id="saveForm" name="saveForm" class="saveForm" type="submit" value=" Carregar Catálogo "/>
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
      
      
      
      
      
     
      <br/>
      
      
      <form id="formInfoNews" action="/eStore/Admin/newsletterSendEmail.jsp" method="post">
            <center>
               <table border="0" cellpadding="6" cellspacing="6" width="630px">
                  <tr>
                     <td colspan="2">
                       <h3>Enviar Email para lista de Endereços</h3> 
                    </td>
                  </tr>
                  <tr>
                     <td style="vertical-align: bottom;">
                        <p>Enviar email para a lists abaixo a informar de um novo catálogo para download</p>
                     </td>
                     <td style="text-align: right; vertical-align: bottom;">
                        <input id="saveForm" name="saveForm" class="saveForm" type="submit" value=" Enviar Emails "/>
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
      
       
      <br/>
      
      <table border="0" width="100%">
         <tr>
            <td>
               <center>
                  <div class="box_cart3">
                     <div class="headings">
                        <ul>
                           <li class="sc-product3">Activos</li>
                        </ul>
                        <div class="clr"> </div>
                     </div>
                     <%
                     if (activeEmails != null) {
                        for (Newsletter ae : activeEmails) {
                           %>
                           <form id="formActivateEmail" action="/eStore/Admin/newsletterDeactivate.jsp" method="post">
                              <input id="idEmailA" type="hidden" name="idEmailA" value="<%=ae.getNewsletterId()%>">
                              <div class="proList">
                                 <ul>
                                    <li class="sc-product3X">
                                       &nbsp;
                                    </li>                                 
                                    <li class="sc-product3">
                                       <%=ae.getNewsletterEmail()%>
                                    </li>
                                    <li class="sc-product3X">
                                       <input type="submit" value=""  style="border: none; width: 24px; height: 24px; background: url('/eStore/Images/imagesTemplate/notification11.png');" >
                                       <!--<a href="#"><img src='/eStore/Images/imagesTemplate/notification.png' height='24' width='24' class='imgcenter2' onclick="deactivateEmail()"/></a>-->
                                    </li>
                                 </ul>
                              </div>
                           </form>
                        <%}
                     }%>
                  </div>   
               </center>
            </td>
            <td>
               &nbsp;&nbsp;
               &nbsp;&nbsp;
            </td>
            <td>
               <center>
                  <div class="box_cart3">
                     <div class="headings">
                        <ul>
                           <li class="sc-product3">Inactivos</li>
                        </ul>
                        <div class="clr"> </div>
                     </div>
                     <%
                     if (inactiveEmails != null) {
                        for (Newsletter ie : inactiveEmails) {
                           %>
                           <form id="formDeactivateEmail" action="/eStore/Admin/newsletterActivate.jsp" method="post">
                              <input id="idEmailI" type="hidden" name="idEmailI" value="<%=ie.getNewsletterId()%>">
                              <div class="proList">
                                 <ul>
                                    <li class="sc-product3X">
                                       <input type="submit" value=""  style="border: none; width: 24px; height: 24px; background: url('/eStore/Images/imagesTemplate/arrow21.png');" >
                                       <!--<a href="#"><img src='/eStore/Images/imagesTemplate/arrow2.png' height='24' width='24' class='imgcenter2' onclick="activateEmail()"/></a>-->
                                    </li>
                                    <li class="sc-product3">
                                       <%=ie.getNewsletterEmail()%>
                                    </li>
                                    <li class="sc-product3X">
                                       &nbsp;
                                    </li>
                                 </ul>
                              </div>
                           </form>
                        <%}
                     }%>
                  </div>
               </center>
            </td>
         </tr>
      </table>
                  
                  
                  
   <br/><br/><br/><br/><br/><br/><br/><br/>
                 
   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formCart').validationEngine();
</script>