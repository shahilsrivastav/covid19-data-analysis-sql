# 📊 COVID-19 Data Analysis using SQL

## 📌 Overview
This project analyzes COVID-19 data using SQL to identify trends in cases, deaths, and vaccinations across countries and over time.

The dataset was cleaned and transformed before performing analysis to ensure accurate and meaningful insights.

---

## 🛠 Tools & Technologies
- SQL (MySQL)
- Excel (for initial data handling)
- GitHub (for version control)

---

## 📂 Dataset
The project uses publicly available COVID-19 datasets:
- Covid Deaths
- Covid Vaccinations

---

## ⚙️ Data Cleaning
- Handled missing and null values using SQL
- Converted data types (VARCHAR → DATE, DOUBLE, BIGINT)
- Trimmed inconsistent values
- Managed data import issues by initially storing columns as VARCHAR

---

## 🔍 Key Analysis Performed

### 🌍 Global Analysis
- Total cases and deaths over time
- Daily death percentage

### 🌎 Country-Level Analysis
- Infection rate compared to population
- Highest death count by country

### 🌐 Continent-Level Analysis
- Total deaths by continent

### 💉 Vaccination Analysis
- Rolling vaccination count using window functions
- Percentage of population vaccinated

### 🇮🇳 India-Specific Analysis
- COVID case vs death trends
- Vaccination progress over time

---

## 🧠 SQL Concepts Used
- Aggregate Functions (SUM, MAX)
- Joins
- Window Functions
- Common Table Expressions (CTE)
- Views for reusable queries
- Data Cleaning techniques

---

## 📁 Project Structure

```
covid19-data-analysis-sql/
│
├── data/                                    # Raw datasets
│   ├── covid_deaths.csv
│   └── covid_vaccinations.csv
│
├── sql/                                     # SQL scripts
│   ├── 01_data_cleaning_covid19_data.sql    # Data cleaning & preprocessing
│   ├── 02_analysis_queries_covid19_data.sql # Exploratory analysis queries
│   └── 03_views_covid19_data.sql            # Reusable SQL views
│
└── README.md                                # Project documentation
```

---

## 🚀 Key Learnings
- Handling real-world messy data
- Writing optimized and structured SQL queries
- Using advanced SQL features like window functions and CTE
- Designing reusable views for analysis

---

## 📌 Conclusion
This project demonstrates how SQL can be used to extract insights from real-world datasets, helping understand pandemic trends and vaccination progress.

---

## 👤 Author
Shahil srivastav
