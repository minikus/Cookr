# Cookr application

Cookr is a chef booking application that allows users/hosts to create events, and book chefs for private events. On the homepage and navigation, users can message other chefs, create new events where then can link chefs and their available menus, and browse through different menus and chefs, which are all linked to each other when you go into each element.

When browsing through the index of chefs, users are able to see the average rating of chefs. Within each chef profile, the chef's menus will be listed, and users can review each chefs and give them a rating between 1-10. Only admins or users that wrote the comment will be able to delete the review. The reviews are create via. an ajax request, therefore the page does not need to be refreshed to a post.

Inside each menu profile, users can see which chef created the menu, the price per person, and a link to create a even using this menu. Using this link, the user will be brought to new event form with the previously chosen chef and menu pre-populated in the form.

Inside the Messages function, users can direct message multiple users. Using ajax requests and 3 seconds live polling, the users can also see and respond messages to other users in real time without refreshing the page. Messages that has been received but not yet red from other users will appear in red, and the word Messages in the nav bar will appear in red with the number of unread messages shown.

> ## Models
* Menus
* Users
* Reviews
* Messages
* Event

> ## Gems
* Cloudinary (used to upload profile image and menu images)
* Bootstrap (Used for CSS styling)
* Slick carousel (used for sliding images on the homepage)
* Becrypt


> Ruby version 2.3.0
