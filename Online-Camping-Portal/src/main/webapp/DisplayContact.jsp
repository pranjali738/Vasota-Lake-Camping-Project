<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.lake.entities.Contact" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Display Contact</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
<body>

<%@ include file="AdminHeader.jsp" %>



<div class="container" style="margin-top:100px;" > 
<h2 class="text-center mb-4 text-primary"> Contacts Information </h2> 

<!-- Search Logic -->


<table class="table table-hover table-bordered text-center ">
<thead > 
	<tr class ="table-primary">
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Message</th>
    </tr>
</thead>

<tbody>
<%
 	List<Contact> contacts =  (List<Contact>) request.getAttribute("Contact");
	
	if(contacts==null ||contacts.isEmpty())
	{
%>
	<tr>
				<td colspan="3" class="text-danger">
					No Data Found !!
				</td>
		</tr>
		
<% 
	}
	else
	{
	
		for(Contact C : contacts)  // S-->[101,AAA, 60]
		{
			String name = C.getName();
			String email = C.getEmail();
			String mess = C.getMessage();
%>
			<tr >
				<td> <%= name %> </td>
				<td> <%= email %> </td>
				<td> <%= mess %></td>
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