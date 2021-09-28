SELECT
	physical_memory_in_bytes,
	virtual_memory_in_bytes,
	bpool_committed,
	bpool_commit_target
FROM sys.[dm_os_sys_info];