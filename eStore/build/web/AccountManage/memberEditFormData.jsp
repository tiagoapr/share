<%@page import="java.util.Date"%>
<%@page import="SendEmail.EmailUtility"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.UserInfo"%>
<%


   UserInfo utilizador = new UserInfo();
   boolean updatePassword = false;
   String plainTextPasswd = "";

   if (request.getParameter("passwd") == null || request.getParameter("passwd").isEmpty()) {
      updatePassword = false;
   } else {
      updatePassword = true;
      plainTextPasswd = (String) request.getParameter("passwd");
      utilizador.setUserPasswd(Utils.convertToMd5(plainTextPasswd));
   }

   int idUser = Integer.parseInt((String) request.getParameter("idUser"));
   String nome = (String) request.getParameter("nome");
   String morada = (String) request.getParameter("morada");
   int cpa = Integer.parseInt((String) request.getParameter("cpa"));
   int cpb = Integer.parseInt((String) request.getParameter("cpb"));
   String freguesia = (String) request.getParameter("freguesia");
   String concelho = (String) request.getParameter("concelho");
   String distrito = (String) request.getParameter("distrito");
   int contacto = Integer.parseInt((String) request.getParameter("contacto"));
   int nif = Integer.parseInt((String) request.getParameter("nif"));
   String email = (String) request.getParameter("email");


   utilizador.setUserId(idUser);
   utilizador.setUserNome(nome);
   utilizador.setUserMorada(morada);
   utilizador.setUserCpa(cpa);
   utilizador.setUserCpb(cpb);
   utilizador.setUserFreguesia(freguesia);
   utilizador.setUserConcelho(concelho);
   utilizador.setUserDistrito(distrito);
   utilizador.setUserContacto(contacto);
   utilizador.setUserNif(nif);
   utilizador.setUserEmail(email);
   utilizador.setUserActivo(true);

   int res = utilizador.updateEntity(utilizador, updatePassword);

   int message = 0;

   switch (res) {
      case -1:
         message = 7;//erro
         break;
      case 1:
         String resultMessage = "";
         String host = "smtp.gmail.com";
         String port = "587";
         String user = "isec.pd.1213@gmail.com";
         String pass = "Isec.Tic";

         String recipient = email;
         String subject = "eStore - Alteração / Correcção dos dados de registo";
         String content = "";

         try {
            content = "eStore\n\n\n\n";
            content += "Os dados de registo foram alterados com sucesso!\n";
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
            if(updatePassword){
               content += "Palavra-chave Nova: " + plainTextPasswd + "\n";
            }
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
         } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
         } finally {
            request.setAttribute("Message", resultMessage);
         }
         break;
   }


%>

<script  type = "text/javascript">
   if(<%=res%> == 1){
      alert("Actualização da informação realizada com sucesso!\n\nNecessário efectuar login novamente.\n\nFoi-lhe enviado um email com as alterações realizadas\n\n\n\nObrigado.");
      window.location="/eStore/AccountManage/logout.jsp";      
   }
</script>