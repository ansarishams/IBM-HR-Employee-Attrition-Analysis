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


 ### Q1. Total employees
 
```sql
SELECT COUNT(*) AS total_employee
FROM employee_attrition;
--Analysis--- (The total employee is 1470)
```
----------------------------------------------------------------------------------------------------------------------------

### Q2. Total Attrition employees

```sql
SELECT COUNT(*) AS total_attrition_employee
FROM employee_attrition
WHERE attrition = 'Yes';
--Analysis--- The total employee is 1470 and the employee who left (attrition) is 237
```
----------------------------------------------------------------------------------------------------------------------------

### Q3.  Total attrition & Attrition-percentage

```sql
SELECT COUNT(*) AS total_attrition_employee,
	CONCAT(ROUND(
		SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 
		/ COUNT(*),
	2),'%') AS total_attrition_percentage
FROM employee_attrition;
--Analysis---  The total attrition is 237 , which is 16.12% of total employee
```
----------------------------------------------------------------------------------------------------------------------------

### Q4. Age group wise Attrition

```sql
SELECT
    CASE
        WHEN age < 25 THEN '<25'
        WHEN age <= 34 THEN '25-34'
        WHEN age <= 44 THEN '35-44'
        WHEN age <= 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS employees,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employee_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY age_group
ORDER BY age_group;
--Analysis--- Total attrition of the Age less than 25 is arorund 40% of their total employee which the highest attrition rate ,
--and age 25-34 the attrition rate is around 20% of their employee.
--business advice -- (You should do something on young age employee, specially less than 25 age , or yu can go for <30)
```
----------------------------------------------------------------------------------------------------------------------------

#### Q5. Gender wise Attrition

```sql
SELECT
    gender,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY gender;
--Analysis--- Male employees have an attrition rate approximately 3 percentage points higher than female employees. 
	-- The difference is relatively modest compared with some other segments in the dataset.
```
----------------------------------------------------------------------------------------------------------------------------

### Q6. Marrital status wise Attrition

```sql
SELECT
    marital_status,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY marital_status
ORDER BY attrition_rate DESC;
-- Analysis--- Attrition rate of single person who not married is the highest 
	-- (about 25.33% of their total employee) which is the 1/4 of the their total employee.
```
----------------------------------------------------------------------------------------------------------------------------

### Q7. Education field wise Attrition

```sql
SELECT
    education_field,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY education_field
ORDER BY attrition_rate DESC;
--Analysis--- Both Human Resources & Technical Degree share similar attrition rate which is
	-- (both share 25%-25%)of their total employee

```
----------------------------------------------------------------------------------------------------------------------------

### Q8. Attrition by department

```sql
SELECT
    department,
    COUNT(*) AS employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY department
ORDER BY attrition_rate DESC;
-- Analysis--- Sales & HR Department share approximately attrition rate around 20% each of their total employee.
```
----------------------------------------------------------------------------------------------------------------------------

### Q9. Job Role wise Attrition

```sql
SELECT
    job_role,
    COUNT(*) AS employees,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employee_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY job_role
ORDER BY attrition_rate DESC;
-- Analysis--- Sales Representative aquire around 40% attrition rate of their total employee 
-- and need a priority segment for further investigation.
```
----------------------------------------------------------------------------------------------------------------------------

### Q10. Job level wise Attrition

```sql
SELECT
    job_level,
    COUNT(*) AS employees,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employee_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY job_level
ORDER BY attrition_rate DESC;
-- Analysis--- level 1 is the highest attrition rate of 26.35% of their total employee
```
----------------------------------------------------------------------------------------------------------------------------

### Q11. Job Involment wise Attrition

```sql
SELECT
	CASE 
		WHEN job_involvement = 1 THEN 'Low'
		WHEN job_involvement = 2 THEN 'Medium'
		WHEN job_involvement = 3 THEN 'High'
		ELSE 'Very High'
	END AS job_involvement,
    COUNT(*) AS employees,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employee_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY job_involvement
ORDER BY attrition_rate DESC;
-- Analysis--- Attrition rate of low job involvement is very high , around 34% of their total employee
```
----------------------------------------------------------------------------------------------------------------------------

