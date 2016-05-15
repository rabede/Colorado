package pocketQuery;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import javax.swing.JOptionPane;

public class Query {
	
	private boolean dialog = false;

	public static void main(String[] args) {
		if (args.length == 0) {
			new Query().transform();
		}else{
			new Query().transform(args);
		}
	}
	
	private void transform(){
		dialog = true;
        String[] arr = {new Datei().getDateiname()};
		if (arr[0] != null){
			transform(arr);
		}
		else {
			System.exit(0);
		}
	}

	private void transform(String[] args) {

		String input = null;
		String output = "colorado.gpx";
		String stylesheet = "oc2colorado.xsl";
		InputStream xsl = null;

		try {
			input = args[0];
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out
					.println("Aufruf: java -jar Query.jar Inputdatei [Outputdatei] [XSLT-Datei]");
			System.exit(1);
		}

		try {
			output = args[1];
			System.out.print("Ausgabe von \"" + input + "\" erfolgt in Datei \"" + output + "\"");
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.print("Ausgabe von \"" + input + "\" erfolgt in Datei \"" + output + "\"");
		}

		try {
			stylesheet = args[2];
			xsl = new FileInputStream(stylesheet);
			System.out.println(" mit Stylesheet \"" + stylesheet + "\"");
		} catch (ArrayIndexOutOfBoundsException e) {
			xsl = getClass().getResourceAsStream(stylesheet);
			System.out.println(" mit Standardtransformation");
		} catch (FileNotFoundException e) {
			System.out.println("Datei nicht gefunden: " + stylesheet);
			System.exit(1);
		}
		
		String result;
		if (GPXFile.transformDOM(input, output, xsl)){
			result = new String("Ergebnis in: " + output);
		}
		else{
			result = new String("Fehler beim Schreiben von " + output);
		}
		showResult(result);
	}
	
	private void showResult(String result){
		if (dialog){
			JOptionPane.showMessageDialog(null, result);
		}
		else{
			System.out.println(result);
		}
	}
	

}
