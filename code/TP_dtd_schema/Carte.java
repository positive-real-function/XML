import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class Carte {

    public static void main(String[] args) {
        try {
            // 创建DocumentBuilderFactory
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            
            // 创建DocumentBuilder
            DocumentBuilder builder = factory.newDocumentBuilder();
            
            // 解析XML文件
            Document document = builder.parse(new File("carte.xml"));
            
            // 规范化XML结构
            document.getDocumentElement().normalize();
            
            // 解析菜品
            Map<String, Element> plats = parsePlats(document);
            
            // 解析并打印菜单
            parseMenus(document, plats);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static Map<String, Element> parsePlats(Document document) {
        Map<String, Element> plats = new HashMap<>();
        NodeList platList = document.getElementsByTagName("plat");
        
        for (int i = 0; i < platList.getLength(); i++) {
            Element plat = (Element) platList.item(i);
            String ref = plat.getAttribute("ref");
            plats.put(ref, plat);
            
            System.out.println("Plat: " + getElementContent(plat, "nom"));
            System.out.println("Référence: " + ref);
            System.out.println("Prix: " + plat.getAttribute("prix"));
            
            if (plat.getElementsByTagName("remarque").getLength() > 0) {
                System.out.println("Remarque: " + getElementContent(plat, "remarque"));
            }
            
            Element recette = (Element) plat.getElementsByTagName("recette").item(0);
            if (recette.getChildNodes().getLength() > 0) {
                System.out.println("Recette: " + recette.getTextContent().trim());
            }
            
            System.out.println();
        }
        
        return plats;
    }
    
    private static void parseMenus(Document document, Map<String, Element> plats) {
        NodeList menuList = document.getElementsByTagName("menu");
        
        for (int i = 0; i < menuList.getLength(); i++) {
            Element menu = (Element) menuList.item(i);
            
            System.out.println("Menu: " + menu.getAttribute("nom"));
            System.out.println("Prix: " + getElementContent(menu, "prix"));
            
            NodeList composants = menu.getElementsByTagName("composant");
            for (int j = 0; j < composants.getLength(); j++) {
                Element composant = (Element) composants.item(j);
                String platRef = composant.getAttribute("plat");
                Element plat = plats.get(platRef);
                
                System.out.println("- " + getElementContent(plat, "nom"));
            }
            
            System.out.println();
        }
    }
    
    private static String getElementContent(Element parent, String elementName) {
        NodeList nodeList = parent.getElementsByTagName(elementName);
        if (nodeList.getLength() > 0) {
            return nodeList.item(0).getTextContent();
        }
        return "";
    }
}