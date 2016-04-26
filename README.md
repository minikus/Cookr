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


Messageshow.js breakdown
========================

retrieve
--------
##getUserId:
fires an ajax request to return the id of the current user
##getAllUsers:
fires an ajax request which returns the id, first_name and image url for all users, and then calls the getAllMessages function.
##getAllMessages:
fires an ajax request which returns all of the messages to or from the current user. It saves all the incoming messages as incomingMessages, and then calls checkUnreadMessages.

filterMessages
--------------
##checkUnreadMessages:
iterates through incomingMessages and puts the id of any unread messages in a variable unreadConvos. If there are unread messages it changes the messages link in the nav bar accordingly. It then calls checkIfRefresh.
##checkIfRefresh:
It checks to see if you are already looking at a conversation, and if not it will call getConversations. If you are looking at a conversation history it will check to see if the number of conversations has changed since the last time it checked, and if it has it will call getConversations and displayMessages for whoever the messageFocus is.
##getConversations:
This function goes through all of the messages relating to the current user, works out who the message counterpart is (ie, who a message is from or who a message was to). If the length of conversations has changed since 
