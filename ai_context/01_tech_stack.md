# 01 Tech Stack & Tools

## Core
- **Framework**: Flutter (Latest Stable)
- **Language**: Dart

## Architecture
- **Pattern**: Feature-first, Layered Architecture (Presentation, Domain, Data).

## Key Libraries (Rules: Stick to these)
- **State Management**: `flutter_riverpod` (Riverpod 2.x with code generation recommended).
- **Routing**: `go_router`
- **Networking**: `dio`
- **Local Storage**: `shared_preferences` (for settings), `isar` or `hive` (for data - TBD).
- **UI/Styling**: `flutter_screenutil` (if responsive needed), Standard Material 3.
- **Forms**: `flutter_form_builder`

## Testing
- `flutter_test` for Unit/Widget tests.
- `integration_test` for drivers.
