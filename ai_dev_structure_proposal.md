# AI-Driven Development Structure Proposal

To maximize the efficiency of AI coding assistants, we will create a dedicated `ai_context` directory at the root of your workspace (outside the Flutter project). This serves as the "brain" or "external memory" for the AI, ensuring it always has the correct context without needing to read thousands of lines of code every time.

## 📂 Proposed Directory Structure

```text
Dikkatim Dağılıyor/
├── dikkatim_dagiliyor/       # (Your Flutter Project)
└── ai_context/               # (AI Knowledge Base)
    ├── 00_master_plan.md     # High-level roadmap & current phase
    ├── 01_tech_stack.md      # Strict rules on libs (Riverpod, GoRouter, etc.)
    ├── 02_design_system.md   # Color hexes, text styles, UI rules
    ├── 03_conventions.md     # Coding style, file naming, patterns
    ├── features/             # Detailed specs for each feature
    │   ├── auth_spec.md
    │   └── home_spec.md
    └── prompts/              # Reusable prompt templates
        └── new_feature.md    # Template to start a new feature
```

## 📄 File Descriptions

### 1. `00_master_plan.md`
**Purpose:** Keeps the AI aligned with the overall goal.
**Content:**
- Product Vision
- Current Development Phase (e.g., "Phase 1: MVP")
- Checklist of high-level milestones.

### 2. `01_tech_stack.md`
**Purpose:** prevents the AI from choosing random packages.
**Content:**
- State Management: **Riverpod**
- Routing: **GoRouter**
- HTTP Client: **Dio**
- Local Storage: **Shared Preferences / Hive**

### 3. `02_design_system.md`
**Purpose:** Ensures UI consistency.
**Content:**
- Primary Color: `#6200EE`
- Font Family: `Inter`
- Border Radius: `12.0`
- "Always use `FilledButton` for primary actions."

### 4. `features/*.md` (Feature Specs)
**Purpose:** Micro-requirements for specific tasks.
**Content:**
- **User Story**: "As a user, I want to login..."
- **Data Model**: Fields (email, password).
- **Edge Cases**: Network error, invalid email.
- **UI Mockup Description**.

## 🚀 Workflow for AI Interaction

1.  **Update Context**: Before starting a task, briefly update `00_master_plan.md` or the relevant feature spec.
2.  **Prime the AI**: "Read `ai_context/tech_stack.md` and `ai_context/design_system.md`, then implement the Login Screen."
3.  **Generate**: The AI now has constrained, specific instructions, reducing hallucinations and refactoring time.

---

### Action Plan
Shall I create this `ai_context` directory and populate these files with the initial choices we've made?
