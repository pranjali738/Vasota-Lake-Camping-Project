<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.lake.entities.BookingEntities" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Display Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
<body>

<%@ include file="AdminHeader.jsp" %>





<div class="container" style="margin-top:100px;" > 
<h2 class="text-center mb-4 text-primary"> Bookings Information </h2> 

<!-- Search Logic -->



<!--  Table Logic -->

<table class="table table-hover table-bordered text-center ">
<thead > 
	<tr class ="table-primary">
      <th scope="col">Id</th>
      <th scope="col">NAME</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">No.Persons</th>
      <th scope="col">No.Kids</th>
      <th scope="col">arrival Date</th>
      <th scope="col">Departure Date</th>
      <th scope="col">Tent Name</th>
      
    </tr>
</thead>

<tbody> 
<%
	List<BookingEntities> L =  (List<BookingEntities>) request.getAttribute("listofstudents");

	if(L==null || L.isEmpty())
	{
%>

			<tr>
				<td colspan="9" class="text-danger">
					No Data Found !!
				</td>
			</tr>
	
		
<% 
	}
	else
	{
		
		for(BookingEntities S : L)  // S-->[101,AAA, 60]
		{
			int id = S.getId();
			String name = S.getName();
			String email = S.getEmail();
			long phone = S.getPhoneNo();
			int persons = S.getNoPerson();
			int kids = S.getNoKids();
			String arrival = S.getArrival_date();
			String depture = S.getDeparture_date();
			String tentName = S.getTent_name();			
%>
			<tr>
				<td> <%= id %> </td>
				<td> <%= name %> </td>
				<td> <%= email %> </td>
				<td> <%= phone %></td>
				<td> <%= persons %></td>
				<td> <%= kids %></td>
				<td> <%= arrival %></td>
				<td> <%= depture %></td>
				<td> <%= tentName %></td>
				
			</tr>
		
<%	
		}//for
	}//else

%>

</tbody>
</table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>