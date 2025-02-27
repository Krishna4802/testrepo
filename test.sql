SELECT TOP 50
    deqs.creation_time,
    deqs.last_execution_time,
    dest.text AS [SQL Query],
    deqs.execution_count,
    deqs.total_worker_time / deqs.execution_count AS Avg_CPU_Time,
    deqs.total_elapsed_time / deqs.execution_count AS Avg_Elapsed_Time
FROM sys.dm_exec_query_stats AS deqs
CROSS APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS dest
ORDER BY deqs.last_execution_time DESC;
