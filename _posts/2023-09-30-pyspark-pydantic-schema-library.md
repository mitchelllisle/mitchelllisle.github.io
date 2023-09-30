---
layout: post
title: "One schema library to rule them all"
description:
date: 2023-09-30 15:01:35 +0300
author: mitchell
image: '/images/sparkdantic.jpg'
# video_embed: https://www.youtube.com/embed/62bWUYRxi8g
tags: [pydantic, python, pyspark, schema]
tags_color: '#F08238'
---

## Generating and Testing PySpark DataFrames with Sparkdantic

### 1. Introduction of the Problem Sparkdantic Solves

In the world of Big Data, PySpark has become a go-to framework for processing large datasets. However, as with any framework, there are challenges. One of the most common challenges is defining schemas for DataFrames and generating realistic test data. Whether you're writing unit tests, populating a development database, or just experimenting, having a reliable way to create and populate DataFrames is crucial.

Traditionally, developers would manually define schemas and write custom code to generate test data. This process is not only tedious but also error-prone. What if there was a more streamlined way to handle this?

Enter Sparkdantic, which offers a seamless integration between Pydantic models and PySpark DataFrames. With Sparkdantic, you can define DataFrame schemas using Pydantic models and generate realistic test data based on specifications.

### 2. Creating Schemas and How Sparkdantic Makes It Easy

With PySpark, defining a schema usually involves creating a `StructType` object with a list of `StructField` objects. While this method is powerful, it can become verbose and hard to manage for complex schemas.

Using Sparkdantic, you can leverage Pydantic models to define your DataFrame schema. Pydantic models are Python classes that define data shapes and validation. They are concise, readable, and offer powerful validation capabilities.

```python
from pydantic import BaseModel

class User(BaseModel):
    name: str
    age: int
    email: str
```

With the `SparkModel` class from Sparkdantic, you can easily convert this Pydantic model into a PySpark schema:

```python
from sparkdantic import SparkModel

class UserSparkSchema(SparkModel):
    name: str
    age: int
    email: str

schema = UserSparkSchema.model_spark_schema()
```

This will output a PySpark `StructType` schema, ready to be used in your DataFrames.

```python
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

StructType([
    StructField('name', StringType(), False), 
    StructField('age', IntegerType(), False), 
    StructField('email', StringType(), False)
])
```

### 3. Generating Realistic Fake Data for Unit Tests / Populating a Development Database

Once you have your schema, the next challenge is populating it with realistic data. Sparkdantic provides the `ColumnGenerationSpec` class, which lets you define specifications for generating data for each column.

For instance, if you want the `age` column to have random values between 20 and 50:

```python
from sparkdantic.generation import ColumnGenerationSpec

age_spec = ColumnGenerationSpec(min_value=20, max_value=50, random=True)
```

You may also want a list of names to use for the name column. For this, we can leverage other libraries such as the well known
`faker` library:

```python
from faker import Faker

faker = Faker()

names = [faker.name() for _ in range(1000)]

name_spec = ColumnGenerationSpec(values=names)
```

Using the `generate_data` method of the `SparkModel` in Sparkdantic, you can then generate a DataFrame with the desired number of rows:

```python
spark = SparkSession.builder.appName("demo").getOrCreate()
data = UserSparkSchema.generate_data(spark, n_rows=1000, specs={"age": age_spec, "name": name_spec})
data.show()
```

This will produce a DataFrame with 1000 rows, with the `age` column populated with random values between 20 and 50.

### 4. Conclusion

Defining PySpark DataFrame schemas and generating test data doesn't have to be a cumbersome process. With the integration of Pydantic models and Sparkdantic, you can streamline these tasks, making your development process more efficient and error-free.

Whether you're a data engineer writing unit tests, a data scientist experimenting with data, or a developer populating a development database, Sparkdantic offers a powerful toolset to make your life easier. Give it a try and elevate your PySpark game!