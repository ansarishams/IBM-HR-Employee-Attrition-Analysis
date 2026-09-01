
-- Q1. Total employees

SELECT COUNT(*) AS total_employee
FROM employee_attrition;
--Analysis--- (The total employee is 1470)

----------------------------------------------------------------------------------------------------------------------------

-- Q2. Total Attrition employees

SELECT COUNT(*) AS total_attrition_employee
FROM employee_attrition
WHERE attrition = 'Yes';
--Analysis--- The total employee is 1470 and the employee who left (attrition) is 237

----------------------------------------------------------------------------------------------------------------------------

-- Q3.  Total attrition & Attrition-percentage

SELECT COUNT(*) AS total_attrition_employee,
	CONCAT(ROUND(
		SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) *100.0 
		/ COUNT(*),
	2),'%') AS total_attrition_percentage
FROM employee_attrition;
--Analysis---  The total attrition is 237 , which is 16.12% of total employee

----------------------------------------------------------------------------------------------------------------------------

-- Q4. Age group wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

-- Q5. Gender wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q6. Marrital status wise Attrition
 
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

----------------------------------------------------------------------------------------------------------------------------

--Q7. Education field wise Attrition

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


----------------------------------------------------------------------------------------------------------------------------

-- Q8. Attrition by department

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

----------------------------------------------------------------------------------------------------------------------------

--Q9. Job Role wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q10. Job level wise Attrition


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

----------------------------------------------------------------------------------------------------------------------------

--Q11. Job Involment wise Attrition


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

----------------------------------------------------------------------------------------------------------------------------

-- Q12. Overtime wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

-- Q13. Business travel wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

-- Q14. Work-life balance wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q15. Environment Satisfaction wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

-- Q16. Job satisfaction wise attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q17. Relationship satisfaction wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

-- Q18. Monthly income wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q19. Salry hike wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q20 Stock-Option wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

						--    Experience analysis    --
						
-- Q21. Tenure Band wise attrition

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
		
----------------------------------------------------------------------------------------------------------------------------

--Q22. Year with current manager wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

-- Q23. Years since last promotion wise Attrition

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
-- Analysis--- Employees who have gone 2–3 years since their last promotion show an attrition rate of approximately 17%. 
-- This may warrant further analysis of career progression and promotion opportunities.

----------------------------------------------------------------------------------------------------------------------------

--Q24. Distance from home Band wise Attrition	  

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

----------------------------------------------------------------------------------------------------------------------------

                      -- 20. High-risk segment analysis

--Q25. Overtime + Job satisfaction wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q26. Overtime + low satisfaction + young employees wise Attrition
  
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

----------------------------------------------------------------------------------------------------------------------------

--Q27. Overtime + tenure at company wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q28. Overtime + Job Role wise Attrition

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

----------------------------------------------------------------------------------------------------------------------------

--Q29 Job Level + Income Band wise Attrition

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
-- Analysis--- The Job Level 3–Medium Income segment shows a high observed attrition rate of approximately 50%; 
-- however, the segment size should be checked before treating this as a reliable business priority.

----------------------------------------------------------------------------------------------------------------------------

--30. Department + Job role wise Attrition

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
----------------------------------------------------------------------------------------------------------------------------