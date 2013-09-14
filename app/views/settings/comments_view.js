$('#new_<%=Digest::MD5.hexdigest(@comment.id.to_s)%>').hide();
$('#overlay_box').html("<%=j render :partial => 'settings/comments_view' %>");
$('#myModal').modal('show');
