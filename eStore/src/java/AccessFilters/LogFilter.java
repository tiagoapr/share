package AccessFilters;

// Import required java libraries
import SupportClasses.Utils;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LogFilter implements Filter {

   @Override
   public void init(FilterConfig config) throws ServletException {
      // Get init parameter 
      String testParam = config.getInitParameter("test-param");
      //Print the init parameter 
      System.out.println("Test Param: " + testParam);
   }

   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException {

      HttpServletRequest req = (HttpServletRequest) request;
      HttpSession session = req.getSession();
      
      if (!Utils.userIsLogged(session)) {
         RequestDispatcher rd = req.getRequestDispatcher("/Account/login.jsp");
         rd.forward(request, response);
         return;
      }      
      chain.doFilter(request, response);
   }

   @Override
   public void destroy() {
      /* Called before the Filter instance is removed 
       from service by the web container*/
   }
}