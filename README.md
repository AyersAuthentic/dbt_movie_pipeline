# Portfolio Project: End-to-End Data Pipeline & Analytics for MovieLens Data

This repository showcases a complete data engineering project that builds and manages an automated ELT pipeline using dbt, Snowflake, and AWS S3. The project demonstrates a robust, scalable, and well-documented approach to transforming raw data into analytics-ready datasets.

## Project Overview

This project simulates a real-world data analytics scenario for a movie streaming service. Using the extensive MovieLens dataset, I engineered a pipeline that extracts raw data, loads it into a cloud data warehouse, and executes a series of transformations to produce clean, reliable, and insightful data models. The final output is a set of fact and dimension tables that can be easily consumed by business intelligence tools for in-depth analysis of movie ratings, user behavior, and content tagging.

The primary goal was to showcase mastery of modern data stack tools and ELT best practices, with a strong emphasis on data quality, documentation, and version control.

## Architecture & Data Flow

The pipeline follows a modern ELT (Extract, Load, Transform) architecture, ensuring a clear separation of concerns and maximizing the power of the cloud data warehouse.

*A simplified representation of the data flow from source to analytics-ready models.*

1.  **Data Ingestion (Extract & Load)**: Raw CSV files from the MovieLens dataset are uploaded to an **AWS S3** bucket, which serves as our data lake's landing zone.
2.  **Data Warehouse Loading**: The data is then loaded into **Snowflake**, our cloud data warehouse. This raw data is kept in a dedicated schema to preserve the original source of truth.
3.  **Transformation (Transform)**: **dbt** connects directly to Snowflake to run a series of SQL-based models. These models clean, join, and aggregate the raw data, building it into a logical, multi-layered data warehouse with staging, intermediate, and final presentation models (facts and dimensions).

## Key Features & Technical Highlights

This project demonstrates proficiency in a wide range of data engineering and dbt concepts:

  * **Advanced Data Modeling**: Designed and implemented a scalable data model with clear distinctions between staging layers, dimension tables (`dim_movies`, `dim_users`), and fact tables (`fct_ratings`).
  * **Slowly Changing Dimensions (SCD Type 2)**: Utilized **dbt snapshots** to track the history of changes in mutable source data, preserving a complete historical record.
  * **Data Quality Assurance**: Implemented a robust testing suite with over 20 custom and generic tests (e.g., `unique`, `not_null`, `relationship`) to ensure data integrity, accuracy, and reliability.
  * **Automated Data Documentation**: Leveraged **dbt's documentation features** to auto-generate a complete project website. This site includes descriptions for every model and column, as well as a dynamic data lineage graph that visualizes the entire data flow.
  * **Modular & Reusable Code**: Developed custom **dbt macros** to encapsulate complex business logic, promoting DRY (Don't Repeat Yourself) principles and improving code maintainability.
  * **Performance Optimization**: Strategically applied different dbt materializations (`view`, `table`, `incremental`) to optimize query performance and reduce computational costs in the data warehouse.
  * **Package Management**: Integrated the `dbt-utils` package to leverage community-built macros, such as the generation of surrogate keys.

## Technologies and Tools

  * **Transformation & Modeling**: dbt (data build tool)
  * **Data Warehouse**: Snowflake
  * **Data Lake / Storage**: AWS S3
  * **Code Editor**: Visual Studio Code
  * **Language**: SQL

## How to Explore the Code

This repository is structured as a standard dbt project.

  * `models/`: Contains all the SQL-based data transformations, organized into staging, intermediate, and marts directories.
  * `tests/`: Includes custom SQL-based data tests.
  * `snapshots/`: Contains the configuration for the Slowly Changing Dimension tracking.
  * `macros/`: Holds custom macros used throughout the project.
  * `dbt_project.yml`: The main configuration file for the dbt project.

