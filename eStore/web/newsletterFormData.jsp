<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Newsletter"%>





<%

   Newsletter nl = new Newsletter();
   Newsletter aux = new Newsletter();
   List<Newsletter> newsletterList = new ArrayList<Newsletter>();

   String email = Utils.parseStringSpecialChars((String) request.getParameter("newsletterEmail"));
   int message = 0;
   int resultado = 0;

   newsletterList = aux.asEmailOnList(email);

   if (newsletterList == null) {
      nl.setNewsletterEmail(email);
      nl.setNewsletterActivo(true);
      resultado = aux.insertEntity(nl);
      if (resultado == 1) {
         message = 14;//Ok
         response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
         return;
      }else{
         message = 13;//erro a inserir
         response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
         return;
      }
   } else {
      if (newsletterList.get(0).getNewsletterActivo()) {
         message = 13;//erro email activo / ja inserido na newsletter
         response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
         return;
      } else {
         aux.activateEmail(newsletterList.get(0).getNewsletterId());
         message = 14;//Ok email reactivado
         response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
         return;
      }
   }






   






%>