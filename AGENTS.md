<!-- LOVABLE:BEGIN -->
> [!IMPORTANT]
> This project is connected to [Lovable](https://lovable.dev). Avoid rewriting
> published git history — force pushing, or rebasing/amending/squashing commits
> that are already pushed — as it rewrites history on Lovable's side and the
> user will likely lose their project history.
>
> Commits you push to the connected branch sync back to Lovable and show up in
> the editor, so keep the branch in a working state.
<!-- LOVABLE:END -->

- Account data lives in normalized tables (profiles, medications, medication_schedules, refills, dose_events, orders, order_items, notification_preferences, user_devices, prescriptions, prescription_items, reminders, caregiver_permissions, audit_logs; all owner-scoped via user_id, cascading from profiles). `src/lib/cloud.ts` loads them into the in-memory store and writes back only changed rows; why: UI keeps one simple store while the database is the source of truth. `user_state` is deprecated.
- Prescription reading runs in the `extractPrescription` server function (AI Gateway, signed-in only); it stores the upload in the private `prescriptions` bucket under `<user_id>/` and records prescriptions + unverified items; why: keeps the AI key server-side and AI output separate from the verified plan.
- Removing a medicine from the current plan uses the shared store removal action to archive it, with existing cloud sync disabling its schedule; why: removal stops reminders and refill alerts without deleting dose history.
