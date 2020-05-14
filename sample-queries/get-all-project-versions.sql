/*
	Author: Glenn Snyder
	Date: May 14, 2020
	BD Version: v2020.4.x
	Description: Sample query showing how to get all project versions from 
		the Black Duck reporting DB for a given project-version

	Comment: Use the psql -v option to pass the project and version name, e.g.
		psql ... -v project="'my-project'" -v version="'my-version'"
*/
select 
	project.project_name, 
	project.owner,
	project_version.*
from 
	project
left join 
	project_version
on 
	project.project_id = project_version.project_id
order by 
	project_name,
	version_name;