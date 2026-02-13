# IGME-340 Course Syllabus
## Multi-platform Media App Development - Spring 2026 (2255)

| | |
|----:|:----|
| **Instructor:** | John-Paul Takats (about me: [https://www.jptweb.com/about-me/](https://www.jptweb.com/about-me/)) |
| **Office:** | GOL-2527 |
| **Email:** | jxtadm@rit.edu |
| **Office Hours:** | Latest office hour info: [https://people.rit.edu/~jxtadm/](https://people.rit.edu/~jxtadm/) You may also book virtual Zoom hours there. |
| **Logistics:** | Meets in: GOL 2570. Mon & Wed 3:00 PM - 4:15 PM. |

---

## Table of Contents

- [IGME-340 Course Syllabus](#igme-340-course-syllabus)
  - [Multi-platform Media App Development - Spring 2026 (2255)](#multi-platform-media-app-development---spring-2026-2255)
  - [Table of Contents](#table-of-contents)
  - [Syllabus as Course Agreement](#syllabus-as-course-agreement)
  - [Course Catalog Description](#course-catalog-description)
  - [Prerequisites](#prerequisites)
  - [Important RIT Dates \& Deadlines (Spring 2026)](#important-rit-dates--deadlines-spring-2026)
    - [Final Exam Week](#final-exam-week)
  - [Required Textbook](#required-textbook)
  - [Learning Management Systems](#learning-management-systems)
  - [Communication](#communication)
    - [MyCourses](#mycourses)
      - [Key MyCourses Areas](#key-mycourses-areas)
    - [Slack Workspace](#slack-workspace)
    - [Email Communication](#email-communication)
      - [Emailing Me](#emailing-me)
      - [Course Emails from Me](#course-emails-from-me)
  - [Equipment Requirements](#equipment-requirements)
    - [Hardware](#hardware)
    - [Software](#software)
  - [Attendance \& On-time Arrival](#attendance--on-time-arrival)
  - [Grading \& Assessment](#grading--assessment)
    - [Late Project \& Homework Policy](#late-project--homework-policy)
    - [Policy on Incomplete Grades](#policy-on-incomplete-grades)
  - [Course Elements Explored](#course-elements-explored)
    - [Projects (70% of Grade)](#projects-70-of-grade)
    - [Participation - GitHub Classroom (10% of Grade)](#participation---github-classroom-10-of-grade)
    - [Labs/Homework (20%)](#labshomework-20)
    - [How This Course Flows](#how-this-course-flows)
  - [Academic Integrity](#academic-integrity)
  - [Generative AI (e.g., ChatGPT)](#generative-ai-eg-chatgpt)
  - [Additional Important Notes](#additional-important-notes)
    - [Statement of Teaching Philosophy](#statement-of-teaching-philosophy)
    - [Student Support Availability](#student-support-availability)
    - [Statement on Diversity, Inclusion, and Respect](#statement-on-diversity-inclusion-and-respect)
    - [Statement on Academic Accommodations](#statement-on-academic-accommodations)
    - [Statement on Title IX](#statement-on-title-ix)

---

## Syllabus as Course Agreement

This syllabus serves as a contract between instructor and students. By remaining enrolled in this course, you acknowledge that you have read, understood, and agree to abide by all policies outlined in this document, including those regarding attendance, deadlines, late work, and academic integrity.

**Your continued enrollment indicates acceptance of:**

- All grading policies and assessment weights
- Assignment deadlines and late work penalties
- Course communication expectations
- Academic integrity standards

**Syllabus Modifications**: While this document represents the planned structure of the course, I reserve the right to make adjustments as needed to enhance learning outcomes or address unforeseen circumstances. Any changes will be communicated via official RIT email. This syllabus and all course materials are maintained in GitHub, so you can view the full revision history and see exactly what changed and when.

---

## Course Catalog Description

Interactive media applications are no longer restricted to personal computers. They can now be found on many distinct hardware platforms including mobile, tablet, wearable, and large-screened computing devices. In this course, students will learn to design, prototype and develop media rich interactive experiences that can be deployed to a wide variety of hardware devices. Programming projects are required.

---

## Prerequisites

**Officially:** IGME-330 or equivalent course and student standing in GAMEDES-BS or NWMEDID-BS.

The course is a higher-level programming course, it is expected that you will have familiarity programming in languages such as Java, C# or JavaScript.

**About Dart:** We'll use the Dart programming language for Flutter development. Dart has strong similarities to TypeScript and JavaScript (which you used in IGME-330), so the syntax should feel familiar. We'll cover Dart basics in Week 1, but you'll be expected to pick up the language structure mostly on your own through practice and the provided exercises. Office hours are available if you need extra help getting comfortable with Dart.

---

## Important RIT Dates & Deadlines (Spring 2026)

| Date | Event |
|:-----|:------|
| January 12, 2026 (Monday) | Day, evening, and online classes begin |
| January 19 (Monday) | Martin Luther King Jr. Day - No Classes |
| January 20 (Tuesday) | Last day of Add/Drop period |
| March 8-15 | Spring Break - No Classes |
| April 3 (Friday) | Last day to drop from classes with a grade of "W" |
| April 27 (Monday) | Last day, evening, and online classes |
| April 28 (Tuesday) | Reading Day |
| Apr. 29, 30, May 1, 4, 5, 6 | Exam Period (see section below) |

### Final Exam Week

During the Final Exam period (Apr. 29, 30, May 1, 4, 5, 6) there will likely be a scheduled activity either in person or on Zoom. We will talk about this in class as the semester progresses. Our scheduled time is **TBD** (will be posted once finalized).

---

## Required Textbook

There is no required textbook for this course. All learning materials, including lecture presentations, code examples, and external resources, will be provided through our course platforms.

**Reference Guides:** I've created a set of [quick-reference guides](../reference/) for common Flutter/Dart topics. These are designed for fast lookup while coding - think of them as a "cheat sheet" collection rather than tutorial content. The reference guides were created with AI assistance to ensure comprehensive coverage; however, the weekly class notes, code examples, and demos are written by me to ensure they align with how we actually teach the material in class.

---

## Learning Management Systems

- **MyCourses**: Primary hub for announcements, grades, and assignment submission
- **GitHub**: All course notes, assignment instructions, and reference materials are hosted in a public GitHub repository. This makes content accessible, version-controlled, and easy to update. I will link to these materials from MyCourses.
- **GitHub Classroom**: Used for [participation assignments](#participation---github-classroom-10-of-grade) throughout the semester. You'll receive invite links through MyCourses.

**A note about the GitHub repo:** Since the course materials are version-controlled, you may occasionally see content in the repository that I haven't officially linked from MyCourses yet. Feel free to look ahead, but keep in mind that until I link something from MyCourses, it's not finalized and may change.

---

## Communication

### MyCourses

MyCourses serves as our official communication platform. While it may not be the most modern interface you're accustomed to, it provides essential accountability and documentation required by university policies.

To ensure you don't miss important information:

- **Enable notifications**: Set up email/push notifications for announcements and deadlines
- **Check regularly**: All official announcements, grade updates, and deadline changes will be posted here

#### Key MyCourses Areas

**Content → Weekly Folders**: Each week has its own folder (Week 1, Week 2, etc.) containing:

- Weekly overview and objectives
- Links to all materials and resources
- Clear expectations for the week

**Announcements Feed** (on course homepage): Important updates that don't require email

- Check regularly for course adjustments and reminders
- Enable push notifications to stay current
- Essential for this agile course with limited in-person time

**Calendar** (Desktop Sidebar): Your single source of truth for ALL deadlines

- Shows all due dates including participation activities
- More comprehensive than "Upcoming Work" widget
- Check weekly to stay on track

> **More Info:** The Calendar feature (found in the desktop sidebar) shows ALL course deadlines, including participation activities and non-traditional submissions. Avoid relying on the "Upcoming Work" widget, which only displays certain assignment types. I maintain all deadlines in the Calendar to give you a complete view of what's due when.

*Remember: "I didn't see it on MyCourses" won't be accepted as an excuse for missed deadlines or announcements.*

### Slack Workspace

**Slack is my preferred way to communicate** - I check it more frequently than email.

- Great for quick questions, troubleshooting, and collaboration
- Great for finding out what you missed due to excused absence
- Be careful though not to share solutions or code as this could constitute academic dishonesty

**If you don't hear back within 24 hours, please send me a reminder.** Messages occasionally get buried - a polite nudge is always welcome!

*[Slack invitation link will be provided in Week 1]*

### Email Communication

#### Emailing Me

When emailing me, please follow these guidelines:

- **Subject Line Format**: `IGME-340 - [Your Subject]`
- **Use RIT Email**: Always email from your official RIT address
- **Be Specific**: Provide detailed context about your question or issue
- **Technical/Code Issues**: Email is not ideal for debugging. Please attend office hours for code help, as I cannot stay after class this semester due to back-to-back teaching schedule

#### Course Emails from Me

I will use mass emails for urgent updates and important changes. While I'll TRY to cross-post to Slack and MyCourses when possible, **email remains the official channel** for:

- Assignment deadline changes or extensions
- Critical course updates
- Time-sensitive information

**Important**: Check your email regularly, especially near due dates. As this is an agile course in a rapidly-evolving field, I may need to make adjustments throughout the semester to keep content current and relevant. I strive to balance structure with flexibility to give you the best learning experience.

*Note: While last-minute changes can be frustrating, they're sometimes necessary to ensure fairness or incorporate emerging technologies.*

---

## Equipment Requirements

### Hardware

- **Computer**: Windows or Mac capable of running Flutter development tools
- **Storage**: You need **at least 20GB free** - Flutter SDK, Android Studio, and projects add up quickly. A single Flutter project can grow to 4GB+ before cleaning.
- **Platform Note**: While Flutter supports both iOS and Android development, iOS apps require a Mac for building and testing. To ensure all students can fully participate regardless of their computer, **this course will focus primarily on Android development**, which works on both Windows and Mac.
- **Mobile Device** (Optional): Android device for testing on real hardware
- **Developer Licenses** (Not Required): No paid developer accounts needed

### Software

- All required software is free for educational use
- In Week 1B, we'll set up a development environment on the classroom lab machines together - this gives everyone a working setup they can use during class
- It's **strongly recommended** you also get Flutter running on your personal machine so you can work outside of class
- See [Lab 00: Environment Setup](../labs/lab-00-environment-setup.md) for detailed instructions

### Limited Hardware? You Can Still Succeed

**If your computer can't run Android Studio** (too slow, not enough storage, etc.), you have options:

1. **Classroom Lab Machines**: GOL 2570 has machines with Android Studio. We'll set up Flutter on these in Week 1B - it persists all semester.
2. **GCCIS Open Labs**: Other GCCIS lab machines also have Android Studio. You may need to install the Flutter VS Code extension and SDK when using a different machine (still verifying this), but once you get the hang of it, the setup takes about 10 minutes.
3. **Chrome Fallback**: For the first few weeks, you can develop targeting Chrome instead of Android. This works on slower machines.
4. **Virtual Machine** (emergency option): I can set you up on rles.rit.edu if needed - has storage space but is slow and can't run Android Studio.

**The key:** You don't need to buy a new computer, but you DO need to plan around limitations. A lot of work can be done on limited hardware using Chrome as a target, but you'll need to test on an Android emulator periodically to ensure full credit. Later in the semester, we cover features that are more unique to phones (camera, sensors, etc.) that don't work in a browser.

### Tell Me Early About Hardware Issues

If storage or hardware might be a problem, **let me know in the first few weeks**:
- I can help you set up alternatives
- I'll be flexible with extensions if you communicate early
- Waiting until the day before a project is due is NOT a valid reason for an extension - that was within your control to address earlier

---

## Attendance & On-time Arrival

Attendance is mandatory. Lectures will start promptly at the beginning of class, and may be followed by an in-class assignment or exercise that you are expected to work on until the end of the meeting (i.e. not leaving early, or doing HW for a different course).

**If you miss class:** You can still complete the GitHub Classroom participation assignments using the weekly notes to catch up. However, you'll miss out on in-class explanations and troubleshooting help.

**Excessive absences or late arrivals:** I reserve the right to deduct points from your participation grade if this becomes a pattern. In recent semesters, late arrivals have been disruptive - please be on time out of respect for your classmates. See the participation section below for more details.

---

## Grading & Assessment

| Grade | Percentage |
|-------|------------|
| A     | 93+        |
| A-    | 90-92      |
| B+    | 87-89      |
| B     | 83-86      |
| B-    | 80-82      |
| C+    | 77-79      |
| C     | 73-76      |
| C-    | 70-72      |
| D     | 60-69      |
| F     | < 60       |

Grades will be rounded up at .5 or higher (e.g., 89.5 becomes 90, but 89.4 stays 89).

### Late Project & Homework Policy

Assignments completed or turned in after their due date will not be accepted for credit without PRIOR approval. If you need an extension, submit a request using the Slack workflow in **#340-extension-request** before the due date. Extensions are usually granted if you communicate proactively. If you are having an emergency, reach out to me via Slack DM as soon as possible — I realize things come up, it is just important we discuss this in advance and not the day work is due.

### Policy on Incomplete Grades

Incomplete grades will be given only in the most exceptional circumstances, solely for issues that arise AFTER the 'W' deadline has passed, and then only by prior arrangement with the professor. Being overcommitted and/or not having enough time to complete your coursework is not sufficient justification for an "I". Instead, meet with the professor as early as possible in the semester if you're having difficulty.

---

## Course Elements Explored

This course is designed with intentional pacing. The first 4-5 weeks focus on foundational skills through structured homework assignments. Once you have these building blocks, we shift to project-based learning where you'll apply everything in larger, creative applications. This front-loaded approach ensures you have the tools needed before diving into complex projects.

### Projects (70% of Grade)

There are 3 major projects to be completed in the semester.

- **Project 1** (22.5%) - Design to Spec
- **Project 2** (22.5%) - Web Service Application
- **Project 3** (25%) - Roll Your Own Project

**Project Deliverables**: Projects 2 and 3 have multiple deliverables, not just a final submission:
- **Proposal/Plan** - What you intend to build
- **Prototype** - Early version with basic functionality
- **Final Submission** - Complete project
- **Video Walkthrough** (Project 3) - Demo video showing your app in action

**Why multiple deliverables?** This mirrors how projects work in industry - you plan before you code. It also means your grade isn't entirely dependent on the final product. If you struggle with the programming but put effort into the proposal and prototype, those points can help cushion your grade.

**Don't skip deliverables!** Each one is worth points. Students have been surprised to lose points on prototypes they didn't submit - check MyCourses calendar for all due dates.

**Project Grading**: Grades are determined by published rubrics that explain exactly how your projects will be assessed.

**Project Submission**: Projects are submitted via MyCourses - check each project spec for specific submission instructions.

**Time Commitment - Be Realistic**: This course has relatively few assignments, but 70% of your grade is projects. A 3-credit course typically expects 6-9 hours of work outside the classroom per week. If you're not putting in this time and leaving projects to the last minute, you will likely not succeed.

For reference, here's what students reported spending on Project 3 (Fall 2025):

| Metric | Hours |
|--------|-------|
| Lowest reported | 19 hours |
| Highest reported | 45-50 hours |
| Average | ~28 hours |

Projects are not something you can cram the night before. Plan accordingly.

### Participation - GitHub Classroom (10% of Grade)

Throughout the semester, you will submit in-class work via GitHub Classroom. Each class session (starting Week 2) has its own assignment that you'll complete and submit.

**How it works:**
- Accept the GitHub Classroom assignment (link posted in MyCourses/Slack)
- Follow along with in-class demonstrations and exercises
- Submit your work before the next class session
- Graded on effort and progress, not perfection

**Requirements:**
- **20 total repos** throughout the semester
- **Complete 17 of 20** to receive full credit (3 drops allowed)
- Good faith effort is expected; doesn't need to be 100% complete
- If you miss class, use the weekly notes to catch up and submit

**Bonus Opportunity:** Complete ALL 20 participation assignments and earn **5 bonus points** that can be applied to any of your 3 projects!

See [Participation - GitHub Classroom](participation-github-classroom.md) for full details on submission methods.

### Labs/Homework (20%)

Approximately 5-6 structured assignments designed to build foundational skills in Dart and Flutter. These assignments are **strategically front-loaded** in the first half of the semester to prepare you for project work.

**What to Expect:**

- **Focus areas**: Dart fundamentals, Flutter widgets, layouts, and basic state management
- **Submission**: Due dates vary - check MyCourses calendar
- **Grading**: Full credit for good-faith completion and effort
- **Time**: Varies by experience level - start early so you have time to ask questions if stuck

**Schedule Note**: Most homework occurs in Weeks 1-6, with minimal assignments during heavy project periods. This intentional pacing ensures you build skills early without competing priorities later in the semester.

*These assignments directly support upcoming projects - they're skill-builders, not busywork.*

### How This Course Flows

- **Weeks 1-5**: Skill Building Phase
  - Regular homework assignments
  - Learning Dart & Flutter fundamentals
  - Building your toolkit

- **Weeks 6-14**: Project Phase
  - Apply your skills to real projects
  - Minimal homework (only bridge assignments)
  - Focus on creative problem-solving

---

## Academic Integrity

As part of the RIT academic community, it is imperative that you maintain the highest standards of academic honesty in this course. This policy outlines our commitment to uphold academic integrity and the consequences of violating it.

- **Cheating**: Engaging in any form of fraudulent or deceptive academic act, including falsification of data and unauthorized possession or use of materials, sources, or tools. See also our Generative AI policy (next section).
- **Collusion**: Inappropriate collaboration with others in work that is meant to be completed individually.
- **Plagiarism**: Representing the ideas of others as your own without proper attribution.
- **Duplicate Submission**: Submitting work in this course that you have previously submitted in this course or another, without prior approval. Importantly, if you have previously taken this course and are retaking it (whether due to a withdrawal or to improve a grade), all submitted work must be original and created anew for this semester. Resubmitting past work, even your own, without explicit permission is not allowed and will be treated as a breach of academic integrity.

**Consequences**: Breaches of academic integrity, including but not limited to cheating, collusion, plagiarism, and duplicate submission, will result in serious disciplinary action. This may range from failing the assignment to potentially failing the course, depending on the violation's severity. Each case will be carefully reviewed in accordance with the RIT Academic Integrity Policy.

For full details on the policy and your responsibilities within it, please visit RIT's Academic Integrity website: [https://www.rit.edu/academicintegrity/](https://www.rit.edu/academicintegrity/)

---

## Generative AI (e.g., ChatGPT)

**The key rule: Disclosure is required.** If AI is used to write any code and you don't disclose it, this is a breach of academic integrity policy.

**Using AI to learn:** You may use AI tools to look up concepts you don't know how to implement - this is similar to searching documentation or Stack Overflow. However, you must always disclose AI usage in your submission, describing how and to what extent it was used.

**Projects 1 & 2:** Focus on demonstrating that YOU understand the fundamentals. AI-generated code without genuine understanding defeats the purpose of these skill-building assignments.

**Project 3:** AI usage is permitted more liberally, as long as it's documented. By this point you should have the fundamentals down and can use AI as a productivity tool.

**Verification:** I reserve the right to ask you to come to office hours and explain advanced concepts that appear in your homework. If you can't explain code you submitted, that's a problem. You must show that you understand what you've turned in.

---

## Additional Important Notes

### Statement of Teaching Philosophy

My goal is to spark your curiosity and excitement about multiplatform development rather than serve as an encyclopedia of information. I bring a unique perspective from years in industry combined with teaching experience, which I hope provides valuable real-world context to our coursework.

I genuinely welcome your feedback throughout the semester; whether it's about speaking volume, organization, pacing, or anything else that affects your learning. Please share concerns with me directly rather than waiting for end-of-semester evaluations if you feel comfortable, as my goal is to continuously improve and deliver the high-quality education you expect at RIT.

**A note on feedback:** If something isn't working for you, please tell me - via Slack, email, office hours, or even an anonymous message if you prefer. I can't fix what I don't know about. Unlike a restaurant that can rebrand, public review sites are tied to my name permanently and don't give me a way to respond or follow up. I'm just asking for the courtesy of being able to hear your concerns and improve - reaching out directly makes that possible.

Given our limited in-person time (2.5 hours/week) and the lab-based nature of this course, we'll use a flipped classroom approach. This means you'll engage with foundational content before class, allowing us to maximize our face-to-face time for hands-on work, problem-solving, and collaborative learning.

I'm committed to making this a valuable experience for all of us. Let's learn and grow together this semester.

### Student Support Availability

Success in this course depends heavily on your personal health and wellbeing. Recognize that stress is an expected part of the college experience, and it often can be compounded by unexpected setbacks or life changes outside the classroom. Your other instructors and I strongly encourage you to reframe challenges as an unavoidable pathway to success. Reflect on your role in taking care of yourself throughout the term, before the demands of exams and projects reach their peak. Please feel free to reach out to me about any difficulty you may be having that may impact your performance in this course as soon as it occurs and before it becomes unmanageable.

In addition to your academic advisor, I strongly encourage you to contact the many other support services on campus that stand ready to assist you. These include the Academic Success Center, College Restoration Program, Disability Services, English Language Center, Higher Education Opportunity Program, Spectrum Support program, and TRiO Support Services. Students can find out about specific services and programs on the Student Affairs Website.

If you feel you are in need of counseling services, you can call [Counseling & Psychological Services (CaPS)](https://www.rit.edu/studentaffairs/counseling/get-support/need-help-now) at 475-2261 during business hours (M-Th, 8 to 5) or go directly to CaPS on the second floor of the August Center (AUG). Additional contact information is available at the link.

[Tigers Care](https://www.rit.edu/studentaffairs/tigerscare/) is a campus-wide effort to enhance, promote, and sustain a culture of caring and support at RIT.

Other avenues of support include:

- The [RIT Academic Support Center](http://www.rit.edu/studentaffairs/asc) has several resources for students in terms of assistance with math, science, and writing skills.
- [Ombuds Office](http://rit.edu/ombuds)
- [Disability Services Office](http://www.rit.edu/studentaffairs/disabilityservices/)
- [Student Health Center](http://www.rit.edu/studentaffairs/studenthealth/)
- [Counseling Center](http://www.rit.edu/studentaffairs/counseling/)
- [Center for Women and Gender](https://www.rit.edu/studentaffairs/womenandgender/)
- [Q Center](https://www.rit.edu/studentaffairs/qcenter/index.html)

### Statement on Diversity, Inclusion, and Respect

RIT is committed to fostering an inclusive environment where all faculty, staff, and students can thrive both professionally and personally. Through equitable policies and practices, RIT upholds its values of diversity and fairness while ensuring compliance with federal, state, and local laws.

RIT has developed [Policy P05.0 Diversity Statement](https://www.rit.edu/policies/p050) for all community members.

### Statement on Academic Accommodations

RIT is committed to providing academic accommodations to students with disabilities. If you would like to request academic accommodations such as testing modifications due to a disability, please contact the Disability Services Office. Contact information for the DSO and information about how to request accommodations can be found at www.rit.edu/dso. After you receive academic accommodation approval, it is imperative that you contact me as early as possible so that we can work out whatever arrangement is necessary.

### Statement on Title IX

RIT is committed to providing a safe learning environment, free of harassment and discrimination as articulated in our university policies located on our governance website. RIT's policies require faculty to share information about incidents of gender based discrimination and harassment with RIT's Title IX coordinator or deputy coordinators when incidents are stated to them directly. The information you provide to a non-confidential resource which includes faculty will be relayed only as necessary for the Title IX Coordinator to investigate and/or seek resolution. Even RIT Offices and employees who cannot guarantee confidentiality will maintain your privacy to the greatest extent possible.

If an individual discloses information during a public awareness event, a protest, during a class project, or advocacy event, RIT is not obligated to investigate based on this public disclosure. RIT may however use this information to further educate faculty, staff and students about prevention efforts and available resources.

If you would like to report an incident of gender based discrimination or harassment directly you may do so by using the online Sexual Harassment, Discrimination and Sexual Misconduct Reporting or anonymously by using the Compliance and Ethics Hotline.

If you have a concern related to gender-based discrimination and/or harassment and prefer to have a confidential discussion, assistance is available from any of RIT's confidential resources (listed below).

**RIT Counseling and Psychological Services**  
585-475-2261 (V)  
585-475-6897 (TTY)  
[www.rit.edu/counseling](http://www.rit.edu/counseling)

**RIT Student Health Center**  
585-475-2255 (V)  
[www.rit.edu/studentaffairs/studenthealth](http://www.rit.edu/studentaffairs/studenthealth)

**RIT Ombuds Office**  
585-475-7357  
585-475-6424  
585-286-4677 (VP)  
[www.rit.edu/ombuds/contact-us](http://www.rit.edu/ombuds/contact-us)

**NTID Counseling and Academic Advising**  
585-475-6400  
[www.ntid.rit.edu/counselingdept](http://www.ntid.rit.edu/counselingdept)

**Center for Religious Life**  
585-475-2137  
[www.rit.edu/studentaffairs/religion](http://www.rit.edu/studentaffairs/religion)

---

*Last updated: Spring 2026*