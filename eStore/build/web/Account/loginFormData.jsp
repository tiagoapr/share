<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="DatabaseClasses.UserInfo"%>

<%
   UserInfo user = new UserInfo();
   UserInfo aux = new UserInfo();
   String loginEmail = request.getParameter("email");
   String loginPassword = request.getParameter("passwd");

   user = aux.getUserInfo(loginEmail, loginPassword);

   if (user == null) {
      response.sendRedirect("/eStore/Account/login.jsp");
      return;
   }

   if (user.getNivelAcesso_NivelAcessoId() > 10) {
      //conta bloqueada
      response.sendRedirect("/eStore/Support/messages.jsp?a=10");
      return;
   } else if (!user.getUserActivo()) {
      //user inactivo
      response.sendRedirect("/eStore/Support/messages.jsp?a=11");
      return;
   } else {
      Carrinho c = new Carrinho();
      List<Carrinho> items = new ArrayList<Carrinho>();
      items = c.getItemsOnCart(user.getUserId());

      if (items != null) {
         session.setAttribute("sessionCarrinhoFul", items.size());
      } else {
         session.setAttribute("sessionCarrinhoFull", 0);
      }
      session.setAttribute("sessionUserObject", user);
      session.setAttribute("sessionUserEmail", user.getUserEmail());
      session.setAttribute("sessionUserId", user.getUserId());
      session.setAttribute("sessionNivelAcesso", user.getNivelAcesso_NivelAcessoId());
      session.setAttribute("sessionUrlPathBack", "/eStore/index.jsp");

      response.sendRedirect("/eStore/index.jsp");
   }
%>