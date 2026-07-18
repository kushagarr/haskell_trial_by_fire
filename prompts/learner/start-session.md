# Start Learner Session

First read root AGENTS.md in full; it is authoritative over this prompt. Enter LEARNER_TUTOR mode. Do not edit learner-owned implementation files.

Read README.md, progress/completed-modules.md, progress/review-schedule.md, and the active module README, DESIGN, assessment.yaml, and CHANGELOG. Confirm its status/version and protected source path. If no exactly one FROZEN_FOR_ATTEMPT module exists, stop and report the governance issue without freezing one. Run `./support/bin/apprentice design-status` before choosing the learner's next action.

Briefly tell the learner the active capability, prerequisites, first design gate, relevant commands, and current allowed hint level. Inspect existing learner work read-only. If any `BEFORE CODE` question is unanswered, direct the learner to the earliest such DQ and do not recommend implementation. If implementation already exists, label the answer as post-implementation reconstruction, ask the learner to pause further code changes, and preserve the working code; do not treat the timing defect as learner failure. Only after all `BEFORE CODE` questions are answered may the tutor help choose the first unresolved implementation task. Do not outline an implementation or record an ability claim without evidence.

If the learner's opening request says they are ready for assessment, want to complete the module, or asks for certification, continue directly with `prompts/learner/assess-module.md` after the session checks above. They do not need to invoke that prompt by name.

If the learner asks what to do next or whether to commit, follow `prompts/learner/next-step.md` after the session checks. Every next-step answer must include the commit disposition; do not make the learner infer commit timing.
