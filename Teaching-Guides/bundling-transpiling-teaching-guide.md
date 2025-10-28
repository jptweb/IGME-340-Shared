# Teaching Guide: Bundling and Transpiling JavaScript with Webpack

## Pre-Class Setup
- [ ] Have Visual Studio Code open with starter project
- [ ] Have Babel playground open: https://babeljs.io/repl
- [ ] Have terminal window visible alongside VS Code
- [ ] Download and extract "Greeter module zip code" starter
- [ ] Verify Node.js and npm are installed on demo machine

## Learning Objectives
By the end of this lesson, students will be able to:
1. Explain what transpiling is and why it's necessary
2. Demonstrate the difference between ES6 and ES5 code
3. Set up and configure webpack for module bundling
4. Use npm scripts to automate the build process
5. Understand the relationship between source code and distribution code

---

## Part 1: Introduction to Transpiling (10 minutes)

### Opening Hook
"Today we're solving a real-world problem: How do we write modern JavaScript but still support older browsers?"

### Key Concept: What is Transpiling?
**Definition to share**: "Transpilers read source code in one programming language and transform it into equivalent code in another language."

**Real-world context**: 
- We want to write code in TypeScript (coming soon in this course)
- TypeScript won't run in browsers
- Solution: Transpile TypeScript → JavaScript that browsers understand

### Two Famous Transpilers
1. **TypeScript** - What we'll use in this course
2. **CoffeeScript** - Historical alternative (mention briefly)

---

## Part 2: Babel Demonstration (5-8 minutes)

### Live Demo: Babel Playground
Open https://babeljs.io/repl and make window large enough for class to see.

#### Example 1: Simple ES6 Features
**Say**: "Let me show you what Babel does. I'll write some modern ES6 code on the left."

**Type in left panel**:
```javascript
const name = "World";
const greet = () => {
  console.log(`Hello ${name}!`);
};
```

**Point out the transformations on the right**:
- `const` → `var`
- Arrow function → regular function
- Template string → string concatenation
- **Say**: "Notice everything gets converted to ES5 that all browsers understand."

#### Example 2: ES6 Classes
**Say**: "Let's look at something more complex - classes."

**Type in left panel**:
```javascript
class Person {
  constructor(name) {
    this.name = name;
  }
  
  greet() {
    return `Hello, ${this.name}`;
  }
}
```

**Point out the right panel**:
- **Say**: "Wow, this gets messy! It uses function constructors and prototype properties."
- **Say**: "This is why we prefer writing the shorter ES6 version - Babel handles the messy transformation for us."

**Key Teaching Point**: "You can see why writing modern JavaScript is better - it's cleaner and more readable, while the transpiler handles browser compatibility."

---

## Part 3: Introduction to Module Bundling (3 minutes)

### Transition Statement
"Babel handles transpiling, but we have another problem: modules don't work in older browsers. That's where webpack comes in."

### What is Webpack?
- **Module bundler** - combines multiple JavaScript files into one
- Takes all your imports/exports and bundles them together
- Solves the modules compatibility problem

### Why Use NPM Locally?
- We'll use Node.js and npm on our local machine
- These are developer tools, not production tools
- **Check**: "Everyone should have Node.js and npm installed already"

---

## Part 4: Hands-On Webpack Setup (25-30 minutes)

### Initial Project Setup

**Distribute starter files**: "Everyone download the Greeter module starter code."

**Demo the starter code first**:
1. Open in VS Code
2. Run it in browser (show it works)
3. Point out the module structure in code:
   - `<script type="module" src="main.js">`
   - Import statement in main.js
   - Export statement in utils.js

**Say**: "This works great in modern browsers, but what about older ones? Let's fix that."

---

### Step 1: Navigate to Project Directory

**Say**: "First, we need to get our terminal into the right folder."

**Demo slowly**:
```bash
cd [drag folder from Finder]
pwd  # Verify location
```

**Student Action**: "Everyone do this now. Type `pwd` to verify you're in the correct folder."

---

### Step 2: Initialize NPM

**Say**: "Let's create our package.json file that tracks our project metadata."

**Type and explain**:
```bash
npm init -y
```

**After it runs**: "Open package.json in VS Code. This has all our project metadata - name, version, scripts."

**Keep Finder window visible**: "I'm keeping Finder open so you can see files being created."

---

### Step 3: Install Webpack

**Say**: "Now we install webpack, our module bundler."

**Type**:
```bash
npm install webpack --save-dev
```

**While installing**: "Notice it says `--save-dev` not just `--save`. This means it's a development tool."

**After installation**:
- **Point to node_modules folder**: "See this folder? Don't commit this to GitHub."
- **Open package.json**: "See devDependencies? That's where webpack is listed."

