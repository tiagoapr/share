<%@include file="../masterHeader.jsp"%>

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

   <%@include file="../masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">

      <h1>Iniciar Sessão</h1>
      <hr />
      
      <br/>
      <br/>
      <br/>

      <form id="formLogin" action="/eStore/Account/loginFormData.jsp" method="post">

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
                              <label for="email">Email:</label>  
                           </td> 
                           <td align="left">
                              <input id="email" type="text" name="email" style="width: 200px;" class="validate[required,custom[email]]">
                           </td>
                        </tr>
                        <tr>
                           <td align="right">
                              <label for="passwd">Palavra Chave:</label>  
                           </td> 
                           <td align="left">
                              <input id="passwd" type="password" name="passwd" style="width: 200px;" class="validate[required]"><br>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2" align="right">
                              <br/>
                              <a href="/eStore/Account/loginRecover.jsp">Recuperar palvra-chave</a> &nbsp;&nbsp;&nbsp;&nbsp;
                              <input type="submit" value=" Iniciar Sessão ">
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
   $('#formLogin').validationEngine();
</script>
