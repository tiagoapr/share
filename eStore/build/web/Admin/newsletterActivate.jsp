<%@page import="DatabaseClasses.Newsletter"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="SupportClasses.Utils"%>


<%

   int idEmail = Integer.parseInt((String) request.getParameter("idEmailI"));

   int resultado = 0;
   Newsletter nl = new Newsletter();
   resultado = nl.activateEmail(idEmail);

   //out.print("Act>>"+resultado);


   switch (resultado) {
      case -1:
         response.sendRedirect("/eStore/Support/messages.jsp?a=15");
         break;
      case 1:
         response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));
         break;
   }

%>

