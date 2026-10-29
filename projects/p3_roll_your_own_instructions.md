# Project 3 - Roll-Your-Own Flutter App

> **How to Use This Document:** This is your official project brief covering scope, deadlines, and submission requirements. For a detailed breakdown of how to excel on each grading category with links to relevant course materials, see the **[Project 3 Expectations Guide](p3_roll_your_own_expectations.md)**.

## I. Overview
**Using Flutter, create a Game or App**:
- For this project you are creating a Flutter game or app experience for mobile platforms, Android or iOS (ideally both).
  - Example projects:
    - Flutter Game
    - Utility Application
    - Enhanced API-based Application

- Your goal is to create an app or game that is easy to use, functional, and aesthetically pleasing.

- Ideally the experience will run on all platforms Flutter can run on, but the bare minimum is the Android Emulator or the iOS Simulator.

- You will be evaluated on:
    - your creativity
    - the quality of the experience you create
    - the soundness of your programming
    - how far you went beyond what we did in class, as described below

- The project is very open. It's up to you to decide which technologies and packages to use. Some examples:
  - Flame Engine
  - GPS / Maps
  - Native Camera
  - [Flutter Casual Games Toolkit](https://docs.flutter.dev/resources/games-toolkit)
  - Firebase
  - Advanced State Management, ex: BLoC, Riverpod
  - Responsive Layout
  - Another package we haven't discussed or shown in class

- These are Advanced Features, and they're optional. See [Going Above and Beyond](#going-above-and-beyond) for how they fit into your grade.

### What You Turn In

Five deliverables, each with its own dropbox in MyCourses, so make sure you submit to all five. Due dates are in MyCourses too.

| Deliverable | What it is | Share of the P3 grade |
|---|---|---|
| [Proposal](#iv-proposal) | A short pitch for your idea, with mockups | 7.5% |
| [Prototype App](#v-prototype-app) | A rough, working version of your app or game | 2.5% |
| [Final App](#vi-final-app) | Your finished Flutter project | 70% |
| [Documentation](#vii-documentation) | A PDF that tells me what to look for while grading | 10% |
| [Video Demonstration](#viii-video-demonstration) | A 3 to 5 minute demo of your project | 10% |

> **Project Scope & Success:** These projects are substantial, but manageable with proper planning. I've provided extensive code examples in our [Reference Manual](../reference/README.md), including complete implementations like the [shared preferences guide](../reference/data-persistence/shared-preferences.md). 
>
> **Time Management:** Plan for 6 to 9 hours of outside work weekly, which is standard for a 3-credit course. [I'm not making this up :)](https://www.humboldt.edu/sites/default/files/learning-center/2024-11/studyratiorecommendations.pdf). Starting early gives you time to create A-quality work and impressive portfolio pieces. Unlike unpredictable exams, you control your project outcomes through consistent effort. Last-minute starts typically lead to poor results and unnecessary stress.

## II. Examples from Previous Semesters

Check out some [Project 3 demos from previous semesters](../documents/p3-demos/p3-demos-showcase.md) to get a sense of what students have built: games, utility apps, and more.

## III. Requirements

This is what your **Final App** (Section VI, 70% of the project grade) is graded on. It will be evaluated across six key categories. Each category is detailed extensively in the **[Project 3 Expectations Guide](p3_roll_your_own_expectations.md)** with specific technical requirements and links to relevant course materials.

### The Six Evaluation Categories (Code Submission):

1. **Usefulness & Entertainment (10 pts)** - Create something genuinely engaging that people would want to use

2. **Error Prevention & Handling (10 pts)** - Build robustly with input validation, graceful error handling, and user-friendly messages

3. **Code Quality & Organization (15 pts)** - Clean, commented, well-structured code following best practices

4. **Functional Requirements (20 pts)** - Core features including:
   - Custom splash screen, app icon, and app name
   - SharedPreferences for data persistence
   - Multiple pages with appropriate navigation
   - Functionality that goes beyond class examples
   - No crashes or debug statements

5. **Interface Quality (20 pts)** - Intuitive, well-labeled interface that works well in portrait orientation, with dialogs where they help and layouts that fit a phone screen without overflow

6. **Visual Design (20 pts)** - Custom fonts, coordinated colors, appropriate imagery, and polish beyond default Flutter appearance

> **Note:** Documentation (10%) and the Video Demonstration (10%) are graded separately as their own MyCourses submissions (see Sections VII and VIII).

### Critical Success Factors

**To succeed on this project, you must:**
- Create functionality that goes beyond what we've done in class examples
- Use at least one custom Dart `class` of your own creation
- Organize code into multiple `.dart` files with separation of concerns
- Write type-safe variables (minimize use of `var`)
- Apply DRY (Don't Repeat Yourself) principles
- Comment all functions explaining what they do, and explain **why** on anything non-obvious. See the [Commenting Guide](../commenting_guide.md)
- Remove or comment out all `print` statements

### Going Above and Beyond

The rubric has one more row after the six categories: **Above and Beyond**, worth up to 5 points, for exceptional polish or Advanced Features. Projects with both can go past 100, and I add those points by hand.

Advanced Features are optional. Think of them as a menu: pick one or two that fit your project, or pitch something that isn't on the list (your proposal is a good place to ask). The full menu, with what counts for each one, is in the [Expectations Guide](p3_roll_your_own_expectations.md#advanced-features-optional-menu), along with [how the grade works](p3_roll_your_own_expectations.md#how-the-grade-works).

### A Note on Enhanced API-based Applications

If you choose the "Enhanced API-based Application" option, you may build substantially on your Project 2 or create an entirely new API-driven app. If you are enhancing your Project 2:
- Your P3 grade is based **only on what's new**. The original P2 work is your starting point, not your submission
- You must clearly document what features and improvements were added for P3 in your documentation (Section VII)
- The new work should be substantial enough to stand on its own as a full project

## IV. Proposal

⚠️ **This submission is worth 7.5% of your Project 3 grade.**

Write a brief project treatment: a short pitch for your idea. You can format it any way you want, but give each item below at least its own paragraph. Feel free to label the paragraphs with headings.

- Give your game/app a name. It can be changed later. Put it at the top of your page.
- Add a High Concept: A 1-3 sentence description that pitches and summarizes your app/game.  Examples in link below.
- Genre: Identify the genre(s) the experience belongs to. There are sample lists of genres provided in the link below.
- Platform: Android, iOS, web, desktop, or all?
- Aesthetics: How would you describe the desired graphic style... You might not make it there, but what are you aiming for?
- Mockups: Provide at least 2 mockup screens of the app/game.  They can be hand-drawn sketches captured on a phone camera, Photoshop mockups, etc.  

- Application Project:
  - Describe some of the basic functionality, like controls, and options available to the user. How do you anticipate the user using your app?

- Game Project:
  - Gameplay: Discuss what choices the player will be able to make and what kind of control they have to make those choices.  How will the player learn how to play?  
  
- Advanced Features (optional): any from the [menu](p3_roll_your_own_expectations.md#advanced-features-optional-menu) you're aiming for, or something else you'd like to try. I'll let you know if it counts, or if it's too much for the time you have.
- Other: anything else you'd like to say, like packages you plan to use.
- **AI Tool Usage:** Indicate whether you plan to use AI coding assistants (Claude, ChatGPT, GitHub Copilot, Cursor, etc.) for this project. If yes, briefly describe which tools and for what aspects (e.g., "Planning to use Claude for help with complex state management patterns"). See [Section IX](#ix-ai-tools--academic-integrity) for full requirements.
- About the developer: Give your name/major/minor/year and your skill set/interests.  

> The document is similar in style to the Project 3 proposal used in IGME-235. For reference, including the high concept examples and genre lists mentioned above, see the [IGME-235 Project 3 page](https://github.com/rit-igm-web/igme-235-shared/blob/main/projects/project-3.md).

### What to Submit
One PDF, named `LastName_FirstName_P3Proposal.pdf`, uploaded to the Project 3 Proposal dropbox. The rubric is attached there.

## V. Prototype App

A check-in partway through, so I can catch problems while there's still time to fix them.

### What to Do
- At minimum, it runs and the main thing your app or game does is working. Rough is fine at this stage.
- Stuck on something? Say so in the dropbox comment box. That's the most useful thing you can tell me right now.

### What to Submit
Run `flutter clean`, put your project folder inside a folder named `LastName_FirstName_Project3`, zip that folder, and upload it to the Project 3 Prototype App dropbox. If anything needs an API key, leave it in so I can run it.

### How the Prototype Is Graded
With a small rubric, *Prototype Check*: does it run, and does the core work. The full Project 3 rubric is linked at the top of the Prototype App dropbox. A 10/10 on the prototype means you're on track. It doesn't mean the final is headed for 100. The final is graded on Section III.

## VI. Final App

Your finished Flutter project. Documentation (Section VII) and the video (Section VIII) are separate dropboxes, graded separately.

### What to Submit
Run `flutter clean`, put your project folder inside a folder named `LastName_FirstName_Project3`, zip that folder, and upload it to the Project 3 Final App dropbox. If anything needs an API key, leave it in. Before you zip it, check the [Critical Success Factors](#critical-success-factors) one more time, especially removing `print` statements.

### How the Final App Is Graded
On the six categories in [Section III](#iii-requirements), with the rubric attached to the dropbox in MyCourses. The [Project 3 Expectations Guide](p3_roll_your_own_expectations.md) breaks each category down with links to course materials. Review both before you get deep into development.

## VII. Documentation

⚠️ **This submission is worth 10% of your Project 3 grade.**

**WHY THIS MATTERS:** Your documentation tells me what to look for while grading. I will **NOT** have time to analyze everyone's code from top to bottom searching for features. **To get credit for the work you did, you MUST describe it in your documentation.** If you implemented something cool but didn't document it, I might miss it and you won't receive credit.

### Instructions

1. **Make a copy of the documentation template:** Click this link to automatically create your own copy:
   - **[P3 Documentation Template (Google Doc)](https://docs.google.com/document/d/1YKIwzxLpxgO9H1lsbCcu6r4z4WUJgCe_cSYE5Mprp2s/copy)**
   - The link will automatically create a copy in your Google Drive

2. **Fill out every section.** Each one matters for grading. In Professional Execution and Advanced Features, list only what you actually built and leave the rest blank:
   - Project Information
   - Must-Have Features Checklist
   - Professional Execution details
   - Advanced Features (only if you built any)
   - **AI Tool Usage Declaration (Required for everyone)**
   - **MOST IMPORTANT:** Section 8 - Step-by-Step Testing Guide

3. **Be SPECIFIC in your Testing Guide** - Tell me exactly where to find your features:
   - ✅ Good: "On the Home screen, tap the blue '+' button in the bottom right to see the Add Pet form"
   - ❌ Bad: "The app has a cool feature"

4. **Export to PDF** - Use File > Download > PDF in Google Docs

5. **Submit to MyCourses** - Upload your PDF to the Project 3 Documentation dropbox
   - Filename format: `LastName_FirstName_P3_Documentation.pdf`

**Remember:** If it's not documented, it might not get graded! This is your opportunity to make sure I see all the hard work you put into your project.

## VIII. Video Demonstration
During final exam week, you will present your project in a brief video demo. 

### Video Requirements:

⚠️ **This submission is worth 10% of your Project 3 grade.**

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
We may watch the videos together as a class during the final exam period. Details will be announced later in the semester.

---

## IX. AI Tools & Academic Integrity

> **Quick Links:** [Documentation Section (VII)](#vii-documentation) | [AI Documentation Template](https://docs.google.com/document/d/1YKIwzxLpxgO9H1lsbCcu6r4z4WUJgCe_cSYE5Mprp2s/copy)

### Academic Integrity Policy

Using any form of assistance (from other people, AI tools, or online sources) without proper disclosure constitutes **academic dishonesty**. This includes:

- Having someone else write code for you
- Using AI tools (Claude, ChatGPT, GitHub Copilot, Cursor, etc.) to generate code without documenting their use
- Copying code from classmates, online sources, or previous semesters without attribution

**If you use AI assistance, you MUST disclose and document it as described below.** Undisclosed AI use will be treated as academic dishonesty and may result in:
- Being asked to explain your code in detail during office hours
- Being asked to rewrite sections of code in front of me to demonstrate understanding
- Potential referral to RIT's Academic Integrity process

### The Reality of AI in Professional Development

You've already demonstrated fundamental understanding through Projects 1 and 2. At this point in your education, it's appropriate to learn how professional developers use AI tools, because employers increasingly expect this skill.

**However:** AI is a tool, not a substitute for understanding. In the professional world, you'll need to:
- Understand architecture and make design decisions (AI can't do this for you)
- Collaborate with teams and explain technical choices (AI can't attend your meetings)
- Debug and maintain code over time (AI-generated code you don't understand becomes a liability)
- Evaluate when AI suggestions are good vs. problematic

This project is your opportunity to practice using AI as a professional tool while maintaining accountability for your work.

### AI Usage Requirements

**ALL students must indicate whether they used AI assistance or not** in their project documentation.

#### If You Choose NOT to Use AI:
- Simply indicate "No AI tools used" in your documentation
- No additional documentation required
- Standard grading applies

#### If You Choose to Use AI Tools:

You may use AI coding assistants (Claude, ChatGPT, GitHub Copilot, Cursor, etc.), BUT you must:

1. **Declare AI usage in your Proposal** (Section IV above)
   - Indicate you plan to use AI tools
   - Briefly mention which tools and for what aspects (e.g., "planning to use Claude for complex state management logic")

2. **Document AI usage in your Final Documentation** ([Section VII](#vii-documentation) | [Documentation Template](https://docs.google.com/document/d/1YKIwzxLpxgO9H1lsbCcu6r4z4WUJgCe_cSYE5Mprp2s/copy))
   - Include an "AI Collaboration" section covering:
     - Which specific AI tools you used, and the model if you know it (for example: "Claude in VS Code", "ChatGPT", "GitHub Copilot autocomplete")
     - Which features/components used AI assistance and to what degree
       - Example: "Used Claude to help structure my Provider pattern - it generated initial boilerplate which I then modified for my specific needs"
       - Example: "Used GitHub Copilot for autocomplete suggestions while writing repetitive widget code"
     - Specific examples of prompts or approaches that worked well
     - What required significant manual intervention or didn't work
     - What you learned about AI's capabilities and limitations for Flutter development

3. **Demonstrate Deep Understanding**
   - Your code comments must explain WHY, not just WHAT
   - In documentation, explain architectural decisions (not just "the AI suggested it")
   - Be prepared to explain any part of your code if asked
   - Understand how different components interact and why you structured things the way you did

**Important Notes:**
- Using AI is not a shortcut to better grades or less work
- The same core requirements apply to everyone
- The documentation requirement adds work for AI users
- You must understand and be able to explain ALL code in your project, regardless of who/what wrote it
- If I suspect undisclosed AI use, you'll be asked to explain your code and potentially rewrite sections to prove understanding

### What "Understanding Your Code" Means

Whether you write code yourself or use AI assistance, you must be able to:
- Explain what each function does and why it's structured that way
- Describe how state flows through your application
- Justify architectural decisions ("I used Provider because...")
- Debug issues and explain what's happening when things break
- Modify and extend the code for new requirements

If you can't do these things, you don't understand your code, and that's a problem whether AI wrote it or you copied it from Stack Overflow.

### Why This Approach?

This isn't about making your life harder. It's about preparing you for professional development:
- **Transparency:** In the workplace, you'll need to document decisions and tools used
- **Understanding:** You can't maintain or debug code you don't understand
- **Collaboration:** You'll need to explain technical choices to teammates and stakeholders
- **Professional skills:** Learning to use AI effectively is valuable; hiding that you used it is not

By requiring disclosure and understanding, I'm teaching you to use AI as a professional tool while maintaining accountability for your work, which is exactly what employers will expect.

---
