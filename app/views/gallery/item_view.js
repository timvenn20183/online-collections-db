$('#overlay_box').html("<%=j render :partial => 'gallery/item_view' , :locals => {:item => @item} %>");
$('#myModal').modal('show');

