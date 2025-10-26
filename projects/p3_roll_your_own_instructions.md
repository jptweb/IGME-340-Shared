> **Project Scope & Success:** These projects are substantial, but manageable with proper planning. I've provided extensive code examples in our [Reference Manual](../reference/README.md), including complete implementations like the [shared preferences guide](../reference/data-persistence/shared-preferences.md). 
>
> **Time Management:** Plan for 6 to 9 hours of outside work weekly—standard for a 3-credit course. [I'm not making this up :)](https://www.humboldt.edu/sites/default/files/learning-center/2024-11/studyratiorecommendations.pdf). Starting early gives you time to create A-quality work and impressive portfolio pieces. Unlike unpredictable exams, you control your project outcomes through consistent effort. Last-minute starts typically lead to poor results and unnecessary stress.

# Project 3 - Roll-Your-Own Flutter App

## I. Overview
*Using Flutter, create a Game or App*:
- For this project you are creating a Flutter game or App experience for Mobile platforms, Android or IOS (ideally both).
- You will be proposing an idea and describing it on a nicely formatted "proposal/about". Additionally you will be submitting documentation for it (so I know how to grade it) and a video presentation that will be played during our final exam period to the class (over zoom for those who want to travel early).
  
Example projects:
- Flutter Game
- Utiliy Application
- Enhanced API based application (Enhancing Project 2 or something new).

### What to implement
The project will be very open and it will be up to you to decide what technologies/packages to implement, below are some examples:
- **Flame Engine**
- GPS / Maps
- Native Camera
- Flutter Casual Game Kit
- **Firebase** 
- Advanced State Management, ex: **Go Router**, **BLoC**, **Riverpod**
- Responsive Layout
- Other package not discussed or shown in class.

## II. Goal
- Your goal is to create a app or game that is easy to use, functional, and aesthetically pleasing.

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
- Images are properly optimized for mobile delivery - e.g. No grossely overside images (ex: 3000x3000).
- Sound is used to enhance the experience
- Utilize a custom font.


### D. Code Conventions
- Utilize at least one dart `class` of your own creation
- by type aware, don't just use `var`.
- D.R.Y. - Don't Repeat Yourself. Repeated blocks of nearly identical code should be factored out and placed in a separate function.
- Separation of Concerns. Have separate .dart files for your classes, utility functions, and main code.
  - Learn more and see examples of this here: [Declarative UI Architecture: Data Controls the UI](../reference/state-management/declarative-ui-architecture.md). Another good way to implement this could be by using the Provider Package which we covered in the (10A Notes)[../weekly/10A.md].
- Use proper variable and function names, do NOT just use a single letter (exceptions for minor local variables inside loops).
- Well-commented code. Each and every function gets a comment indicating what it does
- Delete or comment out your `print` statements.

## IV. Milestones
1. **Proposal:** Submit a proposal that provides the information described in Section V (Proposal) below about what you plan to create for your app or game. See MyCourses dropbox for submission info & the due date. *(10% of project grade)*

2. **Checkpoint / Prototype:** Create a working draft of your project. This is essentially a "code check-in" to ensure you're making progress. See MyCourses dropbox for the due date. *(5% of project grade - basically free points for submitting your work-in-progress)*

3. **Final Project:** Final project deliverable is due final exam week - see MyCourses dropbox for the due date and submission instructions. *(85% of project grade - broken down as 15% video demo, 70% code submission)*
   - Your final submission includes **both** a video demonstration and your complete project files
   - See Section VI (Video Demonstration) below for detailed video requirements

## V. Proposal
We would like you to write a brief project treatment for your Project 3 Proposal:

Here are some elements/sections to include:

You may format this in any way that you want, but break each bulleted item below into a separate paragraph at least.  Feel free to label the paragraphs with headings.

- Give your game/app a name. It can be changed later. Put it at the top of your page.
- Add a High Concept: A 1-3 sentence description that pitches and summarizes your app/game.  Examples in link below.
- Genre: Identify the genre(s) the experience belongs to. There are sample lists of genres provided in the link below.
- Platform: Desktop, Web, mobile, or all?
- Aesthetics: How would you describe the desired graphic style... You might not make it there, but what are you aiming for?
- Mockups: Provide at least 2 mockup screens of the app/game.  They can be hand-drawn sketches captured on a phone camera, Photoshop mockups, etc.  

- Application Project:
  - Describe some of the basic functionality, like controls, and options available to the user. How do you anticipate the user using your app?

- Game Project:
  - Gameplay: Discuss what choices the player will be able to make and what kind of control they have to make those choices.  How will the player learn how to play?  
  
- Other: Anything else that you like to say, like discuss packages you'd like to use, etc.
- About the developer: Give your name/major/minor/year and your skill set/interests.  

> The document is similar in style to the Project 3 template used in 230/235. For reference you can look at https://github.com/rit-igm-web/igme-235-shared/blob/main/projects/project-3.md.

## VI. Video Demonstration
During final exam week, you will present your project in a brief video demo. 

### Video Requirements:
- **Length:** No more than **5 minutes** (ideally 3 minutes so we can watch everyone's during the final exam period)
- **Format:** Record your computer screen or device using a tool such as [OBS](http://obsproject.com)
- **Submission:** Upload to YouTube as an **unlisted video** and submit the link to MyCourses
  - If you're uncomfortable with YouTube, contact me to arrange an alternative
- **Content to Cover:**
  - What you made
  - How it works
  - What's cool and what you think is "above and beyond"
  - How you overcame any serious challenges
  - Resources utilized (libraries, tutorials, etc.), if any
- **Audio:** Ideally include a voice-over explanation. If you prefer not to do voice-over, you can upload a separate text description to the dropbox.

### Final Exam Viewing:
Since many people may want to travel for break, I'm conducting our final exam period virtually this year on Zoom. We'll watch all the videos together as a class during that time.


## VII. Documentation

⚠️ **This submission is worth 5% of your overall course grade.**

**WHY THIS MATTERS:** Your documentation tells me what to look for while grading. I will **NOT** have time to analyze everyone's code from top to bottom searching for features. **To get credit for the work you did, you MUST describe it in your documentation.** If you implemented something cool but didn't document it, I might miss it and you won't receive credit.

### Instructions

1. **Make a copy of the documentation template:** [Click here to copy the Google Doc template](YOUR_GOOGLE_DOC_URL_HERE/copy)

2. **Fill out ALL sections** - Don't skip anything! Each section is important for grading.

3. **Be SPECIFIC in Section 8 (Testing Notes)** - Tell me exactly where to find your features: "On the Home screen, tap the blue button..." not just "the app has a cool feature"

4. Export your completed Google Doc to a PDF (in the file menu of google docs)

5. Upload Submit this PDF to the correct dropbox in MyCourses by the due date indicated there. I know its possible to share google docs but this prevents any potential permission issues, and preserves a copy I know works in mycourses.

**Remember:** If it's not documented, it might not get graded! This is your opportunity to make sure I see all the hard work you put into your project.

---

## VIII. Grading

### Grading Breakdown:
- **10%** - Proposal
- **5%** - Checkpoint/Prototype (essentially free points for submitting progress)
- **15%** - Video Demonstration
- **70%** - Final Code Submission

### Grading Rubrics:
The detailed grading rubrics for each part of this assignment are attached to the assignments in myCourses:
- Project 3 - Proposal
- Project 3 - Checkpoint/Prototype
- Project 3 - Final Code Submission
- Project 3 - Video Demo Link

Please review them before you get deep into your project development. For a detailed breakdown of how to excel on the final submission, see the companion document: [Project 3 Expectations Guide](p3_roll_your_own_expectations.md).
