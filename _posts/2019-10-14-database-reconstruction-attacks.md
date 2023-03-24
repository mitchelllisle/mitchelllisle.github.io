---
layout: post
title: "Protecting Sensitive Data: Understanding Database Reconstruction Attacks"
description:
date: 2023-02-23 15:01:35 +0300
author: mitchell
image: '/images/dra-hero.jpg'
# video_embed: https://www.youtube.com/embed/62bWUYRxi8g
tags: [privacy, python, databases, z3]
tags_color: '#064789'
---

# Protecting Sensitive Data: Understanding Database Reconstruction Attacks

There are a number of reasons businesses and governments want to share information about people. One of the most common and useful way data is shared is through a census. A Census is particularly interesting because it contains some extremely personal information about individuals and as a result, it must be carefully protected to ensure any statistical information that is released doesn't encroach on everyones right to priavacy. In a number of cases, aggregate data does little to hinder hackers from being able to re-create a database that is either very close, or exactly the same as the original data. In this blog post, we will explore a little about how these attacks work with a simple example.

This blog post and the subsequent code is adapted from a paper on database reconstruction attacks. You can find the paper [here](https://queue.acm.org/detail.cfm?id=3295691)

Imagine we work for a company called Acme Data Inc. and that have the following database that contains information for people within a certain geographic area.

| name            | age | married | smoker | employed |
|-----------------|-----|---------|--------|----------|
| Sara Gray       | 8   | False   | False  | False    |
| Joseph Collins  | 18  | False   | True   | True     |
| Vincent Porter  | 24  | False   | False  | True     |
| Tiffany Brown   | 30  | True    | True   | True     |
| Brenda Small    | 36  | True    | False  | False    |
| Dr. Tina Ayala  | 66  | True    | False  | False    |
| Rodney Gonzalez | 84  | True    | True   | False    |

*Note*: All data here is fake generated data, and likeness to a real person is entirely coincidental.

We have *7* people in total in this block. Alongside **age**, we also have each resident's **smoking status**, **employment status** and whether they are **married** or not. From here, we publish a variety of statistics about this block. You have probably seen something similar if you've ever done a census.

📓 To simplify the example, this fictional world has:

- Two marriage statuses; Married (**True**) or Single (**False**)
- Two smoking statuses; Non-Smoker (**False**) or Smoker (**True**)
- Two employment statuses;  Unemployed (**False**) or Employed (**True**)

👾 One additional piece of logic we know is that any statistics with a **count of less than 3** is suppressed. Suppression of statistics with low counts is often used as a tactic for protecting privacy. The less people there are to represent a statistic, the more they often stick out in a dataset meaning their privacy is often more at risk than those who 'blend in with the crowd'. As we'll see, simply knowing that a statistic is suppressed can even be used to attack a dataset.

As a Data Analyst working for Acme Data, we have been tasked with producing the following summary statistics that we can publish on our website for anyone to view. After running our analysis, this is the output that we intend to publish:

| id        | name                   | count | median-age | mean-age  |
|-----------|------------------------|-------|------------|-----------|
| A1        | total-population        | 7.0   | 30.0   | 38.0  |
| A2        | non-smoker              | 4.0   | 30.0   | 33.0  |
| B2        | smoker                  | 3.0   | 30.0   | 44.0  |
| C2        | unemployed              | 4.0   | 51.0   | 48.0  |
| D2        | employed                | 3.0   | 24.0   | 24.0  |
| A3        | single-adults           | NaN   | NaN    | NaN   |
| B3        | married-adults          | 4.0   | 51.0   | 54.0  |
| A4        | unemployed-non-smoker   | 3.0   | 36.0   | 37.0  |

So we can see that `A1` contains statistics for all 7 people
