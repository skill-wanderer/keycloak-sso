# Skill-Wanderer Design System (for Micro Frontends)

This guide defines the shared visual language used in this repository so other micro frontends (including AI-generated ones) can stay consistent.

## 1) Core Design DNA

- **Theme**: dark-first, high-contrast, warm-accented interface.
- **Brand emotion**: practical, human, optimistic, mission-driven.
- **Visual signature**: orange/yellow gradients, soft-glass cards, rounded pill buttons, subtle motion.

## 2) Design Tokens (source of truth)

Use these CSS variables in each micro frontend (or inherit from the host shell):

```css
:root {
  --primary-orange: #FF6B35;
  --deep-orange: #E85D25;
  --dark-bg: #1a1a1a;
  --darker-bg: #0f0f0f;
  --light-text: #e0e0e0;
  --accent-yellow: #FFD93D;
  --card-bg: rgba(255, 255, 255, 0.05);
  --card-hover: rgba(255, 255, 255, 0.08);
}
```

Additional semantic accents used by principle pages:

```css
:root {
  --success-green: #4CAF50;
  --failure-red: #f44336;
  --wisdom-purple: #9C27B0;
  --growth-blue: #2196F3;
  --premium-gold: #FFC107;
  --lock-silver: #9E9E9E;
}
```

## 3) Typography

- **Primary font**: system sans stack (`-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, ...`).
- **Body text color**: `var(--light-text)`.
- **Headlines**:
  - Large hero title: `clamp(2.5rem, 6-8vw, 4-5rem)`
  - Section title: `clamp(2rem, 4-5vw, 3rem)`
- **Line height**: `1.6` default, `1.8` for descriptive paragraphs.
- **Gradient heading style**:

```css
background: linear-gradient(135deg, var(--primary-orange), var(--accent-yellow));
-webkit-background-clip: text;
background-clip: text;
-webkit-text-fill-color: transparent;
```

## 4) Layout System

- **Max content widths**:
  - Main containers: `1200px`
  - Narrow content blocks/forms: `800px`
- **Horizontal gutters**: `20px`.
- **Section spacing**:
  - Hero: top-heavy spacing (`100-140px` top)
  - Standard sections: `80px 20px`
- **App shell pattern**:
  1. Fixed top navigation
  2. Main page content
  3. Subscribe section
  4. Footer

## 5) Surface and Elevation

- **Backgrounds**:
  - Base page: `var(--dark-bg)` / `var(--darker-bg)`
  - Sections often use radial gradients with low opacity orange/yellow highlights.
- **Card style**:
  - Background: `var(--card-bg)`
  - Border: `1px solid rgba(255, 107, 53, 0.2)`
  - Radius: `16px`
  - Hover: lift (`translateY(-5px)`) + stronger border + `var(--card-hover)`

## 6) Component Contracts (reuse these patterns)

### Buttons

Base:

```css
.btn {
  padding: 15px 30px;
  border-radius: 50px;
  font-size: 1.1rem;
  font-weight: 600;
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  gap: 10px;
}
```

Variants:
- **Primary**: orange gradient fill + soft orange shadow.
- **Secondary**: transparent with orange border; fill orange on hover.
- **Outline**: transparent with subtle orange border; soft tinted hover.

### Hero Section

- Centered content.
- Large gradient heading.
- One concise tagline + optional supporting paragraph.
- CTA group (`display: flex; gap: 20px; flex-wrap: wrap; justify-content: center;`).

### Card Grids

- Use responsive grid:

```css
grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
gap: 30px;
```

### Navigation

- Fixed navbar with blur/glass effect.
- Height and padding reduce on scroll.
- Underline hover/active states in brand orange.
- Mobile menu with expandable submenus.

### Footer

- Darker background than page body.
- Subtle top border using orange alpha.
- Centered link groups and compact legal/open-source info.

## 7) Motion Guidelines

- Timing: `0.3s` for hover/transitions; `0.6-0.8s` for entrance animations.
- Motion style: small, vertical lift (`-2px` to `-5px`) and fade/slide-up.
- Avoid large or distracting motion.

## 8) Responsive Behavior

- Breakpoint focus: `768px` and `600px`.
- On mobile:
  - Stack CTAs vertically.
  - Collapse multi-column grids to one column.
  - Convert nav to hamburger + accordions.

## 9) Tailwind + CSS Usage Strategy

This project uses **Tailwind + scoped component CSS**.

- Keep **tokens in CSS variables** (not hard-coded per component).
- Tailwind is useful for utility layout primitives.
- Brand-specific visuals (hero gradients, custom cards, nav interactions) are primarily in scoped CSS.

## 10) Micro Frontend Integration Rules

For a new micro frontend to match this design:

1. Import shared global CSS that defines tokens.
2. Respect shell structure (Nav/Main/Subscribe/Footer) where applicable.
3. Reuse button/card/hero patterns above.
4. Use the same max-widths (`1200px` and `800px`) and section spacing (`80px 20px`).
5. Keep text tone practical and mission-focused.
6. Do not introduce a new color system unless extending existing semantic tokens.

## 11) AI Prompt Template (for generating consistent UI)

Use this prompt for codegen assistants:

```text
Build this micro frontend using the Skill-Wanderer design system:
- Dark-first UI with orange/yellow accent gradients
- Tokens: --primary-orange #FF6B35, --deep-orange #E85D25, --dark-bg #1a1a1a, --darker-bg #0f0f0f, --light-text #e0e0e0, --accent-yellow #FFD93D, --card-bg rgba(255,255,255,.05), --card-hover rgba(255,255,255,.08)
- System sans typography, rounded pill buttons, soft glass cards, subtle hover lift
- Container max-width 1200px, section spacing 80px 20px, responsive collapse below 768px
- Keep components visually compatible with existing navigation, hero, card grid, subscribe, and footer styles
- Avoid introducing new brand colors/shadows/fonts
```

## 12) Reference Implementation in This Repo

- Global tokens/base styles: `assets/css/main.css`
- Tailwind extensions: `tailwind.config.ts`
- App shell layout: `layouts/default.vue`
- Navigation pattern: `components/TheNavigation.vue`
- Subscribe section pattern: `components/TheSubscribe.vue`
- Footer pattern: `components/TheFooter.vue`
- Hero + card usage example: `pages/index.vue`
