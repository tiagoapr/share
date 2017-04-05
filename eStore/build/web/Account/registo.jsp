<%@include file="../masterHeader.jsp"%>

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

   <%@include file="../masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">

      <h1>Registo</h1>
      <hr />
      
      <p>Todos os campos são de preenchimento obrigatório!</p>

      <form id="formRegisto" action="/eStore/Account/registoFormData.jsp" method="post">

         <center>

            <table border="0">
               <tr>
                  <td>
                     <img src="/eStore/Images/imagesTemplate/user-icon.png" alt=""  />
                  </td>
                  <td>
                     <table style="border: 0px solid black;" cellpadding="6" cellspacing="6">
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
                              <label for="morada">Morada:</label>  
                           </td> 
                           <td align="left">
                              <input id="morada" type="text" name="morada" style="width: 350px;" class="validate[required]">
                           </td>
                        </tr>
                        <tr>
                           <td align="right">
                              <label for="codPostal">Código Postal:</label>  
                           </td> 
                           <td align="left">
                              <input id="cpa" type="text" maxlength="4" name="cpa" style="width: 35px;" class="validate[required,custom[integer]]">
                              &nbsp;-&nbsp;
                              <input id="cpb" type="text" maxlength="3" value="000" name="cpb" style="width: 25px;" class="validate[required,custom[integer]]">
                           </td>
                        </tr>
                        <tr>
                           <td align="right">
                              <label for="freguesia">Freguesia:</label>  
                           </td> 
                           <td align="left">
                              <input id="freguesia" type="text" name="freguesia" style="width: 200px;" class="validate[required]">
                           </td>
                        </tr>
                        <tr>
                           <td align="right">
                              <label for="concelho">Concelho:</label>  
                           </td> 
                           <td align="left">
                              <input id="concelho" type="text" name="concelho" style="width: 200px;" class="validate[required]">
                           </td>
                        </tr>
                        <tr>
                           <td align="right">
                              <label for="distrito">Distrito:</label>  
                           </td> 
                           <td align="left">
                              <input id="distrito" type="text" name="distrito" style="width: 200px;" class="validate[required]">
                           </td>
                        </tr>
                        <tr>
                           <td align="right">
                              <label for="contacto">Contacto:</label>  
                           </td> 
                           <td align="left">
                              <input id="contacto" type="text" maxlength="9" name="contacto" style="width: 80px;" class="validate[required,custom[phone]]">
                           </td>
                        </tr>
                        <tr>
                           <td align="right">
                              <label for="nif">NIF:</label>  
                           </td> 
                           <td align="left">
                              <input id="nif" type="text" maxlength="9" name="nif" style="width: 80px;" class="validate[required,custom[integer]]"><br>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2">
                              <br /> 
                           </td> 
                        </tr>
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
                           <td align="right">
                              <label for="passwdConfirm">Confirmar Palavra Chave:</label>  
                           </td> 
                           <td align="left">
                              <input id="passwdConfirm" type="password" name="passwdConfirm" style="width: 200px;" class="validate[required,equals[passwd]]">
                           </td>
                        </tr>

                     </table>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" align="right">
                     <input type="submit" value=" Registar ">
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
   $('#formRegisto').validationEngine();
</script>
