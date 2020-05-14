/*
	Author: Glenn Snyder
	Date: May 14, 2020
	BD Version: v2020.4.x
	Description: Sample query showing how to retrieve custom field values from 
		the Black Duck reporting DB for a given project-version

	Comment: Use the psql -v option to pass the project and version name, e.g.
		psql ... -v project="'my-project'" -v version="'my-version'"
*/
select 
	project.project_name,
	project_version.version_name,
	project_version.phase as "phase",
	project_version.distribution as "distribution",
	project_version_custom_fields.custom_field_label,
	project_version_custom_fields.values,
	project_version_custom_fields.active,
	project_version_custom_fields.custom_field_type
from
	project
join
	project_version
on
	project.project_id = project_version.project_id
left join
	project_version_custom_fields
on
	project_version.version_id = project_version_custom_fields.project_version_id
where
	project.project_name=:project and
	project_version.version_name=:version