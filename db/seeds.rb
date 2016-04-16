

User.destroy_all
u1 = User.create :first_name => 'Carmen', :last_name => 'Carmen', :email => 'carmen@ga.com', :password => 'chicken',  :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image => 'https://scontent-syd1-1.xx.fbcdn.net/hphotos-xfp1/v/t1.0-9/10259697_10154837861315284_4629627545294386790_n.jpg?oh=dc38d0314feac0f30e9d2b79f528ca1f&oe=57AEAD87'
u2 = User.create :first_name => 'Rany', :last_name => 'Azevedo', :email => 'rany@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image => 'https://avatars.slack-edge.com/2016-01-18/18750769953_1f2731af6aae4adf0588_512.jpg'
u3 = User.create :first_name => 'Sam', :last_name => 'Humphreys', :email => 'sam@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image =>
'https://avatars.slack-edge.com/2016-02-01/19978362099_6bf9a9f5a5a24c4b1984_512.jpg'
u4 = User.create :first_name => 'Wilco', :last_name => 'Minidaru', :email => 'admin@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :admin => true, :phone => "0423 009 884", :image => 'https://scontent-syd1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/1903006_670971409634100_1134469841117217300_n.jpg?oh=3bc7c942b701caf4e34d0b2caa555fe4&oe=57BB0887'
u5 = User.create :first_name => 'Molly', :last_name => 'Thedog', :email => 'Molly@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => false, :phone => "0423 009 884", :image => 'https://media.giphy.com/media/RHDL2c1NCMu2c/giphy-tumblr.gif'
u6 = User.create :first_name => 'Joel', :last_name => 'Turnbull', :email => 'joel@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'https://files.slack.com/files-pri/T0351JZQ0-F10TTR59T/pasted_image_at_2016_04_15_02_48_pm.png', :bio => "I can cook anything and everythere ever listed on a menu. Just name it. ", :rate => 250
u7 = User.create :first_name => 'Jack', :last_name => 'Jeffress', :email => 'jack@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'https://ga-students.slack.com/files/badger/F10TJ7XHA/pasted_image_at_2016_04_15_02_58_pm.png', :bio => "Famous for cooking rabbits, horses, camels, and donkeys. Grey up with a pack of wolves. Foundation of cooking was from hunting wild rabbits and sourcing raw herbs.", :rate => 50
u8 = User.create :first_name => 'Badger', :last_name => 'Barnaby', :email => 'badger@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :chef => true, :phone => "0423 009 884", :image => 'http://s3-ap-southeast-2.amazonaws.com/gipht/giphs/gifs/000/000/018/original/data?1459475072', :bio => '10+ years experience washing dishes in an underground Thai resteraunt in Chinatown', :rate => 3.99


Menu.destroy_all

m1 = Menu.create :title => 'Japanese 8 course dinner', :cuisine => "Japanese", :pricePP => 45, :description => 'spicy mango chicken curry, has bits of peas and carrots inside', :vego => false, :gluten_free => false, :image => "http://www.bobturf.org/jeannie/images/JaipurPalace_MangoChickenCurry.jpg"
m2 = Menu.create :title => 'Asian dinner with 5 variations of fried Rice', :cuisine => "Chinese", :pricePP => 8.50, :description => 'epic chili Taiwanese fried rice, there is baby shrimps, brocolo, mince beef, shallots, 2 whole garlics, and egg in the mix. Very tasty. Must pickup before 10pm' , :vego => false, :gluten_free => false, :image => "http://f.tqn.com/y/chinesefood/1/W/x/T/1/ground-beef-fried-rice-resized.jpg"
m3 = Menu.create :title => 'Italian 5 course menu', :cuisine => "Italian", :pricePP => 5, :description => 'I have a huge box of canned bake beans. Come eat them with me, or feel free to take some home.', :vego => true, :gluten_free => true, :image => "http://i.dailymail.co.uk/i/pix/2015/09/13/23/2C480A5700000578-0-image-m-3_1442182728997.jpg"
m4 = Menu.create :title => 'Japanese 8 course dinner', :cuisine => "Japanese", :pricePP => 45, :description => 'spicy mango chicken curry, has bits of peas and carrots inside', :vego => false, :gluten_free => false, :image => "http://www.bobturf.org/jeannie/images/JaipurPalace_MangoChickenCurry.jpg"
m5 = Menu.create :title => 'Asian dinner with 5 variations of fried Rice', :cuisine => "Chinese", :pricePP => 8.50, :description => 'epic chili Taiwanese fried rice, there is baby shrimps, brocolo, mince beef, shallots, 2 whole garlics, and egg in the mix. Very tasty. Must pickup before 10pm' , :vego => false, :gluten_free => false, :image => "http://f.tqn.com/y/chinesefood/1/W/x/T/1/ground-beef-fried-rice-resized.jpg"
m6 = Menu.create :title => 'Italian 5 course menu', :cuisine => "Italian", :pricePP => 5, :description => 'I have a huge box of canned bake beans. Come eat them with me, or feel free to take some home.', :vego => true, :gluten_free => true, :image => "http://i.dailymail.co.uk/i/pix/2015/09/13/23/2C480A5700000578-0-image-m-3_1442182728997.jpg"


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

Event.destroy_all
(1..40).to_a.each do |i|
  Event.create :suburb => suburb.sample, :address => address.sample, :time => dates.sample, :user_id => User.all.pluck(:id).sample, :menu_id => Menu.all.pluck(:id).sample, :description => description.sample, :guests => guests.sample, :confirm => confirm.sample
end

rating = [2,3,4,5]
review = ["Amazing!!!", "Could be better", "Best Dinner party ever becase the food was awesome", "Very weird but pleasant", "FABULOUS!!"]
Review.destroy_all
(1..20).each do |i|
  Review.create :user_id => User.all.pluck(:id).sample, :target => User.all.pluck(:id).sample, :rating => rating.sample, :review => review.sample
end
