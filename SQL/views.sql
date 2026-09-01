CREATE OR REPLACE VIEW vw_hr_employee_analytics AS

SELECT
    employee_number,
    
    age,
    gender,
    marital_status,
    education,
    education_field,

    department,
    job_role,
    job_level,
    job_involvement,

    business_travel,
    overtime,

    monthly_income,
    percent_salary_hike,
    stock_option_level,

    job_satisfaction,
    environment_satisfaction,
    relationship_satisfaction,
    work_life_balance,

    distance_from_home,
    years_at_company,
    years_with_curr_manager,
    years_since_last_promotion,

    total_working_years,
    years_in_current_role,
    num_companies_worked,
    training_times_last_year,

    attrition,

    /* Age Band */
    CASE
        WHEN age < 25 THEN '<25'
        WHEN age <= 34 THEN '25-34'
        WHEN age <= 44 THEN '35-44'
        WHEN age <= 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,

    /* Income Band */
    CASE
        WHEN monthly_income < 3000 THEN 'Low'
        WHEN monthly_income < 6000 THEN 'Medium'
        ELSE 'High'
    END AS income_band,

    /* Salary Hike Band */
    CASE
        WHEN percent_salary_hike <= 11 THEN '<=11%'
        WHEN percent_salary_hike BETWEEN 12 AND 15 THEN '12-15%'
        WHEN percent_salary_hike BETWEEN 16 AND 20 THEN '16-20%'
        ELSE '20+%'
    END AS salary_hike_band,

    /* Tenure Band */
    CASE
        WHEN years_at_company <= 2 THEN '0-2 Years'
        WHEN years_at_company <= 5 THEN '3-5 Years'
        WHEN years_at_company <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS tenure_band,

    /* Manager Tenure Band */
    CASE
        WHEN years_with_curr_manager < 2 THEN '0-1 Year'
        WHEN years_with_curr_manager < 6 THEN '2-5 Years'
        WHEN years_with_curr_manager < 11 THEN '6-10 Years'
        WHEN years_with_curr_manager < 14 THEN '10-13 Years'
        ELSE '14+ Years'
    END AS manager_tenure_band,

    /* Promotion Gap */
    CASE
        WHEN years_since_last_promotion <= 1 THEN '0-1 Year'
        WHEN years_since_last_promotion <= 3 THEN '2-3 Years'
        WHEN years_since_last_promotion <= 5 THEN '4-5 Years'
        ELSE '5+ Years'
    END AS promotion_gap_band,

    /* Distance Band */
    CASE
        WHEN distance_from_home <= 5 THEN '1-5'
        WHEN distance_from_home <= 10 THEN '6-10'
        WHEN distance_from_home <= 15 THEN '11-15'
        WHEN distance_from_home <= 20 THEN '16-20'
        WHEN distance_from_home <= 25 THEN '21-25'
        ELSE '25+'
    END AS distance_band,

    /* Job Involvement Label */
    CASE
        WHEN job_involvement = 1 THEN 'Low'
        WHEN job_involvement = 2 THEN 'Medium'
        WHEN job_involvement = 3 THEN 'High'
        ELSE 'Very High'
    END AS job_involvement_label,

    /* Job Satisfaction Label */
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        ELSE 'Very High'
    END AS job_satisfaction_label,

    /* Environment Satisfaction Label */
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        ELSE 'Very High'
    END AS environment_satisfaction_label,

    /* Relationship Satisfaction Label */
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        ELSE 'Very High'
    END AS relationship_satisfaction_label,

    /* Work Life Balance Label */
    CASE
        WHEN work_life_balance = 1 THEN 'Bad'
        WHEN work_life_balance = 2 THEN 'Good'
        WHEN work_life_balance = 3 THEN 'Better'
        ELSE 'Best'
    END AS work_life_balance_label

FROM employee_attrition;





CREATE OR REPLACE VIEW vw_hr_risk_segments AS

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

    CASE
        WHEN years_at_company <= 2 THEN '0-2 Years'
        WHEN years_at_company <= 5 THEN '3-5 Years'
        WHEN years_at_company <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS tenure_band,

    job_role,
    department,
    job_level,

    CASE
        WHEN monthly_income < 3000 THEN 'Low'
        WHEN monthly_income < 6000 THEN 'Medium'
        ELSE 'High'
    END AS income_band,

    COUNT(*) AS employees,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attrition_rate

FROM employee_attrition

GROUP BY
    overtime,
    job_satisfaction,
    age_group,
    tenure_band,
    job_role,
    department,
    job_level,
    income_band;







SELECT * FROM vw_hr_risk_segments
SELECT * FROM vw_hr_employee_analytics