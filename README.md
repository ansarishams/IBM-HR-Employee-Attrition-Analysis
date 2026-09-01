# 📊 IBM HR Employee Attrition Analysis

An end-to-end Data Analytics project focused on understanding employee attrition, identifying high-risk employee segments, and generating actionable HR insights using SQL and Power BI.

---

## 📌 Project Overview

Employee attrition is an important HR challenge because high employee turnover can increase recruitment costs, reduce productivity, and affect team stability.

In this project, I analyzed the **IBM HR Analytics Employee Attrition & Performance** dataset to understand:

- How many employees left the organization
- Overall employee attrition rate
- Which departments and job roles have higher attrition
- How overtime is associated with employee attrition
- Whether tenure is associated with higher attrition
- How job satisfaction and work-life balance relate to attrition
- Which age groups show higher attrition
- Which income bands have higher observed attrition
- Which combinations of employee characteristics form higher-attrition segments
- What HR actions could be considered based on the analysis

The project follows a practical analytics workflow:

**Data → SQL Analysis → Data Cleaning → DAX → Power BI Dashboard → Business Insights → HR Recommendations**

---

## 🎯 Business Objective

The main objective of this project is to identify patterns and employee segments associated with higher observed attrition and convert those findings into meaningful business insights.

### Key Business Questions

1. What is the overall employee attrition rate?
2. How many employees have left the organization?
3. Which departments have the highest attrition rate?
4. Which job roles have the highest attrition?
5. Is overtime associated with higher attrition?
6. Which tenure groups have higher attrition?
7. Which age groups show higher attrition?
8. How does business travel relate to attrition?
9. How does job satisfaction relate to attrition?
10. How does environment satisfaction relate to attrition?
11. How does work-life balance relate to attrition?
12. Which income bands show higher attrition?
13. Which job levels show higher attrition?
14. Which marital-status groups show higher attrition?
15. How does relationship satisfaction relate to attrition?
16. How does salary hike relate to attrition?
17. How does years at company relate to attrition?
18. How does years with current manager relate to attrition?
19. How does years since last promotion relate to attrition?
20. How does years in current role relate to attrition?

In addition to these analyses, I performed further SQL-based analysis to explore employee segments and combinations of multiple factors.

---

## 🗂️ Dataset

**Dataset:** IBM HR Analytics Employee Attrition & Performance

**Records:** 1,470 employees

**Target Variable:** Attrition

- `Yes` → Employee left the organization
- `No` → Employee stayed

The dataset contains employee demographic, job, compensation, satisfaction, and work-related attributes.

> **Note:** This is an IBM HR Analytics sample dataset commonly used for analytics practice and portfolio projects. It should not be presented as confidential or actual internal IBM employee data.

---

## 🛠️ Tools & Technologies

### SQL
- PostgreSQL
- SQL aggregations
- `GROUP BY`
- `CASE WHEN`
- Filtering
- Conditional calculations
- Percentage calculations
- Views
- Multi-dimensional analysis

### Power BI
- Power Query
- Data cleaning and transformation
- Data modeling
- DAX
- KPI Cards
- Bar Charts
- Matrix
- Slicers
- Page Navigation
- Dashboard design

### Other
- Excel / CSV for dataset handling
- GitHub for project documentation and portfolio presentation

---

# 🔄 Project Workflow

## 1. Data Preparation

The dataset was first reviewed to understand:

- Available columns
- Data types
- Missing values
- Duplicate records
- Categorical variables
- Numerical variables
- Attrition-related fields

The data was then prepared for SQL analysis and Power BI reporting.

---

## 2. SQL Analysis

I created SQL analyses to answer business questions related to employee attrition.

Some of the major analyses include:

- Total employees
- Total employees who left
- Overall attrition rate
- Attrition by department
- Attrition by job role
- Attrition by age group
- Attrition by business travel
- Attrition by overtime
- Attrition by job satisfaction
- Attrition by environment satisfaction
- Attrition by work-life balance
- Attrition by income band
- Attrition by tenure band
- Attrition by job level
- Attrition by salary hike
- Attrition by relationship satisfaction
- Attrition by years at company
- Attrition by years with current manager
- Attrition by years since last promotion
- Attrition by years in current role

I also performed combined analysis to identify employee segments where multiple factors were associated with higher observed attrition.

---

# 📊 Power BI Dashboard

The final Power BI dashboard contains **4 analytical pages**.

---

## 1️⃣ HR Employee Attrition Overview

This page provides a high-level view of employee attrition.

### KPIs

- Total Employees: **1,470**
- Employees Left: **237**
- Active Employees: **1,233**
- Attrition Rate: **16.12%**
- Average Monthly Income: **6,503**
- Average Tenure: **7.01 Years**

### Main Visuals

- Attrition Rate by Department
- Attrition Rate by Job Role
- Attrition Rate by Age Group
- Attrition Rate by Business Travel

### Slicers

- Gender
- Department
- Job Role
- Overtime

