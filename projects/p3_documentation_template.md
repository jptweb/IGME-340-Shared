# Project 3 Documentation Template

> **Instructions:** Copy this template into a Google Doc or Word document, fill out ALL sections completely, then export to PDF and submit to MyCourses. Be as specific as possible—this is how I know what to grade!

---

## 1. Project Information

**Project Name:** [Your app/game name]

**Developer Name:** [Your name]

**Short Description:** [2-3 sentences describing what your project does]

**GitHub Repository:** [Link to your repo if applicable]

---

## 2. AI Tool Usage Declaration

**Required for ALL students** - Check ONE:

- [ ] **No AI tools were used** in the development of this project

- [ ] **AI tools were used** in the development of this project (complete Section 3 below)

---

## 3. AI Collaboration Details

> **Only complete this section if you used AI tools. If you didn't use AI, skip to Section 4.**

### AI Tools Used:
List the specific AI tools you used (be specific with versions):
- Example: ChatGPT-4
- Example: GitHub Copilot
- Example: Claude Sonnet 3.5
- [Your tools here]

### Features/Components That Used AI Assistance:

For each feature where you used AI, describe:
1. What feature/component it was
2. How you used AI (prompting approach, what you asked for)
3. How much of the final code was AI-generated vs. modified by you

**Example:**
- **Provider State Management Setup (Week 10 content)**
  - Used Claude to generate initial Provider boilerplate structure
  - Prompt: "Create a Provider pattern setup for a Flutter app that manages a list of items"
  - Result: AI generated about 60% of the ChangeNotifier class, I modified it significantly to fit my specific data model and added custom methods for my app's needs
  - What I learned: AI is good at boilerplate but doesn't understand my specific requirements

[Your detailed descriptions here - be specific!]

### What Worked Well:
[Describe prompting strategies or AI approaches that were effective]

### What Required Manual Intervention:
[Describe what the AI got wrong or what you had to fix/rewrite]

### What You Learned About AI's Capabilities and Limitations:
[Reflect on what AI is good/bad at for Flutter development]

---

## 4. Must-Have Features Checklist

Check off each required feature and **describe where to find it** in your app:

- [ ] **Custom Splash Screen**
  - Location: [Describe - e.g., "Appears on app launch for 2 seconds"]
  
- [ ] **Custom App Icon**
  - Description: [Briefly describe your icon design]
  
- [ ] **Appropriate App Name**
  - App name: [Your app name as it appears on device]
  
- [ ] **Debug Banner Removed**
  - Confirmed removed
  
- [ ] **SharedPreferences for Data Persistence**
  - What data is saved: [e.g., "User preferences, game high scores, last viewed page"]
  - Where it's used: [e.g., "Settings page saves theme preference, game saves top 5 scores"]
  
- [ ] **Multiple Pages/Screens**
  - List your pages: 
    1. [Page name and purpose]
    2. [Page name and purpose]
    3. [etc.]
  
- [ ] **Navigation Method** (check ONE):
  - [ ] BottomNavigationBar
  - [ ] TabBar
  - [ ] Named Routes
  - Description of navigation: [How user moves between pages]
  
- [ ] **No Crashes**
  - Tested on: [e.g., "Android Pixel 6 emulator", "iPhone 14 simulator", "Physical Samsung Galaxy S21"]
  
- [ ] **No Debug Print Statements**
  - Confirmed: All print statements removed or commented out

---

## 5. Functionality Beyond Class Examples

**Required:** Your project must do something we didn't build together in class.

Describe what makes your project unique:
[Explain specific features, workflows, or implementations that go beyond what we did in class. Be specific!]

---

## 6. Code Quality & Organization

- [ ] **Code Comments**
  - Type of comments used: [Function headers, inline explanations, etc.]
  - Sample location: [Point to a specific file/function with good comments]

- [ ] **Multiple .dart Files**
  - List your main files and their purposes:
    1. [filename.dart - purpose]
    2. [filename.dart - purpose]
    3. [etc.]

