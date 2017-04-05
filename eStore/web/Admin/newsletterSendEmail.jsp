<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DatabaseClasses.Newsletter"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="java.util.Date"%>
<%@page import="SendEmail.EmailUtility"%>


<%

   // reads form fields
   String host = "smtp.gmail.com";
   String port = "587";
   String user = "isec.pd.1213@gmail.com";
   String pass = "Isec.Tic";



   //String content = "";

   String resultMessage = "";
   String message;
   int resultado = 0;


   try {
      Newsletter aux = new Newsletter();
      List<Newsletter> emailsList = new ArrayList<Newsletter>();
      emailsList = aux.getEmailsList(true);


      if (emailsList != null) {
         for (Newsletter news : emailsList) {
            String recipient = news.getNewsletterEmail().toString();
            String subject = "eStore - Newsletter";
            String content = "eStore\n\n\n\n";
            content += "Já se encontra disponivel para download no nosso site o mais recente catálogo!\n\n";
            content += "A não perder.\n\n";
            content += "Visite-nos em www.estore.com";
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
         }
         message = "18";
         response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
      }
   } catch (Exception ex) {
      ex.printStackTrace();
      resultMessage = "There were an errorXXX: " + ex.getMessage();
   } finally {
      request.setAttribute("Message", resultMessage);
   }



%>