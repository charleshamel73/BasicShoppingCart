<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- 
Example of using jsp:setProperty with an explicit value
supplied to the "value" attribute. See SaleEntry2.jsp
and SaleEntry3.jsp for alternatives. 

Taken from Core Servlets and JavaServer Pages 2nd Edition
from Prentice Hall and Sun Microsystems Press,
http://www.coreservlets.com/.
(C) 2003 Marty Hall; may be freely used or adapted.
-->

<HTML>
<HEAD>
<TITLE>Using jsp:setProperty</TITLE>
<LINK REL=STYLESHEET
      HREF="JSP-Styles.css"
      TYPE="text/css">
</HEAD>
<BODY>
<CENTER>
<TABLE BORDER=5>
  <TR><TH CLASS="TITLE">
      Order Page</TABLE>
<jsp:useBean id="item" class="mybean.Catalog" />
<jsp:useBean id="cart" class="mybean.ShoppingCart" scope="session"/>
<%
	synchronized(session){
		String itemID =request.getParameter("itemID");
		int numItemsOrdered = -1;
		try {
			numItemsOrdered = Integer.parseInt(request.getParameter("numItems"));
		} catch(NumberFormatException nfe) {}
%>
<jsp:setProperty name="item" property="itemID" value='<%= request.getParameter("itemID") %>' />
<jsp:setProperty name="item" property="numItems" value='<%= numItemsOrdered %>' />
<%
		if(numItemsOrdered > -1){
			System.out.println("update");
			cart.updateItem(item.getItemID(),numItemsOrdered);
		}else if( !item.getItemID().equals("unknown")){  
			System.out.println("Adding");
			cart.addItem(item.getItemID());
		}
%>
<BR>
<%
		System.out.println(cart.getSize());
		if(cart.getSize()==0){
%>
<H2><I>No items in your cart...</I></H2>
<%
		} else{
%>
<TABLE BORDER=1>
<TR CLASS="COLORED">
  <TH>Item ID<TH>Item Name<TH>Unit Price<TH>Number Ordered<TH>Total Price
<%
			for(int i=0;i<cart.getSize();i++){
				mybean.Catalog x = cart.getCatalog(i);
%>
<jsp:setProperty name="item" property="itemID" value="<%= x.getItemID() %>"/>
<jsp:setProperty name="item" property="numItems" value="<%= x.getNumItems() %>"/>
<TR ALIGN="RIGHT">
  <TD><jsp:getProperty name="item" property="itemID" />
  <TD><jsp:getProperty name="item" property="name" />
  <TD>$<jsp:getProperty name="item" property="itemCost" />
  <Form method ="POST">
	<Input Type ="Hidden" name="itemID" value= '<jsp:getProperty name="item" property="itemID" />' />
  <TD>
	<Input Type = "Text" name="numItems" size=3 value='<jsp:getProperty name="item" property="numItems" />' />
	<Small> <Input Type="Submit" value="Update Order" /> </Small>
  </Form>
  <TD>$<jsp:getProperty name="item" property="totalCost" />

 <%
			}
		}
 %>
</TABLE>   
<FORM ACTION="TVPage.jsp" METHOD= "POST">
	<Small> <Input Type="Submit" value="TVs" /> </Small>
</FORM>    
<FORM ACTION="PhonePage.jsp" METHOD= "POST">
	<Small> <Input Type="Submit" value="Phones" /> </Small>
</FORM>    
<FORM ACTION="TabletsPage.jsp" METHOD= "POST">
	<Small> <Input Type="Submit" value="Tablets" /> </Small>
</FORM>    
<FORM ACTION="LaptopPage.jsp" METHOD= "POST">
	<Small> <Input Type="Submit" value="Laptops" /> </Small>
</FORM>    
<FORM ACTION="Checkout-Form.jsp" METHOD= "POST">
	<Small> <Input Type="Submit" value="Checkout" /> </Small>
</FORM>  
</CENTER></BODY></HTML>
<%
	}
%>