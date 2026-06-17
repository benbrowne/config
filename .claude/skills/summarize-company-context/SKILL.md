---
name: summarize-company-context
description: Research a topic by searching notes (log.md and wiki topic files), Outlook emails, Teams messages, Fireflies meeting recaps, Teams meeting transcripts, and Asana tickets, then produce a structured summary written to a wiki topic file. Use when asked to research, summarise, or find everything known about a person, company, or project.
argument-hint: [topic]
---

Research everything known about $ARGUMENTS from notes, emails, Teams, Fireflies, and Asana, then write a structured summary to `/home/ben/Documents/wiki/$ARGUMENTS.md`.

## Step 1 — Search in parallel

Run all of the following simultaneously:

**Notes (log.md) — two-step approach:**
1. `grep -in "$ARGUMENTS" /home/ben/Documents/wiki/log.md` — find match line numbers
2. `grep -n "^# " /home/ben/Documents/wiki/log.md` — find all H1 section boundaries

For each match line, identify the nearest `^# ` heading before it and the next `^# ` heading after it. Use Read with `offset` and `limit` to load each full section. Never read log.md in full.

**Wiki topic files:**
Use Glob to check whether `/home/ben/Documents/wiki/$ARGUMENTS.md` or similar files already exist.

**Emails:**
Use `mcp__claude_ai_Microsoft_365__outlook_email_search` with `$ARGUMENTS` as the query (limit 50). Note subjects, senders, dates, and body summaries.

**Teams messages:**
Use `mcp__claude_ai_Microsoft_365__chat_message_search` with `$ARGUMENTS` as the query. Note the chat/channel, sender, date, and message content.

**Fireflies meeting transcripts:**
Use the Fireflies MCP to search meeting transcripts for `$ARGUMENTS`. If the Fireflies MCP tools are not yet available, call `mcp__claude_ai_Fireflies__authenticate` first and complete the OAuth flow. Once authenticated, use the transcript search tool with `$ARGUMENTS` as the query. Note meeting titles, dates, and any matched transcript excerpts.

**Teams meeting transcripts:**
Use `mcp__claude_ai_Microsoft_365__outlook_calendar_search` with `$ARGUMENTS` as the query to find relevant calendar events. Note the event URIs for loading transcripts in Step 2.

**Asana:**
Use `mcp__claude_ai_Asana__asana_search_tasks` with `$ARGUMENTS` as the search text. Note task names, assignees, status, due dates, and descriptions.


## Step 2 — Load full content

From the email results, identify the most informative threads — prioritise originating emails, not just replies. Read them in full using `mcp__claude_ai_Microsoft_365__read_resource` with the URI from each result.

For Fireflies results, load the full transcript for the most relevant meetings using the Fireflies MCP — transcripts contain verbatim dialogue, action items, and questions not captured elsewhere.

For calendar events found in Step 1, read each event using `mcp__claude_ai_Microsoft_365__read_resource` with the `calendar:///events/{eventId}` URI. If the event has an associated Teams meeting, attempt to read the transcript using `mcp__claude_ai_Microsoft_365__read_resource` with a `meeting-transcript:///{meetingId}` URI (the meeting ID is typically found in the event's online meeting details).

Load all relevant log sections using Read with `offset` and `limit`.

For Asana tasks with relevant titles, use `mcp__claude_ai_Asana__asana_get_task` to load full task details including subtasks and stories.

Run these reads in parallel.

## Step 3 — Write the summary

Synthesise everything into `/home/ben/Documents/wiki/$ARGUMENTS.md` using this structure:

- **What it is** — one-paragraph description of the topic/company/person
- **Key contacts** — table of people and roles (if applicable)
- **History / timeline** — chronological entries, one per significant event, with date and source
- **Current status** — what is active, pending, or unresolved right now
- **Technical or commercial notes** — specific factual detail worth preserving

Rules:
- Be concise. No padding.
- Cite the source inline where useful (e.g. `log.md:4096`, email subject, Asana task name).
- Use consistent capitalisation for the topic name throughout.
