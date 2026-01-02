SELECT * FROM covid19_Patient_Diagnosis;

SELECT COUNT(*) AS TOTAL_NO_OF_PATIENTS
FROM covid19_Patient_Diagnosis;


SELECT covid_result, COUNT(*) AS Positive_and_Negative_Count
FROM covid19_Patient_Diagnosis
GROUP BY covid_result;

SELECT 
    comorbidity,
    COUNT(*) AS positive_cases
FROM covid19_Patient_Diagnosis
WHERE covid_result = '1'
GROUP BY comorbidity;

SELECT comorbidity, COUNT(*) AS Negative_case
FROM covid19_Patient_Diagnosis
WHERE covid_result = '0'
GROUP BY comorbidity;


SELECT covid_result, AVG(oxygen_level)
FROM covid19_Patient_Diagnosis
GROUP BY covid_result;

SELECT AVG(body_temperature)
FROM covid19_Patient_Diagnosis;

SELECT AVG(age)
FROM covid19_Patient_Diagnosis;

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN oxygen_level IS NULL THEN 1 ELSE 0 END) AS missing_oxygen,
    SUM(CASE WHEN comorbidity IS NULL THEN 1 ELSE 0 END) AS missing_comordity
FROM covid19_Patient_Diagnosis;

SELECT 
    COUNT(*) AS total_patients,
    SUM(CASE WHEN covid_result = '1' THEN 1 ELSE 0 END) AS positive_cases
FROM covid19_Patient_Diagnosis;

SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN covid_result = '0' THEN 1 ELSE 0 END) / COUNT(*), 
    2) AS positivity_rate
FROM covid19_Patient_Diagnosis;

SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN covid_result = '1' THEN 1 ELSE 0 END) / COUNT(*), 
    2) AS positivity_rate,
     ROUND(
        100.0 * SUM(CASE WHEN covid_result = '0' THEN 1 ELSE 0 END) / COUNT(*), 
    2) AS negativity_rate
FROM covid19_Patient_Diagnosis;

SELECT gender, COUNT(*) AS positive_cases
FROM covid19_Patient_Diagnosis
WHERE covid_result = '1'
GROUP BY gender;

SELECT 
    CASE 
        WHEN age < 20 THEN '0-19'
        WHEN age BETWEEN 20 AND 39 THEN '20-39'
        WHEN age BETWEEN 40 AND 59 THEN '40-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS positive_cases
FROM covid19_Patient_Diagnosis
WHERE covid_result = '1'
GROUP BY 
    CASE 
        WHEN age < 20 THEN '0-19'
        WHEN age BETWEEN 20 AND 39 THEN '20-39'
        WHEN age BETWEEN 40 AND 59 THEN '40-59'
        ELSE '60+'
    END
ORDER BY positive_cases DESC;


SELECT 
    'Fever' AS symptom, COUNT(*) AS count_positive
FROM covid19_Patient_Diagnosis
WHERE fever = '1' AND covid_result = '1'
UNION ALL
SELECT 'Dry Cough', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE dry_cough = '1' AND covid_result = '1'
UNION ALL
SELECT 'Loss of Smell', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE loss_of_smell = '1' AND covid_result = '1'
UNION ALL
SELECT 'Soar Throat', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE dry_cough = '1' AND covid_result = '1'
UNION ALL
SELECT 'Fatigue', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE fatigue = '1' AND covid_result = '1'
UNION ALL
SELECT 'Headache', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE headache = '1' AND covid_result = '1'
UNION ALL
SELECT 'Shortness of Breath', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE shortness_of_breath = '1' AND covid_result = '1'
UNION ALL
SELECT 'Loss of Smell', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE loss_of_smell = '1' AND covid_result = '1'
UNION ALL
SELECT 'Loss of Taste', COUNT(*)
FROM covid19_Patient_Diagnosis
WHERE loss_of_taste = '1' AND covid_result = '1';


SELECT 
    travel_history,
    contact_with_patient,
    COUNT(*) AS positive_cases
FROM covid19_Patient_Diagnosis
WHERE covid_result = '1'
GROUP BY travel_history, contact_with_patient;
