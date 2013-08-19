$('#<%=@item.slug%>_inner').html("<%=j render :partial => 'items/details_brief', :locals =>{:item => @item } %>");
