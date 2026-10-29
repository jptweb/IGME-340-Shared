# How to Excel on Project 3

This page breaks the Project 3 rubric into concrete things you can build, with links to the course notes that cover each one. The [Project 3 Instructions](p3_roll_your_own_instructions.md) are still the source of truth for deadlines and submissions.

Every project is different, so no page can be an exact checklist for your app. Use this as a guide, and ask me if you're not sure where a feature fits. I can also answer questions you put in your proposal.

## How to read this page

Each category below has up to two lists:

- **Must Have:** everyone does these. This part is a checklist.
- **Professional Execution:** ideas for doing the Must Haves really well. This is about quality, not more features. You don't need every item, just the ones that make sense for your app.

**Advanced Features** are not inside the categories. They're all in [one menu at the bottom](#advanced-features-optional-menu). They're optional, and they're how you get past 100. Pick one or two that fit your project. Nobody is expected to do all of them, and a game and a habit tracker will pick completely different ones.

These three names match the sections of the P3 Documentation template, so you can use this page when you fill it out.

## How the grade works

The final app is graded on six categories worth 95 points, plus one more rubric row, Above and Beyond, worth up to 5 points for exceptional polish or Advanced Features. That's how you reach 100. Projects with both can go past 100, up to 110, and I add those points by hand. Documentation and the Video Demo are separate MyCourses submissions with their own grades.

| Score | What it looks like |
|---|---|
| 70-80 | Some Must Haves missing, or there but rough |
| 80-90 | All Must Haves done and working |
| 90-95 | All Must Haves, with strong execution and attention to detail |
| 95-100 | Exceptional polish throughout, **or** solid work plus an Advanced Feature or two |
| 100-110 | Exceptional polish **and** multiple Advanced Features |

So there are two ways into the A range. You can polish everything and skip Advanced Features entirely, or you can do solid work and add one or two. Doing both is how you get past 100.

Most important: **document your work.** I can only grade what I can see. If you built something you're proud of, especially an Advanced Feature, say so in your documentation and tell me where to find it.

---

## 1. Usefulness & Entertainment (10 pts)

**Must Have:**
- A clear purpose: something someone would actually want to use or play
- It works as intended

**Professional Execution** (ideas, pick what fits):
- An engaging experience that holds someone's attention
- Enough polish that people want to try it

## 2. Error Prevention & Handling (10 pts)

**Must Have:**
- Graceful error handling: problems show a message instead of crashing the app
- [Input validation](../reference/input-forms/form-validation.md) anywhere the user types
- Error messages a user can understand