### Q12. Overtime wise Attrition

```sql
SELECT
    overtime,
    COUNT(*) AS employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY overtime;
-- Analysis--- Who worked with overtime ,they have more than 30% 
-- and who don't have overtime they have only 10% of their total employee.
```
----------------------------------------------------------------------------------------------------------------------------

-- Q13. Business travel wise Attrition

```sql
SELECT
    business_travel,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY business_travel
ORDER BY attrition_rate DESC;
-- Analysis--- Who travel most , they have around 25% attrition rate of their total employee and 
	-- who rarely (about 15% of their total employee) who don't(nearly 8% of their total employee)
```
----------------------------------------------------------------------------------------------------------------------------

### Q14. Work-life balance wise Attrition

```sql
SELECT
	CASE 
		WHEN work_life_balance = 1 THEN 'Bad'
		WHEN work_life_balance = 2 THEN 'Good'
		WHEN work_life_balance = 3 THEN 'Better'
		ELSE 'Best'
	END AS work_life_balance,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY work_life_balance
ORDER BY attrition_rate DESC;
-- Analysis--- who has bad work life balance ,they have around 32% attrition rate of their total employee, 
-- and who have better work life balance they
	-- have low attrition rate (14% of their total employee) and most employee in this category
```
----------------------------------------------------------------------------------------------------------------------------

### Q15. Environment Satisfaction wise Attrition

```sql
SELECT
	CASE 
		WHEN environment_satisfaction = 1 THEN 'Low'
		WHEN environment_satisfaction = 2 THEN 'Medium'
		WHEN environment_satisfaction = 3 THEN 'High'
		ELSE 'Very High'
	END AS environment_satisfaction,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY environment_satisfaction
ORDER BY attrition_rate DESC;
-- Analysis--- Low environment satisfactions employees left the company most which is 25.35% of their total employee
```
----------------------------------------------------------------------------------------------------------------------------

### Q16. Job satisfaction wise attrition

```sql
SELECT
	CASE 
		WHEN job_satisfaction = 1 THEN 'Low'
		WHEN job_satisfaction = 2 THEN 'Medium'
		WHEN job_satisfaction = 3 THEN 'High'
		ELSE 'Very High'
	END AS job_satisfaction,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY job_satisfaction
ORDER BY attrition_rate DESC;
-- Analysis--- Low job satisfactions employees left the company most which is 23% of their total employee
```
----------------------------------------------------------------------------------------------------------------------------

### Q17. Relationship satisfaction wise Attrition

```sql
SELECT
	CASE 
		WHEN relationship_satisfaction = 1 THEN 'Low'
		WHEN relationship_satisfaction = 2 THEN 'Medium'
		WHEN relationship_satisfaction = 3 THEN 'High'
		ELSE 'Very High'
	END AS relationship_satisfaction,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY relationship_satisfaction
ORDER BY attrition_rate DESC;
-- Analysis--- Comparing to others Low relationship satisfactions employees left the company most which is 21% of their total employee
```
----------------------------------------------------------------------------------------------------------------------------

### Q18. Monthly income wise Attrition

```sql
SELECT
    CASE
        WHEN monthly_income < 3000 THEN 'Low'
        WHEN monthly_income < 6000 THEN 'Medium'
        ELSE 'High'
    END AS salary_band,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY salary_band
ORDER BY attrition_rate DESC;
-- Analysis--- Employees earning below 3,000 have the highest attrition rate at approximately 29%, 
-- suggesting that lower-income employees are an important segment for further compensation and retention analysis.
```
----------------------------------------------------------------------------------------------------------------------------

### Q19. Salry hike wise Attrition

