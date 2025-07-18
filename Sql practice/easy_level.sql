
--Show first name, last name, and gender of patients whose gender is 'M'

select
    first_name,
    last_name,
    gender
from patients
where gender = 'M';

--show first name and last name of patients who does not have allergies. (null)

select
    first_name,
    last_name
from patients
where allergies is null;

--show first name of patients that start with the letter 'C'

select first_name
from patients
where first_name like 'C%';

--show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

select
    first_name,
    last_name
from patients
where weight between 100 and 120;

--Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'

update patients
set allergies = 'NKA'
where allergies is null;

--show first name and last name concatinated into one column to  --show their full name.

select
    concat(first_name, ' ', last_name) as full_name
from patients;

--show first name, last name, and the full province name of each patient.

select
    first_name,
    last_name,
    province_name
from patients
    join province_names on patients.province_id = province_names.province_id;
--Example: 'Ontario' instead of 'ON'

--show how many patients have a birth_date with 2010 as the birth year.

select count(patient_id)
from patients
where year(birth_date) = 2010;

--show the first_name, last_name, and height of the patient with the greatest height.

select
    first_name,
    last_name,
    height
from patients
order by height desc
limit 1;
 
 --show all columns for patients who have one of the following patient_ids:
--1,45,534,879,1000
 
select *
    from patients
where
  patient_id in('1', '45', '534', '879', '1000');


--show the total number of admissions

select count (*) as total_admissions
from admissions;

--show all the columns from admissions where the patient was admitted and discharged on the same day.

select *
from admissions
where admission_date = discharge_date;

--show the patient id and the total number of admissions for patient_id 579.

select
    patient_id,
    count(patient_id) as total_admissions
from admissions
where patient_id = 579;

--Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.

select distinct(city) as unique_cities
from patients
where province_id = 'NS';

--Write a query to find the first_name, last name, and birth date of patients who has height greater than 160 and weight greater than 70

select
    first_name,
    last_name,
    birth_date
from patients
where height > 160 and weight > 70;

--Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'

select
    first_name,
    last_name,
    allergies
from patients
where
  allergies is not null
    and city = 'Hamilton';