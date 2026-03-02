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

You can use **any public API** that interests you — the goal is to build something *you* find engaging. The main requirement is that the API returns data you can search/filter (to meet the 3-control requirement). The suggested APIs below are all free with no authentication, but you're welcome to use an API that requires an API key or other authentication — that's actually good real-world practice. Just know that *you* are responsible for getting it set up and working, which is why the proposal requires proof that you've successfully connected to your chosen API.

If you already have an API in mind, go for it. If you're looking for inspiration, here are some that have worked well in the past:

### Suggested APIs

APIs are listed roughly in order of how straightforward they are to work with for this project. Tags give you a quick sense of what to expect.

- **Jikan (MyAnimeList) API v4:** https://docs.api.jikan.moe/ — search and filter anime/manga by title, type, score, status, rating, genre, and more. Returns full details in a single request. `Tried & tested` `Highly configurable`
  *(Note: v3 is no longer supported — make sure you're using v4.)*

- **REST Countries:** https://restcountries.com/ — filter by region, language, currency, capital, etc. Full country data returned in every response. `Tried & tested` `Lots of filters`

- **AmiiboAPI:** https://www.amiiboapi.org/docs/#amiibo — search by name, filter by type (Figure/Card/Yarn), game series, amiibo series, character. No auth required. `Looks promising` `Lots of filters`
  *(New replacement for the old amiiboapi.com which shut down Dec 2025.)*

- **NHTSA Vehicle API:** https://vpic.nhtsa.dot.gov/api/ — decode VINs, search by make/model/year, filter by vehicle type, manufacturer. No auth required. Good exercise in URL building. `Looks promising` `Lots of filters`

- **TheMealDB / TheCocktailDB:** https://www.themealdb.com/api.php / https://www.thecocktaildb.com/api.php — These are sister APIs with the same structure. Search by name, filter by category, area/glass type, ingredient. `Tried & tested` `Incomplete filter responses`
  **Read this before choosing:** The *search* endpoint (`search.php?s=chicken`) returns full data — name, instructions, ingredients, images, everything. But the *filter* endpoints (`filter.php?c=Seafood`) only return three fields: name, thumbnail, and ID. That means if you want to show any real detail (ingredients, instructions, etc.) when filtering by category or area, you'd need to make a *second* request per item using `lookup.php?i={id}` to get the full data. This adds complexity that other APIs on this list don't have. Totally doable, but plan for it.

*Love dogs, sports, weather, or something else not listed here? Find an API for it and prove it works in your proposal. The [Finding Your Own API](#finding-your-own-api) section below has directories to browse. (The Dog API at dog.ceo was previously listed here but removed — it only returns image URLs with no search or filtering, making it very difficult to meet the 3-control requirement.)*

*Note: 235 starters for some of the above APIs can be found in the [web-service-app-starters.md](https://github.com/tonethar/IGME-235-Shared/blob/master/tutorial/web-service-app-starters.md) — these are web-based but useful for understanding the API structure.*

### Finding Your Own API (Encouraged!)

The list above is just a handful of APIs we've seen work in past semesters — it's a **very** small sample of what's out there. Some of the best projects come from students who find an API they're genuinely excited about. There are **hundreds** of free public APIs covering just about every topic you can think of:

Animals, Anime, Books, Cryptocurrency, Food & Drink, Games, Geography, Movies & TV, Music, News, Science, Sports, Vehicles, Weather — and a lot more.

**Start here:** [Public API Lists](https://github.com/public-api-lists/public-api-lists) — a massive categorized directory of free APIs. We'll look at this together in class. When browsing, look for APIs where the **Auth** column says `No` or `apiKey` — those will be the easiest to get up and running. Also pay attention to how many endpoints and filter parameters an API offers — you need enough to build 3 meaningful controls.

Other directories to browse:
- [Free Public APIs for Developers (freeCodeCamp)](https://www.freecodecamp.org/news/public-apis-for-developers/)

**If you choose your own API:**
- You must prove you can access it and get data back by the proposal deadline (see [Section IV](#iv-proposal) below). This is your safety net — if the API turns out to be broken or too limited, you'll find out early.
- Keep your project to a reasonable scope that is roughly equivalent to the other assignments.
- APIs that require an API key are totally fine (and good practice!) — just be sure you can get the key and connect before submitting your proposal.

You can make pretty much any experience you like as long as it captures a user request, gets data from the API, and then presents it back in a way that is useful or fun, easy to understand, and fairly well organized.

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
- Widgets are well labeled and follow interface conventions, for example:
  - radio buttons are for mutually exclusive options, checkboxes are for when you want to let the user choose *multiple* options.
- Users should be able to figure out how to use the app with minimal instruction:
  - be sure to provide instruction and hints if necessary
- User errors must be handled gracefully:
  - for example, if the user forgets to type in a search term before clicking the Search button, the app should tell the user something like "Please enter a search term first"
- Users must know what *state* the app is in at all times:
  - for example, when they click the search button, there should some indication that a search is happening:
    - text that says "Searching for 'Tacos' near you" and so on
    - a "spinner" or other "indeterminate progress" animation

### C. Code Conventions
- D.R.Y. - Don't Repeat Yourself. Repeated blocks of nearly identical code must be factored out and placed in a separate function.
- Take advantage of separating your widgets out into their own classes to make managing the Widget tree easier.
- Don't be afraid to create separate .dart files for specific functionality.
- Variable and function names must follow a standard, ex, CONSTANTS, Classes, normalVariables. Make sure variables are easy to understand.
- Well-commented code. Each and every function gets a comment indicating what it does.

## IV. Proposal

The proposal ensures you've thoughtfully planned your application before diving into development. This checkpoint helps you validate your API choice, confirm scope feasibility, and receive early feedback.

**Due Date:** See MyCourses for due date/time.

Your proposal document must include:

### 1. API Selection & Justification (Required)
- **API Name & Documentation Link** (ex: https://developers.giphy.com/docs/)
- **API Choice Category**: Specify one of:
  - Pre-approved API from [Section II](#ii-api-options) above
  - Custom API (requires API viability proof)

**For Custom APIs Only:** You must demonstrate that your chosen API is accessible and returns usable data. I'm willing to offer some guidance here as well if you come to office hours or contact me not last minute.

Include **ONE** of the following:
- Screenshot of successful API call in Hoppscotch/Postman/browser showing JSON response
- OR Screenshot of successful API call in DartPad showing parsed data
- OR Code snippet with comments explaining how you'll access the API

*This doesn't need to be in your Flutter app yet — just proof the API is accessible and returns data you can work with, but you're welcome to do it in Flutter too.*

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
Include an About Dialog or page with Documentation where you document your process, cite any sources, tell me where to find anything special you want me to see, and also explain how you met the requirements.

## VII. Grading
The grading rubric for this project is visible in myCourses. You should look it over carefully. Find it by going to the "Assignments" section and clicking through to the "Project 2 Final Submission" dropbox.

Reminder — 'A'-level work means doing college-level work that goes beyond what we did in class. (You should be able to see this reflected in the online Rubric). Meeting only the base requirements will most likely only earn you a B.

## VIII. Submission
- Perform a `flutter clean`, ZIP and post the completed project and documentation page to the MyCourses dropbox. Be sure to check the Submission Guidelines for more details!

> **Need Help?**
> Don't forget I added extensive documentation in the references area about how to [connect to Giphy](../reference/network/giphy-api-setup.md). Much of the code you need may end up being similar in nature to this; but the way you interact and build it will be different. In a sense we are providing you with much of the ingredients; but you need to creatively assemble and build the meal.
