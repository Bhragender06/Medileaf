import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { AppShell, PageTitle } from "@/components/site";
import { draftToMed, emptyDraft, MedForm, validateDraft } from "@/components/med-form";
import { setState, uid } from "@/lib/store";

export const Route = createFileRoute("/medications/new")({
  head: () => ({
    meta: [
      { title: "Add medicine — Medileaf" },
      { name: "description", content: "Add a medicine to your plan by hand." },
      { property: "og:title", content: "Add medicine — Medileaf" },
      { property: "og:description", content: "Add a medicine and set reminder times." },
    ],
  }),
  component: () => <AppShell><NewMed /></AppShell>,
});

function NewMed() {
  const navigate = useNavigate();
  const [d, setD] = useState(emptyDraft);
  const [err, setErr] = useState("");
  function save() {
    const e = validateDraft(d);
    if (e) return setErr(e);
    setState((s) => ({ ...s, meds: [...s.meds, { id: uid(), ...draftToMed(d, "manual") }] }), `Added ${d.name} manually`);
    navigate({ to: "/dashboard" });
  }
  return (
    <>
      <PageTitle title="Add a medicine" sub="Enter the details exactly as they appear on your prescription or pack." />
      <div className="surface p-6 md:p-8"><MedForm d={d} onChange={setD} /></div>
      {err && <p role="alert" className="mt-4 font-semibold text-destructive">{err}</p>}
      <div className="mt-6 flex justify-end gap-3">
        <button className="btn btn-ghost" onClick={() => navigate({ to: "/dashboard" })}>Cancel</button>
        <button className="btn btn-primary" onClick={save}>Save medicine</button>
      </div>
    </>
  );
}
