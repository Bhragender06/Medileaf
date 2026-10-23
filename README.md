# 🌿 Medileaf — Smart Medication Management & Eco-Rewards

> An intelligent, full-stack medication adherence platform featuring AI-powered prescription parsing, proactive refill alerts, a comprehensive admin suite, and a circular-economy medicine blister recycling program.

---

## ✨ Features

### 💊 Medication & Adherence Management
- **Custom Schedules & Reminders:** Set fine-grained daily, weekly, or as-needed medication routines with dose logging.
- **Supply Tracking & Auto Refill Alerts:** Tracks medication inventory and alerts users before their supplies run dry.
- **One-Click Reordering:** Seamless replenishment flow with order tracking from submission to delivery.

### 🤖 AI Prescription Scanner
- **Direct Prescription Uploads:** Securely upload doctor prescription slips or packaging images.
- **Automated Extraction:** Server-side AI vision extracts medication names, strengths, dosages, and schedules directly into draft plans for verification.

### 🌱 Eco-Rewards Program (Circular Medicine Packaging)
- **Safe Medicine & Blister Return:** Users can submit return notices for used blister packs, empty bottles, and expired medicines.
- **Verified Recycling Counter:** Return shipments are verified at headquarters, tracking items against a 50-item unlock threshold.
- **Flower Seed Claims:** Reaching verified return milestones (50, 100, 150 items) unlocks real flower and herb seed parcels (Marigold, Sunflower, Zinnia, Basil, Wildflower blends) delivered to users' homes.

### 🛡️ Admin Management Panel (`/admin`)
- **Role-Based Access Control:** Secure, server-verified access restricted to platform administrators.
- **Order Pipeline:** Manage order lifecycles (`Submitted` ➔ `Confirmed` ➔ `Shipped` ➔ `Delivered` / `Cancelled`).
- **Recycling Parcel Verification:** Inspect user recycling notices, verify received counts, and dispatch earned flower seed rewards.
- **User Directory & Account Controls:** Overview of user health plans, order histories, and account status management.
- **Prescription Review & Refill Overviews:** Centralized view of unverified uploads and patients running critically low on supplies.

---

## 🛠️ Tech Stack

- **Framework:** [TanStack Start v1](https://tanstack.com/start) (Full-stack React 19 with SSR & server functions)
- **Routing:** [TanStack Router](https://tanstack.com/router) (Strictly typed file-based routes)
- **Styling:** [Tailwind CSS v4](https://tailwindcss.com/) with [shadcn/ui](https://ui.shadcn.com/) components
- **State & Data:** [TanStack Query v5](https://tanstack.com/query)
- **Backend & Auth:** Lovable Cloud / PostgreSQL with Row-Level Security (RLS)
- **AI Processing:** Server-side Vision Models via Lovable AI Gateway
- **Testing:** [Vitest](https://vitest.dev/) & Playwright

---

## 📁 Project Structure

```text
├── src/
│   ├── components/       # Reusable UI & layout elements
│   ├── lib/
│   │   ├── admin-logic.ts       # Admin status, refill & order logic
│   │   ├── admin.functions.ts   # Protected admin server functions
│   │   ├── cloud.ts             # Cloud sync & data hydration
│   │   ├── extract.functions.ts # AI prescription parsing
│   │   ├── rewards-logic.ts     # Recycling milestone & seed validation
│   │   ├── rewards.functions.ts # Eco-rewards claims & return handlers
│   │   └── store.ts             # Client-side state store
│   ├── routes/           # TanStack file-based routes
│   │   ├── __root.tsx    # Root layout & providers
│   │   ├── index.tsx     # Landing page
│   │   ├── dashboard.tsx # Patient daily dosage dashboard
│   │   ├── rewards.tsx   # Eco-rewards & seed catalog
│   │   ├── admin.tsx     # Admin operations control panel
│   │   ├── refills.tsx   # Refill & reorder history
│   │   └── upload.tsx    # Prescription upload & AI scanner
│   └── styles.css        # Tailwind v4 theme definitions
