
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("index.jsp")
public class indexServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        Map<String,String> s=new HashMap<String, String> ();
        //all the necessary code to obtain the list of products
        //store it as request attribute
        request.setAttribute("s",s);
        s.put("hi","hi");
        //forward to the desired view
        //this is the real JSP that has the content to display to user
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}