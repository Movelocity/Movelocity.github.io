package notebook;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notebook.Person;
import notebook.Address;

/**
 * Servlet implementation class PersonServlet
 */
@WebServlet(urlPatterns={"/person"})
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = -5392874L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Address address = new Address(
				"Rue D'Anjou",
				"5090B",
				"Brossard",
				"Quebec",
				"A1A B2B",
				"Canada");
		Person person = new Person(
				1099, 
				"Charles", 
				"Unjeye", 
				address);
		person.setFirstName("Charles");
		request.setAttribute("person", person);
		Map<String, String> capitals = new HashMap<String, String>();
		capitals.put("China", "Beijing");
		capitals.put("Austria", "Vienna");
		capitals.put("Australia", "Canberra");
		capitals.put("Canada", "Ottawa");
		capitals.put("America", "Washington");
		capitals.put("Britain", "London");
		request.setAttribute("capitals", capitals);
		
		RequestDispatcher rd = request.getRequestDispatcher("/person.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Recieved a post from a client.");
	}

}
