<%@include file="../masterHeader.jsp"%>

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

   <%@include file="../masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">

      <h1>Recuperar Palavra-Chave</h1>
      <hr />

      <br/>
      <br/>
      <br/>     
      <br/>

      <form id="formRecuva" action="/eStore/Account/loginSendEmail.jsp" method="post">

         <center>

            <table border="0" cellpadding="6" cellspacing="6"  >
               <tr>
                  <td>
                     <img src="/eStore/Images/imagesTemplate/Login-icon.png" alt=""  />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td style="text-align: right;">
                     <table border="0" cellpadding="6" cellspacing="6">                        
                        <tr>
                           <td align="right">
                              <label for="email">Email de Registo:</label>  
                           </td> 
                           <td align="left">
                              <input id="emailReg" type="text" name="emailReg" style="width: 200px;" class="validate[required,custom[email]]">
                           </td>
                        </tr>

                        <tr>
                           <td colspan="2" align="right">
                              <br/><br/>
                              <input type="submit" value=" Recuperar Palavra Chave ">
                           </td>
                        </tr>

                     </table>
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
   $('#formRecuva').validationEngine();
</script>
