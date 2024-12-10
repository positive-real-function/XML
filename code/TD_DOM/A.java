import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;

public class A {
    public static void main(String[] args) {
        try {
            //创建解析工厂
            DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
            //使用DTD检查
            factory.setValidating(true);
            //创建解析器
            DocumentBuilder builder=factory.newDocumentBuilder();

            File xml=new File("/Users/jinzhuoyuan/King/Cours/S5/xml/XML_code/XML/code/TD_DOM/A.xml");
            Document doc=builder.parse(xml);

            //获取根节点
            Node racine=doc.getDocumentElement();
            System.out.println(racine.getNodeName());

            //获取所有子节点
            NodeList nodeList=racine.getChildNodes();
            for(int i=0;i<nodeList.getLength();i++){
                Node node=nodeList.item(i);
                if(node.getNodeType()==Node.ELEMENT_NODE){
                    Element e=(Element)node;
                    System.out.println(e.getNodeName());
//                    System.out.println(e.getTextContent());
                }
            }

        }catch (Exception e){
            System.out.println("error");
        }

    }


    //a)Nombre d'element dans un document
    static int nomberElement(Node noeud){
        int nbe=0;
        if(noeud.getNodeType()==Node.ELEMENT_NODE)//pour elementA ajoute &&noeud.getNodeName().equals("A")
            nbe++;
        if(noeud.hasChildNodes()){
            NodeList enfants=noeud.getChildNodes();
            for(int i=0;i<enfants.getLength();i++){
                int reseaul=nomberElement(enfants.item(i));
                nbe+=reseaul;
            }
        }
        return nbe;
    }

    static int nomberElementA(Node noeud){
        NodeList elements=(noeud.getChildNodes());
        if(noeud.getNodeName().equals("A"))
            return 1+elements.getLength();
        else
            return elements.getLength();
    }

    //b)Afficher text dans un document
    static void afficherTexte(Node noeud){
        if(noeud.getNodeType()==Node.TEXT_NODE)
            System.out.println(noeud.getNodeValue());
        if(noeud.hasChildNodes()){
            NodeList enfants=noeud.getChildNodes();
            for(int i=0;i<enfants.getLength();i++){
                afficherTexte(enfants.item(i));
            }
        }
    }

    static void afficherTexte2(Node noeud){
        System.out.println(noeud.getTextContent());
    }

    //Affiche la somme des valeurs de tous les éléments « montant » fils d’un élément « dépense »
    static int sommeDepenses(Node noeud){
        int somme=0;
        if(noeud.getNodeType()==Node.ELEMENT_NODE&&noeud.getNodeName().equals("montant")){
            if(noeud.getParentNode().getNodeName().equals("depense")){
//                int montant=Integet.paresInt(noeud.getTextContent());
//                somme+=montant;
            }
        }
        if(noeud.hasChildNodes()){
            NodeList enfants=noeud.getChildNodes();
            for(int i=0;i<enfants.getLength();i++){
                sommeDepenses(enfants.item(i));
            }
        }
        return somme;
    }
}



