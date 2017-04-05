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

   String recipient = request.getParameter("emailReg");
   String subject = "eStore - Recuperação de Palavra-chave";
   String content = "Content";

   String resultMessage = "";
   String message;
   int resultado = 0;


   try {
      UserInfo usr = new UserInfo();
      UserInfo userAux = new UserInfo();
      usr = userAux.getUserByEmail(recipient);
      if (usr != null) {
         Date now = new Date();
         String newPass = Utils.transformToSimpleDateFormat(now);
         String encodedPass = Utils.convertToMd5(newPass);
         usr.setUserPasswd(encodedPass);
         resultado = userAux.updateEntity(usr, true);
         if (resultado == 1) {
            content = "eStore\n\n\n\n";
            content += "A palavra chave foi alterada com sucesso!\n";
            content += "Utilize as seguintes credencias para iniciar a sessão.\n\n";
            content += "Email: " + recipient + "\n";
            content += "Palavra-chave: " + newPass + "\n";
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
            message = "16";
            response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
         } else {
            message = "17";
            response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);
         }
      }
   } catch (Exception ex) {
      ex.printStackTrace();
      resultMessage = "There were an errorXXX: " + ex.getMessage();
   } finally {
      request.setAttribute("Message", resultMessage);
   }



%>