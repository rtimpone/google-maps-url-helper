Google Maps URL Helper
======================

This is a simple helper class to generate iOS Google Maps urls.  The file is written in Swift and has two static functions.  The first checks the device to see if it can open a Google Maps url.  The second creates a Google Maps url with a start location, destination location, and transportation mode.  These parameters are all optional.  The function also takes a boolean to indicate whether a callback button should be added when google maps is opened.  For more info on how callbacks work in Google Maps, see the documentation.  

This helper class was created as part of a biking app I'm working on.  It includes some new Swift features I was playing around with such as nested functions, string interpolation, optionals, and string based enums.  

The iOS Google Maps URL scheme documentation can be found here: https://developers.google.com/maps/documentation/ios/urlscheme 
