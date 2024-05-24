 -- QUESTIONS
                   
            SELECT * FROM HR;   
            
-- 1 . what is the age distribution of employees in the company?
      
      select min(age) as yougest,
	  max(age) as oldest from hr
      where age >=  18 and termdate ='0000-00-00';
      
   select 
        case 
            when age >= 18 and age <=25 then '18-25'
			when age >= 26 and age <=35 then '26-35'
			when age >= 36 and age <=45 then '36-45'
			when age >= 46 and age <=55 then '46-55'
            else '56+'  
        end as age_group,gender,count(*) as count
     from hr  where age >=  18 and termdate ='0000-00-00'   
     group by age_group,gender
     order by age_group,gender;  
     
-- 2 . How does the gender distribution vary across departments ?  
       select department,gender,count(*) as count from hr
       where age >= 18 and termdate = '0000-00-00'
       group by gender,department
       order by gender,department;     
                       
-- 3 .WHAT IS THE GENDER BREAKDOWN OF EMPLOYEES IN THE COMPANY?
   
   select gender,count(*) as count from hr
   where age >= 18 and termdate = '0000-0-00'
   group by gender;
   
 -- 4 . What is  the race/ethnicity  breakdown of employees in the company?
    
    select race,count(*) as count from hr 
    where age >= 18 and termdate = '0000-00-00'
    group by race;
 
 
  -- 5. How many employees work at headquaters versus remote locations?
       
       select location,count(*) as count from hr
       where age >= 18 and termdate ='0000-00-00'
       group by location;
       
  -- 6 . what is the average length of the employment for employees who have been terminated?
  
       select round(avg(datediff(termdate,hire_date))/365,0) as avg_length_employment
       from hr 
       where termdate <= curdate() and termdate <> '0000-00-00'
       and age >= 18;
  
  -- 7 . What is the distributions of the job titles across the company?
  
        select jobtitle,count(*) as count from hr
        where age >= 18 and termdate = '0000-00-00'
        group by jobtitle
        order by jobtitle ;
        
   -- 8 . Which department has the highest turnover rate?
 
	   select department,total_count,terminated_count,terminated_count/total_count as termination_rate
       from (select department,count(*) as total_count,
       sum(case when termdate <> '0000-00-00' and termdate <= curdate() then 1 else 0 end ) as terminated_count
       from hr
       where age >= 18
       group by department) as subquery
       order by termination_rate desc;
       
   -- 9 . what is the distribution of employees across locations by  state?     
   
        select location_state,count(*) as count from hr
        where age >= 18 and termdate = '0000-00-00'
        group by location_state
         order by location_state;
         
      
	-- 10 . What is the tenure distribution for each department?
    
        select department ,round(avg(datediff(termdate,hire_date)/365),0) as avg_tenure
        from hr
        where age >= 18 and termdate <> '0000-00-00' and termdate <= curdate()
        group by department;