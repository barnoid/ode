/**
 * Ing.java
 *
 *
 * Created: Tue Nov  5 19:24:59 2002
 *
 * @author <a href="mailto:">Barney Livingston</a>
 * @version
 */

public class Ing {

	private String ing;

	public Ing (){
		ing = OdeUtils.getRandomLine("ings");
	}

	public String getIng() {
		return ing;
	}
	
}// Ing
