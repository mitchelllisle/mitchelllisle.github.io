---
layout: post
title: "Why I Am a Luddite"
description: "A practical framework for thinking about AI adoption: not whether it is impressive, but who it serves and at what cost."
date: 2026-05-02 00:00:00 +1100
author: mitchell
image: '/images/luddite.jpg'
image_credit: 'Photo by <a href="https://unsplash.com/@thkelley?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Thomas Kelley</a> on <a href="https://unsplash.com/photos/gray-ge-volt-meter-at-414-xVptEZzgVfo?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>'
tags: [ai, work, technology, organisations]
tags_color: '#6366f1'
---

The story most people know goes like this: in early 19th century England, textile workers who feared the future smashed the machines that threatened their jobs. Ignorance versus progress. The Luddites lost, technology won, end of story.

Brian Merchant, who spent years researching the movement, found something messier and more useful. The Luddites were not anti-technology, they were anti-poverty. They were skilled workers who understood the machines intimately and objected not to machinery itself, but to the conditions of its deployment. Their phrase for what they opposed was machinery hurtful to commonality.

They were not asking whether the machines worked. They were asking who they worked for.

That reframing matters for AI in 2026.

I use AI every day. It is genuinely useful, occasionally magical, occasionally strange, and worth taking seriously. I am not arguing that it does not matter. What I have become more skeptical of is the claim that the current shape of AI adoption is inevitable, and that asking questions about it is just resistance.

That framing usually sounds like this: the future is already decided, the only question is whether you are keeping up.

Who decided this deployment model? What alternatives were considered? Who absorbs the cost when it fails? These are not anti-technology questions. They are basic governance questions.

I do not know the future of AI, and neither does anyone else, whatever confidence they project. What has helped is having a framework for the present: evaluate specific deployments, not the technology in the abstract.

The Luddite question is that framework: not is this impressive, but who does this serve, and on what terms?

## AI Does Not Fix Systems, It Accelerates Them

One pattern keeps repeating: AI does not transform how an organization works. It accelerates whatever is already there.

A team with broken processes, heavy stage gates, stale documentation, and meaningless metrics introduces AI. Now it has governance bots enforcing the same gates, AI-generated versions of documents nobody reads, and automated summaries of reports that were already being ignored.

Everything gets faster. Nothing gets better.

I have seen this play out in data work repeatedly: dashboards nobody uses produced at higher volume, strategy documents polished into confident illegibility, status updates that are longer and cleaner but carry less signal than what they replaced.

Velocity increases and noise increases with it, for the same reason: the tool was applied to a broken model rather than to the question of whether the model was worth keeping.

The roughest implementations are often not caused by careless people. They happen because pressure to be seen adopting AI outpaces the harder work of deciding what adoption should mean.

The label changes. The thinking does not.

## The IKEA Effect And Prompting

Dan Ariely and colleagues studied what they called the IKEA effect: people overvalue things they help construct. In one of the better-known experiments, participants made origami cranes and then stated how much they would pay to keep them. Neutral observers were asked to price the same cranes.

The builders were willing to pay roughly five times more.

The mechanism is effort, not quality. Putting work into something changes how we value it, independent of what it objectively is.

That is interesting in an AI context.

When you prompt something into existence, you frame the question, iterate outputs, and shape the final result. That is real effort, even if it differs from producing every word or line yourself. If the threshold for ownership feelings is low, then AI-assisted output may feel more trustworthy than it deserves simply because we invested effort in producing it.

