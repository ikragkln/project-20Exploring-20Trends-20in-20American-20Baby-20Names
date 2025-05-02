--QUESTION 1;
--List the first five names in alphabetical order and find out if each name is "Classic" or "Trendy." 
--Save your query as a DataFrame name_types with three columns: first_name, sum, and popularity_type
SELECT first_name, 
           sum(num),
           CASE 
               WHEN max(year)< 1970 THEN 'Classic' 
               ELSE 'Trendy' 
           END AS popularity_type
FROM public.baby_names
GROUP BY first_name
ORDER BY first_name ASC
LIMIT 5;

--QUESTION 2
--What were the top 20 male names overall, and how did the name Paul rank? 
--Save your query as a DataFrame top_20 with three columns: name_rank, first_name, and sum.
SELECT first_name, 
       row_number() OVER (ORDER BY sum(num) DESC) AS name_rank,
       sum(num) 
FROM public.baby_names
WHERE sex = 'M' 
GROUP BY first_name
ORDER BY sum(num) DESC
LIMIT 20;

--QUESTION 3
--Which female names appeared in both 1920 and 2020? 
--Save your query as a DataFrame a_names with two columns: first_name, and total_occurrences
SELECT first_name, 
       COUNT(first_name) AS total_occurrences 
FROM public.baby_names
WHERE year IN (1920,2020)
GROUP BY first_name;
