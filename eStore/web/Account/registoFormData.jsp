<%@page import="SendEmail.EmailUtility"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.UserInfo"%>

<%
   UserInfo utilizador = new UserInfo();

   
   String nome = Utils.parseStringSpecialChars((String) request.getParameter("nome"));
   String morada = Utils.parseStringSpecialChars((String) request.getParameter("morada"));
   int cpa = Integer.parseInt((String) request.getParameter("cpa"));
   int cpb = Integer.parseInt((String) request.getParameter("cpb"));
   String freguesia = Utils.parseStringSpecialChars((String) request.getParameter("freguesia"));
   String concelho = Utils.parseStringSpecialChars((String) request.getParameter("concelho"));
   String distrito = Utils.parseStringSpecialChars((String) request.getParameter("distrito"));
   int contacto = Integer.parseInt((String) request.getParameter("contacto"));
   int nif = Integer.parseInt((String) request.getParameter("nif"));
   String email = Utils.parseStringSpecialChars((String) request.getParameter("email"));
   String plainTextPasswd = (String) request.getParameter("passwd");

   utilizador.setNivelAcesso_NivelAcessoId(2);
   utilizador.setUserCpa(cpa);
   utilizador.setUserCpb(cpb);
   utilizador.setUserContacto(contacto);
   utilizador.setUserNif(nif);
   utilizador.setUserPasswd(Utils.convertToMd5(plainTextPasswd));
   utilizador.setUserActivo(false);
   utilizador.setUserNome(nome);
   utilizador.setUserMorada(morada);
   utilizador.setUserFreguesia(freguesia);
   utilizador.setUserConcelho(concelho);
   utilizador.setUserDistrito(distrito);
   utilizador.setUserEmail(email);
      
   int res = utilizador.insertEntity(utilizador);

   int message = 0;

   switch (res) {
      case -2:
         message = 3;//email repetido
         break;
      case -1:
         message = 1;//erro
         break;
      case 1:
         message = 2;//OK
         String resultMessage = "";
         String host = "smtp.gmail.com";
         String port = "587";
         String user = "isec.pd.1213@gmail.com";
         String pass = "Isec.Tic";

         String recipient = email;
         String subject = "eStore - Registo efectuado";
         String content = "";

         try {
            content = "eStore\n\n\n\n";
            content += "Parabéns! Registo concluido com sucesso\n";
            content += "Seguem abaixo os seus dados. Esta informação pode ser consultada no menu Conta Membro.\n\n";
            content += "Nome: " + nome + "\n";
            content += "Morada: " + morada + "\n";
            content += "Código Postal: " + cpa + " - " + cpb + "\n";
            content += "Freguesia: " + freguesia + "\n";
            content += "Concelho: " + concelho + "\n";            
            content += "Distrito: " + distrito + "\n";
            content += "Contacto: " + contacto + "\n";
            content += "NIF: " + nif + "\n";
            content += "Email: " + email + "\n";     
            content += "Palavra-chave: " + plainTextPasswd + "\n";
            
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
         } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
         } finally {
            request.setAttribute("Message", resultMessage);
         }
         break;
      
   }

   response.sendRedirect("/eStore/Support/messages.jsp?a=" + message);

%>