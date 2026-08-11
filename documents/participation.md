# Participation Repos

## Overview

Starting in Week 2, most class sessions have a repo where you submit your in-class work. This is worth **10% of your final grade**.

**The goal:** keep a personal archive of working code from every class, so you have something to look back at when you're building projects or studying.

---

## How you get the repos: Classroom 50

Participation assignments are distributed through **Classroom 50**, which runs on top of GitHub. You'll get an invite link for each one through MyCourses or Slack.

> **TODO (JP):** add the Classroom 50 join link and a screenshot of the accept screen before Week 2.

Practically speaking, this is still GitHub. You need a GitHub account, your work lives in a GitHub repo, and you submit by committing and pushing. Classroom 50 is the layer that hands each of you your own copy and lets me see them all in one place.

If you used GitHub Classroom in another course, this will feel almost identical.

---

## The Numbers

> **Note:** The exact number of participation assignments can shift slightly
> from semester to semester depending on snow days, schedule changes, and how
> the calendar falls. The **ratio** stays the same: you can drop a small
> handful (about 15%), and completing every delivered assignment earns a bonus.

For Fall 2026:

- **Total repo count:** confirmed early in the semester once the schedule settles
- **Drop the lowest few** (roughly 15%) to receive full participation credit
- **Bonus:** complete every delivered repo and earn **5 bonus points** toward any project

> *Exact numbers will be posted in MyCourses and announced in class in the first two weeks.*

---

## How It Works

### Each class day:
1. Accept the assignment from the link posted in MyCourses or Slack
2. This creates **your personal repo** for that class (something like `week7a-yourusername`)
3. Clone it, or work on GitHub.com directly

### During and after class:
- Follow along with the demo
- Work at your own pace
- **Don't worry if you don't finish.** Show good effort and progress

### Before next class:
Submit using one of the two methods below.

---

## Submission Method 1: Clone, commit, push (recommended)

Most participation repos contain a complete Flutter app, so cloning is the natural way to work with them.

### Using the command line:
```bash
git clone [your-assignment-repo-url]
cd [repo-name]
# work on the code
git add .
git commit -m "Week 7A work"
git push
```

### Using GitHub Desktop:
1. Clone your assignment repo
2. Open the folder in VS Code and work on it
3. Commit and push from GitHub Desktop

**Opening the project in VS Code:** open the folder that contains `pubspec.yaml`. If you open the folder above it, VS Code won't recognize it as a Flutter project and you'll get confusing errors that have nothing to do with your code.

**About build files:** each repo has a `.gitignore` that keeps the `build/` folder out of git. Leave it alone. Without it you'd be pushing 450+ MB.

---

## Submission Method 2: Edit on GitHub.com (no cloning)

Use this when you only changed one file, or when Flutter isn't cooperating on your machine and you still want credit.

1. Go to your repo on GitHub.com
2. Click the file you changed, usually `lib/main.dart`
3. Click the pencil icon to edit
4. Paste in your code from class
5. Click **"Commit changes"**, add a message, confirm

Takes about thirty seconds. Your code is saved and I can see it.

**This counts for full credit.** Participation is graded on whether you engaged with the class material, not on how you got the file into the repo.

---

## Grading

| Completed | Result |
|-----------|--------|
| All but 3 (or fewer missed) | Full credit (100% of participation grade) |
| All delivered | Full credit + **5 bonus points** to any project |
| More than 3 missed | Proportional credit |

**What counts as "complete":**
- Good effort and progress
- Doesn't need to be perfect or finished
- Shows you followed along with the class content

---

## Need to Catch Up?

If you miss class or fall behind, use the weekly notes:
- They contain the code examples from class
- Follow along at your own pace
- Submit before the next class

Example: https://github.com/jptweb/IGME-340-Shared/blob/main/weekly/7A.md

---

## Quick Tips

- **Accept each assignment** when it's posted, since each class gets a new repo
- **Method 2 is the escape hatch.** If your setup is broken, paste the file on the website and get the credit
- **Show good effort.** It doesn't need to be perfect
- **Submit within 24 hours** while the material is fresh
- **Use the weekly notes** if you miss a class

---

## Questions?

- **During class:** ask me directly
- **Slack:** post in the course channel
- **Email:** jxtadm@rit.edu (subject: IGME-340 - Participation Question)
