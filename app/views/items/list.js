$("#center").html("<%= j render :partial => 'items/list', :locals => {:items => @items} %>");
$('html, body').animate({ scrollTop: 0 }, 0);

