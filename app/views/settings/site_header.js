$('#headerimage').html("<%= j render 'settings/site_header' %>");
$('#bar').html('<div class="bar" style="width:0%"></div>');
$('html, body').animate({ scrollTop: 0 }, 0);
