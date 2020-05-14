/*
	Author: Glenn Snyder
	Date: May 14, 2020
	BD Version: v2020.4.x
	Description: Sample query showing how to retrieve component matches from 
		the Black Duck reporting DB for a given project-version

	Comment: Use the psql -v option to pass the project and version name, e.g.
		psql ... -v project="'my-project'" -v version="'my-version'"
*/
select DISTINCT
	project.project_name,
	project_version.version_name,
	project_version.phase as "phase",
	project_version.distribution as "distribution",
	component.component_name,
	component.component_version_name,
	component_license.license_display,
	component_usages.usage,
	component_matches.match_type,
	component_matches.match_path,
	component_matches.match_file_name
from
	project
join
	project_version
on
	project.project_id = project_version.project_id
left join
	component
on
	project_version.version_id = component.project_version_id
join
	component_license
on
	component.id = component_license.component_table_id
left join
	component_matches
on
	project_version.version_id = component_matches.project_version_id
join
	component_usages
on
	component.id = component_usages.component_id
where
	project.project_name=:project and
	project_version.version_name=:version
order by
	project_name,
	version_name,
	component_name,
	component_version_name,
	match_type,
	match_path,
	match_file_name