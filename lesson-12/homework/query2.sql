CREATE PROCEDURE GetRoutinesWithParameters
    @DatabaseName SYSNAME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX) = '';

    IF @DatabaseName IS NOT NULL
    BEGIN
        SET @SQL = '
        USE [' + QUOTENAME(@DatabaseName) + '];
        SELECT
            DB_NAME() AS DatabaseName,
            SCHEMA_NAME(o.schema_id) AS SchemaName,
            o.name AS RoutineName,
            o.type_desc AS RoutineType,
            p.name AS ParameterName,
            TYPE_NAME(p.user_type_id) AS ParameterDataType,
            p.max_length AS ParameterMaxLength
        FROM sys.objects o
        LEFT JOIN sys.parameters p ON o.object_id = p.object_id
        WHERE o.type IN (''P'', ''FN'', ''TF'', ''IF'') -- P = Stored Proc, FN = Scalar Function, TF = Table-valued, IF = Inline
        ORDER BY SchemaName, RoutineName, ParameterName;
        ';
        EXEC sp_executesql @SQL;
    END
    ELSE
    BEGIN
        SELECT @SQL = STRING_AGG('
        USE [' + QUOTENAME(name) + '];
        SELECT
            ''' + name + ''' AS DatabaseName,
            SCHEMA_NAME(o.schema_id) AS SchemaName,
            o.name AS RoutineName,
            o.type_desc AS RoutineType,
            p.name AS ParameterName,
            TYPE_NAME(p.user_type_id) AS ParameterDataType,
            p.max_length AS ParameterMaxLength
        FROM sys.objects o
        LEFT JOIN sys.parameters p ON o.object_id = p.object_id
        WHERE o.type IN (''P'', ''FN'', ''TF'', ''IF'')
        ', '
        UNION ALL
        ')
        FROM sys.databases
        WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')
          AND state_desc = 'ONLINE';

        EXEC sp_executesql @SQL;
    END
END;