<div id="ikea-effect-widget" style="max-width: 620px; margin: 2rem auto; padding: 1.1rem; border: 2px solid #d8ccb8; border-radius: 10px; background: radial-gradient(80% 130% at 20% 10%, #fff8eb 0%, transparent 60%), linear-gradient(140deg, #f7f4ee 0%, #e8dfd0 100%); box-shadow: 0 10px 30px rgba(40,30,20,0.08); font-family: 'Courier New', Courier, monospace; color: #2a251e;">
  <div style="display: flex; justify-content: space-between; align-items: center; gap: 0.75rem; margin-bottom: 0.9rem; flex-wrap: wrap;">
    <div style="font-size: 0.88rem; text-transform: uppercase; letter-spacing: 0.08em;">IKEA Effect Motif</div>
    <div style="display: inline-flex; border: 2px solid #d8ccb8; border-radius: 8px; overflow: hidden; background: #f5ecde;">
      <button id="mode-observer" style="border: 0; padding: 0.35rem 0.65rem; background: #fff; color: #2a251e; font-family: inherit; font-size: 0.76rem; cursor: pointer;">observer</button>
      <button id="mode-builder" style="border: 0; padding: 0.35rem 0.65rem; background: transparent; color: #756b5d; font-family: inherit; font-size: 0.76rem; cursor: pointer;">builder</button>
    </div>
  </div>

  <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; align-items: center;" id="ikea-scene">
    <div style="position: relative; min-height: 180px; border: 2px solid #d8ccb8; border-radius: 8px; background: linear-gradient(#ede3d2 1px, transparent 1px), linear-gradient(90deg, #ede3d2 1px, transparent 1px), #f9f5ee; background-size: 20px 20px; display: grid; place-items: center; overflow: hidden;">
      <div id="crane" style="--crane-color: #b7b0a6; --wing-color: #cec7be; width: 128px; height: 128px; position: relative; transform: translateY(4px); image-rendering: pixelated; animation: crane-bob 5s ease-in-out infinite;">
        <div id="wing-left" class="crane-wing"></div>
        <div id="wing-right" class="crane-wing crane-wing-right"></div>
        <div class="crane-fold"></div>
        <div class="crane-beak"></div>
      </div>
      <div style="position: absolute; bottom: 0.55rem; left: 0.55rem; right: 0.55rem; font-size: 0.72rem; background: rgba(255,255,255,0.9); border: 1px solid #d8ccb8; border-radius: 6px; padding: 0.4rem 0.5rem;">Effort can increase attachment without increasing quality.</div>
    </div>

    <div style="border: 2px solid #d8ccb8; border-radius: 8px; padding: 0.8rem; background: #fff9ef;">
      <h3 id="mode-title" style="margin: 0 0 0.35rem; font-size: 0.9rem;">Observer view</h3>
      <p id="mode-note" style="margin: 0.25rem 0; color: #756b5d; font-size: 0.8rem; line-height: 1.45;">Looks like output. Low attachment.</p>
      <p id="mode-score" style="margin-top: 0.6rem; display: inline-block; font-size: 0.76rem; border: 1px solid #d8ccb8; border-radius: 999px; padding: 0.22rem 0.55rem; color: #2a251e; background: #fff;">valuation: 1x</p>
      <p style="margin: 0.5rem 0 0; font-size: 0.72rem; color: #756b5d;"><strong style="color: #2a251e;">How to read:</strong> same crane, different valuation signal. The output can look identical while attachment changes with effort.</p>
    </div>
  </div>
</div>

<style>
  #crane::before {
    content: '';
    position: absolute;
    inset: 0;
    background: var(--crane-color);
    clip-path: polygon(50% 10%, 62% 26%, 86% 26%, 68% 40%, 82% 56%, 58% 52%, 50% 66%, 42% 52%, 18% 56%, 32% 40%, 14% 26%, 38% 26%);
    filter: drop-shadow(0 6px 0 rgba(30,20,10,0.08));
  }
  .crane-wing {
    position: absolute;
    width: 42px;
    height: 29px;
    background: var(--wing-color);
    top: 44%;
    left: 18%;
    transform-origin: 100% 50%;
    clip-path: polygon(0 50%, 100% 0, 100% 100%);
    animation: crane-flap-left 3.6s steps(2, end) infinite;
  }
  .crane-wing-right {
    left: auto;
    right: 18%;
    transform-origin: 0 50%;
    clip-path: polygon(0 0, 100% 50%, 0 100%);
    animation: crane-flap-right 3.6s steps(2, end) infinite;
  }
  .crane-fold {
    position: absolute;
    width: 34px;
    height: 22px;
    top: 39%;
    left: 50%;
    transform: translateX(-50%);
    background: rgba(255, 255, 255, 0.16);
    clip-path: polygon(50% 0, 100% 100%, 0 100%);
    pointer-events: none;
  }
  .crane-beak {
    position: absolute;
    width: 18px;
    height: 7px;
    top: 24%;
    right: 14%;
    background: var(--crane-color);
    clip-path: polygon(0 50%, 100% 0, 100% 100%);
    transform: rotate(-5deg);
    pointer-events: none;
  }
  @keyframes crane-bob {
    0%, 100% { transform: translateY(4px); }
    50% { transform: translateY(0); }
  }
  @keyframes crane-flap-left {
    0%, 75%, 100% { transform: rotate(0deg); }
    80%, 90% { transform: rotate(-12deg); }
  }
  @keyframes crane-flap-right {
    0%, 75%, 100% { transform: rotate(0deg); }
    80%, 90% { transform: rotate(12deg); }
  }
  @media (max-width: 680px) {
    #ikea-scene {
      grid-template-columns: 1fr !important;
    }
  }
