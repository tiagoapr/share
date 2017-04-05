<%@page import="DatabaseClasses.EncomendaLinha"%>
<%@page import="DatabaseClasses.Carrinho"%>
<%@page import="SupportClasses.Utils"%>


<%
   //int idArtig = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
   //int idEncLinha = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(1)));
   //String refTransporte = request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(2));

   int idArtig = Integer.parseInt((String) request.getParameter("idArtig"));
   int idEncLinha = Integer.parseInt((String) request.getParameter("idEncLinha"));
   String refTransporte = (String) request.getParameter("refTransporte");
   
   
   EncomendaLinha encLinha = new EncomendaLinha();
  
   encLinha.sendItem(idEncLinha, idArtig, refTransporte);
   response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));
%>

