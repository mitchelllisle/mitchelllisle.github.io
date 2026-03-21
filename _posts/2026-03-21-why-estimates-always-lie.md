---
layout: post
title: "Why Estimates Always Lie — And What to Do About It"
description: A look at why software estimation is so reliably broken, and a tool I built to make it a little more honest
date: 2026-03-21 00:00:00 +1100
author: mitchell
image: '/images/truestimates.jpg'
image_credit: 'Photo by <a href="https://unsplash.com/@joelfilip?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Joel Filipe</a> on <a href="https://unsplash.com/photos/clear-glass-building-ZMRMFULofus?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>'
tags: [software, estimation, productivity, tools]
tags_color: '#6366f1'
---

Ask any developer how long a project will take, and then ask again once it's done. The numbers will rarely match. This isn't an occasional failure — it's one of the most consistent and documented patterns in software development.

And yet, most of us just keep doing it the same way. We stare at a Jira board, assign story points, add a 20% buffer, and hand something over with a confidence we fundamentally do not have. Then we spend months quietly explaining why things are taking longer than expected.

I wanted to understand *why* estimation fails so reliably — and build something that makes it harder to lie to yourself.

## The Problem Isn't Laziness

The tempting narrative is that developers are just bad at scoping things. They're naive optimists who forget about edge cases and tech debt. Fix the person, fix the problem.

But that framing misses what's actually going on.

When you estimate a project, you almost always estimate *the work* — the actual build. The feature, the screen, the API endpoint. The thing you can see and reason about. The thing that ends up in your Jira ticket.

The problem is that the work is never just the work.

Every project comes wrapped in a thick layer of invisible effort that we don't put in the Jira ticket because it isn't *the thing* we're building. It's the meetings, the config, the debugging sessions, the backslide on a dependency upgrade, the scope conversations, the infrastructure that breaks on a Friday afternoon.

We're not bad at estimating *the work*. We're consistently ignoring everything around it.

## Dave Stewart's Taxonomy of Invisible Work

A few years ago, Dave Stewart published a [fantastic deep dive](https://davestewart.co.uk/blog/work/project-estimation/) on why projects always take longer — the result of a brutal postmortem on a project that ran far, far over. He also published an [accompanying gist](https://gist.github.com/davestewart/643ffc55aa7c173618d2707b776a1443) that catalogues, in painstaking detail, all the things you don't think about when you quote for a project.

Reading it is one of those experiences where you nod continuously while quietly reflecting on every project you've ever been part of.

His key insight is that project work can be broken into distinct categories, and only one of them is what we actually estimate:

| Category | What it means |
|---|---|
| The work around the work | Meetings, reviews, project management |
| The work to get the work | Research, scoping, quoting, pitching |
| The work before the work | Setup, config, infrastructure, services |
| **The work** | **The actual build, product, design, docs, tests** |
| The work between the work | Debugging, refactoring, iteration, tooling |
| The work beyond the work | Scope creep, omissions, nice-to-haves |
| The work outside the work | Surprises, contingency, unknown unknowns |
| The work after the work | Hosting, deployment, security, ongoing support |

Looking at this list, the *actual work* — the thing that goes in the estimate — is one entry out of eight. And Dave's rough analysis suggests execution might represent as little as **20% of total project effort**.

That number feels extreme until you think about the last project you shipped. How much time was spent in stakeholder meetings? How long did the initial environment setup take? How many days got consumed by a third-party API that didn't behave as documented? How many afternoons were eaten by "quick questions" that turned into scope renegotiations?

Add it all up honestly and 20% starts to seem plausible. Maybe even generous.

## Why We Keep Getting It Wrong

There are a few cognitive traps that make this so persistent.

**The planning fallacy** — our tendency to anchor on best-case scenarios and discount known risks — is well-documented. We don't just forget the adjacent work; we actively don't want to include it because doing so makes the estimate "more expensive" and harder to sell.

**Invisible work is invisible.** If it doesn't have a ticket, it doesn't exist in the estimate. But it still exists in the calendar.

**We estimate outcomes, not processes.** "Build a search feature" gets an estimate. "Spend two days understanding why Elasticsearch index updates are inconsistent across environments" doesn't. But the second thing is what actually happens.

The practical result is that estimates consistently represent a best-case path through the *visible* work, while everything else accumulates silently.

## Building a Better Tool

I built [true-estimate](https://mitchelllisle.github.io/true-estimate/) to make this hidden work visible — and to make it slightly harder to accidentally produce a naive estimate.

The tool is directly inspired by Dave Stewart's framework. Rather than a flat list of tasks, it organises your estimate into the eight phases above. You can add tasks under each phase with optional week estimates. As you fill it in, you get three numbers:

- **Estimated** — only the execution work, the thing you'd normally quote
- **Hidden** — everything outside the execution phase
- **Total** — what it actually costs

The goal isn't to produce a precise forecast, because that's largely impossible. It's to force the question: *what am I not accounting for?* The admin load, the setup time, the inevitable bugs and scope conversations — they're going to happen regardless of whether you estimate them. The only question is whether you're planning for them or absorbing them silently.

There's also a sample project you can load to see what a realistic breakdown might look like. The hidden work being consistently larger than the estimated work is, in my experience, not a bug in the sample — it's about right.

## An Honest Estimate Isn't a Pessimistic One

There's sometimes a reluctance to estimate comprehensively because it feels like pessimism or padding. If you include two weeks for "general iteration and debugging," it looks like you're hedging. Shouldn't a good developer be more efficient than that?

But this is exactly backwards. An honest estimate is a professional one. It signals that you understand how software projects actually work — that there is always invisible work, always iteration, always surprises. Hiding that work doesn't make it go away. It just means someone absorbs it unexpectedly, whether that's you, the project timeline, or the client.

The developers and teams who build trust over time are the ones whose estimates are reliable — not necessarily short.

## Try It

If you've got a project in front of you — a new feature, a refactor, a greenfield build — give [true-estimate](https://mitchelllisle.github.io/true-estimate/) a try before you submit that Jira estimate. Work through each phase and be honest about what you're probably going to spend time on. Then compare your execution estimate to the total.

The gap between those two numbers is the amount of work you were planning to do for free.

---

*The true-estimate tool is open source — code is [on GitHub](https://github.com/mitchelllisle/true-estimate). Dave Stewart's original article, which inspired the structure, is [well worth reading in full](https://davestewart.co.uk/blog/work/project-estimation/).*
