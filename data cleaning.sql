USE SATYAM;

DESCRIBE HR;

SELECT * FROM HR;

  -- IMPORTANT  ..   set sql_mode='allow_invalid_dates';
                   
                     set sql_safe_updates = 0;
  
  -- DATA CLEANING  OF HR
  
  SELECT TERMDATE FROM HR;

update hr
set termdate =if( termdate IS NOT NULL AND TERMDATE <> '',
 date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')),'0000-00-00') 
 where true;
 
 set sql_mode='allow_invalid_dates';

  ALTER TABLE HR
 modify COLUMN  termdate DATE;   
  
  SELECT HIRE_DATE FROM HR;

UPDATE hr 
SET HIRE_DATE = CASE
         WHEN  HIRE_DATE LIKE '%/%' THEN date_format(STR_TO_DATE( HIRE_DATE,'%m/%d/%Y'),'%Y-%m-%d')
         WHEN  HIRE_DATE LIKE '%-%' THEN date_format(STR_TO_DATE( HIRE_DATE,'%m-%d-%Y'),'%Y-%m-%d')
         ELSE NULL 
         END;
         
  ALTER TABLE HR
 modify COLUMN  HIRE_DATE  DATE; 

ALTER TABLE HR
CHANGE COLUMN ï»¿id EMP_ID VARCHAR(20) NULL;

select birthdate from hr;

UPDATE hr 
SET BIRTHDATE = CASE
         WHEN BIRTHDATE LIKE '%/%' THEN date_format(STR_TO_DATE(BIRTHDATE,'%m/%d/%Y'),'%Y-%m-%d')
         WHEN BIRTHDATE LIKE '%-%' THEN date_format(STR_TO_DATE(BIRTHDATE,'%m-%d-%Y'),'%Y-%m-%d')
         ELSE NULL 
         END;
 
 ALTER TABLE HR
 modify COLUMN BIRTHDATE DATE ; 
 
 ALTER TABLE HR ADD COLUMN AGE INT;
 
 UPDATE HR SET AGE = timestampdiff(YEAR,BIRTHDATE,CURDATE());
 
 SELECT COUNT(*) FROM HR WHERE AGE<18;


       -- -- -- END -- -- --   
 
 
  
  
      
 
	
    
    
    

 
 
         





