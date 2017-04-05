<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="SupportClasses.Utils"%>


<%
   int idU = Integer.parseInt((String) request.getParameter("idU"));
   //int idU = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));

   int resultado = 0;

   UserInfo user = new UserInfo();
   resultado = user.deactivateUser(idU);


   switch (resultado) {
      case -1:
         response.sendRedirect("/eStore/Support/messages.jsp?a=12");
         break;
      case 1:
         response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));
         break;
   }

%>

