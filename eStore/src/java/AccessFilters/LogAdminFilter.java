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

public class LogAdminFilter implements Filter {

   @Override
   public void init(FilterConfig config) throws ServletException {
   }

   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
           throws java.io.IOException, ServletException {

      HttpServletRequest req = (HttpServletRequest) request;
      HttpSession session = req.getSession();
      if (Utils.userIsLoggedAsAdmin(session)) {
         chain.doFilter(request, response);
      } else {
         RequestDispatcher rd = req.getRequestDispatcher("/Support/messages.jsp?a=996");
         rd.forward(request, response);
      }
   }

   @Override
   public void destroy() {
   }
}
