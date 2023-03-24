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

The stat `A1` represents the total population count, median age, and mean age of individuals in the database. The count refers to the total number of individuals in the database, the median age refers to the age that separates the database into two equal halves, and the mean age refers to the average age of all individuals in the database. The other stats are all showing the same information for various cohorts.

Note that with `A3` we have suppressed it in order to protect the identity of the individuals who have a higher risk of being re-identified. What's interesting about this stat is that this is information we can encode into our model to help us come up with a better re-construction. We can infer that it is suppressed because there is <3 people who represent this cohort since we know that other stats (such as `D2`) contain 3 people and that stat is not supressed.

In order to encode these constraints into a model that we can use to re-construct the data, we can use a library such as [Z3](https://github.com/Z3Prover/z3). We can use libraries such as Z3 to model constraints and then ask for an answer that fits within those constraints. Effectively, each stat above is a constraint that we can model and we can ask it to generate all the permutations of age, smoker status, employment status and married status that have to exist in order to satisfy all the constraints. An example of modelling a constraint can be done like this:

```python
import z3

# create a solver object, that houses all our constraints
solver = z3.Solver()

# create representations of the variables we want to receive an answer for; such as ages
ages: z3.ArraySort = z3.Array('ages', z3.IntSort(), z3.IntSort())

# define a constraint on these variables (we know there are 7 people, so we range over that number)
# the constraint we add here is to ensure all 7 people have a realistic age (between 0 and 125)
min_age = 0
max_age = 125

for i in range(7):
    solver.add(
        z3.And(
            z3.Select(ages, i) > min_age,
            z3.Select(ages, i) < max_age
        )
    )

solver.check() # this checks that our constraints can produce a valid model
solver.model() # we can then access that model
```

The result of the constraints above would end up outputing a list of values for ages that fit within our constraints. For example, the model we end up with might look like this:

```text
[45, 34, 67, 34, 123, 1, 8]
```

Of course there could be many permutations, the model may output different answers depending on which one it picks first. With each new constraint added, we reduce the search space until we ideally get down to 1 answer that fit all the constraints. At this point, we've re-constructed the database!

If you want to see this in action, check out [this repo with a full implementation](https://github.com/mitchelllisle/database-reconstruction-attacks).

Why is this possible? Well the answer to that comes from the same people that have come up with the best technique we know of to protecting against this type of attack:

> "[Giving] overly accurate answers to too many questions will destroy privacy in a spectacular way"
>
> Cynthia Dwork and Aaron Roth, Authors of 'The Algorithmic foundations of Differential Privacy'

The next question you may be asking is "How do I protect against this attack?". A couple of things you can look at include:
 - [Differential privacy](https://desfontain.es/privacy/friendly-intro-to-differential-privacy.html): DP is a great fit for protecting this type of data. In fact, the US Census Bereau have adopted DP to avoid disclosure of private information about individuals
 - [Data minimisation](https://martinfowler.com/bliki/Datensparsamkeit.html): Releasing too much information can lead to a simpler re-construction attack vector, so minimising the data you release can be a simple way to limit what people can infer about your data

If you can, try and consult with privacy experts in your organisation to ensure they do a privacy review before sharing data with third-parties or with the public.

 Thanks!
