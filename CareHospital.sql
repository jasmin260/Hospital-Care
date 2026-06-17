USE world_schema;
--- Creating a view from the clean data 
---	creating a cte called clean data to extract non-duplicate  data
CREATE VIEW vm_admissionData AS
WITH CleanData AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY `MRD No.`, `D.O.A`, `D.O.D`
               ORDER BY `MRD No.`
           ) AS Dup_NO
    FROM `admission data`
)
SELECT *
FROM CleanData
WHERE Dup_NO = 1
  AND `MRD No.` IS NOT NULL;
  -- Total Discharge
  Select count(*) as tot_discharge From vm_admissionData Where `Outcome` = 'Discharge'
  
  -- Average Daily Discharge Rate 
WITH CT AS (
    SELECT
        SUM(CASE WHEN `Outcome` = 'Discharge' THEN 1 ELSE 0 END) AS tot_discharge,
        SUM(`DURATION OF STAY`) AS tot_stay
    FROM vm_admissionData
)
SELECT
    CAST(
        (CAST(tot_discharge AS DECIMAL(10,2))
         /
         CAST(tot_stay AS DECIMAL(10,2))
        ) * 100
    AS DECIMAL(10,2)) AS avg_daily_discharge
FROM CT;

--- Average length of stay
WITH CT AS (
    SELECT
        SUM(CASE WHEN `Outcome` = 'Discharge' THEN 1 ELSE 0 END) AS tot_discharge,
        SUM(`DURATION OF STAY`) AS tot_stay
    FROM vm_admissionData
)
SELECT
    CAST(
        (CAST(tot_stay AS DECIMAL(10,2))
         /
         CAST(tot_discharge AS DECIMAL(10,2))
        ) * 100
    AS DECIMAL(10,2)) AS avg_len_stay
FROM CT;


--Q4 Distribution of discharges by Age Group
-- <16 Paediatric
-- <65 Adult
-- >= 65 Senior Citizen
SELECT 
	CASE 
		WHEN `AGE` < 16 THEN 'Paediatric'
		WHEN `AGE` < 65 THEN 'Adult'
		WHEN `AGE` >= 65 THEN 'Senior Citizen'
		ELSE 'Unknown'
	END AS Age_Group, COUNT(*) AS Distribution
FROM vm_admissionData
WHERE `OUTCOME` = 'DISCHARGE'
GROUP BY CASE 
		WHEN `AGE` < 16 THEN 'Paediatric'
		WHEN `AGE` < 65 THEN 'Adult'
		WHEN `AGE` >= 65 THEN 'Senior Citizen'
		ELSE 'Unknown'
	END
ORDER BY 2 DESC
-- Distribution of discharges by Gender Discharges 
SELECT `GENDER`, COUNT(*) AS Distribution
FROM vm_admissionData
WHERE `OUTCOME` = 'DISCHARGE'
GROUP BY `GENDER`
ORDER BY 2 DESC

-- Distribution of discharges by day of the week
SELECT
    DAYNAME(STR_TO_DATE(`D.O.D`, '%d/%m/%Y')) AS Day_of_Week,
    COUNT(*) AS Distribution
FROM vm_admissionData
WHERE `Outcome` = 'Discharge'
  AND STR_TO_DATE(`D.O.D`, '%d/%m/%Y') IS NOT NULL
GROUP BY DAYNAME(STR_TO_DATE(`D.O.D`, '%d/%m/%Y'))
ORDER BY COUNT(*) DESC;