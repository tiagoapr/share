<%@page import="DatabaseClasses.ClassFamilia"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Artigo"%>


<%

   ClassFamilia familia = new ClassFamilia();
   ClassFamilia aux = new ClassFamilia();

   String classF = Utils.parseStringSpecialChars(request.getParameter("novaClassF"));
   
   if (classF != null) {
      familia.setClassFamiliaNome(classF);
      aux.insertEntity(familia);
   }

   response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));

%>
