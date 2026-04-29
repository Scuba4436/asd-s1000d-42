
graphicLevel = 2;
activeView = "master";
element = null;
schema = null;
graphicContext = null;

function init(inElement) {
	
	graphicContext = window.parent.frames[1].getGraphicContext();
	displayGraphicContext();
	
	element = inElement;
	document.getElementById("graphicLevel").innerHTML = graphicLevel;
	displayXSDGraphic(inElement, graphicContext);
}

function levelSet(level, inElement) {
	if (level < 1) {
		level = 1;
	}
	if (level > 4) {
		level = 4;
	}			
	graphicLevel = level;
	document.getElementById("graphicLevel").innerHTML = graphicLevel;
}


function displayGraphicContext () {
	if(graphicContext != null)
		document.getElementById("graphicContext").innerHTML = "Context of: "+graphicContext;
	else
		document.getElementById("graphicContext").innerHTML = "";
}

function changeLevel(changeValue) {
	levelSet(graphicLevel + changeValue);
	
	if(activeView == "master")
		displayXSDGraphic(element, null);
	if(activeView == "flat")
		displayXSDGraphicFlat(element, schema);
}

function loadXMLDoc(fname) {
	var xmlDoc;
	if (document.implementation && document.implementation.createDocument) {
		xmlDoc=document.implementation.createDocument("","",null);
	}
	else {
		alert('Your browser cannot handle this script');
	}
	try {
		xmlDoc.async=false;
		xmlDoc.load(fname);
		return(xmlDoc);
	}
	catch(e) {
		try //Google Chrome
		{
			var xmlhttp = new window.XMLHttpRequest();
			xmlhttp.open("GET",file,false);
			xmlhttp.send(null);
			xmlDoc = xmlhttp.responseXML.documentElement;
			return(xmlDoc);
		}
		catch(e) {
			error=e.message;
		}
	}
}

function displayXSDGraphic(startElement, context) {
	activeView = "master";
	
	if(context == null) {
		graphicContext = null;
		displayGraphicContext();
		window.parent.frames[1].setGraphicContext(null);
	}
	
	if(graphicContext != null)
		displayXSDGraphicFlat(startElement, graphicContext);
	else {
		// Code for chrome, firefox etc.
		if (document.implementation && document.implementation.createDocument && typeof XSLTProcessor != 'undefined') { 
			xml=loadXMLDoc("../xml_schema_viewer/xsd_graphic.xml");
			xsl=loadXMLDoc("../xml_schema_viewer/xsd_graphic.xsl");
			xsltProcessor=new XSLTProcessor();
			xsltProcessor.importStylesheet(xsl);
			xsltProcessor.setParameter(null, "startElement", startElement);
			xsltProcessor.setParameter(null, "maxLevel", graphicLevel);
			resultDocument = xsltProcessor.transformToFragment(xml,document);
			document.getElementById("XSDGraphic").innerHTML = ""
			document.getElementById("XSDGraphic").appendChild(resultDocument);
		}
		else {
			try {	 // IE
				/*
				var xml = new ActiveXObject("MSXML2.DOMDocument");
				var xsl = new ActiveXObject("Microsoft.XMLDOM");
				*/
				var xml = new ActiveXObject("Microsoft.XMLDOM"); 
				var xsl = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
				xml.load("../xml_schema_viewer/xsd_graphic.xml");
				xsl.load("../xml_schema_viewer/xsd_graphic.xsl");
				var processor = new ActiveXObject("Msxml2.XSLTemplate");
				processor.stylesheet = xsl;
				var objXSLTProc = processor.createProcessor();
				objXSLTProc.input = xml;
				objXSLTProc.addParameter("startElement", startElement);
				objXSLTProc.addParameter("maxLevel", graphicLevel);
				objXSLTProc.transform();
				document.getElementById("XSDGraphic").innerHTML = objXSLTProc.output;
			}
			catch (e) {
				if(typeof console != "undefined") {
					console.log('transformxml: no browser support');
				}
				return null;
			}
		}
	}
}

function displayXSDGraphicFlat(startElement, schemaFile) {
	activeView = "flat";
	
	graphicContext = schemaFile;
	displayGraphicContext();
	window.parent.frames[1].setGraphicContext(schemaFile);
	
	schema = schemaFile;
	 
	// Code for chrome, firefox etc.
	if (document.implementation && document.implementation.createDocument && typeof XSLTProcessor != 'undefined') { 
		xml=loadXMLDoc("../xml_schema_viewer/xsd_graphic_flat.xml");
		xsl=loadXMLDoc("../xml_schema_viewer/xsd_graphic_flat.xsl");
		xsltProcessor=new XSLTProcessor();
		xsltProcessor.importStylesheet(xsl);
		xsltProcessor.setParameter(null, "startElement", startElement);
		xsltProcessor.setParameter(null, "maxLevel", graphicLevel);
		xsltProcessor.setParameter(null, "flatSchema", schemaFile);
		
			
		resultDocument = xsltProcessor.transformToFragment(xml,document);
		document.getElementById("XSDGraphic").innerHTML = ""
		document.getElementById("XSDGraphic").appendChild(resultDocument);
	}
	else {
		try {	 // IE
			var xml = new ActiveXObject("Microsoft.XMLDOM"); 
			var xsl = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
			xml.load("../xml_schema_viewer/xsd_graphic_flat.xml");
			xsl.load("../xml_schema_viewer/xsd_graphic_flat.xsl");
			var processor = new ActiveXObject("Msxml2.XSLTemplate");
			processor.stylesheet = xsl;
			var objXSLTProc = processor.createProcessor();
			objXSLTProc.input = xml;
			objXSLTProc.addParameter("startElement", startElement);
			objXSLTProc.addParameter("maxLevel", graphicLevel);
			objXSLTProc.addParameter("flatSchema", schemaFile);			
			objXSLTProc.transform();
			document.getElementById("XSDGraphic").innerHTML = objXSLTProc.output;
		}
		catch (e) {
			if(typeof console != "undefined") {
				console.log('transformxml: no browser support');
			}
			return null;
		}
	}
}


