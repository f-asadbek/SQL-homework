DECLARE @html NVARCHAR(MAX);

SET @html = 
'<h3>Index Metadata Report</h3>
<table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse;">
<tr>
<th>Table Name</th>
<th>Index Name</th>
<th>Index Type</th>
<th>Column Name</th>
</tr>';

SELECT @html += 
    '<tr><td>' + s.name + '.' + t.name + 
    '</td><td>' + i.name +
    '</td><td>' + i.type_desc +
    '</td><td>' + c.name +
    '</td></tr>'
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
JOIN sys.indexes i ON t.object_id = i.object_id
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE i.name IS NOT NULL;

SET @html += '</table>';

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ProfileName',
    @recipients = 'asadbekfayzullaev777@gmail.com',
    @subject = 'Report',
    @body = @html,
    @body_format = 'HTML';
