# 🦠Covid-19-India-SQL-Analysis
## 📌 Project Overview
This project performs a structured SQL-based analysis of COVID-19 spread and vaccination progress across all 36 Indian states and union territories using PostgreSQL. The goal was to design a relational database schema, load real-world data, and extract meaningful insights through analytical SQL queries — covering case distribution, death rates, recovery patterns, and vaccination coverage. 

## Datasets
[SQL Project](https://github.com/taniya528/Covid-19-India-SQL-Analysis/blob/main/Covid%2019%20SQL%20analysis%20project.sql)
[Download CSV Files](https://github.com/taniya528/Covid-19-India-SQL-Analysis/blob/main/Latest%20Covid-19%20India%20Status.csv)
[Download CSV File2](https://github.com/taniya528/Covid-19-India-SQL-Analysis/blob/main/COVID-19%20India%20Statewise%20Vaccine%20Data.csv)

## 🛠️ Tools & Technologies
Tool        -  Purpose
PostgreSQL  - Relational database design and data storage
SQL         -  Data querying and analysis
pgAdmin     -  4Database management and query execution 
Excel/CSV   - Raw data source and preprocessing

## 💡 Key Insights

1. Maharashtra, Kerala, and Karnataka were the top 3 most affected states by total case count.
2. Recovery rate across most states was above 95% — indicating effective medical response nationwide.
3. States with higher vaccination coverage showed comparatively lower active case percentages, suggesting vaccination effectiveness.
4. Dose 1 completion was significantly higher than Dose 2 across almost all states — highlighting a gap in full vaccination coverage.
5. Some smaller states and UTs showed vaccination doses higher than their recorded population — likely due to migrant worker vaccinations being counted locally.
6. Low recovery rate states (below 95%) were flagged using WHERE filters — these states required more focused healthcare attention.
7. Active case percentage varied significantly across states — with some densely populated states carrying disproportionately high active burdens.

## 🚀 How to Run

1. Install PostgreSQL and open pgAdmin 4
2. Create a new database: covid_analysis
3. Open Query Tool and run covid19_india_analysis.sql
4. Data will be inserted and all 8 queries can be executed one by one
5. View results directly in pgAdmin query output

## 👩‍💻 Author
## Taniya Sahu

📧 taniyasahu528ks@gmail.com
🔗 [LinkedIn](https://www.linkedin.com/in/taniya-sahu-abc1610155/)
💻 [GitHub](https://github.com/taniya528)

## 📌 Skills Demonstrated
SQL, PostgreSQL, Relational Database Design, Data Analysis, JOINs, Aggregations, Subqueries  Data Cleaning, Analytical Thinking.
