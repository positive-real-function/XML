import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.*;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

public class Gare_Dom {
    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory  fabrique= DocumentBuilderFactory.newInstance();
        fabrique.setValidating(true);
        DocumentBuilder parseur = fabrique.newDocumentBuilder();
        File xml=new File("C:\\Users\\Administrator\\Desktop\\Gare.xml");
        Document doc=parseur.parse(xml);
//        doc.getDocumentElement().normalize();

    }
}