```sql
SELECT
	CASE
        WHEN percent_salary_hike <12 THEN '<11%'
        WHEN percent_salary_hike BETWEEN 12 AND 15  THEN '12-15%'
        WHEN percent_salary_hike  BETWEEN 16 AND 20 THEN '16-20%'
        ELSE '20+ %'
    END AS salary_percent_hike,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY salary_percent_hike
ORDER BY attrition_rate DESC;
-- Analysis--- Comparing to others (<11%) salary-hike employees attrition rate is most which is around 20% of their total employee
```
----------------------------------------------------------------------------------------------------------------------------

### Q20 Stock-Option wise Attrition

```sql
SELECT
	stock_option_level,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY stock_option_level
ORDER BY stock_option_level ;
-- Analysis--- who don't have any stock level (0) they have highest attrition rate around 25% of their total employee
	-- and who are at 3rd stock-level are the 2nd highest attrtion rate (18% of their total employee) but have very low employee
````
----------------------------------------------------------------------------------------------------------------------------

						--    Experience analysis    --
						
### Q21. Tenure Band wise attrition

```sql
SELECT
    CASE
        WHEN years_at_company <= 2 THEN '0-2 Years'
        WHEN years_at_company <= 5 THEN '3-5 Years'
        WHEN years_at_company <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS tenure_at_company,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY tenure_at_company
ORDER BY attrition_rate DESC;
-- Analysis--- Comparing to others who have joined the company in last 2 years they have highest 
-- attrition rate around 30% of their total employee and attrition rate is very good in experienced category(10+years) 
```		
----------------------------------------------------------------------------------------------------------------------------

### Q22. Year with current manager wise Attrition

```sql
SELECT
    CASE
        WHEN years_with_curr_manager <2 THEN '0-1 Year'
        WHEN years_with_curr_manager <6 THEN '2-5 Years'
        WHEN years_with_curr_manager <11 THEN '6-10 Years'
		WHEN years_with_curr_manager <14 THEN '10-13 Years'
        ELSE '14+ Years'
    END AS years_gap_with_manager,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY years_gap_with_manager
ORDER BY attrition_rate DESC;
-- Analysis--- who worked with their manager from last 1 years ,they have highest attrition rate around 29% of their 
-- total employee while employees with longer manager tenure show much lower attrition. 
-- This relationship should be investigated alongside job satisfaction and tenure.
```
----------------------------------------------------------------------------------------------------------------------------

### Q23. Years since last promotion wise Attrition

```sql
SELECT
    CASE
        WHEN years_since_last_promotion <= 1 THEN '0-1 Year'
        WHEN years_since_last_promotion <= 3 THEN '2-3 Years'
        WHEN years_since_last_promotion <= 5 THEN '4-5 Years'
        ELSE '5+ Years'
    END AS promotion_gap,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY promotion_gap
ORDER BY attrition_rate DESC;
-- Analysis--- Employees who have gone 2â€“3 years since their last promotion show an attrition rate of approximately 17%. 
-- This may warrant further analysis of career progression and promotion opportunities.
```
----------------------------------------------------------------------------------------------------------------------------

### Q24. Distance from home Band wise Attrition	  

```sql
SELECT
	CASE
        WHEN distance_from_home <= 5 THEN '1-5 KM'
        WHEN distance_from_home BETWEEN 6 AND 10  THEN '6-10 KM'
        WHEN distance_from_home  BETWEEN 11 AND 15 THEN '11-15 KM'
		WHEN distance_from_home  BETWEEN 16 AND 20 THEN '16-20 KM'
		WHEN distance_from_home  BETWEEN 21 AND 25 THEN '21-25 KM'
        ELSE '25+ KM'
    END AS company_from_home_distance,
    COUNT(*) AS employees,
	SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employee_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY company_from_home_distance
