/**
 * OdeUtils.java
 *
 *
 * Created: Tue Nov  5 19:01:29 2002
 *
 * @author <a href="mailto:">Barney Livingston</a>
 * @version
 */

import java.io.*;
import java.util.*;

public class OdeUtils {
	
	public static String getRandomLine(String filename) {

		Vector fileStrings = new Vector();

		try {
			// open file
			BufferedReader in = new BufferedReader( new FileReader( filename ) );

			while( in.ready() ) {
				String s = in.readLine();

				if( s != null ) {
					fileStrings.addElement( s );
				}
			}

			in.close();
		}

		catch( IOException e ){
			System.out.println( "Error: " + filename + " file is missing." );
			return null;
		}

		return (String)fileStrings.elementAt( (int)(Math.random() * fileStrings.size()) );

	}

	public static boolean startsVowel(String word) {
		word = word.toLowerCase();
		if ( word.startsWith("a") ||
			 word.startsWith("e") ||
			 word.startsWith("i") ||
			 word.startsWith("o") ||
			 word.startsWith("u") ) {
			return true;
		} else {
			return false;
		}
	}
			 
	
}// OdeUtils
