/**
 * Ode.java
 *
 * This is approximatly revision 7 of this program, it is precisely
 * the first written in Java.
 *
 * It was begun in around 1992 on a BBC B written in BBC BASIC 2.
 * Then it was modified for BBC BASIC V on a RISC PC, eventually
 * including a GUI.
 * One year ago to the day, it was reimplemented in C, the code for
 * which is almost as nasty as the original.
 * I think I once started writing a Pascal version, it was never
 * finished, what became of it I don't know.
 *
 * Thanks, inspiration, suggestions and contributions are due to:
 * Peter Jones, Douglas Adams, Mark Hiscott and Duncan Jauncey.
 *
 * Created: Tue Nov  5 17:18:53 2002
 *
 * @author <a href="mailto:">Barney Livingston</a>
 * @version 7.0 (06/11/2002)
 */

public class Ode {

	public static void main(String[] args) {

		Noun noun1 = new Noun();
		Verb verb  = new Verb();
		Ing  ing   = new Ing();
		Noun noun2 = new Noun( new Adj() );

		System.out.print("Ode to ");
		if (noun1.getPrep().length() > 0) System.out.print(noun1.getPrep() + " ");
		System.out.print( noun1.getNoun() + " " + noun1.getPost());
		System.out.println( " I " + verb.getVerb() + " one midsummer morning,");

		System.out.print("While " + ing.getIng() + " ");
		if (noun2.getPrep().length() > 0) System.out.print(noun2.getPrep() + " ");
		if (noun2.getAdj().length() > 0) System.out.print(noun2.getAdj() + " ");
		System.out.println(noun2.getNoun() + ".");
		
	}
	
}// Ode
