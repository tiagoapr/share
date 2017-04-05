<%@page import="DatabaseClasses.ClassSubFamilia"%>
<%@page import="DatabaseClasses.ClassFamilia"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DatabaseClasses.Artigo"%>

<%
   ClassFamilia f = new ClassFamilia();
   ClassFamilia familia = new ClassFamilia();   
   List<ClassFamilia> familiaList = new ArrayList<ClassFamilia>();
   familiaList = familia.getClassFamiliaList();
   Iterator itf = familiaList.iterator();
   
   ClassSubFamilia sf = new ClassSubFamilia();  
   ClassSubFamilia subFamilia = new ClassSubFamilia();       
   List<ClassSubFamilia> subFamiliaList = new ArrayList<ClassSubFamilia>();
%>

<!-- ### BARRA LATERAL ESQUERDA ### -->
<div id="sidebar-left">

   <div class="box_sidebar">
      <div class="box">
         <a href="/eStore/Downloads/Newsletter.pdf" onclick="return !window.open(this.href, 'Details', 'width=800, height=500, left=24, top=24, scrollbars=no, resizable=no, menubar=no, status=no, toolbar=no, directories=no')" target="_blank"><img src="/eStore/Images/imagesTemplate/banner3.gif" alt="" /></a>									
      </div>
   </div><!-- end box_sidebar -->

   <div class="box_sidebar">
      <div class="box cart">
         <a href="#"><img src="/eStore/Images/imagesTemplate/onlinepay.gif" alt="" /></a>									
      </div>
   </div><!-- end box_sidebar -->

   <div class="box_sidebar">
      <div class="sidebar-title">Categorias</div>
      <div class="box">         
         <div id="accordion">
            <%while (itf.hasNext()) {
               f = (ClassFamilia) itf.next();
               subFamiliaList = subFamilia.getClassSubFamiliaList(f.getClassFamiliaId());
               Iterator itsf = subFamiliaList.iterator();
               %>
               <h3> <%= f.getClassFamiliaNome()%></h3>
               <div>
                  <%while (itsf.hasNext()) {
                     sf = (ClassSubFamilia) itsf.next();
                     %>                     
                     <h4><%= "<a href='/eStore/productsList.jsp?a=" + f.getClassFamiliaId() + "&b=" + sf.getClassSubFamiliaId() + "'>" + sf.getClassSubFamiliaNome() + "</a>" %></h4>                     
                  <%}%>
               </div>
            <%}%>
         </div>
      </div>								
   </div><!-- end box_sidebar -->


   <div class="box_sidebar">
      <div class="sidebar-title">Informações</div>
      <div class="box">
         <ul>
            <li><a href="/eStore/shipping.jsp"> Entregas &amp; Devoluções </a></li>
            <li><a href="/eStore/privacy.jsp"> Aviso de privacidade </a></li>
            <li><a href="/eStore/conditions.jsp"> Condições de Uso </a></li>
            <li><a href="/eStore/contacts.jsp"> Fale connosco </a></li>
         </ul>
      </div>								
   </div><!-- end box_sidebar -->	

</div><!-- end sidebar-left -->

<script>
   $(function() {
      $( "#accordion" ).accordion();
   });
</script>