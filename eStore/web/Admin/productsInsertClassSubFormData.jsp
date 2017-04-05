<%@page import="DatabaseClasses.ClassSubFamilia"%>
<%@page import="DatabaseClasses.ClassFamilia"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Artigo"%>


<%

   ClassSubFamilia subFamilia = new ClassSubFamilia();
   ClassSubFamilia auxSF = new ClassSubFamilia();
   
   int idFamilia = Integer.parseInt((String) request.getParameter("classFamilia2"));   
   String classSubF = Utils.parseStringSpecialChars(request.getParameter("novaClassSubF"));
   
   if (classSubF != null) {
      subFamilia.setClassFamilia_FamiliaId(idFamilia);
      subFamilia.setClassSubFamiliaNome(classSubF);
      auxSF.insertEntity(subFamilia);
   }

   response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));

%>
