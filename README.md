

# Sample Queries for the Synopsys Black Duck Reporting DB

This repository includes sample queries for retrieving information from the Synopsys Black Duck reporting schema.

## References

- v2020.4.0 Reporting Database Product Guide
  - Provides all the tables included in the reporting schema
  - Provides instruction on how to connect to the DB

## Running the Sample Queries

A convenience script is included: **run_query.bash**

The script is a wrapper around the psql command used to connect with the Black Duck database and execute queries which are stored in files. Be sure to check/do the following before using the script:

1. Set the BD_HOST value which should be the hostname for your Black Duck server
2. Check the POSTGRESQL_PORT for your installation (default is 55436 but for hosted customers it is 5432)

The script takes one argument, the name of a file containing the query to run, e.g.

```bash
./run_query.bash sample-queries/get-projects.sql # will retrieve all the projects
```

If additional arguments are provided they are passed directly to psql. So, for instance, if you want CSV formatted output,

```bash
./run_query.bash get-all-project-versions.sql --csv
```

If you want to provide the name of a project and a version to one of the samples that requires those parameters,

```
./run_query.bash get-project-version-components.sql -v project="'my-project'" -v version="'my-version'"
```



## Sample Queries

Sample queries are all in the **sample-queries** directory.

## Converting from CSV to JSON

If you want to convert from CSV to JSON a convenience (python) script is provided - **convert_csv_to_json.py**. It can read from STDIN or from a file and output the CSV data in JSON format. The first argument is either stdin ("-") or a filename that has the CSV data and the second argument is the output file name.

From STDIN use "-" as the first argument,

```
./run_query.bash get-project-version-components.sql -v project="'my-project'" -v version="'my-version'" --csv | python3 convert_csv_to_json.py - all-project-versions.json
```

