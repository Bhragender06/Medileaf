# 🌿 Medileaf — Smart Adherence & Eco-Rewards Platform

<p align="center">
  <img src="src/assets/Medileaf_ Rooted in Care.png" alt="Medileaf Logo" width="120" />
</p>

<p align="center">
  <b>The intelligent full-stack healthcare platform uniting AI medication safety, elderly voice accessibility, medical jargon translation, and a circular-economy blister recycling program.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/React-19-blue?logo=react" alt="React 19" />
  <img src="https://img.shields.io/badge/Framework-TanStack%20Start%20v1-FF4154?logo=tanstack" alt="TanStack Start" />
  <img src="https://img.shields.io/badge/Styling-Tailwind%20CSS%20v4-38B2AC?logo=tailwindcss" alt="Tailwind CSS v4" />
  <img src="https://img.shields.io/badge/Database-PostgreSQL%20%2B%20RLS-336791?logo=postgresql" alt="PostgreSQL" />
  <img src="https://img.shields.io/badge/AI-Lovable%20AI%20Gateway-8A2BE2" alt="AI Gateway" />
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT License" />
</p>

---

## 💡 The Problem & The Solution

- **Medication Non-Adherence & Conflicts:** Over 50% of chronic patients take medications incorrectly or face adverse drug-drug interactions.
- **Medical Acronym Confusion:** Prescriptions filled with Latin shorthand (`TID AC`, `PRN`, `QHS`) confuse patients and caregivers.
- **Elderly Inaccessibility:** Tiny medicine packaging fonts and complicated digital UIs create barriers for seniors and visually impaired individuals.
- **Pharma Plastic Waste:** Billions of non-biodegradable foil blister packs and expired pills end up in landfills or water supplies each year.

**Medileaf solves all four:** proactive adherence schedules, four real-time AI assistive tools, and an eco-incentive program that rewards patients with real flower and herb seeds for returning empty packaging.

---

## 🏆 Standout AI Features (Hackathon Highlights)

### 1. 🛡️ AI Safety Shield (Drug, Food & Duplicate Interaction Checker)
- **Real-Time Cross-Referencing:** Validates new medications against your existing active list before you save them.
- **Severity Tiers:** Categorized into **Severe Danger** (red), **Moderate Caution** (amber), **Dietary & Lifestyle** (e.g., grapefruit, alcohol, vitamin K interactions), and **Duplicate Therapy**.
- **Actionable Output:** Provides plain-language explanations, one concrete recommendation, and suggested questions to ask your doctor. Includes a one-click printout for clinic visits.

### 2. 📸 Computer Vision "Snap & Count" (Eco-Parcel Verification)
- **Object Detection via Vision AI:** Users point their mobile camera at a table of empty blister strips and bottles.
- **Bounding-Box Overlays:** Detects foil blisters, medicine bottles, and expired boxes with confidence scores.
- **One-Tap Return Slip:** Auto-calculates eco-points and populates the return slip with zero manual counting fraud.

### 3. 🎙️ Multilingual Voice Assistant & Pill Identifier (Elderly Accessibility)
- **Voice-In / Voice-Out:** Natural speech recognition (STT) and smooth speech synthesis (TTS) available via a floating mic on every screen.
- **Bilingual Support:** Full English and **हिन्दी (Hindi)** support.
- **Context-Aware Answers:** Inquires like *"When is my next dose?"* or *"Can I take Ibuprofen on an empty stomach?"* trigger spoken answers, highlighted visual cards, quick action buttons, and emergency helpline prompts (112).

### 4. 📄 "Explain Like I'm 10" — Medical Jargon Translator
- **Prescription De-mystifier:** Decodes Latin medical shorthand (`BID`, `TID`, `QHS`, `PRN`, `AC`, `PC`, `PO`) into simple, conversational instructions.
- **Visual Daily Timeline:** Auto-plots complex instructions across Morning, Afternoon, Evening, and Bedtime slots.
- **Interactive Leaflet Mode:** Integrated directly into Medicine Detail cards and prescription upload reviews with interactive acronym chips.

---

## 🌱 Eco-Rewards Program (Circular Medicine Economy)

