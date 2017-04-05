
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Encomenda"%>






<%
   //int idEnc = Integer.parseInt(request.getParameter((String) Utils.getUrlParameters(request.getQueryString()).get(0)));
   
   int idEnc = Integer.parseInt((String) request.getParameter("idEncomenda"));

   Encomenda enc = new Encomenda();
   
   enc.payOrder(idEnc);
   
   response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));

%>