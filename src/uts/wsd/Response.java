package uts.wsd;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Response {
	
	@XmlElement(name="value")
	private int value;
	@XmlElement(name="count")
	private int count;
	@XmlElement(name = "name")
	private ArrayList<String> name = new ArrayList<String>();
	@XmlElement(name = "uuid")
	private ArrayList<String> uuid = new ArrayList<String>();
}
