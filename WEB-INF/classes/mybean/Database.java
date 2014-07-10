package mybean;
import java.util.*;
import java.io.*;

/** Simple bean to illustrate the various forms
 *  of jsp:setProperty.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */
 
 
public class Database{
  private HashMap<String, ShoppingCart> database;
  
  public Database(){
	database = new HashMap<String,ShoppingCart>();
	loadDatabase();
	PrintDatabase();
  }
  
  public void addOrder(String confNum, ShoppingCart order){
	database.put(confNum,order);
	PrintDatabase();
	saveDatabase();
  }
  
  public int removeOrder(String confNum){
	ShoppingCart order = database.remove(confNum);
	PrintDatabase();
	if(order ==null){
		return 0;
	}
	saveDatabase();
	return 1;
  }
  
  public void PrintDatabase(){
	System.out.println("Current State");
	// Get a set of the entries
      Set set = database.entrySet();
      // Get an iterator
      Iterator i = set.iterator();
      // Display elements
      while(i.hasNext()) {
         Map.Entry me = (Map.Entry)i.next();
         System.out.println(me.getKey() + ": ");
      }
  }
  
  public void saveDatabase(){
	ObjectOutputStream oos =null;
	FileOutputStream fos = null;
    try {
		fos = new FileOutputStream("orderList.txt");
		oos = new ObjectOutputStream(fos);
		Set set = database.entrySet();
		// Get an iterator
		Iterator i = set.iterator();
		while(i.hasNext()) {
			Map.Entry me = (Map.Entry)i.next();
			oos.writeObject(me.getKey());
			oos.writeObject(me.getValue());
		}
	} catch (FileNotFoundException ex) {
        ex.printStackTrace();
    } catch (IOException ex) {
        ex.printStackTrace();
    } finally {
		try {
                if (oos != null) {
                    oos.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
    }
  }
  
  public void loadDatabase(){
	FileInputStream fis = null;
	ObjectInputStream ois = null;
	try{
		fis = new FileInputStream("orderList.txt");
		ois = new ObjectInputStream(fis);
		 String key = (String)ois.readObject();
		 while(key!=null){
			ShoppingCart cart = (ShoppingCart)ois.readObject();
			database.put(key,cart);
			key = (String)ois.readObject();
		 }
	} catch (ClassNotFoundException ex) {
            ex.printStackTrace();
	} catch (FileNotFoundException ex) {
        ex.printStackTrace();
    } catch (IOException ex) {
        ex.printStackTrace();
    } finally {
		try {
                if (ois != null) {
                    ois.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
    }
  }
}