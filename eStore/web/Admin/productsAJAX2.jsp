<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import=" DatabaseClasses.ClassSubFamilia"%>
<%@page import="java.sql.*" %> 





<%
   int idFamilia = Integer.parseInt((String) request.getParameter("id"));

   if (idFamilia == 0) {
      response.getWriter().println(" ");
   } else {

      List<ClassSubFamilia> subFamiliaList = null;
      ClassSubFamilia subFamilia = new ClassSubFamilia();

      try {
         subFamiliaList = subFamilia.getClassSubFamiliaList(idFamilia);
         Iterator it = subFamiliaList.iterator();
         String listSubFamilia = new String();

         while (it.hasNext()) {
            ClassSubFamilia subFamiliaIT = (ClassSubFamilia) it.next();
            listSubFamilia += subFamiliaIT.getClassSubFamiliaNome() + "<br/>";
         }
         response.getWriter().println(listSubFamilia);
      } catch (Exception e) {
         System.out.println(e);
      }
   }
%>