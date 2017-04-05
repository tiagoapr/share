<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="org.apache.catalina.User"%>
<%@include file="../masterHeader.jsp"%>



<%
   Utils.setPathBack(session, request.getRequestURI(), request.getQueryString());


   UserInfo user = new UserInfo();
   List<UserInfo> activeUsers = new ArrayList<UserInfo>();
   List<UserInfo> inactiveUsers = new ArrayList<UserInfo>();
   List<UserInfo> blockedUsers = new ArrayList<UserInfo>();

   activeUsers = user.getActiveUsers(true);
   inactiveUsers = user.getActiveUsers(false);
   blockedUsers = user.getBlockedUsers();





%>

<script type="text/javascript">
   
   function blockUser(){
      var a = document.getElementById("idU").value;
      var url = "/eStore/Admin/usersBlock.jsp";
      url = url + "?a=" + a;
      if(confirm("\n\n\nA conta do utilizador será bloqueada.\n\nDesta forma ficará impossibilitado de iniciar sessão no site\n\n\n\n\nContinuar com o bloqueio da conta do utilizador?")){
         window.location.replace(url);
      }
   }
   
   function deactivateUser(){
      var a = document.getElementById("idU").value;
      var url = "/eStore/Admin/usersDeactivate.jsp";
      url = url + "?a=" + a;
      if(confirm("\n\n\nA conta do utilizador ficará inactiva.\n\nDesta forma ficará impossibilitado de iniciar sessão no site\n\n\n\n\nContinuar com a inactivação da conta do utilizador?")){
         window.location.replace(url);
      }
   }
   
   function activateUser(){   
      var a = document.getElementById("idUA").value;
      var url = "/eStore/Admin/usersActivate.jsp";
      url = url + "?a=" + a;
      window.location.replace(url);
   }
   
   function unblockUser(){
      var a = document.getElementById("idUX").value;
      var url = "/eStore/Admin/usersActivate.jsp";
      url = url + "?a=" + a;
      window.location.replace(url);
   }
</script>

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >

  
   
   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content_full">

      <h1>Utilizadores registados</h1>
      <hr />
      <br/>
      <table border="0" width="100%">
         <tr>
            <td rowspan="2">
               <center>
                  <div class="box_cart3">
                     <div class="headings">
                        <ul>
                           <li class="sc-product3">Activos</li>
                        </ul>
                        <div class="clr"> </div>
                     </div>
                     <%
                     if (activeUsers != null) {
                        for (UserInfo au : activeUsers) {
                           %>
                           <div class="proList">
                              <ul>
                                 <li class="sc-product3X">
                                    <form id="formBlockUser" action="/eStore/Admin/usersBlock.jsp" method="post">
                                       <input id="idU" type="hidden" name="idU" value="<%=au.getUserId()%>">
                                       <input type="submit" value=""  style="border: none; width: 24px; height: 24px; background: url('/eStore/Images/imagesTemplate/block1.png');" >
                                       <!--<a href="#"><img src='/eStore/Images/imagesTemplate/block.png' height='20' width='20' class='imgcenter2' onclick="blockUser()"/></a>-->
                                    </form>
                                 </li>                                 
                                 <li class="sc-product3">
                                   <%= "<a href='/eStore/AccountManage/memberEdit.jsp?a=" + au.getUserId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_self' > " + au.getUserEmail() +" </a>" %>                                   
                                 </li>
                                 <li class="sc-product3X">
                                    <form id="formDeactivateUser" action="/eStore/Admin/usersDeactivate.jsp" method="post">
                                       <input id="idU" type="hidden" name="idU" value="<%=au.getUserId()%>">
                                       <input type="submit" value=""  style="border: none; width: 24px; height: 24px; background: url('/eStore/Images/imagesTemplate/notification11.png');" >
                                       <!--<a href="#"><img src='/eStore/Images/imagesTemplate/notification.png' height='24' width='24' class='imgcenter2' onclick="deactivateUser()"/></a>-->
                                    </form>
                                 </li>
                              </ul>
                           </div>
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
                     if (inactiveUsers != null) {
                        for (UserInfo iu : inactiveUsers) {
                           %>
                           <div class="proList">
                              <ul>
                                 <li class="sc-product3X">
                                    <form id="formActivateUser" action="/eStore/Admin/usersActivate.jsp" method="post">
                                       <input id="idU" type="hidden" name="idU" value="<%=iu.getUserId()%>">
                                       <input type="submit" value=""  style="border: none; width: 24px; height: 24px; background: url('/eStore/Images/imagesTemplate/arrow21.png');" >
                                       <!--<a href="#"><img src='/eStore/Images/imagesTemplate/arrow2.png' height='24' width='24' class='imgcenter2' onclick="activateUser()"/></a>-->
                                    </form>
                                 </li>
                                 <li class="sc-product3">
                                    <%= "<a href='/eStore/AccountManage/memberEdit.jsp?a=" + iu.getUserId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > " + iu.getUserEmail() +" </a>" %>
                                 </li>
                                 <li class="sc-product3X">
                                    &nbsp;
                                 </li>
                              </ul>
                           </div>
                        <%}
                     }%>
                  </div>
               </center>
            </td>
         </tr>
         <tr>
            <td>
               &nbsp;&nbsp;
               &nbsp;&nbsp;
            </td>
            <td>
               <br/><br/>
               <center>
                  <div class="box_cart3">
                     <div class="headings">
                        <ul>
                           <li class="sc-product3">Bloqueados</li>
                        </ul>
                        <div class="clr"> </div>
                     </div>
                     <%
                     if (blockedUsers != null) {
                        for (UserInfo bu : blockedUsers) {
                           %>
                           
                           <div class="proList">
                              <ul>
                                 <li class="sc-product3X">
                                    <form id="formUnblockUser" action="/eStore/Admin/usersActivate.jsp" method="post">
                                       <input id="idU" type="hidden" name="idU" value="<%=bu.getUserId()%>">
                                       <input type="submit" value=""  style="border: none; width: 24px; height: 24px; background: url('/eStore/Images/imagesTemplate/arrow21.png');" >
                                       <!--<a href="#"><img src='/eStore/Images/imagesTemplate/arrow2.png' height='24' width='24' class='imgcenter2' onclick="unblockUser()"/></a>-->
                                    </form>
                                 </li>
                                 <li class="sc-product3">
                                    <%= "<a href='/eStore/AccountManage/memberEdit.jsp?a=" + bu.getUserId() +" 'onclick='return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')' target='_blank' > " + bu.getUserEmail() +" </a>" %>
                                 </li>
                                 <li class="sc-product3X">
                                    &nbsp;
                                 </li>
                              </ul>
                           </div>
                        <%}
                     }%>
                  </div>
               </center>
            </td>
         </tr>
      </table>
                  
                  
                  
   <br/><br/><br/><br/><br/><br/>
                 
   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>

<script type="text/javascript">
   $('#formCart').validationEngine();
</script>