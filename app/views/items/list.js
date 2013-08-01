$("#center").html("<%= j render :partial => 'items/list', :locals => {:items => @items} %>");
