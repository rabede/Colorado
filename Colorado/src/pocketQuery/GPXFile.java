package pocketQuery;

import java.io.*;

//import de.bellweb.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

public class GPXFile {

	public static boolean transformDOM(File sourcefile, File resultfile, InputStream xsl){

		StreamSource style = new StreamSource(xsl);
		StreamResult result = new StreamResult(resultfile);

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document document = builder.parse(sourcefile);

			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(style);

			DOMSource source = new DOMSource(document);
			transformer.transform(source, result);

		} catch (TransformerConfigurationException tce) {
			// Error generated by the parser
			System.out.println("\n** Transformer Factory error");
			System.out.println("   " + tce.getMessage());

			// Use the contained exception, if any
			Throwable x = tce;

			if (tce.getException() != null) {
				x = tce.getException();
			}

			x.printStackTrace();
			return false;
		} catch (TransformerException te) {
			// Error generated by the parser
			System.out.println("\n** Transformation error");
			System.out.println("   " + te.getMessage());

			// Use the contained exception, if any
			Throwable x = te;

			if (te.getException() != null) {
				x = te.getException();
			}

			x.printStackTrace();
			return false;
		} catch (SAXException sxe) {
			// Error generated by this application
			// (or a parser-initialization error)
			Exception x = sxe;

			if (sxe.getException() != null) {
				x = sxe.getException();
			}

			x.printStackTrace();
			return false;
		} catch (ParserConfigurationException pce) {
			// Parser with specified options can't be built
			pce.printStackTrace();
			return false;
		} catch (IOException ioe) {
			// I/O error
			ioe.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static boolean transformDOM(File sourcefile, String out, InputStream xsl){
		File resultfile = new File(out);
		return transformDOM(sourcefile, resultfile, xsl);

	}
	
	public static boolean transformDOM(String in, String out, InputStream xsl) {
		File sourcefile = new File(in);
		return transformDOM(sourcefile, out, xsl);
	}
		
}
