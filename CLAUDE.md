# Conventions

- Exercises are grouped into sections by topic: `NN_slug/` (e.g. `01_basics/`), each with a `README.md` listing its exercises. Create one with `./new_section.sh "Title" [slug]` — it also adds the section to the root `README.md`.
- One folder per exercise inside a section: `NN_slug/exNN/` with `README.md` and the solution (`solution.sql`). Create it with `./new_exercise.sh <section> "Title"` — it also adds a row (status ⏳) to the section's table; set it to ✅ once solved.
- Folder names, titles and READMEs are in English; the task is pasted verbatim in Polish and translated to English.
- Exercise README sections: Task (PL + EN), Files, How to run (with example output from a real run). No prose Solution/Notes sections — code review and explanations go in chat, in Polish.
- One commit per exercise, e.g. `basics/ex03: column aliases`, on `main`.
