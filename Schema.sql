SELECT *
FROM mental_health_and_technology_usage_2024;

#Distribution of Age
SELECT Age, COUNT(*) AS Freq
FROM mental_health_and_technology_usage_2024
GROUP BY Age
ORDER BY Age;

#Distribution of Gender
SELECT Gender, COUNT(*) AS Freq
FROM mental_health_and_technology_usage_2024
GROUP BY Gender
ORDER BY Freq;

#Distribution of Mental Health Status
SELECT Mental_Health_Status, COUNT(*) AS Freq
FROM mental_health_and_technology_usage_2024
GROUP BY Mental_Health_Status
ORDER BY Freq DESC;

#Distribution of Stress Levels
SELECT Stress_Level, COUNT(*) AS Freq
FROM mental_health_and_technology_usage_2024
GROUP BY Stress_Level
ORDER BY Freq DESC;

#Average Sleep Hours by Stress Level
SELECT Stress_Level, AVG(Sleep_Hours) AS Avg_Sleep_Hours
FROM mental_health_and_technology_usage_2024
GROUP BY Stress_Level
ORDER BY Avg_Sleep_Hours DESC;

#Correlation between Technology Usage and Sleep Hours
SELECT 
	AVG(Technology_Usage_Hours) AS Avg_Tech_Usage,
    AVG(Sleep_Hours) AS Avg_Sleep
FROM mental_health_and_technology_usage_2024;

#Technology Usage by Mental Health Status
SELECT 
	Mental_Health_Status,
    AVG(Technology_Usage_Hours) AS Avg_Tech_Usage,
    AVG(Social_Media_Usage_Hours) AS Avg_Social_Media_Usage
FROM mental_health_and_technology_usage_2024
GROUP BY Mental_Health_Status
ORDER BY Avg_Tech_Usage DESC;

#Stress Levels and Physical Activity Hours
SELECT Stress_Level,
       AVG(Physical_Activity_Hours) AS Avg_Physical_Activity
FROM mental_health_and_technology_usage_2024
GROUP BY Stress_Level
ORDER BY Avg_Physical_Activity DESC;

#Technology Usage by Age Group
SELECT CASE 
           WHEN Age BETWEEN 18 AND 25 THEN '18-25'
           WHEN Age BETWEEN 26 AND 35 THEN '26-35'
           WHEN Age BETWEEN 36 AND 45 THEN '36-45'
           ELSE '46+' 
       END AS Age_Group,
       AVG(Technology_Usage_Hours) AS Avg_Tech_Usage,
       AVG(Gaming_Hours) AS Avg_Gaming_Hours
FROM mental_health_and_technology_usage_2024
GROUP BY Age_Group
ORDER BY Age_Group;

#Mental Health by Gender
SELECT Gender, 
       Mental_Health_Status,
       COUNT(*) AS Count
FROM mental_health_and_technology_usage_2024
GROUP BY Gender, Mental_Health_Status
ORDER BY Gender, Count DESC;

#Impact of Work Environment on Mental Health
SELECT Work_Environment_Impact,
       Mental_Health_Status,
       COUNT(*) AS Count
FROM mental_health_and_technology_usage_2024
GROUP BY Work_Environment_Impact, Mental_Health_Status
ORDER BY Work_Environment_Impact, Count DESC;

#Support System Access and Stress Level
SELECT Support_Systems_Access,
       Stress_Level,
       COUNT(*) AS Count
FROM mental_health_and_technology_usage_2024
GROUP BY Support_Systems_Access, Stress_Level
ORDER BY Support_Systems_Access, Count DESC;

#Online Support Usage by Mental Health Status
SELECT Online_Support_Usage,
       Mental_Health_Status,
       COUNT(*) AS Count
FROM mental_health_and_technology_usage_2024
GROUP BY Online_Support_Usage, Mental_Health_Status
ORDER BY Online_Support_Usage, Count DESC;

#Daily Average Technology Usage (Total Screen Time)
SELECT User_ID,
       (Technology_Usage_Hours + 
       Gaming_Hours + 
       Social_Media_Usage_Hours) AS Total_Screen_Time
FROM mental_health_and_technology_usage_2024
ORDER BY Total_Screen_Time DESC;

#Sleep Deprivation and Technology Use
SELECT AVG(Technology_Usage_Hours) AS Avg_Tech_Usage,
       AVG(Social_Media_Usage_Hours) AS Avg_Social_Media_Usage
FROM mental_health_and_technology_usage_2024
WHERE Sleep_Hours < 6;

#Compare Physical Activity Hours by Mental Health Status
SELECT Mental_Health_Status,
       AVG(Physical_Activity_Hours) AS Avg_Physical_Activity
FROM mental_health_and_technology_usage_2024
GROUP BY Mental_Health_Status
ORDER BY Avg_Physical_Activity DESC;

#Screen Time Comparison for Users with and without Support Systems
SELECT Support_Systems_Access,
       AVG(Screen_Time_Hours) AS Avg_Screen_Time
FROM mental_health_and_technology_usage_2024
GROUP BY Support_Systems_Access;

#Health Score (Combining Key Health Metrics)
SELECT User_ID,
       CASE 
           WHEN Mental_Health_Status = 'Excellent' THEN 3
           WHEN Mental_Health_Status = 'Good' THEN 2
           WHEN Mental_Health_Status = 'Fair' THEN 1
           WHEN Mental_Health_Status = 'Poor' THEN 0
       END + 
       CASE 
           WHEN Stress_Level = 'Low' THEN 2
           WHEN Stress_Level = 'Medium' THEN 1
           WHEN Stress_Level = 'High' THEN 0
       END + 
       (Physical_Activity_Hours / 4) +
       (Sleep_Hours / 4) AS Health_Score
FROM mental_health_and_technology_usage_2024
ORDER BY Health_Score DESC;

#Behavioral Clusters
SELECT User_ID,
       CASE 
           WHEN Technology_Usage_Hours > 5 AND Physical_Activity_Hours <= 2 THEN 'High-Tech/Low-Activity'
           WHEN Technology_Usage_Hours > 5 AND Physical_Activity_Hours > 2 THEN 'High-Tech/Active'
           WHEN Technology_Usage_Hours <= 5 AND Physical_Activity_Hours <= 2 THEN 'Low-Tech/Low-Activity'
           ELSE 'Low-Tech/Active'
       END AS User_Cluster
FROM mental_health_and_technology_usage_2024;

SELECT *
FROM mental_health_and_technology_usage_2024
WHERE User_ID IN ('USER-08006', 'USER-01407');