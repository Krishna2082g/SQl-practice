
--Show unique birth years from patients and order them by ascending.
select distinct(year(birth_date))
from patients
order by birth_date asc;


--Show unique first names from the patients table which only occurs once in the list.
select first_name
from patients
group by first_name
having count(first_name) = 1;
--For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.

--Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select
    patient_id,
    first_name
from patients
where first_name like 's____%s';


--Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
select
    patients.patient_id,
    first_name,
    last_name
from patients
    join admissions on patients.patient_id = admissions.patient_id
where diagnosis = 'Dementia';
--Primary diagnosis is stored in the admissions table.



--Display every patient's first_name.
--Order the list by the length of each name and then by alphabetically
select first_name
from patients
order by
  len(first_name),
  first_name asc;



--Show the total amount of male patients and the total amount of female patients in the patients table.
--Display the two results in the same row.

select (
    select count(*)
    from patients
    where gender = 'M'
  ) as male_count, (
    select count(*)
    from patients
    where gender = 'F'
  ) as female_count;




--Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. --Show results ordered ascending by allergies then by first_name then by last_name.
select first_name, last_name, allergies
from patients
where allergies in ('Penicillin','Morphine')
order by allergies,first_name,last_name;


--Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
SELECT
    patient_id,
    diagnosis
FROM admissions
GROUP BY
  patient_id,
  diagnosis
HAVING COUNT(*) > 1;