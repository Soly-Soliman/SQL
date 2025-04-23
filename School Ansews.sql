 ---How many Elementary Schools are in the dataset?
select count(*) from chicago_public_schools where `Elementary, Middle, or High School` ='ES'

--Correct answer: 462
--What is the highest Safety Score?
select MAX(Safety_Score) AS MAX_SAFETY_SCORE from chicago_public_schools;

--Correct answer: 99

--Which schools have highest Safety Score?
select Name_of_School, Safety_Score from chicago_public_schools where 
  Safety_Score= (select MAX(Safety_Score) from chicago_public_schools)
  --Correct answer: several schools with with Safety Score of 99.

  --What are the top 10 schools with the highest “Average Student Attendance”?

  select top(10) Name_of_School, Average_Student_Attendance from chicago_public_schools order by Average_Student_Attendance desc

--Retrieve the list of 5 Schools with the lowest Average Student Attendance sorted in ascending order based on attendance
  SELECT top (10) Name_of_School, Average_Student_Attendance  
     from chicago_public_schools 
     order by Average_Student_Attendance ;

-- Which Schools have Average Student Attendance lower than 70%?
Solution:

SELECT Name_of_School, Average_Student_Attendance from chicago_public_schools
    where CAST(REPLACE(Average_Student_Attendance, '%', '')  AS DOUBLE) < 70
    order by Average_Student_Attendance


 --Get the total College Enrollment for each Community Area
 select Community_Area_Name, sum(College_Enrollment) AS TOTAL_ENROLLMENT 
   from chicago_public_schools 
   group by Community_Area_Name 

--Get the 5 Community Areas with the least total College Enrollment sorted in ascending order

select top (5)Community_Area_Name, sum(College_Enrollment) AS TOTAL_ENROLLMENT 
   from chicago_public_schools 
   group by Community_Area_Name 
   order by TOTAL_ENROLLMENT asc 

--Get the hardship index for the community area which has the school with the highest enrollment.
 select community_area_number, community_area_name, hardship_index from chicago_socioeconomic_data 
   where community_area_number in 
   ( select community_area_number from chicago_public_schools where COLLEGE_ENROLLMENT = (select MAX(COLLEGE_ENROLLMENT) from chicago_public_schools)  ) ;