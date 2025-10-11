# IGME-340: Multi-platform Media App Development

**RIT School of Interactive Games and Media**  
**Fall 2025 | Instructor: John-Paul Takats**

Welcome to IGME-340! This course explores cross-platform mobile application development using Flutter and Dart. You'll learn to design, prototype, and develop media-rich interactive experiences that deploy to multiple platforms from a single codebase.

---

## 📚 Course Materials Organization

This repository contains all course materials organized by type and purpose:

### 📅 [Weekly Class Notes](weekly/)
Detailed notes from each class session organized chronologically. Start here to follow along with what we covered in class.

**Structure:** `Week [#][A/B]` format (e.g., `1A.md`, `1B.md`)
- **A sessions:** Tuesdays (often introduce new concepts)
- **B sessions:** Thursdays (often dive deeper or apply concepts)

**What's Inside:**
- Demonstrations and walkthroughs from class
- Code examples we wrote together
- Key concepts and terminology
- Common issues and solutions
- Homework assignments and due dates
- Links to relevant reference materials

**Usage Tip:** Weekly notes show the *teaching progression* - they're your record of "what happened in class."

---

### 📖 [Reference Guide](reference/)
Quick-reference documentation for Flutter widgets, concepts, and patterns. Use this when coding to quickly look up syntax and common use cases.

**Categories:**
- **Styling & Theming** - BoxDecoration, Themes, Colors, Fonts
- **Core Widgets** - Container, Row, Column, Stack, Images
- **Buttons & Interaction** - Button types, GestureDetector, InkWell
- **Input & Forms** - TextField, DropdownButton, Form validation
- **Lists & Scrolling** - ListView, GridView, ScrollView
- **Navigation** - Routing, Dialogs, SnackBars
- **State Management** - setState, Provider, ChangeNotifier
- **APIs & Data** - HTTP requests, JSON parsing, async/await
- **Common Patterns** - Code organization, DRY principles

**What's Inside:**
- Quick copy-paste examples
- Properties reference tables
- Common patterns (without homework solutions)
- Troubleshooting tips
- Links to official documentation

**Usage Tip:** Reference pages are *concise lookups* - use them when you know what you're looking for and need quick syntax.

**Relationship to Weekly Notes:**  
Reference pages link back to weekly notes for context, and weekly notes link to reference for quick lookups. They complement each other!

---

### 🔬 [Labs](labs/)
Hands-on assignments that build foundational Flutter and Dart skills. 

**Current Labs:**
- **Lab 01** - Basic Layout Challenge
- **Lab 02** - GIF Finder (HTTP requests, GridView, API integration)
- *(More labs added throughout semester)*

**What to Expect:**
- 1-2 hour time commitment per lab
- Focus on practical Flutter skills
- Builds toward project competency
- Due before next class session (check MyCourses for exact dates)

---

### 🎯 [Projects](projects/)
Three major course projects where you'll apply everything you've learned to create complete applications.

**Project Breakdown:**
1. **Project 1 (15%)** - Design to Spec
2. **Project 2 (25%)** - Web Service Application  
3. **Project 3 (30%)** - Roll Your Own

**What's Inside:**
- Project specifications and requirements
- Rubrics and grading criteria
- Example proposals and documentation
- Submission guidelines

**Project Philosophy:**  
Projects emphasize architecture decisions, client communication, and solution assessment - skills that are harder to outsource to AI.

---

### 🏋️ [Exercises](exercises/)
Similar to the Labs. Probably should just be renamed next semester to either call these Labs or Exercises! The idea these were meant to perhaps be early general activities that were a little smaller then the labs.

**Content:**
- Dart language exercises
- Quick Flutter widget practice
- Warm-up activities

---

### 📋 [Documents](documents/)
Course policies, guidelines, and supplementary materials that don't fit in the reference documentation. Since I have the syllabus on mycourses. The syllabus probabably should have gone here, but instead its linked to from
mycourses (see Syllabus folder in content for that in mycourses)

