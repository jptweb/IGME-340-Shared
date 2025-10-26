> **Project Scope & Success:** These projects are substantial, but manageable with proper planning. I've provided extensive code examples in our [Reference Manual](../reference/README.md), including complete implementations like the [shared preferences guide](../reference/data-persistence/shared-preferences.md). 
>
> **Time Management:** Plan for 6 to 9 hours of outside work weekly—standard for a 3-credit course. [I'm not making this up :)](https://www.humboldt.edu/sites/default/files/learning-center/2024-11/studyratiorecommendations.pdf). Starting early gives you time to create A-quality work and impressive portfolio pieces. Unlike unpredictable exams, you control your project outcomes through consistent effort. Last-minute starts typically lead to poor results and unnecessary stress.

# Project 3 - Roll-Your-Own Flutter App

## I. Overview
*Using Flutter, create a Game or App*:
- For this project you are creating a Flutter game or experience for Mobile platforms, Android or IOS (ideally both).
- You will be proposing an idea and describing it on a nicely formatted "proposal/about" document which will include the "game treatment" elements described below: 

The project will be very open and it will be up to you to decide what technologies/packages to implement, below are some examples:
- **Flame Engine**
- GPS / Maps
- Native Camera
- Flutter Casual Game Kit
- **Firebase** 
- Advanced State Management, ex: **Go Router**, **BLoC**, **Riverpod**
- Responsive Layout
- Other package not discussed or shown in class.
  
Example projects:
- Flutter Game
- Utility Application
- Enhanced API based application (Enhancing Project 2 or something new).

## II. Goal
- Your goal is to create an app or game that is easy to use, functional, and aesthetically pleasing.

- Ideally the experience will run in all platforms Flutter can run on, but the bare minimum will be the Android Simulator or IOS Simulator. 

- You will be evaluated on:
    - your creativity
    - the quality of the experience you create
    - the soundness of your programming.
    - how far you went beyond what we did in class, as described below

## III. Requirements

### A. Functional
- Your game or app should do something useful, and be easy to use.
- The functionality goes beyond what we have done in similar in-class examples and exercises.
- Input validation (if applicable)
- Custom Splash Screen and Icon, Good App Name.
- Use of Shared_Preferences to save and load data.
- Should have more than 1 page, at a minimum your app and an about page.
- No App crashing.
- Documentation Page, accessible from within your app.
  

### B. Design & Interaction
- Pleasing graphic design
- Widgets are well labeled
- User should be able to figure out how to use the app with minimal instruction (and be sure to provide instruction if necessary!), and user errors are handled gracefully.
- While it doesn't need to be responsive, it should, at a minimum, look good on a portrait oriented device. 

### C. Media
- Images are properly optimized for mobile delivery - e.g. No grossly oversize images (ex: 3000x3000).
- Sound is used to enhance the experience
- Utilize a custom font.


### D. Code Conventions
- Utilize at least one dart `class` of your own creation
- Be type aware, don't just use `var`.
- D.R.Y. - Don't Repeat Yourself. Repeated blocks of nearly identical code should be factored out and placed in a separate function.
- Separation of Concerns. Have separate .dart files for your classes, utility functions, and main code.
  - Learn more and see examples of this here: [Declarative UI Architecture: Data Controls the UI](../reference/state-management/declarative-ui-architecture.md). Another good way to implement this could be by using the Provider Package which we covered in the [10A Notes](../weekly/10A.md).
- Use proper variable and function names, do NOT just use a single letter (exceptions for minor local variables inside loops).
- Well-commented code. Each and every function gets a comment indicating what it does
- Delete or comment out your `print` statements.

## IV. Milestones
1. **Proposal:** Submit a proposal that provides the information described in the next section about what you plan to create for your app or game - see myCourses dropbox for submission info & the due date
2. **Checkpoint / Prototype:** Create a working draft of your project. See myCourses dropbox for the due date
3. **Final project deliverable** is due final exam week - see MyCourses dropbox for the due date and submission instructions.  
    - Part of the final deliverable includes a demonstration of your app or game.  
        1. You should create a short video demo by recording your computer screen or device while using a tool such as OBS: http://obsproject.com
        2. Submit this video by uploading it to YouTube as an unlisted video. (If you aren't comfortable uploading it to YouTube let me know - we can arrange something else. I'm planning to play all videos during the final exam period so we can watch together as a class.)
        3. Ideally, you should explain your project with a voice-over. However, if you do not wish to do that, you can upload your description as a separate file to the dropbox.
        4. Please make the video no more than **5 minutes**. Ideally if everyone does a 3 minute video we can show all these during our final exam period over Zoom. Since many people may want to travel for break, I am doing our exam period virtually this year on Zoom.
        5. If you have technical issues that prevent you from doing this, you may schedule a Zoom chat with your course instructor to demonstrate your finished project (which they may then record to be able to refer to during grading).

## V. Proposal
We would like you to write a brief project treatment for your Project 3 Proposal:

Here are some elements/sections to include:

You may format this in any way that you want, but break each bulleted item below into a separate paragraph at least. Feel free to label the paragraphs with headings.

- Give your game/app a name. It can be changed later. Put it at the top of your page.
- Add a High Concept: A 1-3 sentence description that pitches and summarizes your app/game. Examples in link below.
- Genre: Identify the genre(s) the experience belongs to. There are sample lists of genres provided in the link below.
- Platform: Desktop, Web, mobile, or all?
- Aesthetics: How would you describe the desired graphic style... You might not make it there, but what are you aiming for?
- Mockups: Provide at least 2 mockup screens of the app/game. They can be hand-drawn sketches captured on a phone camera, Photoshop mockups, etc.

- Application Project:
  - Describe some of the basic functionality, like controls, and options available to the user. How do you anticipate the user using your app?

- Game Project:
  - Gameplay: Discuss what choices the player will be able to make and what kind of control they have to make those choices. How will the player learn how to play?
  
- Other: Anything else that you'd like to say, like discuss packages you'd like to use, etc.
- About the developer: Give your name/major/minor/year and your skill set/interests.

> The document is similar in style to the Project 3 template used in 230/235. For reference you can look at https://github.com/rit-igm-web/igme-235-shared/blob/main/projects/project-3.md.

## VI. Documentation
- You will be expected to maintain documentation for this project, and have it included as part of the project for submission. Ideally it should be someplace in your app, but if you don't want it there, then provide it in the submission Dropbox.
- Your documentation should include your proposal, your process for this project, cite any sources, tell me where to find anything special you want me to see, and also explain how you met the requirements.

**If you want POINTS in your grade for a feature or technology you used it needs to be documented! I won't have time at end of semester to browse every line of everyone's project! If I missed something and it was documented in your documentation I will retroactively adjust your score even after final grades are due by filing a change of grade form.**

## VII. Video Demonstration
During final exam week, you will present your project in a brief video demo. Plan to show us:
- What you made.
- How it works.
- What's cool, and what you think is "above and beyond"
- How you overcame any serious challenges.
- Resources utilized (for libraries, tutorials, etc.), if you used any.

**There is an alternative if you have technical issues with making your own video as described above in the Milestones section.**

## VIII. Grading

### Your project grade will be split into two parts.
- Project 3 - Final Code Submission
- Project 3 - Video Demo Link

### The grading rubrics for each part of this assignment are attached to the assignments in myCourses.

Please review them before you get deep into your project development. Additionally, see the [Project 3 Expectations Guide](p3_roll_your_own_expectations.md) for a detailed breakdown of how to excel on this project that gives deep explanation to each areas of the RUBRIC attached to project 3 in MyCourses.

---

*Need help? Check the [Reference Manual](../reference/README.md) for code examples and guides on all major topics covered in class.*