ORDER BY company_from_home_distance;
-- Analysis---Employees living farther from the workplace show relatively high attrition rates, 
-- particularly in the higher-distance segments. HR could investigate commuting burden and evaluate whether 
-- transportation support would be beneficial.
```
----------------------------------------------------------------------------------------------------------------------------

                      -- 20. High-risk segment analysis

### Q25. Overtime + Job satisfaction wise Attrition

```sql
SELECT
    overtime,
    CASE 
		WHEN job_satisfaction = 1 THEN 'Low'
		WHEN job_satisfaction = 2 THEN 'Medium'
		WHEN job_satisfaction = 3 THEN 'High'
		ELSE 'Very High'
	END AS job_satisfaction,
    COUNT(*) AS employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY overtime, job_satisfaction
ORDER BY attrition_rate DESC;
-- Analysis--- which employee have overtime and all job saticsfaction level, they have the attrition rate 
	-- more than 34% of their total employee except very high job satisfaction + overtime (22% of their total employee)
```
----------------------------------------------------------------------------------------------------------------------------

### Q26. Overtime + low satisfaction + young employees wise Attrition

```sql
SELECT
    overtime,
    CASE 
		WHEN job_satisfaction = 1 THEN 'Low'
		WHEN job_satisfaction = 2 THEN 'Medium'
		WHEN job_satisfaction = 3 THEN 'High'
		ELSE 'Very High'
	END AS job_satisfaction,
    CASE
        WHEN age < 30 THEN '<30'
        ELSE '30+'
    END AS age_group,
    COUNT(*) AS employees,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY
    overtime,
    job_satisfaction,
    CASE
        WHEN age < 30 THEN '<30'
        ELSE '30+'
    END
ORDER BY attrition_rate DESC;
-- Analysis--- whoes age is <30 and do overtime and also didn't satisfy from his jo (low satisfaction) have the most 
		-- attrition rate around 65% of their total employee which 3/4 of their total employee. 
		-- 2nd most is medium job-satisfaction + overtime + <30 (53% of their total employee)
```
----------------------------------------------------------------------------------------------------------------------------

### Q27. Overtime + tenure at company wise Attrition

```sql
SELECT
    overtime,
    CASE
        WHEN years_at_company <= 2 THEN '0-2 Years'
        WHEN years_at_company <= 5 THEN '3-5 Years'
        WHEN years_at_company <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS tenure_at_company,
    COUNT(*) AS employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY overtime, tenure_at_company
ORDER BY overtime DESC ;
-- Analysis--- who joined the company since last 2 years and have overtime have the most 
		-- attrition rate around 51% of their total employee. 
```
----------------------------------------------------------------------------------------------------------------------------

### Q28. Overtime + Job Role wise Attrition

```sql
SELECT
    overtime,
    job_role,
    COUNT(*) AS employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY overtime, job_role
ORDER BY attrition_rate DESC ;
-- Analysis--- who worked as a sales representative and have overtime have the most 
-- attrition rate around 66% of their total employee. 2nd most is Laboratory Technician + overtime(50% of their total employee)
```
----------------------------------------------------------------------------------------------------------------------------

### Q29 Job Level + Income Band wise Attrition

```sql
SELECT
    job_level,
     CASE
        WHEN monthly_income < 3000 THEN 'Low'
        WHEN monthly_income < 6000 THEN 'Medium'
        ELSE 'High'
    END AS salary_band,
    COUNT(*) AS employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY salary_band, job_level
ORDER BY attrition_rate DESC;
-- Analysis--- The Job Level 3â€“Medium Income segment shows a high observed attrition rate of approximately 50%; 
-- however, the segment size should be checked before treating this as a reliable business priority.
```
----------------------------------------------------------------------------------------------------------------------------

### 30. Department + Job role wise Attrition

```sql
SELECT
    department,
    job_role,
    COUNT(*) AS employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY department, job_role
ORDER BY attrition_rate DESC ;
-- Analysis--- Sales Representatives within the Sales department show approximately 40% attrition, 
-- making this a notable department-role combination for further investigation. The HR Manager segment shows 0% observed
-- attrition, but its employee count should be considered before interpreting this as evidence of a best-performing segment.
```
----------------------------------------------------------------------------------------------------------------------------

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
