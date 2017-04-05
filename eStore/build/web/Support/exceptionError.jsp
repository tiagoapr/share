<%@include file="../masterHeader.jsp"%>

<div class="clr"></div>

<!-- -------------------------------------------------------------- -->
<!-- BEGIN CONTAINER -->
<!-- -------------------------------------------------------------- -->						
<div id="main_content" >
   
   <%@include file="../masterMainLeft.jsp"%>

   <!-- ### BARRA LATERAL DIREITA ### -->
   <div id="content">
      <h1> Atenção </h1>

      <hr />

      <br /> <br /> <br />

      <h3>Ops! Algo de errado aconteceu. </h3>

      <%=exception.toString()%>

      <%
         if (Utils.userIsLoggedAsAdmin(session)) 
         {
            // unwrap ServletExceptions.
            while (exception instanceof ServletException) {
               exception = ((ServletException) exception).getRootCause();
            }
            // print stack trace.
            exception.printStackTrace(new PrintWriter(out));
         }
      %>

   </div><!-- end content -->
</div><!-- end main_content -->

<div class="clr"></div>

<%@include file="../masterFooter.jsp"%>