---

## 2️⃣ HR Employee Attrition Drivers

This page focuses on individual factors associated with employee attrition.

### Main Visuals

- Attrition Rate by Overtime
- Attrition Rate by Tenure Band
- Attrition Rate by Work-Life Balance
- Attrition Rate by Job Satisfaction
- Attrition Rate by Environment Satisfaction
- Attrition Rate by Income Band

### Key Purpose

To identify which employee characteristics are associated with comparatively higher observed attrition.

---

## 3️⃣ HR Employee Attrition Risk Segments

This page combines multiple employee attributes to identify higher-attrition segments.

### Main Analysis

- Age Group × Overtime × Job Satisfaction
- Job Level × Income Band
- Department × Job Role
- Job Role × Overtime
- Tenure Band × Overtime
- Job Satisfaction × Overtime

### Key Purpose

Instead of looking at one factor at a time, this page examines how multiple characteristics can overlap within employee segments.

---

## 4️⃣ HR Employee Attrition Insights & Recommendations

The final page converts the analysis into business-oriented insights.

### Includes

- Executive Summary
- Key Business Insights
- High-Attrition Segment Observation
- Important Interpretation
- Recommended HR Actions

This page focuses on the **"So What?"** of the analysis.

---

# 🔍 Key Business Insights

### 1. Overtime is strongly associated with higher attrition

Employees working overtime show an observed attrition rate of **30.53%**, compared with **10.44%** among employees without overtime.

This makes workload and working-hour patterns important areas for HR investigation.

---

### 2. Early-tenure employees show substantially higher attrition

Employees with **0–2 years of tenure** show an observed attrition rate of **29.82%**, compared with **8.13%** among employees with **10+ years** of tenure.

This highlights the importance of early-tenure retention initiatives.

---

### 3. Poor work-life balance is associated with higher attrition

Employees reporting **Bad work-life balance** show an observed attrition rate of **31.25%**.

This suggests that workload, staffing and working-hour patterns should be investigated further.

---

### 4. Low income band shows substantially higher attrition

Employees in the **Low income band** show an observed attrition rate of **28.61%**, compared with **10.43%** in the High income band.

Compensation and career progression can therefore be considered areas for further investigation.

---

### 5. Younger employees show higher observed attrition

Employees under **25 years** show the highest age-group attrition rate at **39.18%**, followed by employees aged **25–34 at 20.22%**.

This highlights the importance of onboarding, mentoring and early-career development.

---

### 6. Sales Representatives have the highest job-role attrition

Sales Representatives show the highest observed job-role attrition rate at **39.76%**.

Workload, sales targets, overtime, compensation and career progression should be investigated for this group.

---

### 7. Low job satisfaction is associated with higher attrition

Employees reporting **Low job satisfaction** show an observed attrition rate of **22.84%**, compared with **11.33%** among employees reporting Very High job satisfaction.

Employee feedback and manager interventions can help investigate potential causes of dissatisfaction.

---

# 💡 Recommended HR Actions

### 1. Overtime Management

Monitor excessive overtime and workload concentration, particularly in high-attrition teams and roles.

### 2. Early-Tenure Retention

Strengthen onboarding, mentoring, manager check-ins and career development during the first two years.

### 3. Satisfaction Improvement

Investigate low job and environment satisfaction through employee feedback and targeted manager interventions.

### 4. Work-Life Balance

Review workload, staffing and working-hour patterns among employees reporting poor work-life balance.

### 5. Compensation & Career Growth

Review compensation competitiveness, salary progression and advancement opportunities for lower-income segments.

### 6. Targeted Retention

Prioritize high-attrition roles and combined employee segments for deeper investigation and targeted retention actions.

---

# 📈 Key Metrics

| Metric | Value |
|---|---:|
| Total Employees | 1,470 |
| Employees Left | 237 |
| Active Employees | 1,233 |
| Overall Attrition Rate | 16.12% |
| Average Monthly Income | 6,503 |
| Average Tenure | 7.01 Years |

---

# 🧠 Analytical Interpretation

The analysis identifies **associations and patterns**, not proven causal relationships.

For example, the higher attrition observed among employees working overtime does not by itself prove that overtime directly causes employees to leave.

Similarly, high attrition percentages should be evaluated alongside the number of employees in each segment before making business decisions.

The dashboard is therefore intended to identify **areas for further HR investigation and decision-making**, rather than claiming direct causation.

---

# 📁 Project Structure

```text
IBM-HR-Employee-Attrition-Analysis/
│
├── Dataset/
│   └── IBM_HR_Analytics.csv
│
├── SQL/
│   ├── 01_employee_attrition_analysis.sql
│   └── SQL_Views.sql
│
├── PowerBI/
│   └── IBM_HR_Employee_Attrition_Dashboard.pbix
│
├── Dashboard/
│   ├── Overview.png
│   ├── Attrition_Drivers.png
│   ├── Risk_Segment.png
│   └── Insights.png
│
└── README.md
