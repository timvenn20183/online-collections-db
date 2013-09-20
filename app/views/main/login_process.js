$('#left-menu').html("<%=j render :partial => 'settings/options' %>");
$('#center').html("<%=j render :partial => 'settings/index' %>");
history.pushState({}, '', '/settings');

