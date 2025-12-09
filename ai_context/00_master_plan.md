# 00 Master Plan & Roadmap

## Product Vision
"Dikkatim Dağılıyor" helps parents protect their children by identifying harmful applications on their phones.

## Current Phase: Phase 1 - iOS MVP
- **Goal**: Build the core experience specifically for iOS.
- **Status**: Research & Planning
- **Critical Path**: Determine the technical implementation for retrieving app usage/installation data on iOS (Screen Time API vs Family Controls).

## High-Level Milestones
- [x] Project Initialization
- [x] Architecture Setup & AI Context
- [ ] **Technical Research (iOS)**
    - [ ] Investigate `FamilyControls` and `DeviceActivity` frameworks (Required for iOS "App Scanning").
    - [ ] Validate apple entitlement requirements.
- [ ] **Core Feature: App Analysis (iOS)**
    - [ ] **Data Collection**: Fetch usage/app data via Family Controls.
    - [ ] **API Integration**: Send masked/tokenized data to server for analysis.
    - [ ] **Results UI**: Display danger levels.
- [ ] **Onboarding**: Family Sharing & Screen Time permission setup flow.

## Active Task
- Researching Apple's Family Controls and DeviceActivity API.
