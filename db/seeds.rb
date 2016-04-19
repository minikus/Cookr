

User.destroy_all
u1 = User.create :first_name => 'Carmen', :last_name => 'Carmen', :email => 'carmen@ga.com', :password => 'chicken',  :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image => 'https://scontent-syd1-1.xx.fbcdn.net/hphotos-xfp1/v/t1.0-9/10259697_10154837861315284_4629627545294386790_n.jpg?oh=dc38d0314feac0f30e9d2b79f528ca1f&oe=57AEAD87'
u2 = User.create :first_name => 'Rany', :last_name => 'Azevedo', :email => 'rany@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image => 'https://avatars.slack-edge.com/2016-01-18/18750769953_1f2731af6aae4adf0588_512.jpg'
u3 = User.create :first_name => 'Sam', :last_name => 'Humphreys', :email => 'sam@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image =>
'https://avatars.slack-edge.com/2016-02-01/19978362099_6bf9a9f5a5a24c4b1984_512.jpg'
u4 = User.create :first_name => 'Wilco', :last_name => 'Minidaru', :email => 'admin@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :admin => true, :phone => "0423 009 884", :image => 'https://scontent-syd1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/1903006_670971409634100_1134469841117217300_n.jpg?oh=3bc7c942b701caf4e34d0b2caa555fe4&oe=57BB0887'
u5 = User.create :first_name => 'Molly', :last_name => 'Thedog', :email => 'Molly@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image => 'https://media.giphy.com/media/RHDL2c1NCMu2c/giphy-tumblr.gif'
u6 = User.create :first_name => 'Joel', :last_name => 'Turnbull', :email => 'joel@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'https://files.slack.com/files-pri/T0351JZQ0-F10TTR59T/pasted_image_at_2016_04_15_02_48_pm.png', :bio => "I can cook anything and everythere ever listed on a menu. Just name it. ", :rate => 250
u7 = User.create :first_name => 'Jack', :last_name => 'Jeffress', :email => 'jack@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/2283/thumb_BLACK_WHITE__2038_.jpg', :bio => "Famous for cooking rabbits, horses, camels, and donkeys. Grey up with a pack of wolves. Foundation of cooking was from hunting wild rabbits and sourcing raw herbs.", :rate => 50
u8 = User.create :first_name => 'Badger', :last_name => 'Barnaby', :email => 'badger@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://s3-ap-southeast-2.amazonaws.com/gipht/giphs/gifs/000/000/018/original/data?1459475072', :bio => '10+ years experience washing dishes in an underground Thai resteraunt in Chinatown', :rate => 3.99

u9 = User.create :first_name => 'Bobo', :last_name => 'Humperdink', :email => 'bobo@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :phone => "0423 009 884", :image => 'http://www.elitetraveler.com/wp-content/uploads/2013/07/Eric-Ripert.jpg'
u10 = User.create :first_name => 'Jimmy', :last_name => 'Thomas', :email => 'jimmy@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://gowestgourmet.com.au/wp-content/uploads/2014/04/chefs4.jpg'
u11 = User.create :first_name => 'Fifi', :last_name => 'Turnbull', :email => 'fifi@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://lochvillagefoodandwinefestival.com.au/wp-content/uploads/2014/08/chef.jpg', :bio => "I can cook anything and everythere ever listed on a menu. Just name it. ", :rate => 250
u12 = User.create :first_name => 'Billy', :last_name => 'Idol', :email => 'billy@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://www.profitableplantsdigest.com/wp-content/uploads/2012/08/SYH-Chef.jpg', :bio => "Famous for cooking rabbits, horses, camels, and donkeys. Grey up with a pack of wolves. Foundation of cooking was from hunting wild rabbits and sourcing raw herbs.", :rate => 50
u13 = User.create :first_name => 'Gigi', :last_name => 'Barnaby', :email => 'gigi@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://www.gatewaygourmet.com/blog/wp-content/uploads/2014/11/f_pastry_chef_1.jpg', :bio => '10+ years experience washing dishes in an underground Thai resteraunt in Chinatown', :rate => 50
u14 = User.create :first_name => 'Greg', :last_name => 'Tchinkins', :email => 'gerg@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://www.chaine.co.uk/media/static/young_chefs_competition.jpg', :bio => "Famous for cooking rabbits, horses, camels, and donkeys. Grey up with a pack of wolves. Foundation of cooking was from hunting wild rabbits and sourcing raw herbs.", :rate => 50
u15 = User.create :first_name => 'Gloria', :last_name => 'Barnaby', :email => 'gigi2@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://finedininglovers.cdn.crosscast-system.com/BlogPost/xl_7361_TP-LANSHU-CHEN-finedininglovers.jpg', :bio => '40 years experience at a vietnamese family resteraunt', :rate => 40


