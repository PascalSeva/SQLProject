# Connection Establishment
$connection = "D-CL00-WIN\SQLEXPRESS"
$connectionInfo = "Server=$connection; Database=CarRental; Integrated Security=True;" 

#Query * from allInfor table
$query="select * from allInfo"

$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionInfo

#Openning the connection and set command to the SELECT command we made above
$connection.Open()
$command = $connection.CreateCommand()
$command.CommandText = $query

$result = $command.ExecuteReader()
$table = New-Object "System.Data.DataTable"
$table.Load($result)

#modified to save to a json file for importing to MongoDB
$table | select $table.Columns.Columnname | ConvertTo-Json -depth 2 `
|out-file "C:\Users\Charley\CSOneDrive\OneDrive\DesktopBackup\University folder\Fall2020\database\TP\final\carRental.json"

$connection.Close()

# $table |gm
