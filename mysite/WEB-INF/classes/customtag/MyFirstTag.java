package customtag;

import java.io.IOException;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTag;

public class MyFirstTag implements SimpleTag{
	JspContext jspContext;
	
	public void doTag() throws IOException, JspException{
		System.out.println("Debug: do tag");
		jspContext.getOut().print("This is my first tag.(a line created by java class MyFirstTag)");
	}
	
	public void setParent(JspTag parent) {
		System.out.println("Debug: getParent"+parent);
	}
	
	public JspTag getParent() {
		System.out.println("Debug: getParent");
		return null;
	}
	
	public void setJspContext(JspContext jspContext) {
		System.out.println("Debug: setJspContext"+jspContext);
		this.jspContext = jspContext;
	}
	
	public void setJspBody(JspFragment body) {
		System.out.println("Debug: setJspBody"+body);
	}
}