Menu.destroy_all

m1 = Menu.create :title => 'Japanese 8 course dinner', :cuisine => "Japanese", :pricePP => 45, :description => 'spicy mango chicken curry, has bits of peas and carrots inside', :vego => false, :gluten_free => false, :image => "http://bandnewsfmcuritiba.com/wp-content/uploads/2013/08/08-16-kandoo-1.jpg"
m2 = Menu.create :title => 'Asian dinner with 5 variations of fried Rice', :cuisine => "Chinese", :pricePP => 8.50, :description => 'epic chili Taiwanese fried rice, there is baby shrimps, brocolo, mince beef, shallots, 2 whole garlics, and egg in the mix. Very tasty. Must pickup before 10pm' , :vego => false, :gluten_free => false, :image => "https://bitememad.files.wordpress.com/2015/10/dsc_0001.jpg?w=672&h=372&crop=1"
m3 = Menu.create :title => 'Italian 5 course menu', :cuisine => "Italian", :pricePP => 30, :description => 'I have a huge box of canned bake beans. Come eat them with me, or feel free to take some home.', :vego => true, :gluten_free => true, :image => "http://blog.dbandeja.com.br/wp-content/uploads/2013/07/1107-Festa-Italiana1-600x360.jpg"
m4 = Menu.create :title => 'Brazilian Dinner', :cuisine => "Brazilian", :pricePP => 45, :description => 'Brazilian Barbecue ', :vego => false, :gluten_free => false, :image => "https://media.timeout.com/images/103086319/617/347/image.jpg"
m5 = Menu.create :title => 'French Menu', :cuisine => "French", :pricePP => 45, :description => 'French Crepes' , :vego => false, :gluten_free => false, :image => "http://previews.123rf.com/images/dmykhailov/dmykhailov1112/dmykhailov111200098/11770860-French-style-crepes-with-banana-chocolate-sauce-and-sugar-powder-Stock-Photo.jpg"
m6 = Menu.create :title => 'Tradidional Mexican Dinner', :cuisine => "Mexican", :pricePP => 25, :description => 'NAchos, Chili, Burritos...', :vego => true, :gluten_free => true, :image => "http://elcharrorestaurantac.com/wp-content/uploads/2014/08/DeluxeNachos.jpg"
m7 = Menu.create :title => 'Tradidional Spanish Dinner', :cuisine => "Spanish", :pricePP => 45, :description => 'All tapas', :vego => false, :gluten_free => true, :image => "http://blog.descubraomundo.com/wp-content/uploads/2014/05/madri_tapas.jpg"

u10.menus << m1
u11.menus << m2
u12.menus << m3
u13.menus << m4
u14.menus << m5
u15.menus << m6
u15.menus << m7



dates = [" 2011-06-11T21:20:44+09:00",
  " 2016-06-06-11T21:20:44+09:00",
  " 2016-03-11T19:20:44+09:00",
  " 2011-03-11T18:20:44+09:00",
  " 2011-03-11T17:20:44+09:00"]

suburb = ["Sydney", "Pyrmont", "Marickville", "Newtown", "Darlinghurst", "Surry Hills", "Glebe", "Hornsby", "Redfern"]
address = ["22 Saunders St", "54 George St.", "102 Happy Road", "95 Elizabeth Road", "5 Thread Ln"]
description = ["House Party at Sydney Penthouse", "Garage Dinner Party with Local doggie owners", "Parkside Luncheon", "Birthday Lunch at my house", "Happy Dinner get together"]
guests = [4,6,8,9,12,20,35]
confirm = [true, false]

# Event.destroy_all
# (1..40).to_a.each do |i|
#   Event.create :suburb => suburb.sample, :address => address.sample, :time => dates.sample, :user_id => User.all.pluck(:id).sample, :menu_id => Menu.all.pluck(:id).sample, :chef_id => User.where(:chef => true).pluck(:id).sample, :description => description.sample, :guests => guests.sample, :confirm => confirm.sample
# end

Review.destroy_all
