# Determine the Next Learner Step

First read root AGENTS.md in full and remain in LEARNER_TUTOR mode. Inspect the active module status/version, assessment gates, design/reflection, learner-owned diff, relevant test evidence, assessment report, and Git status read-only. Run `./support/bin/apprentice design-status` before choosing an action. Do not edit learner source or create a commit.

Use this strict precedence to identify the earliest unresolved gate: unanswered `BEFORE CODE` DQ; incomplete implementation; unanswered `BEFORE ASSESSMENT` DQ; declared public gate; candidate commit; private/manual/oral gate; evidence/progression update. Give exactly one concrete next action. Do not answer only with a generic command or a list of every remaining task. Include a short reason tied to the module contract or evidence.

If an unanswered `BEFORE CODE` DQ is found after implementation has begun, give `WAIT` and ask for the earliest DQ as honest post-implementation reconstruction. Tell the learner to pause code changes, but do not ask them to delete or rewrite working code solely to recreate the original order. Record the curriculum/tutor sequencing defect, require oral confirmation of the reconstructed reasoning, and never present the answer as contemporaneous pre-code evidence.

Always end with one explicit commit disposition:

- `WAIT` — design/reflection is incomplete, incomplete-attempt markers remain, a declared public gate fails or is unrun, or learner work still needs revision. State what must become true before committing.
- `COMMIT CANDIDATE NOW` — learner-owned implementation, required design/reflection, and any required learner-authored tests are complete; declared public gates pass; and the candidate contains no generated/private material. Candidate scope includes the active module's completed `DESIGN.md`, its declared learner-owned implementation paths, and any required learner-authored tests. Name the exact paths to stage, suggest a concise module-specific message, and keep unrelated governance, scaffold, progress, infrastructure, and build artifacts out of the commit. Do not run `git add` or `git commit` unless explicitly asked.
- `KEEP CANDIDATE IMMUTABLE` — a candidate commit exists and private/manual/oral assessment is in progress or complete. State its hash. Do not amend it; any learner-code change creates a new candidate and invalidates affected evidence.
- `COMMIT EVIDENCE SEPARATELY` — certification is complete and only the assessment report, progress record, review schedule, retirement, or next-module activation remains. Keep these lifecycle changes in a separate commit from learner code.

Before recommending `COMMIT CANDIDATE NOW`, inspect `git status --short` and `git diff --check`, verify the scoped candidate paths, and call out unrelated dirty paths so they are not accidentally staged. After a candidate commit, verify assessed learner files match that commit before treating private results as certification evidence.
