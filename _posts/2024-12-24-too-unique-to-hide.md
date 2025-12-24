---
layout: post
title: "Too Unique to Hide: Understanding Re-identification Risk in Australia"
description: A new tool that reveals how easily you can be identified from "anonymous" data
date: 2024-12-24 10:00:00 +0000
author: mitchell
image: '/images/too-unique-to-hide.jpg'
tags: [privacy, data, security, australia]
tags_color: '#2563eb'
---

We've all been told that our data is "de-identified" or "anonymized." Healthcare providers, government agencies, and companies assure us that after removing names and addresses, our information is safe. But how safe is it really?

This question led me to create [Too Unique to Hide](https://mitchelllisle.github.io/too-unique-to-hide-aus/), an interactive calculator that shows Australians how identifiable they might be from supposedly anonymous datasets.

## How Unique Are You?

Even without your name or address, a few basic demographic facts can be quite distinctive. A combination of your postcode, age group, gender, and occupation might sound generic—but together, they can create a unique profile.

The calculator uses real Australian Bureau of Statistics (ABS) census data to show this. Enter your details, and it shows how many people in Australia share that same demographic profile. The results can be surprising.

## Understanding the Numbers

When fewer people share your characteristics, linking different datasets becomes easier. For example, if an organization releases "anonymous" health data with postcode, age, and gender, it's possible that cross-referencing with other datasets could reveal identities—especially in smaller population groups.

The calculator shows four risk categories based on how many people match your profile, from very high risk (fewer than 10 matches) to lower risk (1,000+ matches). These estimates help you understand your potential visibility in anonymized datasets.

## Real-World Examples

Re-identification isn't just theoretical. In 2016, the Australian Department of Health released "de-identified" Medicare data, but researchers showed it was possible to re-identify individuals, leading to the dataset being withdrawn. Similar issues arose with Netflix viewing data and location tracking from apps.

Most often, this isn't about bad actors—it's organizations not fully appreciating how unique demographic combinations can be when sharing data for legitimate research or policy purposes.

## The Combination Effect

Each demographic factor on its own is common. Millions share your age group or postcode. But combine them with gender and occupation, and you're often in a much smaller group. The calculator visualizes this, showing how rare you are for each attribute individually and combined.

## What You Can Do

Understanding your profile is a useful first step:

1. **Be mindful with surveys** that collect detailed demographics along with postcodes
2. **Think about combinations** when sharing information across multiple platforms
3. **Ask questions** when organizations claim data is anonymous—what demographics remain?
4. **Support privacy protections** that go beyond simple de-identification

## Building the Tool

I built this using Observable Framework and real ABS census data, inspired by research from Imperial College London. All calculations happen in your browser—nothing you enter is collected or transmitted.

The goal is education, not alarm. Many Australians don't realize how distinctive basic demographics can be. This tool makes that concept tangible.

## Looking Forward

Data sharing for research and policy is valuable, and we shouldn't stop it. But we do need better approaches. This includes being realistic about de-identification limits, using stronger privacy techniques like differential privacy, and being thoughtful about what demographic detail gets shared.

Try the calculator at [Too Unique to Hide](https://mitchelllisle.github.io/too-unique-to-hide-aus/) and see where you stand. Whether you're one in thousands or more unique, understanding your demographic fingerprint is worth knowing in our data-driven world.

---

*Try the calculator: [Too Unique to Hide - Australian Edition](https://mitchelllisle.github.io/too-unique-to-hide-aus/)*

*Learn more: [Office of the Australian Information Commissioner](https://www.oaic.gov.au/)*
