package mybean;
import java.util.ArrayList;
import java.io.*;
/** Simple bean to illustrate the various forms
 *  of jsp:setProperty.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */
 
 
public class ShoppingCart implements Serializable{
  private ArrayList<Catalog> cart;
  
  public ShoppingCart(){
	cart = new ArrayList<Catalog>();
  }
  
  public int getSize(){
	return cart.size();
  }
  
  public Catalog getCatalog(int index){
	return cart.get(index);
  }
  
  public ArrayList<Catalog> getCart(){
	return cart;
  }
  
  public void setCart(ArrayList<Catalog> cart){
	this.cart = cart;
  }
  
  public void addItem(String itemID){
	//either doesnt exist
	int found =0;
	for(int i=0;i<cart.size();i++){
		Catalog item = cart.get(i);
		if(item.getItemID().equals(itemID)){
			item.incrementNumItems();
			found=1;
		}
	}
	if(found ==0){
		Catalog x = new Catalog(itemID);
		cart.add(x);
		System.out.println("Item not Found but "+ itemID + ", numItems "+ x.getNumItems());
	}
  }
  
  public void updateItem(String itemID, int count){
	int found=0;
	for(int i=0;i<cart.size();i++){
		Catalog item = cart.get(i);
		if(item.getItemID().equals(itemID)){
			if(count == 0){
				cart.remove(i);
			}
			else if(count >0){
				item.setNumItems(count);
			}
			else{
				System.out.println("invalid number");
			}
			found=1;
		}
	}
	if(found==0){
		System.out.println("Item not Found");
	}
  }
}