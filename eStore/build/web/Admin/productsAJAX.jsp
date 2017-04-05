<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import=" DatabaseClasses.ClassSubFamilia"%>
<%@page import="java.sql.*" %> 
<%

   //String idFamilia = new String();

   int idFamilia = Integer.parseInt((String) request.getParameter("id"));

   if (idFamilia == 0) {
      response.getWriter().println(" ");
   } else {
      String buffer = "<div>";
      List<ClassSubFamilia> subFamiliaList = null;
      ClassSubFamilia subFamilia = new ClassSubFamilia();

      try {
         
        //String x = "<a href='/eStore/productsList.jsp?a=" + f.getClassFamiliaId() + "&b=" + sf.getClassSubFamiliaId() + "'>" + sf.getClassSubFamiliaNome() + "</a>";


         subFamiliaList = subFamilia.getClassSubFamiliaList(idFamilia);
         Iterator it = subFamiliaList.iterator();
         String dropdownSubFamilia = new String();
         String optinSubFamilia = new String();
         dropdownSubFamilia = "<select id='classSubFamilia' name='classSubFamilia' style='width: 350px;'>";

         while (it.hasNext()) {
            ClassSubFamilia subFamiliaIT = (ClassSubFamilia) it.next();
            optinSubFamilia = "<option value=" + subFamiliaIT.getClassSubFamiliaId() + ">" + subFamiliaIT.getClassSubFamiliaNome() + "</option>";
            dropdownSubFamilia += " " + optinSubFamilia;
         }

         dropdownSubFamilia += "</select>";
         buffer += dropdownSubFamilia + "</div>";
         response.getWriter().println(buffer);
      } catch (Exception e) {
         System.out.println(e);
      }
   }
   
   
   
%>