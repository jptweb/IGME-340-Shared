# Project 2 - Web Service Application

## I. Overview

For this project you are creating a Flutter Application that utilizes a Web service.
- Your goal is to create an application that is easy to use, functional, and aesthetically pleasing.
- Ideally the experience will run in either the Android Simulator or IOS Simulator. 
- The objective of this project is for you to demonstrate your mastery of Flutter and Dart programming. 
- You will be evaluated on:
    - how well you met the requirements of the assignment.
    - the quality of the experience you create.
    - the soundness of your programming. 
    
## II. Requirements

### A. Functional
1. Use one of a specified set of APIs or one of your choosing to create a similar experience to [GIF Finder](../reference/network/giphy-api-setup.md) that meets the requirments.

#### Some Preselected Options
- You may get familiar with and use one of the APIs from this list:
  - Because APIs change from time to time this is not a guarantee that these APIs will be smooth sailing, but they have been shown to work.
    - Dog API*: https://dog.ceo/dog-api/
    - Jikan Unofficial MyAnimeList API*: https://jikan.docs.apiary.io/
    - The Amiibo API*: http://www.amiiboapi.com
        - *Starters for the above 3 APIs can be found in the [web-service-app-starters.md](https://github.com/tonethar/IGME-235-Shared/blob/master/tutorial/web-service-app-starters.md)
    - REST Countries: https://restcountries.eu/
    - TheMealDB API: https://www.themealdb.com/api.php
    - There are other API's listed here:
        - [https://github.com/public-api-lists/public-api-lists](https://github.com/public-api-lists/public-api-lists)
        - [https://www.freecodecamp.org/news/public-apis-for-developers/](https://www.freecodecamp.org/news/public-apis-for-developers/)
  - You can make pretty much any experience you like as long as it captures a user request, gets data from the API, and then presents it back in a way that is useful or fun, easy to understand, and fairly well organized. 
        
#### Choose Your Own API Option
- This choice is for the more adventurous students who want to try to go beyond the well-trodden paths and look for an alternative API that appeals to them.
- But if you wish to make this choice, you must be able to prove that you can access the API by the due date of the [PROPOSAL](p2_web_service_application_proposal.md).
- You must also be able to keep your project to a reasonable scope that is roughly equivalent to the other assignments.
- Be careful with your own API Choice, make sure you don't run into any CORS issues.

### A. Functional - continued.
2. You will save the last term searched by the user in the device's shared_preferences. 
    - we are going to test this capability by typing in a search term, doing a search, and then closing the application. When we re-open the app, the user's last search term should still be in the field.
    - ideally this will also be true of the other controls, but we won't require it.
    - if there isn't a 'search term' to save in your project, then save something else and be sure to document what is saved from visit to visit.

3. Required controls - there will be a MINIMUM of 3 controls that a user can use to filter and display the results. Search buttons or similar don't count towards the 3 controls. For example, GIF Finder has these controls:
    - a search button (which doesn't count)
    - a search term field that the user types into
    - a pulldown that the user can use to limit the number of results

  -  **So you will need at least one additional kind of control. What kind of control to use depends on what parameters the web service will allow you to search it on. Here are some ideas:**
  
     - a **rating** pulldown - if we had this on the GIPHY HW then a user would be able to choose between viewing "G" and "PG" videos for example
     - a **sort by** pulldown to allow the user to view the results sorted A->Z, Z->A, by date, etc 
     - a **date** chooser to filter the results by date - a Datepicker Widget would be an excellent choice here.
     - **next** and **previous** buttons - another really nice option is to allow the user to "page" through large numbers of results. In the GIPHY HW did you notice that we always get the same 100 "cat" GIFs back when we search?
       - This is because there are ***thousands*** of cat GIFs on GIPHY, and if we don't otherwise specify we will always get them returned from the web service starting at index 0, which means we always get the first 100 (index 0-99) back.
       - We can instead write code that requests a higher starting index.
      
### B. Design & Interaction
- Pleasing graphic design:
  - Show me the cool things you can do in Flutter. 
  - The interface does not closely resemble the GIPHY homework's UI
- Widgets are well labeled and follow interface conventions, for example:
  - radio buttons are for mutually exclusive options, checkboxes are for when you want to let the user choose *multiple* options.
  
- Users should be able to figure out how to use the app with minimal instruction:
  - be sure to provide instruction and hints if necessary
- User errors must be handled gracefully:
  - for example, if the user forgets to type in a search term before clicking the Search button, the app should tell the user something like "Please enter a search term first"
- Users must know what *state* the app is in at all times:
  - for example, when they click the search button, there should some indication that a search is happening:
    - text that says "Searching for 'Tacos' near you" and so on
    - a "spinner" or other "indeterminate progress" animation.    

### D. Code Conventions
- D.R.Y. - Don't Repeat Yourself. Repeated blocks of nearly identical code must be factored out and placed in a separate function.
- Take advantage of separating your widgets out into their own classes to make managing the Widget tree easier.
- Don't be afraid to create separate .dart files for specific functionality.
- Variable and function names must follow a standard, ex, CONSTANTS, Classes, normalVariables. Make sure variables are easy to understand.
- Well-commented code. Each and every function gets a comment indicating what it does.

## III. Milestones
- Project proposal with mockup - see myCourses for due date/time. 
- Prototype - You should have a working version of your project for others to provide feedback on.  At a bare minimum, you should demonstrate functionality of your API call with results displayed on screen.  see myCourses for due date/time. 
- Final project deliverable - see myCourses for due date/time. 

## IV. Documentation
- Include an About Dialog or page with Documentation where you document your process, cite any sources, tell me where to find anything special you want me to see, and also explain how you met the requirements. 

## V. Grading
The grading rubric for this project is visible in myCourses.  You should look it over carefully.  Find it by going to the "Assignments" section and clicking through to the "Project 2 Final Submission" dropbox.

Reminder - 'A' -level work means doing college-level work that goes beyond what we did in class. (You should be able to see this reflected in the online Rubric). Meeting only the base requirements will most likely only earn you a B.

## VI. Submission
- Perform a `flutter clean`, ZIP and post the completed project and documentation page to to the mycourses dropbox. Be sure to check the Submission Guidelines for more details!

## Need Help?
- Don't forget I added extensive documentation in the references area about how to [connect to Giphy](../reference/network/giphy-api-setup.md). Much of the code you need may end up being similar in nature to this; but the way you interact and build it will be different. In a sense we are providing you with much of the ingredients; but you need to creatively assemble and build the meal.