---

### 📅 [Schedule](schedule.md)
Complete week-by-week course schedule showing topics, due dates, and major milestones.

**Use this to:**
- See what's coming up
- Plan your workload
- Check assignment due dates
- Understand topic progression

---

### 📝 [Submission Guidelines](submission-guidelines.md)
How to properly submit your work for this course.

**Covers:**
- Naming conventions
- File organization
- Required components
- `flutter clean` requirements
- Submission checklist

---

## 🚀 Getting Started

### New to the Course?
1. Read the [syllabus](documents/) to understand course structure
2. Check the [schedule](schedule.md) to see what's coming up
3. Follow [Week 1A notes](weekly/1A.md) to set up your development environment
4. Bookmark the [reference guide](reference/) for quick lookups while coding

### Looking for Something Specific?
- **Setting up Flutter?** → [Week 1A Notes](weekly/1A.md)
- **How do I use [widget]?** → [Reference Guide](reference/)
- **What's due this week?** → [Schedule](schedule.md) or [MyCourses](https://mycourses.rit.edu)
- **Lab instructions?** → [Labs folder](labs/)
- **What did we do in class?** → [Weekly Notes](weekly/)

### Working on an Assignment?
1. Check the [weekly notes](weekly/) for what we covered in class
2. Review the [reference guide](reference/) for syntax and patterns
3. Look at [previous labs](labs/) for similar examples
4. Test early and often!
5. Don't forget `flutter clean` before submission!

---

## 🔍 How to Navigate This Repository

### By Timeline (Chronological Learning)
```
schedule.md → weekly/1A.md → weekly/1B.md → weekly/2A.md → ...
```
Follow this path to experience the course as it unfolds week-by-week.

### By Topic (Reference Lookup)
```
reference/README.md → reference/widgets/container-basics.md
                   → reference/styling/box-decoration.md
                   → reference/network/http-api-integration.md
```
Jump directly to specific topics when you need quick syntax help.

### By Assignment (Getting Work Done)
```
schedule.md → labs/lab_01.md + weekly/2A.md + reference/widgets/
```
Check schedule for due dates, read lab requirements, refer to class notes for context, use reference for syntax.

---

## 💡 Course Philosophy

**Engagement Over Encyclopedias**  
This course prioritizes sparking your curiosity about multiplatform development over memorizing every widget. You'll learn to:
- Assess client needs and recommend solutions
- Make informed architecture decisions
- Communicate technical concepts professionally
- Navigate documentation and learn independently

**AI in a Flutter World**  
We acknowledge AI's capabilities while ensuring you develop foundational understanding. Assessments focus on architecture, decision-making, and communication - skills that complement AI rather than compete with it.

**Real-World Readiness**  
By the end of this course, you'll be able to:
- Build production-ready Flutter applications
- Choose appropriate technologies for project requirements
- Debug effectively and read error messages
- Present and justify technical decisions
- Deploy apps to Android (and understand iOS differences)

---

## 📱 Technology Stack

**Primary Framework:** Flutter 3.x  
**Language:** Dart  
**Target Platform:** Android (with iOS knowledge)  
**Development:** Works on both Mac and Windows

**Why Flutter?**
- Single codebase for multiple platforms
- Hot reload for rapid iteration
- Rich widget library
- Strong industry adoption
- Excellent documentation

---

## 🤝 Getting Help

### During Class
- Ask questions immediately - chances are others have the same question
- Participate in in-class activities and discussions
- Work through exercises with classmates