**Teaching moment**: 
- "Dependencies vs devDependencies"
- "Dependencies = code needed in production"
- "devDependencies = tools for developers only"
- "In this project it doesn't matter much, but it's good practice"

---

### Step 4: Install Webpack CLI

**Say**: "We need one more package for the command-line interface."

**Type**:
```bash
npm install webpack-cli --save-dev
```

**After installation**: "Check package.json - now we have two devDependencies."

**Note about versions**: "Your version numbers might differ from mine. That's okay - you're in the future!"

---

### Step 5: Create Webpack Configuration

**Say**: "Webpack needs instructions. Let's create its config file."

**Create file**: `webpack.config.js` (same level as package.json)

**Important warning**: "Make sure this is in your ROOT folder, not inside src or any subfolder!"

**Type in webpack.config.js**:
```javascript
module.exports = {
  mode: 'development',
  entry: './src/main.js',
  output: {
    filename: 'bundle.js'
  }
};
```

**Explain each line**:
- **mode**: "Development = readable, Production = minified. We'll start with development."
- **entry**: "This is our starting point. Webpack starts here and follows all the imports."
- **output**: "This is what we'll get - bundle.js with everything combined."

**Key concept**: "Webpack is smart - it follows the dependency chain automatically."

---

### Step 6: Configure NPM Scripts

**Say**: "Let's add shortcuts to make running webpack easier."

**Open package.json, modify scripts section**:
```json
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "webpack": "webpack",
  "start": "npm run webpack -- --watch"
}
```

**Explain the scripts**:
- **webpack**: "Runs webpack once"
- **start**: "Runs webpack AND keeps watching for changes"
- **--watch flag**: "Automatically recompiles when you save changes"

---

### Step 7: Run Webpack

**Say**: "Let's see the magic happen!"

**Type**:
```bash
npm start
```

**Point out immediately**:
- "See 'webpack --watch' in the output?"
- "Look at Finder - new `dist` folder appeared!"
- "Inside dist is bundle.js - all our code in one file!"

**Open dist/bundle.js briefly**: 
- "It's messy but it works!"
- "This is the development version - still somewhat readable"
- "Production version would be completely minified"

---

### Step 8: Update HTML to Use Bundle

**Say**: "Now we need to tell our HTML to use the bundle instead of the modules."

**Open greeter.html**:

**Show current script tag**:
```html
<script type="module" src="src/main.js"></script>
```

**Say**: "Let's comment this out and add our new bundle."

**Replace with**:
```html
<!-- <script type="module" src="src/main.js"></script> -->
<script src="dist/bundle.js"></script>
```

**Important teaching moment**: "Notice I removed `type='module'` - bundle.js is just regular JavaScript now!"

---

### Step 9: Test (and Fix) the App

**Say**: "Let's test this. I'll just double-click the HTML file."

**Open in browser** - IT WILL FAIL

**Check console**: "Uh oh - 'cannot read properties of null'. What happened?"

**Explain the problem**:
- "Modules automatically wait for the page to load"
- "Regular JavaScript files don't wait"
- "Our code ran before the page finished loading"

**The fix**: "Two solutions - window.onload in our code, or move the script tag."

**Move script tag to bottom of body**:
```html
<body>
  <!-- all your HTML content -->
  
  <script src="dist/bundle.js"></script>
</body>
```

**Reload page**: "Now it works!"

**Teaching point**: "This is a common pattern - put scripts at the bottom so the page loads first."

---

### Step 10: Demonstrate Auto-Recompilation

**Say**: "Remember that --watch flag? Let me show you why it's cool."

**With terminal visible showing webpack still running**:

1. **Open src/utils.js**
2. **Find the default name**: `const defaultName = "Mr. X";`
3. **Change it**: `const defaultName = "Mr. Z";`
4. **Save the file**

**Point to terminal**: "Watch! It automatically detected the change and recompiled!"

**Refresh browser, click button**: "Now it says 'Goodbye Mr. Z'!"

**Undo the change and save**: "Compiles again - now it's back to Mr. X."

**Teaching point**: "This makes development fast - change code, save, refresh browser. No manual recompiling!"

---

## Part 5: Understanding Distribution (5 minutes)

### What Files Do We Actually Need?

**Say**: "When we deploy this to a web server, what do we actually need?"

**Open Finder and point**:
- ✅ **greeter.html** - "Yes, the page"
- ✅ **dist folder** - "Yes, our bundled code"
- ❌ **src folder** - "No! We're not using this anymore"
- ❌ **node_modules** - "Definitely not! Way too big"
- ❌ **package.json, webpack.config.js** - "No, these are dev tools"

**Demo**: "I could literally delete all these files..."

**Delete in Finder**:
- node_modules
- package.json
- package-lock.json
- webpack.config.js

**Say**: "...and only upload these two things to my web server, and it would work perfectly."

