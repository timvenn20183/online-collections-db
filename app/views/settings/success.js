$('#notice_bar').html('<div class="alert alert-success">Your updates have been saved.</div>');
$('#main_header').html("<%= j render 'main/navigation' %>");
$('html, body').animate({ scrollTop: 0 }, 0);
