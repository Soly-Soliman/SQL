SELECT *  FROM chicago_crime
use School_Data

--Find the total number of crimes recorded in the CRIME table.
select count (id) as total_number from Chicago_crime
--Retrieve first 10 rows from the CRIME table.
select top (10) * from dbo.chicago_crime
--How many crimes involve an arrest?
select count (id) from dbo.chicago_crime where Arrest = 'True'
--Which unique types of crimes have been recorded at GAS STATION locations?
select distinct primary_type  from chicago_crime where location_description  = 'GAS STATION' 

select  *  from chicago_socioeconomic_data

select  community_area_name  from chicago_socioeconomic_data where Community_Area_Name  like 'B%'
--List community area names and numbers with per capita income less than 11000
select  community_area_name  from chicago_socioeconomic_data where PER_CAPITA_INCOME   >11000


select  *  from chicago_socioeconomic_data where Community_Area_number  between 10 and 15 

-- Which schools in Community Areas 10 to 15 are healthy school certified?
select  Name_of_school  from Chicago_Public_Schools where Healthy_School_Certified = 'yes' and Community_Area_Number BETWEEN 10 AND 15
select *  from Chicago_Public_Schools

select avg (Safety_Score) from Chicago_Public_Schools
select  Community_Area_Name, AVG(College_Enrollment) as AVG_ENROLLMENT from CHICAGO_PUBLIC_SCHOOLS group by Community_Area_Name order by AVG_ENROLLMENT desc
select  top (5)Community_Area_Name from Chicago_Public_Schools group  by Community_Area_Name order by avg (College_Enrollment)  desc 

select Community_Area_Name from Chicago_Public_Schools 
where SAFETY_SCORE = (select min(SAFETY_SCORE) from Chicago_Public_Schools)

select  (COMMUNITY_AREA_NAME), SAFETY_SCORE from chicago_public_schools where SAFETY_SCORE = 
( select MAX
(SAFETY_SCORE) from chicago_public_schools )

select count (id) as total_number from Chicago_crime


-- List all case numbers for crimes involving minors?(children are not considered minors for the purposes of crime analysis
SELECT CASE_NUMBER FROM chicago_crime WHERE DESCRIPTION LIKE '%MINOR%'

--List all kidnapping crimes involving a child
SELECT CASE_NUMBER
FROM chicago_crime
WHERE PRIMARY_TYPE = 'KIDNAPPING'
AND DESCRIPTION LIKE '%CHILD%'

--List the kind of crimes that were recorded at schools. (No repetitions)
SELECT DISTINCT PRIMARY_TYPE
FROM chicago_crime
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%'

--List the type of schools along with the average safety score for each type

SELECT NAME_OF_SCHOOL, AVG(SAFETY_SCORE) AS AVG_SAFETY_SCORE
FROM chicago_public_schools
GROUP BY NAME_OF_SCHOOL
--List 5 community areas with highest % of households below poverty line
SELECT top (5) COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY
FROM Chicago_Census
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC
 --Which community area is most crime prone? Display the coumminty area number only
 SELECT  COMMUNITY_AREA_NUMBER
FROM chicago_crime
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY COMMUNITY_AREA_NUMBER desc

SELECT COMMUNITY_AREA_NAME
FROM Chicago_Census
WHERE HARDSHIP_INDEX = (SELECT MAX(HARDSHIP_INDEX) FROM Chicago_Census)


SELECT COMMUNITY_AREA_NUMBER
FROM (

    SELECT top 2 COMMUNITY_AREA_NUMBER, COUNT(*) AS num_crimes
    FROM chicago_crime
    GROUP BY COMMUNITY_AREA_NUMBER
    ORDER BY num_crimes DESC
   
) AS subquery
SELECT COUNT(*) AS num_rows
FROM chicago_crime
WHERE PRIMARY_TYPE = 'KIDNAPPING' AND DESCRIPTION LIKE '%CHILD%'

SELECT AVG(SAFETY_SCORE) AS avg_safety_score
FROM chicago_public_schools
WHERE ([Elementary, Middle, or High School]) LIKE 'm%'

select top 50
*  from Chicago_Public_Schools 


SELECT  c.COMMUNITY_AREA_NUMBER , COMMUNITY_AREA_NAME , count (*) 
FROM
    chicago_crime as c ,  [dbo].[chicago_socioeconomic_data]
    GROUP BY c.COMMUNITY_AREA_NUMBER
    ORDER BY c.num_incidents desc
    



SELECT *
FROM 
   
     chicago_crime
  
  



    SELECT COMMUNITY_AREA_NAME
    FROM chicago_crime , [dbo].[chicago_socioeconomic_data]
	where
    GROUP BY COMMUNITY_AREA_NAME
 

 SELECT c.COMMUNITY_AREA_NUMBER, cs.COMMUNITY_AREA_NAME, COUNT(*) AS num_incidents
FROM chicago_crime c
JOIN chicago_socioeconomic_data cs ON c.COMMUNITY_AREA_NUMBER = cs.COMMUNITY_AREA_NUMBER
GROUP BY c.COMMUNITY_AREA_NUMBER, cs.COMMUNITY_AREA_NAME
ORDER BY num_incidents DESC;


SELECT COMMUNITY_AREA_NAME
FROM (
    SELECT c.COMMUNITY_AREA_NUMBER, cs.COMMUNITY_AREA_NAME, COUNT(*) AS num_incidents
    FROM chicago_crime c
    JOIN chicago_socioeconomic_data cs ON c.COMMUNITY_AREA_NUMBER = cs.COMMUNITY_AREA_NUMBER
    GROUP BY c.COMMUNITY_AREA_NUMBER, cs.COMMUNITY_AREA_NAME
    ORDER BY num_incidents DESC
   
) AS subquery;
