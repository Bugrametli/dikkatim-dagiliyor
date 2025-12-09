# 03 Coding Conventions & Rules

## File Naming
- `snake_case` for filenames (e.g., `user_profile.dart`).
- `PascalCase` for classes (e.g., `UserProfile`).
- `camelCase` for variables/functions (e.g., `fetchUserData`).

## Directory Structure
- Place widgets in `presentation/widgets`.
- Place screens/pages in `presentation/screens`.
- Place logic (Providers/Notifiers) in `presentation/providers` or `application`.

## Code Quality
- **Linter**: Analysis options default (flutter_lints).
- **Grades**: Aim for zero warnings.
- **Comments**: Document complex business logic, but prefer self-documenting code.

## AI Instructions
1. **Read-First**: Always check `ai_context/` before starting a task.
2. **Update**: If you add a new library or change a design rule, UPDATE the corresponding file in `ai_context/`.
3. **No Magic**: Do not invent new patterns; follow existing ones.
