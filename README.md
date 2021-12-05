# Pewlett-Hackard-Analysis

## Overview of Analysis

This analysis was performed to provide Pewlett Hackard with better insight into the upcoming wave of retiring employees. Once the company is aware of the number of employees that are retiring, they can put in place a mentorship program to ensure that the senior roles can be filled in a timely manner with people who are prepared for the role.

To provide insight, we found the number of retiring employees by skill set and then provided a table with detail on employees that could serve in a mentorship program.

## Results

The _RetirementTable_ table provides a list of the current employees that will be retiring. The possible retirement status was established by filtering on employees born between 1952-1955. Once this table was created, the _UniqueTitle_ table was created to filter for the latest job title held by the retiring employees. These employees were then grouped by title to better understand how many of each type of employee would be retiring.

![RetiringTitlesTable.png](Screenshots/RetiringTitlesTable.png) 

Once the total number of employees retiring by title was established, a _mentoring_ table was created to understand which employees were eligible for mentorship. An employee is eligible to be mentored if he/she was born in 1965.

![MentoringTable.png](Screenshots/MentoringTable.png) 

### Takeaways
- Pewlett Hackard will have employeed retiring from 7 different roles, with the majority of people retiring from the position of Senior Engineer and Senior Staff.
![RetiringTitlesTable.png](Screenshots/RetiringTitlesTable.png) 
- There are a total of 90,398 employees that we predict will be retiring in the near future.
![TotalRetiring.png](Screenshots/TotalRetiring.png) 
- There are a total of 1,547 employees that are eligible for the mentoring program.
![TotalMentored.png](Screenshots/TotalMentored.png) 
- From above, it is clear that there are not enough people that are eligible for the mentorship program and perhaps the criteria should be expanded to include more current employees.

## Summary

Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?