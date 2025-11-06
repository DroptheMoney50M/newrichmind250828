# Flutter 관련 규칙
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Flutter Play Store Split Application 관련
-keep class io.flutter.app.FlutterPlayStoreSplitApplication { *; }
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication

# Google Play Core (앱 번들 관련)
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

# Dart 관련 규칙
-dontwarn io.flutter.embedding.**

# 기본 Android 규칙
-keepattributes *Annotation*
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Kotlin 관련
-dontwarn kotlin.**
-dontwarn kotlinx.**

# AndroidX 관련
-keep class androidx.** { *; }
-dontwarn androidx.**

# Shared Preferences
-keep class androidx.preference.** { *; }

# Image Picker
-keep class io.flutter.plugins.imagepicker.** { *; }

# Carousel Slider
-keep class carousel_slider.** { *; }
