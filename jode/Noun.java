/**
 * Noun.java
 *
 *
 * Created: Tue Nov  5 18:22:40 2002
 *
 * @author <a href="mailto:">Barney Livingston</a>
 * @version
 */

public class Noun {

	private String prep;
	private String noun;
	private String post;
	private Adj adj;

	public Noun(){
		getFromFile();
		adj = null;
	}

	public Noun(Adj adjin) {
		getFromFile();
		adj = adjin;
		if ( prep.equals("the") ||
			 prep.equals("|")  ) {
			adj = null;
		} else {
			try {
				if ( Double.parseDouble( adj.getAdj() ) > 1.0 ) {
					if ( !prep.equals("some") ) {
						noun = pluralise( noun );
						prep = adj.getAdj();
					}
					adj = null;
				}
			}
			catch(NumberFormatException e) {
				//adj is non-numeric
				if ( !prep.equals("some") ) {
					if ( OdeUtils.startsVowel( adj.getAdj() ) ) {
						prep = "an";
					} else {
						prep = "a";
					}
				}
			}
		}
	}

	private void getFromFile() {
		noun = OdeUtils.getRandomLine("nouns");
		prep = noun.substring( 0, noun.indexOf(" ") );
		noun = noun.substring( noun.indexOf(" ") + 1, noun.length() );
		post = noun.substring( noun.lastIndexOf(" ") + 1, noun.length() );
		noun = noun.substring( 0,  noun.lastIndexOf(" ") );
	}

	private String pluralise(String word) {
		if ( word.endsWith("ex") ||
			 word.endsWith("ix") ) {
			word = word.substring(0, word.length() - 2) + "ices";
		} else
		if ( word.endsWith("ch") ||
		  	 word.endsWith("sh") ||
		   	 word.endsWith("ss") ||
	   		 word.endsWith("o") ||
		   	 word.endsWith("x") ||
		   	 word.endsWith("s") ) {
	   		word = word + "es";
	   	} else
		if ( word.endsWith("y") &&
			 !OdeUtils.startsVowel(word.substring(word.length() - 2, word.length())) ) {
			word = word.substring(0, word.length() - 1) + "ies";
		} else {	
			word = word + "s";
		}
		return word;
	}

	public String getPrep() {
		if (prep.equals("|")) {
			return "";
		} else {
			return prep;
		}
	}
	
	public String getNoun() {
		return noun;
	}

	public String getPost() {
		return post;
	}

	public String getAdj() {
		if (adj == null) {
			return "";
		} else {
			return adj.getAdj();
		}
	}

}// Noun
