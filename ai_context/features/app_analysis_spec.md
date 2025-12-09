# Feature Spec: App Analysis (iOS Focus)

## User Story
1.  **Parent** installs app on **Child's iPhone** (or uses Family Sharing).
2.  App requests **Family Controls** authorization.
3.  Parent selects the child's device or the current device as the child's.
4.  App retrieves access to "Device Activity" (List of used apps/websites).
5.  App analyzes these activities against the server's danger database.
6.  Parent sees a report of harmful apps usage.

## Technical Strategy (iOS)
Getting a simple list of "installed apps" is not possible on iOS. We MUST use the **Screen Time / Family Controls API**.

### Required Frameworks
- `FamilyControls`: To authorize access.
- `DeviceActivity`: To monitor usage.
- `ManagedSettings`: To potentially restrict apps (future scope).

### Data Flow Changes
On iOS, we cannot simply send package names like `com.instagram`. The Operating System gives us opaque `ApplicationToken`s.
- **Challenge**: How to identify the app on the server?
- **Solution (Research needed)**: The API might only allow us to see categories or specific tokens. We might need to ask the user to "Select Apps to Monitor" using the native `FamilyActivityPicker`, which returns tokens we can track.

## UI Components
1.  **Permission Request Screen**: Explaining why we need Screen Time access.
2.  **Activity Picker**: Native iOS sheet to select apps/categories.
3.  **Dashboard**: Shows usage/risk status. (Note: On iOS, we might be limited to using `DeviceActivityReport` extension to draw the UI using SwiftUI *inside* a sandboxed extension).
