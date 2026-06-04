---
layout: post
title: "Designing the Room"
description: The environment you design for your team is not the backdrop to your leadership. It is a large part of the leadership itself.
date: 2026-06-04 00:00:00 +1000
author: mitchell
image: /images/designing-the-room.jpg
thumbnail: /images/designing-the-room.jpg
tags: [leadership, management, data teams, environment, psychology]
tags_color: '#2a9d8f'
---

<p style="font-size: 0.85rem; color: var(--color-base-text-2); margin: 0 0 1.25rem;">Photo by <a href="https://unsplash.com/@andersjilden?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Anders Jildén</a> on <a href="https://unsplash.com/photos/low-angle-photography-of-gray-building-at-daytime-Sc5RKXLBjGg?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></p>

In 1941, Mervin Kelly designed the new [Bell Labs](https://en.wikipedia.org/wiki/Bell_Labs) building at Murray Hill with a single, deliberate constraint: one long corridor. Not separate wings for physics and chemistry and engineering. One corridor, so that every researcher walking to their office would pass everyone else. Kelly believed the building's layout would determine the quality of what happened inside it. He was right. The corridor produced the transistor, information theory, Unix, and the C language. The room did something. That was the point.

The Bell Labs example hints at something worth exploring: the environments we design for teams shape performance in ways that often go unrecognized. It suggests the environment matters as much as, if not more than, traditional notions of leadership.

Research and experience suggest that many factors affecting team performance relate to environmental design rather than individual traits. Who gets heard in a meeting. Whether mistakes are escalated or buried. How work is assigned and explained. Whether someone feels safe saying "I don't know." These appear to be shaped by environmental settings—the conditions and norms of how teams operate—rather than by personality traits alone. Managers, whether intentionally or not, often help create these conditions.

<div style="text-align: center; margin: 3rem auto; max-width: 640px;">
  <p style="font-size: 0.9rem; color: var(--color-base-text); margin: 0 0 1rem; font-weight: 500;">Behaviour is a function of the person and the environment</p>
  <div style="font-size: 5.5rem; font-weight: 800; color: var(--color-base-text); font-family: 'Courier New', Courier, monospace; letter-spacing: -0.05em; font-style: italic;">B = f(P, E)</div>
</div>

[Kurt Lewin](https://en.wikipedia.org/wiki/Kurt_Lewin) spent decades trying to convince people of a deceptively simple idea: behaviour is a function of both the person and the environment, and the environment is systematically underweighted in how we explain what happens. His equation, B = f(P, E), looks like a truism until you start noticing how rarely the E is examined. When a data team underdelivers, the conversation almost always focuses on P. Skill gaps. Attitude. The wrong hire. The individual who isn't stepping up or who doesn't get what the business is trying to do. The E barely gets a mention. Nobody says "what is it about how we structured this work, or ran these meetings, or handled the last incident, that produced this behaviour?" Yet Lewin's claim, and the evidence that has accumulated around it since, is that the E is doing most of the work.

<div id="lewin-viz" style="font-family: Georgia, serif; margin: 2rem 0; padding: 2rem 1.5rem; color: var(--color-base-text); background: var(--color-base-bg); border: 1px solid var(--color-base-bg-3); border-radius: 4px;">
  <h2 style="font-size: 1.25rem; font-weight: 600; margin: 0 0 0.4rem; color: var(--color-base-text);">B = f(P, E): Where Are You Looking?</h2>
  <p style="font-size: 0.9rem; color: var(--color-base-text-2); margin: 0 0 1.5rem; line-height: 1.5;">When behaviour on your team goes wrong, how much of your diagnosis focuses on the person versus the environment?</p>
  <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 0.75rem;">
    <span style="font-size: 0.85rem; font-weight: 600; color: #b94a2c; white-space: nowrap;">Person (P)</span>
    <input id="lewin-slider" type="range" min="0" max="100" value="70" style="flex: 1; accent-color: #555; cursor: pointer;" />
    <span style="font-size: 0.85rem; font-weight: 600; color: #2c6e49; white-space: nowrap;">Environment (E)</span>
  </div>
  <div style="display: flex; height: 2rem; border-radius: 3px; overflow: hidden; margin-bottom: 0.5rem;">
    <div id="bar-p" style="background: #b94a2c; display: flex; align-items: center; justify-content: center; transition: width 0.15s ease; min-width: 2rem; width: 70%;"><span id="bar-p-text" style="font-size: 0.75rem; color: white; font-weight: 600;">70%</span></div>
    <div id="bar-e" style="background: #2c6e49; display: flex; align-items: center; justify-content: center; transition: width 0.15s ease; min-width: 2rem; width: 30%;"><span id="bar-e-text" style="font-size: 0.75rem; color: white; font-weight: 600;">30%</span></div>
  </div>
  <div id="framing-label" style="text-align: center; font-size: 0.85rem; color: var(--color-base-text-2); margin-bottom: 1.5rem; font-style: italic;">Person-heavy</div>
  <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-bottom: 1.5rem;">
    <div>
      <h3 style="font-size: 0.8rem; font-weight: 600; margin: 0 0 0.3rem; text-transform: uppercase; letter-spacing: 0.04em; color: #b94a2c;">Interventions you'll reach for</h3>
      <div id="person-interventions"></div>
    </div>
    <div>
      <h3 style="font-size: 0.8rem; font-weight: 600; margin: 0 0 0.3rem; text-transform: uppercase; letter-spacing: 0.04em; color: #2c6e49;">Interventions you'll reach for</h3>
      <div id="env-interventions"></div>
    </div>
  </div>
  <p style="font-size: 0.8rem; color: var(--color-base-text-2); margin: 0; line-height: 1.5; border-top: 1px solid var(--color-base-bg-3); padding-top: 1rem;">Lewin's equation is multiplicative in effect. A great environment enables people who would otherwise underperform. The slider shows how the framing of a problem shapes the solutions you see.</p>
</div>

<script>
(function() {
  var personInterventions = ["Performance improvement plan", "Training or coaching", "Role reassignment", "Hire differently next time"];
  var envInterventions = ["Redesign meeting norms", "Clarify how decisions get made", "Change how errors are handled", "Audit what silence costs", "Reduce over-specification of work"];

  function renderItem(text, type) {
    var isDark = document.documentElement.hasAttribute('data-bs-theme') && document.documentElement.getAttribute('data-bs-theme') === 'dark';
    var bg = isDark ? (type === 'p' ? '#3d2420' : '#1d3d2f') : (type === 'p' ? '#fdf0ed' : '#edf5f1');
    var border = type === 'p' ? '#b94a2c' : '#2c6e49';
    var color = isDark ? '#f3f4f6' : (type === 'p' ? '#5a2010' : '#1a4030');
    return '<div style="font-size:0.85rem;padding:0.4rem 0.6rem;border-radius:3px;line-height:1.4;background:' + bg + ';border-left:3px solid ' + border + ';color:' + color + ';margin-bottom:0.4rem;">' + text + '</div>';
  }

  function update(pWeight) {
    var eWeight = 100 - pWeight;
    document.getElementById('bar-p').style.width = pWeight + '%';
    document.getElementById('bar-e').style.width = eWeight + '%';
    document.getElementById('bar-p-text').textContent = pWeight + '%';
    document.getElementById('bar-e-text').textContent = eWeight + '%';
    var label = pWeight > 60 ? 'Person-heavy' : pWeight < 40 ? 'Environment-heavy' : 'Balanced';
    document.getElementById('framing-label').textContent = label;
    var pCount = Math.ceil((pWeight / 100) * personInterventions.length);
    var eCount = Math.ceil((eWeight / 100) * envInterventions.length);
    var pHtml = pCount === 0 ? '<div style="font-size:0.85rem;color:var(--color-base-text-2);font-style:italic;">None</div>' : personInterventions.slice(0, pCount).map(function(t){ return renderItem(t, 'p'); }).join('');
    var eHtml = eCount === 0 ? '<div style="font-size:0.85rem;color:var(--color-base-text-2);font-style:italic;">None</div>' : envInterventions.slice(0, eCount).map(function(t){ return renderItem(t, 'e'); }).join('');
    document.getElementById('person-interventions').innerHTML = pHtml;
    document.getElementById('env-interventions').innerHTML = eHtml;
  }

  var slider = document.getElementById('lewin-slider');
  slider.addEventListener('input', function() { update(parseInt(this.value)); });
  update(70);
})();
</script>

[Barry Schwartz](https://en.wikipedia.org/wiki/Barry_Schwartz_(psychologist)) traced the same logic through the history of work itself. Industrial job design started with an assumption: workers are essentially lazy and will do as little as possible unless compelled. So work was designed accordingly: fragmented, supervised, stripped of discretion. The workers duly behaved as assumed. Schwartz's point is that this was not a discovery about human nature. It was an experiment in environmental design, and it produced exactly the behaviour it expected. Lewin would have recognised it as a predictable application of his equation. The data equivalent is alive and well: if you treat a team's work as a service desk, structure it around ticket throughput, and specify requests so tightly that no judgment is required, you will produce a team that behaves like a service desk. You designed the room. Don't be surprised by who shows up to sit in it.

The most important piece of empirical evidence in this knowledge base on team performance comes from [Google's Project Aristotle](https://psychsafety.com/googles-project-aristotle/), which spent two years studying 180 teams and arrived at a conclusion that surprised even the researchers: who is on the team explains very little about how the team performs. What explains it is how the team operates. The dominant predictor, by a distance, was psychological safety, the shared belief that it is safe to speak up, ask questions, surface mistakes, and disagree, without it counting against you. Not talent density. Not technical depth. The quality of the environment, specifically: whether people experience it as safe to be honest. [Margaret Heffernan](https://www.ted.com/talks/margaret_heffernan_why_it_s_time_to_forget_the_pecking_order_at_work) reached the same conclusion from a different direction, observing that teams built around individual star performance (she calls it the super-chicken model, and the label earns its keep) consistently underperform teams built around social capital, mutual helpfulness, and equal voice. The room matters more than the roster.

What does "designing the environment" actually mean in practice? It means that when a data engineer stays quiet in a planning meeting, the most interesting question is not "why is she disengaged?" but "what signal has this room been sending about what happens when you speak up?" It means that when you explain the context behind a piece of work, not just the specification, you are supporting the autonomy that [Deci and Ryan](https://en.wikipedia.org/wiki/Self-determination_theory) identified as a basic psychological need, the one whose frustration reliably degrades quality and creativity. It means that when something goes wrong and you respond with curiosity rather than blame, you are calibrating the room's safety level, and that calibration will echo in how your team handles the next ten things that go wrong. Tony Manganiello's observation that loyalty is built in moments of tension is exactly this: the tension is the test of the environment, and people are watching closely. They are always watching closely.

The practical implication is that almost everything you do as a data leader is environmental design, whether you think of it that way or not. The way you run a retrospective. Whether you share the reasoning behind a priority call or just the call. Whether you let a dominant voice run the room or actively create space. Whether errors get surfaced to you or hidden from you, which is itself a readout of safety. These are not soft decisions. They are architectural ones.

Lewin had a phrase worth keeping: there is nothing so practical as a good theory. The theory here is simple. The people on your team are largely behaving in response to the environment you have built for them. Improving that environment will produce better behaviour more reliably than improving the individuals. Which means the most useful question when auditing your team's performance is not "who are the problems?" It is "what is the room doing?"
