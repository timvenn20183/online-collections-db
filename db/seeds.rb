puts "Generating default site test"
newsite = Site.new
    newsite.code = "ocd"
    newsite.title = "Your site title"
    newsite.header = "Your site header"
    newsite.email =  "tim@nevyn.co.za"
    newsite.password = 'bW5xNHVaZEYyeFdReDRpMzlnaXZmQT09LS1CcDlLS1IwVUs5VkVPdFhDUTZwTkN3PT0=--bc0103344510fa98bb8402de4cfef1a6b618fab0'
newsite.save
puts "Done."
