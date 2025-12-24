---
layout: post
title: "Too Unique to Hide: Understanding Re-identification Risk in Australia"
description: A new tool that reveals how easily you can be identified from "anonymous" data
date: 2024-12-24 10:00:00 +0000
author: mitchell
image: '/images/too-unique-hero.jpg'
tags: [privacy, data, security, australia]
tags_color: '#2563eb'
---

We've all been told that our data is "de-identified" or "anonymized." Healthcare providers, government agencies, and private companies assure us that after removing names and addresses, our information is safe. But is it really?

This question led me to create [Too Unique to Hide](https://mitchelllisle.github.io/too-unique-to-hide-aus/), an interactive calculator that shows Australians just how identifiable they are from supposedly anonymous datasets.

## The Illusion of Anonymity

Here's a sobering reality: even without your name or address, just a few basic demographic facts can single you out from millions of people. A combination of your postcode, age group, gender, and occupation might sound generic—but when you put them together, they often create a unique fingerprint.

The calculator uses real Australian Bureau of Statistics (ABS) census data to demonstrate this. Enter your postcode, age group, and gender (with occupation optional), and it shows you exactly how many people in Australia share that same demographic profile. The results can be eye-opening.

## Why Small Numbers Matter

When only a handful of people share your characteristics, you're vulnerable to what researchers call **re-identification attacks**. Here's how it works:

Imagine a health insurer releases an "anonymous" dataset of medical claims with postcode, age, and gender. Then imagine a data broker has another dataset with similar demographics plus names. Cross-reference these datasets, and suddenly that "anonymous" health record isn't so anonymous anymore.

The fewer people who match your profile, the easier this becomes. If you're one of only 15 people in your postcode with your age and gender, you're not hiding in a crowd—you're nearly visible.

## What the Risk Levels Mean

The calculator classifies re-identification risk into four categories:

- **Very High Risk** (fewer than 10 matches): You're highly vulnerable. Just one or two additional data points could uniquely identify you.
- **High Risk** (10-99 matches): Your anonymity set is small. Linking datasets could single you out with minimal effort.
- **Moderate Risk** (100-999 matches): You have some protection, but sophisticated data matching could still identify you.
- **Lower Risk** (1,000+ matches): You're better protected by the crowd, though combining multiple datasets could still be revealing.

## Why This Matters

This isn't just a theoretical concern. Re-identification has real-world consequences:

- In 2016, the Australian Department of Health released "de-identified" Medicare and pharmaceutical benefits data. Within days, researchers demonstrated they could re-identify individuals, leading to the data being removed.

- When Netflix released "anonymous" viewing histories for a competition, researchers successfully re-identified users by cross-referencing with public IMDB ratings.

- "Anonymous" location data from smartphone apps has been used to track individuals' movements, including visits to sensitive locations like medical clinics or places of worship.

The problem isn't just malicious actors—it's also well-meaning organizations that underestimate re-identification risks when sharing data for research or commercial purposes.

## The Combination Effect

What makes this particularly insidious is that each characteristic on its own seems harmless. Millions of Australians share your age group. Millions share your postcode. But **combine** them with gender, add occupation, and suddenly you're in a much smaller group.

This is why the visualization in the calculator matters. It shows not just your overall risk, but breaks down how rare you are for each individual attribute. You might be common in your postcode but rare in your occupation—and that combination is what matters.

## What You Can Do

Understanding your re-identification risk is the first step. Here are some practical takeaways:

1. **Be cautious with surveys and forms** that collect detailed demographics, especially if they also ask for your postcode. Even "anonymous" surveys can be linked.

2. **Think about data combinations**. A single dataset might not identify you, but three datasets with partial overlaps can be devastating.

3. **Support strong privacy protections**. Australia's Privacy Principles are a good start, but we need stronger safeguards for how organizations can use and share demographic data.

4. **Question "de-identification" claims**. When organizations say data is anonymous, ask: What demographics remain? Could this be linked with other datasets?

## Building the Calculator

I built this tool using Observable Framework and real ABS census data, adapting the concept from research by Imperial College London. All calculations happen locally in your browser—I don't collect, store, or transmit any information you enter.

The goal isn't to scare people, but to educate. Most Australians have no idea how identifiable they are from basic demographics. This calculator makes that risk tangible and personal.

## The Bigger Picture

As we move toward more data sharing—for research, policy-making, and commercial purposes—we need to be honest about the limits of de-identification. "Anonymous" data often isn't, and pretending otherwise puts people at risk.

Some areas of Australia, particularly rural and regional areas with smaller populations, face even higher risks. If you're the only person of your age and gender in a small postcode, your "anonymous" health records might as well have your name attached.

The solution isn't to stop using data—data-driven research and policy are valuable. But we need to:
- Be honest about re-identification risks
- Use stronger privacy-preserving techniques (like differential privacy)
- Limit the demographic detail in shared datasets
- Enforce penalties for re-identification attempts

## Try It Yourself

I encourage you to visit [Too Unique to Hide](https://mitchelllisle.github.io/too-unique-to-hide-aus/) and see where you stand. The results might surprise you.

Whether you're someone who's "one in a million" or one of thousands with your profile, understanding your re-identification risk is crucial in an era where our data is constantly collected, shared, and analyzed.

The next time someone tells you your data is "anonymous," you'll know to ask: how anonymous, really?

---

*Try the calculator: [Too Unique to Hide - Australian Edition](https://mitchelllisle.github.io/too-unique-to-hide-aus/)*

*Learn more about Australian data privacy: [Office of the Australian Information Commissioner](https://www.oaic.gov.au/)*
