DECLARE @SQL NVARCHAR(MAX) = '';

SELECT @SQL += '
USE [' + name + '];
SELECT 
    ''' + name + ''' AS DatabaseName,
    s.name AS SchemaName,
    t.name AS TableName,
    c.name AS ColumnName,
    ty.name AS DataType
FROM 
    sys.schemas s
    INNER JOIN sys.tables t ON s.schema_id = t.schema_id
    INNER JOIN sys.columns c ON t.object_id = c.object_id
    INNER JOIN sys.types ty ON c.user_type_id = ty.user_type_id;
'
FROM sys.databases
WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb') 
  AND state_desc = 'ONLINE';

EXEC sp_executesql @SQL;
