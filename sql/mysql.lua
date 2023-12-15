function connect()
    DBConnection = dbConnect( "mysql", "dbname=katrp;host=127.0.0.1;charset=utf8", "root", "" )
    if (not DBConnection) then
        outputDebugString("Error: Failed to establish connection to the MySQL database server")
    else
        outputDebugString("Success: Connected to the MySQL database server")
    end
end

addEventHandler("onResourceStart",resourceRoot, connect)
 
function query(...)
    local queryHandle = dbQuery(DBConnection, ...)
    if (not queryHandle) then
        return nil
    end
    local rows = dbPoll(queryHandle, -1)
    return rows
end
 
function execute(...)
    local queryHandle = dbQuery(DBConnection, ...)
    local result, numRows = dbPoll(queryHandle, -1)
    return numRows
end

function getDBConnection()
    return DBConnection
end

