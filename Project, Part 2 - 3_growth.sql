/*Number of members joined by year*/
SELECT 
	year_joined,
COUNT(member_id) new_members
FROM (SELECT
		member_id,
	YEAR(MIN(joined)) year_joined
	FROM grp_member
	GROUP BY member_id) first_joined_table
GROUP BY year_joined
ORDER BY year_joined ASC;

/*Consolidated the smaller neighborhood into larger cities*/
SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
SET city = "Chicago"
WHERE city = "East Chicago";

UPDATE grp_member
SET city = "Chicago"
WHERE city = "West Chicago";

UPDATE grp_member
SET city = "Chicago"
WHERE city = "North Chicago";

UPDATE grp_member
SET city = "Chicago"
WHERE city = "Chicago Heights";

UPDATE grp_member
SET city = "Chicago"
WHERE city = "Chicago Ridge";

UPDATE grp_member
SET city = "Chicago"
WHERE city = "Chicago";

UPDATE grp_member
SET city = "San Francisco"
WHERE city = "South San Francisco";

UPDATE grp_member
SET city = "New York"
WHERE city = "West New York";

/*Chigcago membership by year*/
SELECT 
	year_joined,
COUNT(member_id) new_members
FROM (SELECT
		member_id,
	YEAR(MIN(joined)) year_joined
	FROM grp_member
    WHERE city = "Chicago"
	GROUP BY member_id) first_joined_table
GROUP BY year_joined
ORDER BY year_joined ASC;

/*San Franscisco membership by year*/
SELECT 
	year_joined,
COUNT(member_id) new_members
FROM (SELECT
		member_id,
	YEAR(MIN(joined)) year_joined
	FROM grp_member
    WHERE city = "San Francisco"
	GROUP BY member_id) first_joined_table
GROUP BY year_joined
ORDER BY year_joined ASC;

/*New York membership by year*/
SELECT 
	year_joined,
COUNT(member_id) new_members
FROM (SELECT
		member_id,
	YEAR(MIN(joined)) year_joined
	FROM grp_member
    WHERE city = "New York"
	GROUP BY member_id) first_joined_table
GROUP BY year_joined
ORDER BY year_joined ASC;

/*2017 membership by month*/
SELECT 
	Month_joined_2017,
COUNT(member_id) new_members
FROM (SELECT
		member_id,
	MONTH(joined) Month_joined_2017
	FROM grp_member
    WHERE YEAR(joined) = "2017"
	GROUP BY member_id) first_joined_table
GROUP BY Month_joined_2017
ORDER BY Month_joined_2017 ASC;


