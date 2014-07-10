package mybean;
import java.io.*;
/** Simple bean to illustrate the various forms
 *  of jsp:setProperty.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */

public class Catalog implements Serializable{
  private String itemID;
  private int numItems;

  public Catalog(){
    itemID = "unknown";
    numItems = -1;
  }
  
  public Catalog(String itemID){
    this.itemID = itemID;
    numItems = 1;
  }
  
  public String getItemID() {
    return(itemID);
  }

  public void setItemID(String itemID) {
    if (itemID != null) {
      this.itemID = itemID;
    } else {
      this.itemID = "unknown";   ;  

	  }
  }

  public int getNumItems() {
    return(numItems);
  }

  public void setNumItems(int numItems) {
    this.numItems = numItems;
	System.out.println(itemID + ", numItems: " + this.numItems);
  }
  
  public double getItemCost() {
    double cost;
    
	//Phone IDs
	if (itemID.equals("phone1")) {
      cost = 250;
    } else if(itemID.equals("phone2")){
      cost = 350;
    } else if(itemID.equals("phone3")){
      cost = 150;
	} else if(itemID.equals("phone4")){
      cost = 100;
	} else if(itemID.equals("phone5")){
      cost = 119.88;
    } else if(itemID.equals("phone6")){
      cost = 149.99;
    } else if (itemID.equals("tablets1")) {
      cost = 119.99;
    } else if(itemID.equals("tablets2")){
      cost = 159.00;
    } else if(itemID.equals("tablets3")){
      cost = 349.95;
	} else if(itemID.equals("tablets4")){
      cost = 329.99;
	} else if(itemID.equals("tablets5")){
      cost = 329.00;
    } else if (itemID.equals("laptop1")) {
      cost = 1048.99;
    } else if(itemID.equals("laptop2")){
      cost = 1149.00;
    } else if(itemID.equals("laptop3")){
      cost = 998.00;
	} else if(itemID.equals("laptop4")){
      cost = 879.99;
	} else if (itemID.equals("tv1")) {
      cost = 799.90;
    } else if(itemID.equals("tv2")){
      cost = 959.99;
    } else if(itemID.equals("tv3")){
      cost = 1679.00;
	} else {
	  cost = -9999;
	}
	
    return(roundToPennies(cost));
  }

  private double roundToPennies(double cost) {
    return(Math.floor(cost*100)/100.0);
  }

  public double getTotalCost() {
    return(getItemCost() * getNumItems());
  }
  
  public String getName(){
	String name;
	
	//Phone IDs
	if (itemID.equals("phone1")) {
      name = "Droid MAXX";
    } else if(itemID.equals("phone2")){
      name = "Moto X";
    } else if(itemID.equals("phone3")){
      name = "iPhone 5S";
	} else if(itemID.equals("phone4")){
      name = "iPhone 5c";
	} else if(itemID.equals("phone5")){
      name = "Galaxy S 3";
    } else if(itemID.equals("phone6")){
      name = "Galaxy S 4";
	} else if (itemID.equals("tablets1")) {
      name = "Kindle";
    } else if(itemID.equals("tablets2")){
      name = "Nexus";
    } else if(itemID.equals("tablets3")){
      name = "Surface";
	} else if(itemID.equals("tablets4")){
      name = "Galaxy";
	} else if(itemID.equals("tablets5")){
      name = "iPad";
	} else if (itemID.equals("laptop1")) {
      name = "MacBook";
    } else if(itemID.equals("laptop2")){
      name = "Asus";
    } else if(itemID.equals("laptop3")){
      name = "Sony";
	} else if(itemID.equals("laptop4")){
      name = "Leveno";
	} else if (itemID.equals("tv1")) {
      name = "Panasonic";
    } else if(itemID.equals("tv2")){
      name = "Samsung";
    } else if(itemID.equals("tv3")){
      name = "Sony";
	} else {
	  name = "unknown";
	}
	
	return name;
  }
  
  public void incrementNumItems(){
	numItems= numItems + 1;
  }
}
