# DTD笔记


## 三种导入方式 
    <!DOCTYPE 根标签 SYSTEM “dtd文件目录”>  外部引用 
    <!DOCTYPE 根标签 [ dtd内容 ]>  内部引用
    <!DOCTYPE root-element PUBLIC "public-id" "file.dtd"> 引用网址

## 特殊符号
    lt (<), gt (>), quot ("), amp (&), apos (')



## 引用实体（内部实体和外部实体）

    <?xml version='1.0' ?>
    <!DOCTYPE bouquin [
      <!ENTITY chapitre1 SYSTEM "chap1.xml">
      <!ENTITY chapitre2 SYSTEM "chap2.xml">
      <!ENTITY auteur "Toto">
    ]>
    <bouquin>
        <titre> Les joies de XML </titre>
        <auteur> &auteur; </auteur>
        <intro> Il était une fois ... </intro>
        &chapitre1;
        &chapitre2;
    </bouquin> 




# xml schema笔记

## 构造器（Constructeurs de types）

构造器用于定义复杂类型的结构，以下是主要的构造器：

### xsd:sequence
描述：定义一个有序元素序列。这意味着元素在文档中的出现顺序是固定的，必须按照定义的顺序出现。

    <xsd:complexType name='PersonType'>
        <xsd:sequence>
            <xsd:element name='FirstName' type='xsd:string'/>
            <xsd:element name='LastName' type='xsd:string'/>
        </xsd:sequence>
    </xsd:complexType>

在这个例子中，FirstName 必须出现在 LastName 之前。

### xsd:all

描述：定义一个无序元素组，所有子元素可以按任何顺序出现，但每个元素只能出现一次或不出现。

    <xsd:complexType name='AddressType'>
        <xsd:all>
            <xsd:element name='City' type='xsd:string'/>
            <xsd:element name='Street' type='xsd:string'/>
            <xsd:element name='Number' type='xsd:integer'/>
        </xsd:all>
    </xsd:complexType>

在这个例子中，City、Street 和 Number 可以以任意顺序出现，但每个只能出现一次。

### xsd:choice
描述：定义元素的选择，这意味着可以在多个元素中选择一个或多个元素出现。

    <xsd:complexType name='ContactType'>
        <xsd:choice>
            <xsd:element name='Email' type='xsd:string'/>
            <xsd:element name='Phone' type='xsd:string'/>
        </xsd:choice>
    </xsd:complexType>

在这个例子中，可以选择提供 Email 或 Phone，而不是同时提供。

### xsd:group
描述：用于将多个元素组合成一个组，从而可以在其他类型中重用这个组。相当于在 DTD 中使用括号 (...)。

    <xsd:group name='NameGroup'>
        <xsd:element name='FirstName' type='xsd:string'/>
        <xsd:element name='LastName' type='xsd:string'/>
    </xsd:group>

    <xsd:complexType name='PersonType'>
        <xsd:group ref='NameGroup'/>
    </xsd:complexType>

在这个例子中，NameGroup 定义了一个包含 FirstName 和 LastName 的组，可以在 PersonType 中引用。

### 总结
- 复杂类型用于定义包含多个元素和属性的结构。
- xsd:sequence、xsd:all、xsd:choice 和 xsd:group 是主要的构造器，用于定义复杂类型的子元素如何组织和出现。


## 混合（文本和标签）
    <xsd:complexType name='OfficielType' mixed='true'>
        <xsd:choice minOccurs='0' maxOccurs='unbounded'>
            <xsd:element name='cinema' type='CinemaType' />
            <xsd:element name='film' type='FilmType' />
        </xsd:choice>
    </xsd:complexType>
`mixed=‘true’`：表示这个复杂类型允许混合内容，即可以包含文本和元素。
`<xsd:choice>`：定义了可以出现的子元素，包括 cinema 和 film，并且可以出现零次或多次。

## 简单内容+带属性的标签
    xml
    <titre langue='français'>Le Goût des Autres</titre>

通过将简单内容与属性结合，可以使用 `<xsd:simpleContent>` 和 `<xsd:extension>` 来定义一个新的复杂类型。这个新类型可以包含简单的文本内容和属性。

    <xsd:element name='titre' type='titreType'/>
    <xsd:complexType name='titreType'>
        <xsd:simpleContent>
            <xsd:extension base='xsd:string'>
                <xsd:attribute name='langue' type='xsd:string'/>
            </xsd:extension>
        </xsd:simpleContent>
    </xsd:complexType>
    •	<xsd:element>：定义了一个名为 titre 的元素，类型为 titreType。
    •	<xsd:complexType>：定义了一个复杂类型 titreType。
    •	<xsd:simpleContent>：表示这个复杂类型将包含简单内容（即文本）。
    •	<xsd:extension base='xsd:string'>：表示这个简单内容的基本类型是 xsd:string，即 titre 的内容是字符串类型。
    •	<xsd:attribute>：定义了属性 langue，类型为 xsd:string。

##带属性的单标签

    xml
    <film titre='If' année='1976'/>

    xml schema
    <xsd:element name='film' type='filmType'/>
    <xsd:complexType name='filmType'>
      <xsd:attribute name='titre' type='xsd:string'/>
      <xsd:attribute name='année' type='annéeFilm'/>
    </xsd:complexType>

