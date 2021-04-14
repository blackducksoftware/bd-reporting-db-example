/*
	Author: Glenn Snyder
	Date: April 14, 2021
	BD Version: v2021.2.x
	Description: Sample query showing how to retrieve the top components 
        by the frequency which they are used across project-versions

*/
select component_name, component_version_name, count(*) as component_count 
from component 
group by component_name, component_version_name
order by component_count desc;