import tango.io.Stdout;
import tango.time.StopWatch;
import tango.text.xml.Document;
import tango.text.xml.XmlPrinter;

/*******************************************************************************

*******************************************************************************/

void main()
{
        auto doc = new Document!(char);

        // attach an xml header
        doc.header;

        // attach an element with some attributes, plus 
        // a child element with an attached data value
        doc.root.element   (null, "element")
                .element   (null, "sub")
                .attribute (null, "attrib1", "value")
                .attribute (null, "attrib2")
                .element   (null, "child", "value")
                .parent
                .element   (null, "second");

        // emit document
        auto print = new XmlPrinter!(char);
        Stdout(print(doc)).newline;

        // time some queries
        StopWatch w;
        uint count = 100000;
        auto set = doc.query;

        // simple lookup: locate a specific named element
        w.start;
        for (uint i = count; --i;)
             set = doc.query["element"]["sub"]["child"];
        result ("generic lookups/s", count/w.stop, set);

        // attribute lookup: select all attributes of 'sub'
        w.start;
        for (uint i = count; --i;)
             set = doc.query.child("element").child("sub").attribute;
        result ("attribute lookups/s", count/w.stop, set);

        // filtered lookup: locate all elements with text "value"
        w.start;
        for (uint i = count; --i;)
             set = doc.query.descendant.filter((doc.Node n) {return n.hasText("value");});
        result ("text-predicate lookups/s", count/w.stop, set);

        // filtered lookup: locate all elements with attribute name "attrib1"
        w.start;
        for (uint i = count; --i;)
             set = doc.query.descendant.filter((doc.Node n) {return n.hasAttribute("attrib1");});
        result ("attr-predicate lookups/s", count/w.stop, set);

        // filtered lookup: locate all elements with more than 1 child
        w.start;
        for (uint i = count; --i;)
             set = doc.query.descendant.filter((doc.Node n) {return n.query[].count > 1;});
        result ("text-predicate lookups/s", count/w.stop, set);

}

void result (char[] msg, double time, XmlPath!(char).NodeSet set)
{
        Stdout.newline.formatln("{} {}", time, msg);
        foreach (element; set)
                 Stdout.formatln ("selected '{}'", element.name);
}
