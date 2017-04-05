<%@page import="SupportClasses.Utils"%>
<%@page import="DatabaseClasses.Artigo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>




<%
   int idA = (Integer) session.getAttribute("sessionArtigoId");
   Artigo aux = new Artigo();
   Artigo a = aux.getArtigo(idA, true);
   int resultado = 0;

   File file;
   int maxFileSize = 5 * 1024 * 1024;
   int maxMemSize = 5 * 1024 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();

   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();

      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);

      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);

      // maximum file size to be uploaded.
      upload.setSizeMax(maxFileSize);

      try {
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");
         out.println("</head>");
         out.println("<body>");

         while (i.hasNext()) {
            FileItem fi = (FileItem) i.next();
            if (!fi.isFormField()) {
               if (fi.getContentType().equalsIgnoreCase("image/jpg") || fi.getContentType().equalsIgnoreCase("image/jpeg")
                       || fi.getContentType().equalsIgnoreCase("image/bmp") || fi.getContentType().equalsIgnoreCase("image/gif")
                       || fi.getContentType().equalsIgnoreCase("image/png")) {
                  // Get the uploaded file parameters
                  String fieldName = fi.getFieldName();
                  String fileName = Integer.toString(a.getArtigoId()) + fi.getName();
                  boolean isInMemory = fi.isInMemory();
                  long sizeInBytes = fi.getSize();

                  // Write the file
                  if (fileName.lastIndexOf("\\") >= 0) {
                     file = new File(filePath
                             + fileName.substring(fileName.lastIndexOf("\\")));
                  } else {
                     file = new File(filePath
                             + fileName.substring(fileName.lastIndexOf("\\") + 1));
                  }

                  fi.write(file); //efectua o upload do ficheiro

                  a.setArtigoFoto(fileName);

                  resultado = aux.updateEntity(a);

                  if (resultado == 1) {
                     response.sendRedirect((String) session.getAttribute("sessionUrlPathBack"));
                  } else {
                     out.println("File uploading error!");
                  }
               } else {
                  out.print("O ficheiro é invalido! <br/> As extensões permitidas são: .jpg .jpeg .bmp .gif .png <br/><br/><br/> Faça voltar no browser para alterar o ficheiro!");
               }
            }
         }
         out.println("</body>");
         out.println("</html>");
      } catch (Exception ex) {
         out.print("O ficheiro é invalido! <br/> Excedeu o tamanho permitido de 5 megabytes para upload <br/><br/><br/> Faça voltar no browser para alterar o ficheiro!");
         //out.print(ex); //Se exceder o tamanho lança uma excepção!
      }
   } else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>");
      out.println("</body>");
      out.println("</html>");
   }
%>