### Outside of Class
1. **Check the documentation:**
   - [Weekly notes](weekly/) for what we covered
   - [Reference guide](reference/) for quick syntax
   - [Flutter docs](https://docs.flutter.dev/)

2. **Use Slack:**
   - Post questions in appropriate channels
   - Share helpful resources with classmates
   - Collaborate (within academic integrity guidelines)

3. **Office Hours:**
   - Check [instructor website](https://people.rit.edu/~jxtadm/) for current hours
   - Book virtual appointments when needed
   - Come prepared with specific questions

4. **Email:**
   - Use for administrative or personal issues
   - Include "IGME-340" in subject line
   - Allow 24-48 hours for response

---

## 🎓 Course Learning Outcomes

By completing this course, you will be able to:

1. **Design and develop** cross-platform mobile applications using Flutter and Dart
2. **Evaluate and select** appropriate frameworks and tools for specific project requirements
3. **Implement** responsive layouts that adapt to different screen sizes and platforms
4. **Integrate** external APIs and manage asynchronous data operations
5. **Apply** state management patterns to build interactive applications
6. **Debug** applications using Flutter DevTools and best practices
7. **Communicate** technical decisions and architecture choices effectively
8. **Deploy** applications to target platforms following best practices

---

## 📊 Grading Breakdown

| Component | Weight | Details |
|-----------|--------|---------|
| **Projects** | 70% | Three major projects (15% + 25% + 30%) |
| **Labs/Homework** | 10% | ~5-6 assignments (front-loaded in weeks 1-6) |
| **Participation** | 10% | In-class activities and engagement |
| **Technical Assessments** | 10% | Midterm (5%) + Final (5%) |

**Note:** See [syllabus](documents/) for complete grading policies, late work, and academic integrity guidelines.

---

## 🔗 Important Links

- **MyCourses:** [mycourses.rit.edu](https://mycourses.rit.edu) - Official grades and announcements
- **Slack Workspace:** *(Link provided in class)* - Student collaboration and questions
- **Flutter Documentation:** [docs.flutter.dev](https://docs.flutter.dev)
- **Dart Language Tour:** [dart.dev/guides/language/language-tour](https://dart.dev/guides/language/language-tour)
- **Instructor Website:** [jptweb.com](https://www.jptweb.com)
- **Office Hours:** [people.rit.edu/~jxtadm](https://people.rit.edu/~jxtadm/)

---

## 🌟 Tips for Success

**Before Each Class:**
- Review the schedule to see what's coming up
- Complete any assigned pre-class materials
- Have your development environment ready

**During Class:**
- Take notes in addition to these shared notes (personalize them!)
- Try code examples yourself as we go
- Ask questions when concepts are unclear
- Engage with in-class exercises

**After Class:**
- Review the weekly notes within 24 hours
- Complete homework assignments early (don't wait until due date)
- Practice concepts on your own projects
- Use the reference guide when coding

**Project Success:**
- Start early - time management is crucial
- Read requirements carefully before starting
- Test on actual devices when possible
- Always run `flutter clean` before submitting
- Document your architecture decisions

**Getting Unstuck:**
- Read the error message carefully (they're usually helpful!)
- Check the reference guide for common issues
- Search the weekly notes for similar problems
- Try the Flutter documentation
- Ask on Slack with specific error messages
- Come to office hours with reproducible issues

---

## 📝 Contributing & Feedback

Found an error or have a suggestion? Let me know!

- **Typos/errors:** Mention in class or send me an email
- **Unclear explanations:** Ask questions in class or on Slack
- **Missing examples:** Request them and I'll add them
- **Helpful resources:** Share them and they might get added!

This repository grows based on your needs and feedback throughout the semester.

---

## 📄 License & Usage

Course materials © 2025 John-Paul Takats, RIT School of Interactive Games and Media

**For RIT IGME-340 Students:**
- Use freely for coursework and personal learning
- Retain materials for future reference
- Share knowledge with future students

**Attribution:**
Some materials adapted from previous IGME-340 instructors. Credit given where applicable.

---

**Last Updated:** January 2025  
**Course Website:** [GitHub Repository](https://github.com/jptweb/IGME-340-Shared)  
**Questions?** Contact jxtadm@rit.edu

---

*Welcome to Flutter development! Let's build something amazing together.* 🚀
