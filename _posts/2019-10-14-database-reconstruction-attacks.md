---
layout: post
title: Database Reconstruction Attacks
description:
date: 2023-02-23 15:01:35 +0300
author: mitchell
image: '/images/dra-hero.jpg'
# video_embed: https://www.youtube.com/embed/62bWUYRxi8g
tags: [privacy, python, databases, z3]
tags_color: '#064789'
---

# 🧮 Database Reconstruction Attacks (DRAs)

This notebook is adapted from a paper on database reconstruction attacks. You can find the paper [here](https://queue.acm.org/detail.cfm?id=3295691)

There are a number of reasons businesses and governments want to share information about people. It is important that when sharing information, you consider privacy and anonymity of the people that data is derived from. In most cases, aggregate data does little to hinder hackers from being able to re-create a database that is either very close, or exactlythe same as the original data. In this application, we will take a simple example and re-create the database from nothing but aggregate statistics about those people.

We will mainly use [Z3](https://github.com/Z3Prover/z3) for this. Imagine we have the following database that contains information for people within a certain geographic area (going forward we refer to this area as a **block**.)

We have *7* people in total in this block. Alongside **age**, we also have each resident's **smoking status**, **employment status** and whether they are **married** or not. From here, we publish a variety of statistics about this block. You have probably seen something similar if you've ever done a census.

> 📓 To simplify the example, this fictional world has:
> - Two marriage statuses; Married (**True**) or Single (**False**)
> - Two smoking statuses; Non-Smoker (**False**) or Smoker (**True**)
> - Two employment statuses;  Unemployed (**False**) or Employed (**True**)

> 👾 One additional piece of logic we know is that any statistics with a **count of less than 3** is suppressed. Suppression of statistics with low counts is often used as a tactic for protecting privacy. The less people there are to represent a statistic, the more they often stick out in a dataset meaning their privacy is often more at risk than those who 'blend in with the crowd'. As we'll see, simply knowing that a statistic is suppressed can even be used to attack a dataset