**Important caveat**: "Of course, you'd want to keep your source code for future development. But for deployment? Just HTML and dist folder."

**Undo the deletions**: "Let me undo that for demonstration purposes."

---

### The Node Modules Rule

**Say with emphasis**: "Never, ever commit node_modules to GitHub!"

**Demo what happens**:
1. **Delete node_modules folder**
2. **Quit webpack if running** (Ctrl+C)
3. **Try to run**: `npm start`
4. **It fails**: "No webpack found!"

**Say**: "This is expected. So how do we fix it?"

**Type**: 
```bash
npm install
```

**While running**: "NPM reads package.json and reinstalls everything automatically."

**After installation**:
- "Now node_modules is back"
- `npm start` - "Now it works!"

**Key lesson**: "Always delete node_modules before committing. Anyone can recreate it with `npm install`."

---

## Part 6: Development Workflow Summary (3 minutes)

### The Complete Workflow

**Write on board or show slide**:

```
1. Write/edit code in src/ folder
2. Save changes
3. Webpack automatically recompiles
4. Refresh browser to see changes
5. Repeat!
```

### When You're Done for the Day
```
1. Ctrl+C to stop webpack
2. Delete node_modules (before Git commit!)
3. Commit src/, package.json, webpack.config.js, HTML
4. DO NOT commit dist/ or node_modules/
```

### Starting Work Again
```
1. npm install (recreates node_modules)
2. npm start (starts webpack with --watch)
3. Code away!
```

---

## Part 7: Looking Ahead (2 minutes)

### What's Next?

**Say**: "Today we learned bundling. Next class we'll add actual transpiling."

**Preview**:
- "We'll add Babel to transpile ES6 → ES5"
- "We'll configure webpack to use Babel"
- "Eventually: TypeScript → JavaScript transpiling"

### Why This Matters

**Connect to real world**:
- "Every modern JavaScript framework uses bundlers"
- "React, Vue, Angular - they all use webpack or similar tools"
- "Understanding this workflow is essential for professional development"

---

## Wrap-Up and Assignment (3 minutes)

### Check for Understanding

**Quick questions to ask**:
1. "What's the difference between transpiling and bundling?"
2. "Why do we use --save-dev instead of --save?"
3. "Why don't we commit node_modules?"
4. "What does the --watch flag do?"

### Practice Assignment

**Say**: "For homework, take one of your previous assignments that uses modules and convert it to use webpack."

**Success criteria**:
- Webpack properly configured
- All code bundled into single file
- HTML page loads and works correctly
- No node_modules committed to GitHub

---

## Troubleshooting Guide (For Reference)

### Common Student Errors

**Error: "Cannot find module 'webpack'"**
- Forgot to run `npm install`
- Wrong directory in terminal

**Error: "Entry module not found"**
- Wrong path in webpack.config.js
- Created webpack.config in wrong folder

**Error: "Cannot read properties of null"**
- Script tag needs to be at bottom of body
- OR add window.onload to code

**Error: Files not updating**
- Forgot to refresh browser
- Webpack not running (forgot npm start)
- Edited wrong file (dist vs src)

### Quick Fixes Reference
```bash
# Restart if things are broken
Ctrl+C  # Kill webpack
rm -rf node_modules  # Delete modules
npm install  # Reinstall
npm start  # Restart webpack
```

---

## Time Management Notes

- **Total lesson**: ~60-75 minutes
- **Lecture/Demo**: 45 minutes
- **Student hands-on**: 15-20 minutes
- **Buffer for questions**: 10 minutes

**Pacing tips**:
- Can skip the "change Mr. X to Mr. Z" demo if running behind
- Can skip the "delete files for deployment" demo if short on time
- Make sure students have at least 15 minutes of hands-on practice

**If running long**: Stop before Part 7 and assign watching next video for homework.

---

## Key Phrases to Emphasize

Use these phrases to hit the important concepts:

1. **"Transpiling transforms code from one language to another"**
2. **"Bundling combines multiple files into one"**
3. **"Never commit node_modules to GitHub"**
4. **"The --watch flag automatically recompiles on save"**
5. **"We write in modern JavaScript, Babel handles compatibility"**
6. **"devDependencies are tools for developers, not production code"**
7. **"Always delete node_modules before committing"**
8. **"npm install recreates node_modules from package.json"**

---

## Additional Resources to Share

- Webpack documentation: https://webpack.js.org/
- Babel playground: https://babeljs.io/repl
- NPM documentation: https://docs.npmjs.com/
- ES6 features reference: https://github.com/lukehoban/es6features

---

## Post-Class Notes Section

Use this space after teaching to capture:
- What worked well?
- What confused students?
- What took longer than expected?
- What questions came up?
- What to adjust for next time?