- [ ] **Custom Classes**
  - List your custom classes:
    1. [ClassName - what it represents/does]
    2. [ClassName - what it represents/does]

- [ ] **Type-Safe Variables**
  - Confirmed: Minimized use of `var`, used specific types

- [ ] **DRY Principles Applied**
  - Example of code reuse: [Describe how you avoided repetition]

---

## 7. Professional Execution & Advanced Features

### Professional Execution Elements (if applicable):
List any professional polish you added beyond basic requirements:
- [ ] BoxDecoration with gradients/shadows throughout
- [ ] InkWell feedback on interactive elements
- [ ] SnackBars for contextual feedback
- [ ] Loading states
- [ ] Error states with helpful messages
- [ ] [Other professional touches]

**Where to see it:** [Describe specific locations/interactions]

### Advanced Features (if applicable):
Check and describe any advanced features you implemented:

- [ ] **Provider Pattern**
  - What state is managed: [Description]
  - Files involved: [List relevant files]

- [ ] **Flame Game Engine**
  - Game components used: [Description]

- [ ] **Firebase Integration**
  - What Firebase services: [Auth, Firestore, etc.]
  - What functionality: [Description]

- [ ] **Responsive Design for Tablets**
  - How it adapts: [Description]

- [ ] **Other Advanced Features**
  - Feature name: [Description and implementation details]

---

## 8. Step-by-Step Testing Guide

> **MOST IMPORTANT SECTION!** Tell me exactly how to see your features. Be VERY specific!

**Example Format:**
1. Launch the app → You'll see the custom splash screen (my logo with animation)
2. On the Home screen → Tap the blue "+" button in bottom right
3. This opens the Add Item form → Fill in the name field and tap "Save"
4. You should see a SnackBar confirmation at the bottom of the screen
5. The new item appears in the list with custom BoxDecoration styling
6. Tap the Settings icon (top right) → This opens Settings page
7. Toggle the "Dark Mode" switch → The theme changes immediately and this preference is saved via SharedPreferences
8. Close the app completely and reopen → Dark mode setting persists (demonstrating SharedPreferences)
9. [Continue for ALL major features...]

**Your Testing Guide:**
[Write your detailed step-by-step instructions here. Make it impossible for me to miss your features!]

---

## 9. Known Issues / Future Improvements

**Known Issues:**
[List any bugs or limitations you're aware of]

**Future Improvements:**
[What would you add/improve with more time?]

---

## 10. Resources & Attribution

**Code Resources:**
- [List any tutorials, Stack Overflow solutions, or other code sources you referenced]
- [Include links where applicable]

**Assets:**
- Images: [Where did images come from? Created by you? Free sources?]
- Fonts: [Which fonts used and from where?]
- Icons: [Source of icons if not built-in Flutter icons]
- Sounds/Music (if applicable): [Source and licensing]

**Packages Used:**
List all pub.dev packages beyond the basics:
1. [package_name - what you used it for]
2. [package_name - what you used it for]

---

## 11. Time Investment

Approximately how many hours did you spend on this project?
[Your estimate]

How much time was spent in different phases?
- Planning/Design: [hours]
- Coding: [hours]
- Debugging: [hours]
- Polish/UI: [hours]
- Documentation/Video: [hours]

---

## 12. Self-Reflection

**What are you most proud of in this project?**
[Your response]

**What was the most challenging aspect?**
[Your response]

**What would you do differently if you started over?**
[Your response]

**What did you learn from this project?**
[Your response]

---

**Checklist Before Submission:**
- [ ] I completed ALL sections of this template
- [ ] My Step-by-Step Testing Guide is detailed and specific
- [ ] I declared whether I used AI tools or not
- [ ] If I used AI, I completed Section 3 with specific details
- [ ] I've exported this to PDF
- [ ] My filename is: LastName_FirstName_P3_Documentation.pdf
- [ ] I'm submitting to the correct MyCourses dropbox

