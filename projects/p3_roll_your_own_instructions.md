> **Project Scope & Success:** These projects are substantial, but manageable with proper planning. I've provided extensive code examples in our [Reference Manual](../reference/README.md), including complete implementations like the [shared preferences guide](../reference/data-persistence/shared-preferences.md). 
>
> **Time Management:** Plan for 6 to 9 hours of outside work weekly—standard for a 3-credit course. [I'm not making this up :)](https://www.humboldt.edu/sites/default/files/learning-center/2024-11/studyratiorecommendations.pdf). Starting early gives you time to create A-quality work and impressive portfolio pieces. Unlike unpredictable exams, you control your project outcomes through consistent effort. Last-minute starts typically lead to poor results and unnecessary stress.

# Project 3 - Roll-Your-Own Flutter App

> 📋 **How to Use This Document:** This is your official project brief covering scope, deadlines, and submission requirements. For a detailed breakdown of how to excel on each grading category with links to relevant course materials, see the **[Project 3 Expectations Guide](p3_roll_your_own_expectations.md)**.

## I. Overview
**Using Flutter, create a Game or App**:
- For this project you are creating a Flutter game or App experience for Mobile platforms, Android or IOS (ideally both).
  - Example projects:
    - Flutter Game
    - Utiliy Application
    - Enhanced API based application (Enhancing Project 2 or something new).
      
- You will be proposing an idea and describing it on a nicely formatted "proposal/about". Additionally you will be submitting documentation for it (so I know how to grade it) and a video presentation that will be played during our final exam period to the class (over zoom for those who want to travel early).
  
- Your goal is to create a app or game that is easy to use, functional, and aesthetically pleasing.

- Ideally the experience will run in all platforms Flutter can run on, but the bare minimum will be the Android Simulator or IOS Simulator. 

- You will be evaluated on:
    - your creativity
    - the quality of the experience you create
    - the soundness of your programming.
    - how far you went beyond what we did in class, as described below

- The project will be very open and it will be up to you to decide what technologies/packages to implement, below are some examples:
  - Flame Engine
  - GPS / Maps
  - Native Camera
  - Flutter Casual Game Kit
  - Firebase
  - Advanced State Management, ex: BLoC, Riverpod
  - Responsive Layout
  - Other package not discussed or shown in class.

## III. Requirements

Your project will be evaluated across seven key categories. Each category is detailed extensively in the **[Project 3 Expectations Guide](p3_roll_your_own_expectations.md)** with specific technical requirements and links to relevant course materials.

### The Seven Evaluation Categories:

1. **Usefulness & Entertainment (10 pts)** - Create something genuinely engaging that people would want to use

2. **Error Prevention & Handling (10 pts)** - Build robustly with input validation, graceful error handling, and user-friendly messages

3. **Documentation (10 pts)** - In-app documentation page that explains your work and helps me grade effectively

4. **Code Quality & Organization (10 pts)** - Clean, commented, well-structured code following best practices

5. **Functional Requirements (20 pts)** - Core features including:
   - Custom splash screen, app icon, and app name
   - SharedPreferences for data persistence
   - Multiple pages with appropriate navigation
   - Functionality that goes beyond class examples
   - No crashes or debug statements

6. **Interface Quality (20 pts)** - Intuitive, well-labeled interface that works well in portrait orientation with appropriate use of dialogs and responsive layout techniques

7. **Visual Design (20 pts)** - Custom fonts, coordinated colors, appropriate imagery, and polish beyond default Flutter appearance

### Critical Success Factors

**To succeed on this project, you must:**
- Create functionality that goes beyond what we've done in class examples
- Use at least one custom Dart `class` of your own creation
- Organize code into multiple `.dart` files with separation of concerns
- Write type-safe variables (minimize use of `var`)
- Apply DRY (Don't Repeat Yourself) principles
- Comment all functions explaining what they do
- Remove or comment out all `print` statements

### Going Above and Beyond (95-105+ points)

To reach the highest grades, consider implementing advanced features like:
- Firebase integration or advanced state management (Provider, Riverpod, BLoC)
- Flame game engine for game projects
- GPS/Maps or camera integration
- Responsive design for tablets
- Professional animations and polished UI
- Production-quality error handling and loading states

**See the [Project 3 Expectations Guide](p3_roll_your_own_expectations.md) for detailed examples, technical guidance, and links to relevant course materials for each category.**

## IV. Milestones & Deliverables

This project has five separate submissions in MyCourses, each with its own dropbox:

1. **Proposal (10%)** - Due early in the project timeline
   - See Section V below for detailed requirements

2. **Prototype/Checkpoint (5%)** - Due mid-project
   - Working draft showing progress (basically free points for submitting work-in-progress)
   - See MyCourses dropbox for due date

3. **Final Code Submission (65%)** - Due final exam week
   - Your completed Flutter project
   - See MyCourses dropbox for due date and submission instructions

4. **Documentation (5%)** - Due final exam week
   - Separate PDF submission explaining your project and features
   - See Section VII below for detailed requirements

5. **Video Demonstration (15%)** - Due final exam week
   - 3-5 minute video showcasing your work
   - See Section VI below for detailed requirements

> ⚠️ **Important:** These are SEPARATE submissions in MyCourses. Make sure you submit to all five dropboxes!

## V. Proposal

⚠️ **This submission is worth 10% of your overall course grade.**

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

⚠️ **This submission is worth 15% of your overall course grade.**

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
- **65%** - Final Code Submission
- **5%** - Documentation
- **15%** - Video Demonstration

### Grading Rubrics:
The detailed grading rubrics for each part of this assignment are attached to the assignments in myCourses:
- Project 3 - Proposal
- Project 3 - Checkpoint/Prototype
- Project 3 - Final Code Submission
- Project 3 - Video Demo

Please review them before you get deep into your project development. For a detailed breakdown of how to excel on the final submission, see the companion document: [Project 3 Expectations Guide](p3_roll_your_own_expectations.md).
