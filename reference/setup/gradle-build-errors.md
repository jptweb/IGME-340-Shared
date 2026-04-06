## Gradle / Android Build Errors

These errors are common when an older starter project hasn't kept up with Flutter SDK updates. Newer Flutter releases require newer Gradle and Android Gradle Plugin (AGP) versions, and old project templates may pin versions that are no longer supported.

> **In-class backup:** If you hit any of these errors and just need to keep moving, **run in Chrome instead** - web builds skip Gradle entirely. (Note: WebView, audioplayers, and a few other plugins won't work in Chrome, but most things do.)

---

## Error 1: Gradle Version Too Old

```
Flutter support for your project's Gradle version (8.3.0) will soon be dropped
```

**Fix:** Edit `android/gradle/wrapper/gradle-wrapper.properties` and update the `distributionUrl` line:

```properties
# Old:
distributionUrl=https\://services.gradle.org/distributions/gradle-8.3-all.zip

# New:
distributionUrl=https\://services.gradle.org/distributions/gradle-8.7-all.zip
```

You can use any 8.x version Flutter supports - 8.7 is a safe modern choice.

---

## Error 2: Android Gradle Plugin (AGP) Too Old

```
Your project's Android Gradle Plugin version (8.1.0) is lower than Flutter's minimum (8.1.1)
```

**Fix:** Edit `android/settings.gradle` and bump the AGP version:

```gradle
# Old:
id "com.android.application" version "8.1.0" apply false

# New:
id "com.android.application" version "8.1.1" apply false
```

For newer Flutter versions, **8.2.1** is also a safe choice.

---

## Error 3: Multiple Build Errors / Cascade Failures

If you hit several errors at once and don't want to chase them individually, the fastest path forward is usually:

1. **Run in Chrome** for the rest of the class (`flutter run -d chrome`)
2. **OR** create a fresh Flutter project and copy your `lib/`, `assets/`, and `pubspec.yaml` over

Fresh projects always use the current Gradle/AGP versions and avoid all of these issues.

---

## Why These Errors Happen

Flutter, Android Gradle Plugin, and Gradle itself all have their own release cadences. When Flutter updates:

- It bumps the **minimum** Gradle/AGP versions it supports
- Old project templates pin **specific** versions in their config files
- The two stop matching, and your build fails

The Flutter team usually gives a deprecation warning for one or two releases before making it a hard error, but if you're starting from an older template you may jump straight to the error.

**Newer projects don't have this problem** because Flutter generates fresh config files using current versions.

---

## When Covered in Course

These errors most commonly show up in:
- **[Week 12A](../../weekly/12A.md)** - First Flame overlay project (older starter templates)
- Any project starting from a template more than 6 months old

---

## External Resources

- [Flutter Gradle migration docs](https://docs.flutter.dev/release/breaking-changes/flutter-gradle-plugin-apply)
- [Android Gradle Plugin release notes](https://developer.android.com/build/releases/gradle-plugin)

---

*Last updated: April 2026 | IGME-340 Reference*
