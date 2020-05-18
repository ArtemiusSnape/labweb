package tag;
import model.entities.Request;
import model.entities.User;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

public class RequestTableTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        Locale loc = (Locale) getJspContext().getAttribute("userLocale", PageContext.SESSION_SCOPE);
        ResourceBundle bundle = ResourceBundle.getBundle("locale", loc, this.getClass().getClassLoader());

        User user = (User) getJspContext().getAttribute("user", PageContext.SESSION_SCOPE);
        List<Request> requests = (List<Request>)getJspContext().getAttribute("requestsList", PageContext.REQUEST_SCOPE);

        //StringBuilder content = new StringBuilder("Hello World!");

        String header = "<table border=\"1\" cellpadding=\"5\" cellspacing=\"1\" style=\"border-collapse: collapse\">\n" +
                "    <tr>\n" +
                "        <th>" + bundle.getString("table.id") + "</th>\n" +
                "        <th>" + bundle.getString("table.type") + "</th>\n" +
                "        <th>" + bundle.getString("table.descr") + "</th>\n" +
                "        <th>" + bundle.getString("table.deadline") + "</th>\n" +
                "        <th>" + bundle.getString("table.status") + "</th>\n" +

                (user.getUser_type() == 1 ? "        <th>" + bundle.getString("table.delete") + "</th>\n" : "") +

                "    </tr>\n" +
                "\n";
        StringBuilder tableBody = new StringBuilder();

        for (Request request : requests) {
            String tableRow =
                    "        <tr>\n" +
                            "                <td>"+ request.getRequest_id() + "</td>\n" +
                            "                <td>"+ request.getJob_type() + "</td>\n" +
                            "                <td>"+ request.getJob_descr() + "</td>\n" +
                            "                <td>"+ request.getTo_date() +"</td>\n" +
                            "                <td>"+ request.getStatus() +"</td>\n" +
                            (user.getUser_type() == 1 ? "                <td>\n" +
                            "                   <form method=\"POST\" action=\"" +
                            ((PageContext) getJspContext()).getServletContext().getContextPath() + "/?command=deleteRequest\">\n" +
                            "                       <input type=\"hidden\" name=\"request_id\" value="
                                                        + request.getRequest_id() + ">\n" +
                            "                       <button type=\"submit\" value=\"Delete\"/>\n" +
                            "                   </form>\n" +
                            "                </td>" : "")+
                            "        </tr>\n";
            tableBody.append(tableRow);
        }
        tableBody.append("</table>");
        try {
            JspWriter out = this.getJspContext().getOut();
            out.write(header + tableBody.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
    }
}
