Flutter Video Feed Application
This Flutter application is designed to display a scrollable feed of video thumbnails and provide a full-screen video player experience. The project also implements performance optimizations, state management using Cubit, and thorough testing.

Features
1. Main Feed
   A scrollable list of video thumbnails.
   Each thumbnail displays the video creator's username and the number of likes.
   Tapping on a thumbnail opens the full video player.

2. Video Player
   Full-screen video player for selected clips.
   Play/Pause controls and a progress bar.
   "Like" button functionality that updates the like count dynamically.

3. Performance Optimization
   Efficient loading and caching of video thumbnails and full videos.
   Smooth scrolling, even with a large number of videos in the feed.

4. State Management
   State management is implemented using Cubit.
   Efficient handling of app states, ensuring smooth performance across components.

5. Testing
   Unit tests for the core logic of the application.
   Widget tests for at least two major components.

   Technology Stack
   Flutter
   Cubit for state management
   Dart

   How to Run
   Clone the repository:
   git clone <repository-url>

   Install dependencies:
   flutter pub get

   Run the app:
   flutter run

