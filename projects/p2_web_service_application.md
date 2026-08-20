> **Project Scope & Success:** These projects are substantial, but manageable with proper planning. I've provided extensive code examples in our [Reference Manual](../reference/README.md), including complete implementations like the [shared preferences guide](../reference/data-persistence/shared-preferences.md).
>
> **Time Management:** Plan for 6 to 9 hours of outside work weekly—standard for a 3-credit course. [I'm not making this up :)](https://www.humboldt.edu/sites/default/files/learning-center/2024-11/studyratiorecommendations.pdf). Starting early gives you time to create A-quality work and impressive portfolio pieces. Unlike unpredictable exams, you control your project outcomes through consistent effort. Last-minute starts typically lead to poor results and unnecessary stress.

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

## II. Choosing an API

You can use **any public API** that interests you — the goal is to build something *you* find engaging. The main requirement is that the API returns data you can search/filter (to meet the 3-control requirement). You can make pretty much any experience you like as long as it captures a user request, gets data from the API, and then presents it back in a way that is useful or fun, easy to understand, and fairly well organized.

### Find an API You're Excited About

There are **hundreds** of free public APIs out there covering just about every topic you can think of:

Animals, Anime, Books, Cryptocurrency, Food & Drink, Games, Geography, Movies & TV, Music, News, Science, Sports, Vehicles, Weather — and a lot more.

**Start here:** [Public API Lists](https://github.com/public-api-lists/public-api-lists) — a massive categorized directory of free APIs. We'll look at this together in class.

Other directories to browse:
- [Free Public APIs for Developers (freeCodeCamp)](https://www.freecodecamp.org/news/public-apis-for-developers/)

**Tips for picking a good API:**
- Look for APIs where the **Auth** column says `No` or `apiKey` — those will be the easiest to get up and running. APIs that require an API key are totally fine (and good real-world practice!) — just be sure you can get the key and connect before submitting your proposal.
- Pay attention to how many **endpoints and filter parameters** an API offers — you need enough to build 3 meaningful controls.
- **Every** proposal requires a screenshot proving the API is live and returning data (see [Section IV](#iv-proposal) below) — even for APIs on our "worked before" list. This is your safety net — if the API is down or too limited, you'll find out early enough to switch.
- Keep your project to a reasonable scope that is roughly equivalent to the other assignments.

### APIs That Have Worked Before

The list below is a small handful of APIs that have been used in past semesters or that we've reviewed and think would work well. **You are not limited to this list** — it's just here as a starting point if you want something you know will work. Tags give you a quick sense of what to expect.

- **Jikan (MyAnimeList) API v4:** https://docs.api.jikan.moe/ — search and filter anime/manga by title, type, score, status, rating, genre, and more. Returns full details in a single request. `Tried & tested` `Highly configurable`
  *(Note: v3 is no longer supported — make sure you're using v4.)*

- **REST Countries:** https://restcountries.com/ — filter by region, language, currency, capital, etc. Full country data returned in every response. `Tried & tested` `Lots of filters`

- **AmiiboAPI:** https://www.amiiboapi.org/docs/#amiibo — search by name, filter by type (Figure/Card/Yarn), game series, amiibo series, character. No auth required. `Looks promising` `Lots of filters`
  *(New replacement for the old amiiboapi.com which shut down Dec 2025.)*

- **NHTSA Vehicle API:** https://vpic.nhtsa.dot.gov/api/ — decode VINs, search by make/model/year, filter by vehicle type, manufacturer. No auth required. Good exercise in URL building. `Looks promising` `Lots of filters`

- **TheMealDB / TheCocktailDB:** https://www.themealdb.com/api.php / https://www.thecocktaildb.com/api.php — These are sister APIs with the same structure. Search by name, filter by category, area/glass type, ingredient. `Tried & tested` `Incomplete filter responses`
  **Read this before choosing:** The *search* endpoint (`search.php?s=chicken`) returns full data — name, instructions, ingredients, images, everything. But the *filter* endpoints (`filter.php?c=Seafood`) only return three fields: name, thumbnail, and ID. That means if you want to show any real detail (ingredients, instructions, etc.) when filtering by category or area, you'd need to make a *second* request per item using `lookup.php?i={id}` to get the full data. This adds complexity that other APIs on this list don't have. Totally doable, but plan for it.

*(The Dog API at dog.ceo was previously listed here but removed — it only returns image URLs with no search or filtering, making it very difficult to meet the 3-control requirement.)*

*Note: 235 starters for some of the above APIs can be found in the [web-service-app-starters.md](https://github.com/tonethar/IGME-235-Shared/blob/master/tutorial/web-service-app-starters.md) — these are web-based but useful for understanding the API structure.*

## III. Requirements

### A. Functional
1. Use one of the APIs above (or one of your choosing) to create an experience similar to [GIF Finder](../reference/network/giphy-api-setup.md) that meets the requirements below.

2. **Saved State:** Save the last term searched by the user in the device's shared_preferences.
    - We will test this by typing in a search term, doing a search, and then closing the application. When we re-open the app, the user's last search term should still be in the field.
    - Ideally this will also be true of the other controls, but we won't require it.
    - If there isn't a "search term" to save in your project, then save something else and be sure to document what is saved from visit to visit.

3. **Required Controls:** There will be a MINIMUM of 3 controls that a user can use to filter and display the results. Search buttons or similar don't count towards the 3 controls. For example, GIF Finder has these controls:
    - a search button (which doesn't count)
    - a search term field that the user types into
    - a pulldown that the user can use to limit the number of results

    **So you will need at least one additional kind of control.** What kind of control to use depends on what parameters the web service will allow you to search it on. Here are some ideas:
    - a **rating** pulldown — if we had this on the GIPHY HW then a user would be able to choose between viewing "G" and "PG" videos for example
    - a **sort by** pulldown to allow the user to view the results sorted A->Z, Z->A, by date, etc
    - a **date** chooser to filter the results by date — a Datepicker Widget would be an excellent choice here
    - **next** and **previous** buttons — another really nice option is to allow the user to "page" through large numbers of results. In the GIPHY HW did you notice that we always get the same 100 "cat" GIFs back when we search? This is because there are ***thousands*** of cat GIFs on GIPHY, and if we don't otherwise specify we will always get them returned from the web service starting at index 0, which means we always get the first 100 (index 0-99) back. We can instead write code that requests a higher starting index.

### B. Design & Interaction
- Pleasing graphic design:
  - Show me the cool things you can do in Flutter.
  - The interface does not closely resemble the GIPHY homework's UI
- **Well-labeled controls:** Every input should have a clear label or hint text so users know exactly what to type or select. Don't make users guess what a field expects.
- **Use the right control type for the job:** If a filter has a fixed set of options (e.g., Pokemon types, meal categories, content ratings), use a **DropdownButton** — not a TextField where the user has to type a value and hope it matches exactly. TextFields are great for open-ended search terms, but dropdowns prevent typos and make your app much easier to use. *(This was a common issue in past semesters — don't lose points over it!)*
- Widgets follow interface conventions, for example:
  - radio buttons are for mutually exclusive options, checkboxes are for when you want to let the user choose *multiple* options.
- Users should be able to figure out how to use the app with minimal instruction:
  - be sure to provide instruction and hints if necessary
- **Basic input validation is expected:**
  - Don't let users submit empty searches — show a message like "Please enter a search term first"
  - If a field requires specific input, validate it before making the API call
  - Display user-friendly error messages (not crashes or silent failures)
- Users must know what *state* the app is in at all times:
  - for example, when they click the search button, there should some indication that a search is happening:
    - text that says "Searching for 'Tacos' near you" and so on
    - a "spinner" or other "indeterminate progress" animation

#### Bonus: Form Polish (up to +5 points) *(added March 4, 2026)*

Want a few extra points? Implement professional form behaviors that real-world apps use. These small touches show attention to detail and can either push you past 100 or make up for a rough spot elsewhere. See [Week 8B](../weekly/8B.md) for how to implement these:

- **Clear (X) buttons** on TextFields so users can quickly reset input
- **Focus node management** — pressing the keyboard's next/enter button jumps to the next field
- **Tap-outside keyboard dismissal** — tapping outside a TextField closes the keyboard (standard iOS/Android behavior)

**To receive bonus points, you must document what you implemented** in your submission documentation (see [Section VI](#vi-documentation) below) so I know to look for it.

### C. Code Conventions
- D.R.Y. - Don't Repeat Yourself. Repeated blocks of nearly identical code must be factored out and placed in a separate function.
- Take advantage of separating your widgets out into their own classes to make managing the Widget tree easier.
- Don't be afraid to create separate .dart files for specific functionality.
- Variable and function names must follow a standard, ex, CONSTANTS, Classes, normalVariables. Make sure variables are easy to understand.
- Well-commented code. Each and every function gets a comment indicating what it does. The three required rules:
  - A header block at the top of every `.dart` file: what it does, your name, the date
  - One line above every function saying what it does
  - One line on anything non-obvious saying **why**

  Project 1 was graded leniently on this. **Project 2 is not.** Functions without comments cost
  you points on the rubric. See the [Commenting Guide](../commenting_guide.md) for examples.

## IV. Proposal

The proposal ensures you've thoughtfully planned your application before diving into development. This checkpoint helps you validate your API choice, confirm scope feasibility, and receive early feedback.

**Due Date:** See MyCourses for due date/time.

Your proposal document must include:

### 1. API Selection & Proof of Connection (Required)
- **API Name & Documentation Link** (ex: https://developers.giphy.com/docs/)

**All APIs — including ones from the "worked before" list — require a screenshot proving the API is live and returning data.** APIs go up and down all the time, and we don't want you building a whole project around one that stops working. This takes just a few minutes and protects you.

**Include a screenshot** of a successful API call showing JSON response data. The easiest way:
1. Open [Hoppscotch](https://hoppscotch.io/) (free, no install needed)
2. Paste in one of your API's endpoints
3. Hit Send and screenshot the response

That's it. This doesn't need to be in your Flutter app yet — just proof the API is live, accessible, and returns data you can work with. You're welcome to use Postman, your browser, DartPad, or even Flutter if you prefer.

If you're using an API not on the "worked before" list, or one that requires an API key, I'm happy to offer guidance — just come to office hours or reach out before the last minute.

### 2. Application Purpose (Required)
In 2-3 sentences, describe:
- What problem does your app solve?
- Who is the target user?
- What makes it useful or engaging?

**Example:** "PokeDex Tracker helps competitive Pokemon players quickly search and compare base stats across generations. Users can filter by type, generation, and stat ranges to build optimal team compositions."

### 3. Core Functionality Description (Required)

Describe what users will be able to do with your app. Your description must address:

**Minimum Requirements:**
- [ ] How users search/query the API (text input, dropdowns, etc.)
- [ ] At least 3 user controls for filtering/displaying results (see [Required Controls](#a-functional) above for details and ideas)
- [ ] What data persists between app sessions (shared_preferences) — likely the search term? (we will talk about this week 9)
- [ ] How results are displayed (ListView, GridView, cards, etc.)

**Beyond the Basics (for 'A' level work):**
What makes your app more than a basic API viewer? Consider:
- Additional features not covered in class
- Particularly polished UI/UX
- Creative use of the API data
- Solving a real user need

**Example (Pokemon App):**

*Minimum:* "Users search Pokemon by name (text field), filter by generation (dropdown) and type (dropdown). Last search term is saved using shared_preferences. Results display in scrollable ListView with sprites and basic stats."

*Beyond:* "Tap any Pokemon to see detailed stat comparison chart. Save favorites list that persists. View evolution chains with visual tree diagram. Compare two Pokemon side-by-side."

### 4. Visual Mockup (Required)
Include **at least one** mockup showing your app's main screen. This can be:
- Hand-drawn sketch (photo/scan)
- Digital wireframe (Figma, Balsamiq, draw.io, etc.)
- Screenshot from similar app with annotations

**Your mockup should clearly show:**
- Where user inputs go (search field, dropdowns)
- How results will be displayed
- Navigation elements (if multi-page)

Label key UI elements so we understand your vision.

### 5. Technical Challenges (Optional but Recommended)
Identify 1-2 potential technical hurdles:
- API limitations (rate limits, authentication complexity)
- Data parsing challenges (nested JSON, missing fields)
- UI complexity concerns

This helps me provide early guidance if needed.

### Proposal Submission
1. **Document Format:** Submit as PDF or Word document
2. **File Naming:** `LastName_FirstName_P2Proposal.pdf`
3. **MyCourses:** Upload to the Project 2 Proposal dropbox
4. **Slack:** Share in `#section-[your-section]` channel for peer feedback

## V. Milestones

| Milestone | What's Expected | Due Date |
|-----------|----------------|----------|
| **Proposal** | API choice, purpose, functionality description, mockup (see [Section IV](#iv-proposal)) | See MyCourses |
| **Prototype** | Working API call with results displayed on screen at minimum. Enough for others to provide feedback. | See MyCourses |
| **Final Submission** | Complete, polished application meeting all requirements | See MyCourses |

## VI. Documentation

Your documentation has **two parts**: an in-app About dialog/page and a submission document.

### In-App About Dialog or Page (Required)
Include an About dialog or page inside your app. This is what a real app would have — keep it app-focused:
- App name and brief description
- Developer name
- Data source / API credit and link
- Any other credits or attributions (fonts, images, packages, etc.)

### Submission Document (Required) *(updated March 4, 2026)*
Submit a **short PDF** (1-2 pages) alongside your project ZIP in the MyCourses dropbox. This is what I read while grading — it helps me find everything and give you full credit. Use this structure:

1. **How to Use Your App** — Brief walkthrough: what to search, what the controls do, anything I should try
2. **How You Met the Requirements** — Quick notes on your 3+ controls, shared_preferences, etc.
3. **What's Special** — Anything beyond the basics you want me to notice (bonus polish, creative features, extra effort)
4. **AI Tools Used** — If applicable: what tools, what for (see [Academic Integrity note](#iv-proposal))
5. **Known Issues** — Anything that doesn't quite work or that you'd fix with more time (honesty here is appreciated and won't hurt your grade — it shows self-awareness)

**File naming:** `LastName_FirstName_P2Doc.pdf`

This replaces the old "document everything in the About page" approach — your About page stays clean and app-like, and I get a document that's easy to read while grading.

## VII. Grading
The grading rubric for this project is visible in myCourses. You should look it over carefully. Find it by going to the "Assignments" section and clicking through to the "Project 2 Final Submission" dropbox.

Reminder — 'A'-level work means doing college-level work that goes beyond what we did in class. (You should be able to see this reflected in the online Rubric). Meeting only the base requirements will most likely only earn you a B.

## VIII. Submission
- Perform a `flutter clean`, ZIP your project folder, and upload to the MyCourses dropbox
- Upload your **submission document PDF** (`LastName_FirstName_P2Doc.pdf`) to the same dropbox
- Be sure to check the Submission Guidelines for more details!

> **Need Help?**
> Don't forget I added extensive documentation in the references area about how to [connect to Giphy](../reference/network/giphy-api-setup.md). Much of the code you need may end up being similar in nature to this; but the way you interact and build it will be different. In a sense we are providing you with much of the ingredients; but you need to creatively assemble and build the meal.
