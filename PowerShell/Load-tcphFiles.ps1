# Start with creation of tpc-h files, not included in this demoscript

# Create tables in SQL Instance

# Import data from the different files, parallel where applicable (nation and region are singe entities)
Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\nation.tbl -Delimiter '|' -Table nation -Schema dbo -NoHeaderRow 

# Local VM Benchmark: 100,12 ms
Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\region.tbl -Delimiter '|' -Table region -Schema dbo -NoHeaderRow  

# Local VM Benchmark: 82,41 ms

Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\supplier.tbl.5 -Delimiter '|' -Table supplier -Schema dbo -NoHeaderRow 

# Local VM Benchmark: 10,89 s | 91810 Rows per Second


workflow Test-Workflow
{
    Parallel
    {
        Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\supplier.tbl.1 -Delimiter '|' -Table supplier -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\supplier.tbl.2 -Delimiter '|' -Table supplier -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\supplier.tbl.3 -Delimiter '|' -Table supplier -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\supplier.tbl.4 -Delimiter '|' -Table supplier -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\supplier.tbl.5 -Delimiter '|' -Table supplier -Schema dbo -NoHeaderRow 

		# Local VM Benchmark with one file: 10,89 s | 91.810 Rows per Second
    }
}

workflow Test-Workflow
{
    Parallel
    {
        Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\part.tbl.1 -Delimiter '|' -Table part -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\part.tbl.2 -Delimiter '|' -Table part -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\part.tbl.3 -Delimiter '|' -Table part -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\part.tbl.4 -Delimiter '|' -Table part -Schema dbo -NoHeaderRow 
		Import-DbaCsv -SqlInstance Localhost\Vantage -Database tpc-h -Path K:\tpc-h\Debug\files\part.tbl.5 -Delimiter '|' -Table part -Schema dbo -NoHeaderRow 

		# Local VM Benchmark with one file: 00:03:13 | 103.176 Rows per Second
    }
}