**Professional Execution** (ideas, pick what fits):
- [Keyboard dismissal](../reference/input-forms/focus-management.md#dismissing-the-keyboard) when appropriate

## 3. Code Quality & Organization (15 pts)

**Must Have:**
- Comments at the highest bar of the semester. This is the standard for everyone on P3, whether or not you used AI tools. See the [Commenting Guide](../commenting_guide.md) for examples.
  - A header block at the top of every `.dart` file: what it does, your name, the date
  - One line above every function saying what it does
  - Comments that explain **why** you made a decision, not only what the code does
- Code [organized into multiple .dart files](../reference/patterns/code-organization.md#file-organization)
- At least one [custom class](../study-guides/01-dart-fundamentals.md#v-classes) of your own
- Typed variables instead of `var` everywhere (see [Study Guide 01](../study-guides/01-dart-fundamentals.md#var-final-and-const))
- [DRY](../reference/patterns/code-organization.md#dry-dont-repeat-yourself): no repeated blocks of code
- Debug `print` statements removed

**If you used AI tools:**
- Document it in your submission (see [Instructions, Section IX](p3_roll_your_own_instructions.md#ix-ai-tools--academic-integrity))
- Be ready to explain the decisions in your code with more than "the AI suggested it"
- The file structure should show you thought about it, not that you pasted output

Whether you wrote the code yourself or had help, you need to understand and be able to explain all of it. Using AI code you don't understand is the same problem as copying from Stack Overflow without understanding it.

Related: [Code Organization & DRY](../reference/patterns/code-organization.md), [Declarative UI Architecture](../reference/state-management/declarative-ui-architecture.md) (keeping data separate from UI)

## 4. Functional Requirements (20 pts)

**Must Have:**
- Custom splash screen, custom app icon, and an appropriate app name ([Week 13B](../weekly/13B.md))
- No debug banner (hint: `MaterialApp` has a property for this)
- [SharedPreferences](../reference/data-persistence/shared-preferences.md) to save something: settings, preferences, or game state
- Multiple pages or screens (we built these in [Week 9B](../weekly/9B.md), the Stupid Clicker Game)
  - Games: think menu, game, pause, and game over
  - Apps: whatever pages your app's purpose needs. No About page is required, since your documentation is a separate PDF.
- One navigation method. Pick **one**:
  - [BottomNavigationBar](../reference/navigation/bottomnavigationbar.md) ([Week 11A](../weekly/11A.md))
  - [TabBar](../reference/navigation/tabbar-tabbarview.md) ([Week 11A](../weekly/11A.md))
  - [Named routes](../reference/navigation/named-routes.md)
- No crashes
- Something we didn't build together in class. It doesn't need to be revolutionary. A unique feature or workflow, a creative use of what we covered, a new package or API, or original game mechanics all count. Say what makes yours different in your documentation.

Navigation help: [Basic Navigation](../reference/navigation/basic-navigation.md), [Passing Data Between Pages](../reference/navigation/data-passing.md)

## 5. Interface Quality (20 pts)

**Must Have:**
- An intuitive, well-labeled interface
- [Dialogs or alerts](../reference/navigation/dialogs-alerts.md) with clear instructions where they're needed
- Works well in portrait: content fits on a standard phone screen without overflow. [Expanded and Flexible](../reference/widgets/expanded-flexible.md) help with this.

**Professional Execution** (ideas, pick what fits):
- Tap feedback with [InkWell](../reference/widgets/inkwell-gesturedetector.md) on interactive elements
- Contextual feedback with [SnackBars](../reference/notifications/scaffold-messenger.md)
- [URL Launcher](../reference/platform-integration/url-launcher.md) for external links, if your app has any
- Loading states and empty states that look intentional

## 6. Visual Design (20 pts)

**Must Have:**
- A [custom font](../reference/styling/text-fonts.md), local or Google Fonts
- Coordinated colors using a [Theme](../reference/styling/themes.md) or [ColorScheme](../reference/styling/colorscheme.md)
- [BoxDecoration](../reference/styling/box-decoration.md) for polish: gradients, shadows, borders, rounded corners
- Appropriate [images](../reference/widgets/images-assets.md) and icons ([SVG](../reference/assets/svg-images.md) works too)
- Clearly beyond the default Flutter look

**Professional Execution** (ideas, pick what fits):
- Consistent spacing and visual hierarchy on every screen
- Color that means something (errors, success, warnings) instead of random colors
- Icons and imagery that look like they belong together
- [CachedNetworkImage](../reference/platform-integration/cached-network-image.md) if your app loads images from the network

Styling help: [Themes & ThemeData](../reference/styling/themes.md), [Text Styling & Custom Fonts](../reference/styling/text-fonts.md)

---

## Advanced Features (optional menu)

This is the only list of Advanced Features on the page. Pick one or two that fit your project. Most of these won't fit any given app, and that's fine. One done well is worth more than three done badly.

Want to try something that isn't here? Pitch it in your proposal and I'll tell you if it counts.

The "Counts when" column is the bar. A single fade animation or one sound on a button tap is a nice touch, but it isn't an Advanced Feature.

### Covered in class

| Feature | Good fit for | Counts when | Learn it |
|---|---|---|---|
| Provider | Any app | Multiple ChangeNotifiers managing real app state | [Provider pattern](../reference/state-management/provider-pattern.md), Week 10A |
| GoRouter | Apps with many screens | Advanced navigation patterns, beyond the basic setup from class | [GoRouter](../reference/navigation/gorouter.md), [Week 10A](../weekly/10A.md) |
| Loading and errors in a provider | Apps that load data | The provider owns loading and error state, and the UI reacts to it | [Week 10B](../weekly/10B.md), Part 6 |
| Flame game engine | Games | A Flame game with multiple levels and state | [Week 11B](../weekly/11B.md) to 12B |
| WebView | Apps that show web content | Two-way communication between Flutter and the page | [Week 12A](../weekly/12A.md) |
| Sound effects or music | Games, some apps | Sound that's part of the experience, used throughout | [Week 12B](../weekly/12B.md), AudioPlayers |
| App lifecycle | Any app | Proper state handling when the app is paused and resumed | [Week 13A](../weekly/13A.md) |
| Camera | Apps that capture photos | Camera or image picking that's part of what the app does | [Week 14A](../weekly/14A.md) |
| Responsive tablet layout | Any app | Works well on phones **and** tablets | [MediaQuery & LayoutBuilder](../reference/responsive-design/mediaquery-layoutbuilder.md), [Week 14B notes](../weekly/14B.md) |

### Not covered in class (extra learning)

| Feature | Good fit for | Counts when | Learn it |
|---|---|---|---|
| Custom animations | Any app | Beyond basic implicit animations, used throughout the app | [Flutter animation tutorial](https://docs.flutter.dev/ui/animations/tutorial) |
| Production error handling | Apps that load data | Retry logic and offline support, with clear feedback to the user | On your own |
| Riverpod or BLoC | Any app | Used for your app's state management in place of Provider | [Riverpod docs](https://riverpod.dev/) |
| Firebase | Apps with accounts or shared data | Authentication or a real-time database that the app depends on | [IGME-330 Firebase guide](https://github.com/rit-igm-web/igme-330-shared/blob/main/notes/firebase-1.md) |
| GPS or maps | Location-based apps | Location services that are part of what the app does | On your own |

### Small UX polish

You don't need a killer app to reach 100+. A simpler app with a lot of professional polish can get there too. These are small touches real apps have, the kind users only notice when they're missing. They mostly fit apps with forms or text input, and all four are in [Week 7A](../weekly/7A.md).

- [Clear (X) buttons](../weekly/7A.md#part-1-adding-clear-buttons-to-textfields) on TextFields
- [Next-field navigation](../weekly/7A.md#part-2-focus-nodes---taking-control-of-navigation): the keyboard's Next button jumps to the next field
- [Tap outside to dismiss the keyboard](../weekly/7A.md#part-3-dismissing-the-keyboard)
- [SingleChildScrollView on forms](../weekly/7A.md#part-4-preventing-keyboard-from-covering-fields) so the keyboard doesn't cover the fields

If you add these, list them in your documentation ("I added clear buttons, focus management, and keyboard dismissal") so I know to look.

### What doesn't count as Advanced

These are all Must Haves, so they don't count toward the menu:
- Multiple pages
- SharedPreferences
- Images and a custom font
- Looking better than default Flutter
- Commented, organized code
- Basic navigation

For everything else we've covered, see the [full reference guide](../reference/README.md).

---

*Last updated: Week 10 | Fall 2026*
