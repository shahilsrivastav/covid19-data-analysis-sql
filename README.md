# 📊 COVID-19 Data Analysis using SQL

## 📌 Overview
This project analyzes COVID-19 data using SQL to identify trends in cases, deaths, and vaccinations across countries and over time.

The dataset was cleaned and transformed before performing analysis to ensure accurate and meaningful insights.

---

## 📸 Project Preview

### 🌍 Global Trends
![Global Stats](screenshots/global_stats.png)

### 🌎 Country Analysis
![Country Analysis](screenshots/country_analysis.png)

### 💉 Vaccination Progress
![Vaccination](screenshots/vaccination_progress.png)

---

## 🛠 Tools & Technologies
- SQL (MySQL)
- Excel (for initial data handling)
- GitHub (for version control)

---

## 📂 Dataset
- COVID Deaths dataset  
- COVID Vaccinations dataset  

---

## ⚙️ Data Cleaning
- Handled missing values using `NULLIF` and `TRIM`
- Converted data types (VARCHAR → DATE, DOUBLE, BIGINT)
- Resolved import issues using VARCHAR-first approach

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
├── data/
│   ├── covid_deaths.csv
│   └── covid_vaccinations.csv
│
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_analysis_queries.sql
│   └── 03_views.sql
│
├── screenshots/
│
└── README.md
```

---

## ▶️ How to Run

1. Create a database in MySQL  
2. Run `01_data_cleaning.sql`  
3. Run `02_analysis_queries.sql`  
4. Run `03_views.sql`  

---

## 🚀 Key Learnings
- Handling real-world messy data  
- Writing optimized SQL queries  
- Using advanced SQL features like window functions and CTE  
- Designing reusable views  

---

## 📊 Future Improvements
- Build an interactive dashboard using Power BI  

---

## 👤 Author
Shahil Srivastav
