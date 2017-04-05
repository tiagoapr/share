<%@page import="SupportClasses.Utils"%>


<%

   Utils.sessionLogout(session);
   response.sendRedirect("/eStore/index.jsp");

%>

