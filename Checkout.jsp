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
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
      Confirmation Page</TABLE>
<jsp:useBean id="item" class="mybean.Catalog" />
<jsp:useBean id="cart" class="mybean.ShoppingCart" scope="session"/>
<jsp:useBean id="database" class="mybean.Database" scope="session"/>
<BR>
Congratulations on your Order <%= request.getParameter("firstname")%> <%= request.getParameter("lastname")%>.
<TABLE BORDER=1>
<TR CLASS="COLORED">
  <TH>Item ID<TH>Item Name<TH>Unit Price<TH>Number Ordered<TH>Total Price
<%
	double total = 0;
	for(int i=0;i<cart.getSize();i++){
		mybean.Catalog x = cart.getCatalog(i);
		total += x.getTotalCost();
%>
<jsp:setProperty name="item" property="itemID" value="<%= x.getItemID() %>"/>
<jsp:setProperty name="item" property="numItems" value="<%= x.getNumItems() %>"/>
<TR ALIGN="RIGHT">
  <TD><jsp:getProperty name="item" property="itemID" />
  <TD><jsp:getProperty name="item" property="name" />
  <TD>$<jsp:getProperty name="item" property="itemCost" />
  <TD><jsp:getProperty name="item" property="numItems" />
  <TD>$<jsp:getProperty name="item" property="totalCost" />
<%
	}
%>
<TR ALIGN="Right">
  <TD>
  <TD>
  <TD>
  <TD> Total Cost
  <TD> $<%= total %>
 </TABLE>
 <BR>
<%
	Calendar today= Calendar.getInstance();
	today.add(Calendar.DATE, 14);
	Date date = today.getTime();             
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	String date1 = format1.format(date);  
%>
Your order will be delivered by: <%= date1 %><BR>
 Your order will be shipped to:<BR>
<%= request.getParameter("address") %><BR>
<%= request.getParameter("city") %>,<%= request.getParameter("state") %><BR>
<%
	String lastFour= request.getParameter("cardnum");
	lastFour =lastFour.substring(lastFour.length()-4,lastFour.length());
	String lastname = request.getParameter("lastname");
	lastname = lastname.substring(0, 3);
	String confNum = lastname + lastFour;
%>
The Credit with the last digits <%= lastFour%> has been charged<BR>
Your confirmation number is <%= confNum %>

<%
	database.addOrder(confNum,cart);
%>
</CENTER></BODY></HTML>