Turn medical waste into blooming gardens:
1. **Collect & Snap:** Save empty blister foils, plastic vials, and expired medicines. Snap a photo with the AI Vision scanner.
2. **Ship to HQ:** Attach the unique printable Return Slip code and post the parcel.
3. **Admin Verification:** Headquarters verifies the parcel count in the Admin Panel.
4. **Lifetime Milestones:**
   - **50 Items:** Unlocks a Flower Seed Packet (Sunflower, Marigold, Lavender, Chamomile, Wildflower).
   - **100 Items:** Unlocks the Urban Balcony Garden Starter Kit.
   - **150 Items:** Unlocks the Premium Herbal & Floral Box.
5. **Physical Delivery:** Claimed seeds are dispatched straight to the patient's doorstep.

---

## 🔐 Comprehensive Admin Suite (`/admin`)

- **Role-Based Security:** Protected by server-side role validation (`has_role(caller, 'admin')`) and PostgreSQL Row-Level Security (RLS).
- **Order Management:** Lifecycle tracking (`Submitted` ➔ `Processing` ➔ `Dispatched` ➔ `Delivered`).
- **Eco-Recycling Verification:** Inspect incoming return notices with AI counts, verify physical quantities, and dispatch seed rewards.
- **Prescription Vault:** Secure inspection of uploaded doctor prescriptions via signed storage URLs.
- **Refill Critical Radar:** Proactive radar highlighting patients with under 7 days of medication supply left.
- **User Directory & Account Controls:** Real-time visibility into adherence, orders, and instant account suspension/reactivation.

---

## 🛠️ Tech Stack & Architecture

| Layer | Technology |
|---|---|
| **Framework** | [TanStack Start v1](https://tanstack.com/start) (Full-stack React 19, SSR & Edge Server Functions) |
| **Routing** | [TanStack Router](https://tanstack.com/router) (Strictly typed, file-based routing) |
| **Styling** | [Tailwind CSS v4](https://tailwindcss.com/) with [shadcn/ui](https://ui.shadcn.com/) tokens & Lucide icons |
| **State & Cache** | [TanStack Query v5](https://tanstack.com/query) + reactive client store with cloud sync |
| **Database & Auth** | Lovable Cloud / PostgreSQL with comprehensive Row-Level Security (RLS) |
| **AI Models** | Lovable AI Gateway (structured multi-modal vision & text generation) |
| **Testing** | [Vitest](https://vitest.dev/) (unit & logic tests) + [Playwright](https://playwright.dev/) (end-to-end browser tests) |

---

## 📁 Repository Structure

```text
├── src/
│   ├── components/
│   │   ├── jargon-buster.tsx     # "Explain like I'm 10" translator component
│   │   ├── safety-shield.tsx     # AI Drug interaction checker & warning cards
│   │   ├── snap-and-count.tsx    # Computer Vision blister scanner & bounding boxes
│   │   ├── voice-assistant.tsx   # Multilingual Voice STT/TTS floating assistant
│   │   └── site.tsx              # Navigation & responsive layout header
│   ├── lib/
│   │   ├── admin.functions.ts    # Admin server operations & role verification
│   │   ├── extract.functions.ts  # AI prescription OCR & schedule extraction
│   │   ├── jargon.functions.ts   # AI translation server function & prompt
│   │   ├── jargon-logic.ts       # Latin medical dictionary & timeline parser
│   │   ├── rewards.functions.ts  # Eco-rewards server mutations
│   │   ├── rewards-logic.ts      # Milestone tiers & seed claim validation
│   │   ├── safety.functions.ts   # AI Safety Shield server function
│   │   ├── safety-logic.ts       # Severity ranking & interaction caching logic
│   │   ├── vision.functions.ts   # AI Computer Vision parcel verification
│   │   └── store.ts              # Local-first reactive state store
│   ├── routes/
│   │   ├── __root.tsx            # App root layout, global Toaster, & Voice Assistant
│   │   ├── index.tsx             # Public landing page
│   │   ├── dashboard.tsx         # Patient dosage hub with Safety Shield overview
│   │   ├── explain.tsx           # Dedicated Jargon Buster translation tool
│   │   ├── rewards.tsx           # Eco-rewards tracking & seed catalog
│   │   ├── admin.tsx             # Admin operations dashboard
│   │   ├── upload.tsx            # Prescription photo upload & AI scanner
│   │   ├── refills.tsx           # Reorder and delivery pipeline
│   │   └── medications.$id.tsx   # Detailed medicine view with plain-language notes
│   └── test/                     # Unit test suites for all pure logic modules
