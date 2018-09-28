
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Image extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        Connection connection = null;
        String connectionURL = "jdbc:mysql://localhost:3306/birth_day_db";
        ResultSet rs = null;
        PreparedStatement psmnt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "admin");
            HttpSession session = req.getSession(true);
                       // String id=(String)session.getAttribute("nid");
            //int idn=Integer.parseInt(id);
            //int a=13;
            psmnt = connection.prepareStatement("select * from uploaded_logo  where id='7'");

            psmnt.setInt(1, 7);
            rs = psmnt.executeQuery();

            if (rs.next()) {

                Blob photo = rs.getBlob("images_name");
                byte[] imgData = photo.getBytes(1, (int) photo.length());
                res.setContentType("image/gif");
                OutputStream o = res.getOutputStream();
                o.write(imgData);
                o.flush();
                o.close();

            }
        } catch (Exception e) {
            System.out.println("ggg" + e);
        }

    }
}
