/**
 * Verb.java
 *
 *
 * Created: Tue Nov  5 19:24:59 2002
 *
 * @author <a href="mailto:">Barney Livingston</a>
 * @version
 */

public class Verb {

	private String verb;

	public Verb (){
		verb = OdeUtils.getRandomLine("verbs");
	}

	public String getVerb() {
		return verb;
	}
	
}// Verb
