/**
 * Adj.java
 *
 *
 * Created: Tue Nov  5 19:24:59 2002
 *
 * @author <a href="mailto:">Barney Livingston</a>
 * @version
 */

public class Adj {

	private String adj;

	public Adj (){
		adj = OdeUtils.getRandomLine("adjs");
	}

	public String getAdj() {
		return adj;
	}
	
}// Adj
