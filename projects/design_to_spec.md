# Project 1: Design to Spec

## I. Overview
Application developers commonly work in a team with others such as Content Strategists, User Experience designers, and Graphic Artists.  For this project, you are being asked to create this application based on a mockup animation.  Your Goal is to use Flutter to make the animation a reality.

## II. Requirements
You are to recreate this application:
![App Mockup](images/design_to_spec-demo.gif)

### The functional requirements are:

* AppBar should have an `About` button that shows a popup with credits.
* The `background` is static, but it could scroll if desired, that's up to you.
* The `oak tree` image has a transparent background, you will need to create the gradient yourself, DO NOT MODIFY the image.
* Each item text box needs to scroll if the information is too large.
* Each item (ex, planks), needs to be clickable and show a popup with more information. The text should also be scrollable if the information does not fit.

This is decidedly __NOT__ a Project for you to exercise your *design* creativity. (maybe your coding creativity, however)

You will be graded on how close you are able to get your page to the appearance of this demo animation.

Source image files, fonts, palette, and reference images/animations to work with are available here: [flutter_design_to_spec_assets.zip](https://github.com/lucidchin/IGME-340-Shared/blob/main/projects/support_files/flutter_design_to_spec_assets.zip)

This is an individual project, and since everyone is doing the EXACT SAME design, you should guard your code carefully so that it is not made available to others.  There is enough ambiguity in the design and the ways that it gets implemented that everyone's project can certainly be unique.

The application, at this time, does not need to be responsive and the target devices will be in portrait mode. The application will be tested in the Android Emulator.

QUESTIONS?  It is not uncommon to need to ask questions of the Customer, or design team so that you get the clearest understanding of the spec.  For the purposes of this assignment, the Customer/Design Team  will be your course Instructor and spec clarification questions should be asked in YOUR SECTION'S Slack channel. Be careful not to share your (complete or mostly complete) code to the rest of the class.

If you run into trouble and wish to seek help with a specific question that requires the sharing of your code, do so through a DM to your Instructor.

## III. NON Requirements
- You do not need to guess at page colors.  They are all (except for white and black) specified in included color palette.  
- The fonts have been provided for you, but you are free to use similar fonts of your choosing. 
- The PickAxe SVG has been provide for you, so no need to find another one, but you are free to find a substitute if you desire.
- It is not necessary to crop the images in exactly the same way as the original images, however, we are providing the original images so that they can match more easily.  
- You should use the same heading texts that we provided, however you do not need to use the same placeholder text.  Use VS Code or another tool to generate "Lorem Ipsum" text for you to hold the spaces open.  Tip:  In VS Code, just type `loremNN` where NN is a number of words that you want followed by Enter, and it will generate a block of text for you. Likewise, you can use the [Ipsum.com](https://lipsum.com/feed/html) website to generate text.

## IV: Submissions
- Use the `flutter clean` option in a Terminal winodw before zipping up your project for submission. Upload to the assignment on myCourses (when it is created).