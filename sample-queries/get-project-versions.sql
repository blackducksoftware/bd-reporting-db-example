/*
	Author: Glenn Snyder
	Date: May 14, 2020
	BD Version: v2020.4.x
	Description: Sample query showing how to retrieve versions from 
		the Black Duck reporting DB for a given project

	Comment: Use the psql -v option to pass the project and version name, e.g.
		psql ... -v project="'my-project'"
*/
select 
	project.project_name,
	project_version.version_name 
from 
	project
left join 
	project_version
on 
	project.project_id = project_version.project_id
where 
	project.project_name=:project;