</style>

<script>
(function () {
  var copy = {
    observer: {
      title: 'Observer view',
      note: 'Looks like output. Low attachment.',
      score: 'valuation: 1x',
      color: '#b7b0a6',
      wing: '#cec7be'
    },
    builder: {
      title: 'Builder view',
      note: 'Effort creates ownership. Attachment rises.',
      score: 'valuation: 5x',
      color: '#cf5d2e',
      wing: '#db8664'
    }
  };

  var mode = 'observer';

  var btnObserver = document.getElementById('mode-observer');
  var btnBuilder = document.getElementById('mode-builder');
  var title = document.getElementById('mode-title');
  var note = document.getElementById('mode-note');
  var score = document.getElementById('mode-score');
  var crane = document.getElementById('crane');
  var wingLeft = document.getElementById('wing-left');
  var wingRight = document.getElementById('wing-right');

  if (!btnObserver || !btnBuilder || !title || !note || !score || !crane || !wingLeft || !wingRight) return;

  function paint() {
    var c = copy[mode];
    title.textContent = c.title;
    note.textContent = c.note;
    score.textContent = c.score;
    crane.style.setProperty('--crane-color', c.color);
    crane.style.setProperty('--wing-color', c.wing);
    wingLeft.style.background = c.wing;
    wingRight.style.background = c.wing;

    btnObserver.style.background = mode === 'observer' ? '#fff' : 'transparent';
    btnObserver.style.color = mode === 'observer' ? '#2a251e' : '#756b5d';
    btnBuilder.style.background = mode === 'builder' ? '#fff' : 'transparent';
    btnBuilder.style.color = mode === 'builder' ? '#2a251e' : '#756b5d';
  }

  btnObserver.addEventListener('click', function () {
    mode = 'observer';
    paint();
  });

  btnBuilder.addEventListener('click', function () {
    mode = 'builder';
    paint();
  });

  paint();
})();
</script>

I do not think this means AI-assisted work is inherently bad. It means our confidence in that work may be less objective than we assume.

So I use a simple rule: if I have put significant effort into shaping AI-assisted output that I am about to act on, I get someone who was not in the room to review it.

Not because AI must be wrong. Because I may be the least reliable judge of something that feels like I made it.

At team scale, this matters even more. When everyone has invested effort in an AI-assisted deliverable, you can end up with a room full of ownership bias.

## Skills Are Shifting, Not Disappearing

This is not a case for denial. Skills always depreciate and compound over time.

The skills that are depreciating fastest are the ones AI can increasingly perform: fast SQL drafting, standard dashboard production, report formatting, basic summarization.

The skills that compound are judgment-intensive: knowing what to ask, reading context, seeing when an analysis is technically correct but organizationally wrong, and helping stakeholders clarify what they actually need.

As the cost of producing mediocre output approaches zero, judgment becomes more scarce and more valuable.

If anyone can generate a passable dashboard in five minutes, the value shifts to deciding which dashboards should exist at all.

Whether workers are compensated for that shift, or whether gains are extracted elsewhere, is the Luddite question applied to a career.

## A Useful Question, Even Without Guarantees

The Luddites lost in the most literal sense. The state crushed the movement and the machines continued.

That is not an argument against asking the question. It is a reminder that asking it does not guarantee the answer you want.

And yet, versions of this question have won before: collective bargaining over automation, labor protections, organizations that deploy AI to augment skilled work instead of deskilling it.

The framework does not promise a good outcome. It gives you a way to see clearly enough to push for one.

Sometimes the answer is good. AI can remove tedious work and free people for higher-judgment work they find meaningful.

But on the surface, that can look very similar to AI deployed to deskill, justify layoffs, and extract more from fewer people under the language of progress.

The Luddite frame helps you distinguish between those two paths.

Not refuse the technology. Ask what it is for, who decided, and who benefits.

Nobody else is going to ask that on your behalf.

You should be a Luddite too.
