# Apache Kudu Configuration Reference

## [`kudu-master` Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_supported)

### [Stable Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_stable)

Flags tagged `stable` and not `advanced` are safe to use for common configuration tasks.

#### [`--block_cache_capacity_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_block_cache_capacity_mb)

block cache capacity in MB

| Type    | int64  |
| ------- | ------ |
| Default | `512`  |
| Tags    | stable |

 

#### [`--log_force_fsync_all`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_force_fsync_all)

Whether the Log/WAL should explicitly call fsync() after each write.

| Type    | bool    |
| ------- | ------- |
| Default | `false` |
| Tags    | stable  |

 

#### [`--fs_data_dirs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fs_data_dirs)

Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--fs_metadata_dir`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fs_metadata_dir)

Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--fs_wal_dir`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fs_wal_dir)

Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--master_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_master_addresses)

Comma-separated list of the RPC addresses belonging to all Masters in this cluster. NOTE: if not specified, configures a non-replicated Master.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--rpc_bind_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_bind_addresses)

Comma-separated list of addresses to bind to for RPC connections. Currently, ephemeral ports (i.e. port 0) are not allowed.

| Type    | string    |
| ------- | --------- |
| Default | `0.0.0.0` |
| Tags    | stable    |

 

#### [`--keytab_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_keytab_file)

Path to the Kerberos Keytab file for this server. Specifying a keytab file will cause the server to kinit, and enable Kerberos to be used to authenticate RPC connections.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--superuser_acl`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_superuser_acl)

The list of usernames to allow as super users, comma-separated. A '*' entry indicates that all authenticated users are allowed. If this is left unset or blank, the default behavior is that the identity of the daemon itself determines the superuser. If the daemon is logged in from a Keytab, then the local username from the Kerberos principal is used; otherwise, the local Unix username is used.

| Type    | string           |
| ------- | ---------------- |
| Default | none             |
| Tags    | sensitive,stable |

 

#### [`--user_acl`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_user_acl)

The list of usernames who may access the cluster, comma-separated. A '*' entry indicates that all authenticated users are allowed.

| Type    | string           |
| ------- | ---------------- |
| Default | `*`              |
| Tags    | sensitive,stable |

 

#### [`--webserver_certificate_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_certificate_file)

The location of the debug webserver’s SSL certificate file, in PEM format. If empty, webserver SSL support is not enabled. If --webserver_private_key_file is set, this option must be set as well.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--webserver_port`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_port)

Port to bind to for the web server

| Type    | int32  |
| ------- | ------ |
| Default | `0`    |
| Tags    | stable |

 

#### [`--webserver_private_key_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_private_key_file)

The full path to the private key used as a counterpart to the public key contained in --webserver_certificate_file. If --webserver_certificate_file is set, this option must be set as well.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--webserver_private_key_password_cmd`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_private_key_password_cmd)

A Unix command whose output returns the password used to decrypt the Webserver’s certificate private key file specified in --webserver_private_key_file. If the PEM key file is not password-protected, this flag does not need to be set. Trailing whitespace will be trimmed before it is used to decrypt the private key

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--log_filename`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_filename)

Prefix of log filename - full path is <log_dir>/<log_filename>.[INFO|WARN|ERROR|FATAL]

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--maintenance_manager_num_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_maintenance_manager_num_threads)

Size of the maintenance manager thread pool. For spinning disks, the number of threads should not be above the number of devices.

| Type    | int32  |
| ------- | ------ |
| Default | `1`    |
| Tags    | stable |

 

#### [`--memory_limit_hard_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_memory_limit_hard_bytes)

Maximum amount of memory this daemon should use, in bytes. A value of 0 autosizes based on the total system memory. A value of -1 disables all memory limiting.

| Type    | int64  |
| ------- | ------ |
| Default | `0`    |
| Tags    | stable |

 

#### [`--flagfile`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_flagfile)

load flags from file

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--help`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_help)

show help on all flags [tip: all flags can have two dashes]

| Type    | bool    |
| ------- | ------- |
| Default | `false` |
| Tags    | stable  |

 

#### [`--version`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_version)

show version and build info and exit

| Type    | bool    |
| ------- | ------- |
| Default | `false` |
| Tags    | stable  |

 

#### [`--colorlogtostderr`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_colorlogtostderr)

color messages logged to stderr (if supported by terminal)

| Type    | bool           |
| ------- | -------------- |
| Default | `false`        |
| Tags    | runtime,stable |

 

#### [`--log_dir`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_dir)

If specified, logfiles are written into this directory instead of the default logging directory.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--logtostderr`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_logtostderr)

log messages go to stderr instead of logfiles

| Type    | bool           |
| ------- | -------------- |
| Default | `false`        |
| Tags    | runtime,stable |

 

#### [`--max_log_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_log_size)

approx. maximum log file size (in MB). A value of 0 will be silently overridden to 1.

| Type    | int32          |
| ------- | -------------- |
| Default | `1800`         |
| Tags    | runtime,stable |

 

### [Stable, Advanced Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_stable_advanced)

Flags tagged `stable` and `advanced` are supported, but should be considered "expert" options and should be used carefully and after thorough testing.

#### [`--enable_process_lifetime_heap_profiling`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_enable_process_lifetime_heap_profiling)

Enables heap profiling for the lifetime of the process. Profile output will be stored in the directory specified by -heap_profile_path.

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--heap_profile_path`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heap_profile_path)

Output path to store heap profiles. If not set profiles are stored in /tmp/<process-name>.<pid>.<n>.heap.

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--unlock_experimental_flags`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_unlock_experimental_flags)

Unlock flags marked as 'experimental'. These flags are not guaranteed to be maintained across releases of Kudu, and may enable features or behavior known to be unstable. Use at your own risk.

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | stable,advanced |

 

#### [`--unlock_unsafe_flags`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_unlock_unsafe_flags)

Unlock flags marked as 'unsafe'. These flags are not guaranteed to be maintained across releases of Kudu, and enable features or behavior known to be unsafe. Use at your own risk.

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | stable,advanced |

 

#### [`--fromenv`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fromenv)

set flags from the environment [use 'export FLAGS_flag1=value']

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--tryfromenv`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tryfromenv)

set flags from the environment if present

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--undefok`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_undefok)

comma-separated list of flag names that it is okay to specify on the command line even if the program does not define a flag with that name. IMPORTANT: flags in this list that have arguments MUST use the flag=value format

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--helpmatch`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_helpmatch)

show help on modules whose name contains the specified substr

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--helpon`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_helpon)

show help on the modules named by this flag value

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--helppackage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_helppackage)

show help on all modules in the main package

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--helpshort`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_helpshort)

show help on only the main module for this program

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--helpxml`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_helpxml)

produce an xml version of help

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--log_link`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_link)

Put additional links to the log files in this directory

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--log_prefix`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_prefix)

Prepend the log prefix to the start of each log line

| Type    | bool                    |
| ------- | ----------------------- |
| Default | `true`                  |
| Tags    | runtime,advanced,stable |

 

#### [`--minloglevel`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_minloglevel)

Messages logged at a lower level than this don’t actually get logged anywhere

| Type    | int32                   |
| ------- | ----------------------- |
| Default | `0`                     |
| Tags    | runtime,advanced,stable |

 

#### [`--stderrthreshold`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_stderrthreshold)

log messages at or above this level are copied to stderr in addition to logfiles. This flag obsoletes --alsologtostderr.

| Type    | int32                   |
| ------- | ----------------------- |
| Default | `2`                     |
| Tags    | runtime,advanced,stable |

 

#### [`--stop_logging_if_full_disk`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_stop_logging_if_full_disk)

Stop attempting to log to disk if the disk is full.

| Type    | bool                    |
| ------- | ----------------------- |
| Default | `false`                 |
| Tags    | runtime,advanced,stable |

 

#### [`--symbolize_stacktrace`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_symbolize_stacktrace)

Symbolize the stack trace in the tombstone

| Type    | bool                    |
| ------- | ----------------------- |
| Default | `true`                  |
| Tags    | runtime,advanced,stable |

 

#### [`--v`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_v)

Show all VLOG(m) messages for m ⇐ this. Overridable by --vmodule.

| Type    | int32                   |
| ------- | ----------------------- |
| Default | `0`                     |
| Tags    | runtime,advanced,stable |

 

#### [`--vmodule`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_vmodule)

per-module verbose level. Argument is a comma-separated list of <module name>=<log level>. <module name> is a glob pattern, matched against the filename base (that is, name ignoring .cc/.h./-inl.h). <log level> overrides any value given by --v.

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

### [Evolving Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_evolving)

Flags tagged `evolving` (or not tagged with a stability tag) are not yet considered final, and while they may be useful for tuning, they are subject to being changed or removed without notice.

#### [`--cfile_verify_checksums`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_cfile_verify_checksums)

Verify the checksum for each block on read if one exists

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | evolving |

 

#### [`--cfile_default_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_cfile_default_block_size)

The default block size to use in cfiles

| Type    | int32    |
| ------- | -------- |
| Default | `262144` |
| Tags    | advanced |

 

#### [`--cfile_default_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_cfile_default_compression_codec)

Default cfile block compression codec.

| Type    | string   |
| ------- | -------- |
| Default | `none`   |
| Tags    | advanced |

 

#### [`--cfile_write_checksums`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_cfile_write_checksums)

Write CRC32 checksums for each block

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | evolving |

 

#### [`--max_clock_sync_error_usec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_clock_sync_error_usec)

Maximum allowed clock synchronization error as reported by NTP before the server will abort.

| Type    | int32            |
| ------- | ---------------- |
| Default | `10000000`       |
| Tags    | runtime,advanced |

 

#### [`--consensus_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_consensus_rpc_timeout_ms)

Timeout used for all consensus internal RPC communications.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

 

#### [`--consensus_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_consensus_max_batch_size_bytes)

The maximum per-tablet RPC batch size when updating peers.

| Type    | int32     |
| ------- | --------- |
| Default | `1048576` |
| Tags    | advanced  |

 

#### [`--follower_unavailable_considered_failed_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_follower_unavailable_considered_failed_sec)

Seconds that a leader is unable to successfully heartbeat to a follower after which the follower is considered to be failed and evicted from the config.

| Type    | int32    |
| ------- | -------- |
| Default | `300`    |
| Tags    | advanced |

 

#### [`--fs_wal_dir_reserved_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fs_wal_dir_reserved_bytes)

Number of bytes to reserve on the log directory filesystem for non-Kudu usage. The default, which is represented by -1, is that 1% of the disk space on each disk will be reserved. Any other value specified represents the number of bytes reserved and must be greater than or equal to 0. Explicit percentages to reserve are not currently supported

| Type    | int64            |
| ------- | ---------------- |
| Default | `-1`             |
| Tags    | evolving,runtime |

 

#### [`--group_commit_queue_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_group_commit_queue_size_bytes)

Maximum size of the group commit queue in bytes

| Type    | int32     |
| ------- | --------- |
| Default | `4194304` |
| Tags    | advanced  |

 

#### [`--log_min_segments_to_retain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_min_segments_to_retain)

The minimum number of past log segments to keep at all times, regardless of what is required for durability. Must be at least 1.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1`              |
| Tags    | advanced,runtime |

 

#### [`--global_log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_global_log_cache_size_limit_mb)

Server-wide version of 'log_cache_size_limit_mb'. The total memory used for caching log entries across all tablets is kept under this threshold.

| Type    | int32    |
| ------- | -------- |
| Default | `1024`   |
| Tags    | advanced |

 

#### [`--log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_cache_size_limit_mb)

The total per-tablet size of consensus entries which may be kept in memory. The log cache attempts to keep all entries which have not yet been replicated to all followers in memory, but if the total size of those entries exceeds this limit within an individual tablet, the oldest will be evicted.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

 

#### [`--log_async_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_async_preallocate_segments)

Whether the WAL segments preallocation should happen asynchronously

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--log_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_preallocate_segments)

Whether the WAL should preallocate the entire segment before writing to it

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--log_segment_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_segment_size_mb)

The default size for log segments, in MB

| Type    | int32    |
| ------- | -------- |
| Default | `8`      |
| Tags    | advanced |

 

#### [`--evict_failed_followers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_evict_failed_followers)

Whether to evict followers from the Raft config that have fallen too far behind the leader’s log to catch up normally or have been unreachable by the leader for longer than follower_unavailable_considered_failed_sec

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--leader_failure_max_missed_heartbeat_periods`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_leader_failure_max_missed_heartbeat_periods)

Maximum heartbeat periods that the leader can fail to heartbeat in before we consider the leader to be failed. The total failure timeout in milliseconds is raft_heartbeat_interval_ms times leader_failure_max_missed_heartbeat_periods. The value passed to this flag may be fractional.

| Type    | double   |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

 

#### [`--raft_heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_raft_heartbeat_interval_ms)

The heartbeat interval for Raft replication. The leader produces heartbeats to followers at this interval. The followers expect a heartbeat at this interval and consider a leader to have failed if it misses several in a row.

| Type    | int32    |
| ------- | -------- |
| Default | `500`    |
| Tags    | advanced |

 

#### [`--safe_time_advancement_without_writes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_safe_time_advancement_without_writes)

Whether to enable the advancement of "safe" time in the absense of write operations

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--block_manager_max_open_files`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_block_manager_max_open_files)

Maximum number of open file descriptors to be used for data blocks. If -1, Kudu will use 40% of its resource limit as per getrlimit(). This is a soft limit. It is an error to use a value of 0.

| Type    | int64             |
| ------- | ----------------- |
| Default | `-1`              |
| Tags    | evolving,advanced |

 

#### [`--fs_data_dirs_full_disk_cache_seconds`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fs_data_dirs_full_disk_cache_seconds)

Number of seconds we cache the full-disk status in the block manager. During this time, writes to the corresponding root path will not be attempted.

| Type    | int32             |
| ------- | ----------------- |
| Default | `30`              |
| Tags    | evolving,advanced |

 

#### [`--fs_data_dirs_reserved_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fs_data_dirs_reserved_bytes)

Number of bytes to reserve on each data directory filesystem for non-Kudu usage. The default, which is represented by -1, is that 1% of the disk space on each disk will be reserved. Any other value specified represents the number of bytes reserved and must be greater than or equal to 0. Explicit percentages to reserve are not currently supported

| Type    | int64            |
| ------- | ---------------- |
| Default | `-1`             |
| Tags    | evolving,runtime |

 

#### [`--fs_target_data_dirs_per_tablet`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_fs_target_data_dirs_per_tablet)

Indicates the target number of data dirs to spread each tablet’s data across. If greater than the number of data dirs available, data will be striped across those available. A value of 0 indicates striping should occur across all healthy data dirs. Using fewer data dirs per tablet means a single drive failure will be less likely to affect a given tablet.

| Type    | int32             |
| ------- | ----------------- |
| Default | `3`               |
| Tags    | evolving,advanced |

 

#### [`--block_manager`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_block_manager)

Which block manager to use for storage. Valid options are 'file' and 'log'.

| Type    | string   |
| ------- | -------- |
| Default | `log`    |
| Tags    | advanced |

 

#### [`--log_container_excess_space_before_cleanup_fraction`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_excess_space_before_cleanup_fraction)

Additional fraction of a log container’s calculated size that must be consumed on disk before the container is considered to be inconsistent and subject to excess space cleanup at block manager startup.

| Type    | double                |
| ------- | --------------------- |
| Default | `0.10000000000000001` |
| Tags    | advanced              |

 

#### [`--log_container_max_blocks`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_max_blocks)

Maximum number of blocks (soft) of a log container. Use 0 for no limit. Use -1 for no limit except in the case of a kernel bug with hole punching on ext4 (see KUDU-1508 for details).

| Type    | int64    |
| ------- | -------- |
| Default | `-1`     |
| Tags    | advanced |

 

#### [`--log_container_max_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_max_size)

Maximum size (soft) of a log container

| Type    | uint64        |
| ------- | ------------- |
| Default | `10737418240` |
| Tags    | advanced      |

 

#### [`--log_container_preallocate_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_preallocate_bytes)

Number of bytes to preallocate in a log container when creating new blocks. Set to 0 to disable preallocation

| Type    | uint64     |
| ------- | ---------- |
| Default | `33554432` |
| Tags    | advanced   |

 

#### [`--server_thread_pool_max_thread_count`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_server_thread_pool_max_thread_count)

Maximum number of threads to allow in each server-wide thread pool. If -1, Kudu will use 10% of its running thread per effective uid resource limit as per getrlimit(). It is an error to use a value of 0.

| Type    | int64             |
| ------- | ----------------- |
| Default | `-1`              |
| Tags    | evolving,advanced |

 

#### [`--default_num_replicas`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_default_num_replicas)

Default number of replicas for tables that do not have the num_replicas set.

| Type    | int32    |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

 

#### [`--master_ts_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_master_ts_rpc_timeout_ms)

Timeout used for the master→TS async rpc calls.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

 

#### [`--max_create_tablets_per_ts`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_create_tablets_per_ts)

The number of tablets per TS that can be requested for a new table.

| Type    | int32    |
| ------- | -------- |
| Default | `20`     |
| Tags    | advanced |

 

#### [`--table_locations_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_table_locations_ttl_ms)

Maximum time in milliseconds which clients may cache table locations. New range partitions may not be visible to existing client instances until after waiting for the ttl period.

| Type    | int32    |
| ------- | -------- |
| Default | `300000` |
| Tags    | advanced |

 

#### [`--tablet_creation_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_creation_timeout_ms)

Timeout used by the master when attempting to create tablet replicas during table creation.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

 

#### [`--unresponsive_ts_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_unresponsive_ts_rpc_timeout_ms)

After this amount of time, the master will stop attempting to contact a tablet server in order to perform operations such as deleting a tablet.

| Type    | int32     |
| ------- | --------- |
| Default | `3600000` |
| Tags    | advanced  |

 

#### [`--tserver_unresponsive_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tserver_unresponsive_timeout_ms)

The period of time that a Master can go without receiving a heartbeat from a tablet server before considering it unresponsive. Unresponsive servers are not selected when assigning replicas during table creation or re-replication.

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

 

#### [`--rpc_acceptor_listen_backlog`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_acceptor_listen_backlog)

Socket backlog parameter used when listening for RPC connections. This defines the maximum length to which the queue of pending TCP connections inbound to the RPC server may grow. If a connection request arrives when the queue is full, the client may receive an error. Higher values may help the server ride over bursts of new inbound connection requests.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

 

#### [`--rpc_encrypt_loopback_connections`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_encrypt_loopback_connections)

Whether to encrypt data transfer on RPC connections that stay within a single host. Encryption here is likely to offer no additional security benefit since only a local 'root' user could intercept the traffic, and wire encryption does not suitably protect against such an attacker.

| Type    | bool     |
| ------- | -------- |
| Default | `false`  |
| Tags    | advanced |

 

#### [`--rpc_callback_max_cycles`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_callback_max_cycles)

The maximum number of cycles for which an RPC callback should be allowed to run without emitting a warning. (Advanced debugging option)

| Type    | int64            |
| ------- | ---------------- |
| Default | `100000000`      |
| Tags    | runtime,advanced |

 

#### [`--remember_clients_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_remember_clients_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a client for the purpose of caching its responses. After this period without hearing from it, the client is no longer remembered and the memory occupied by its responses is reclaimed. Retries of requests older than 'remember_clients_ttl_ms' are treated as new ones.

| Type    | int64     |
| ------- | --------- |
| Default | `3600000` |
| Tags    | advanced  |

 

#### [`--remember_responses_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_remember_responses_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a response to a specific request for a client. After this period has elapsed, the response may have been garbage collected and the client might get a response indicating the request is STALE.

| Type    | int64    |
| ------- | -------- |
| Default | `600000` |
| Tags    | advanced |

 

#### [`--rpc_dump_all_traces`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_dump_all_traces)

If true, dump all RPC traces at INFO level

| Type    | bool             |
| ------- | ---------------- |
| Default | `false`          |
| Tags    | runtime,advanced |

 

#### [`--rpc_duration_too_long_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_duration_too_long_ms)

Threshold (in milliseconds) above which a RPC is considered too long and its duration and method name are logged at INFO level. The time measured is between when a RPC is accepted and when its call handler completes.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1000`           |
| Tags    | runtime,advanced |

 

#### [`--trusted_subnets`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_trusted_subnets)

A trusted subnet whitelist. If set explicitly, all unauthenticated or unencrypted connections are prohibited except the ones from the specified address blocks. Otherwise, private network (127.0.0.0/8, etc.) and local subnets of all local network interfaces will be used. Set it to '0.0.0.0/0' to allow unauthenticated/unencrypted connections from all remote IP addresses. However, if network access is not otherwise restricted by a firewall, malicious users may be able to gain unauthorized access.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16` |
| Tags    | evolving,advanced                                            |

 

#### [`--rpc_max_message_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_max_message_size)

The maximum size of a message that any RPC that the server will accept. Must be at least 1MB.

| Type    | int32            |
| ------- | ---------------- |
| Default | `52428800`       |
| Tags    | runtime,advanced |

 

#### [`--use_system_auth_to_local`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_use_system_auth_to_local)

When enabled, use the system krb5 library to map Kerberos principal names to local (short) usernames. If not enabled, the first component of the principal will be used as the short name. For example, 'kudu/foo.example.com@EXAMPLE' will map to 'kudu'.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--web_log_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_web_log_bytes)

The maximum number of bytes to display on the debug webserver’s log page

| Type    | int64            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

 

#### [`--rpc_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_advertised_addresses)

Comma-separated list of addresses to advertise externally for RPC connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound RPC addresses specified in --rpc_bind_addresses are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--rpc_num_acceptors_per_address`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_num_acceptors_per_address)

Number of RPC acceptor threads for each bound address

| Type    | int32    |
| ------- | -------- |
| Default | `1`      |
| Tags    | advanced |

 

#### [`--rpc_num_service_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_num_service_threads)

Number of RPC worker threads to run

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

 

#### [`--rpc_service_queue_length`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_service_queue_length)

Default length of queue for incoming RPC requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

 

#### [`--max_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_negotiation_threads)

Maximum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

 

#### [`--min_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_min_negotiation_threads)

Minimum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

 

#### [`--num_reactor_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_num_reactor_threads)

Number of libev reactor threads to start.

| Type    | int32    |
| ------- | -------- |
| Default | `4`      |
| Tags    | advanced |

 

#### [`--rpc_authentication`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_authentication)

Whether to require RPC connections to authenticate. Must be one of 'disabled', 'optional', or 'required'. If 'optional', authentication will be used when the remote end supports it. If 'required', connections which are not able to authenticate (because the remote end lacks support) are rejected. Secure clusters should use 'required'.

| Type    | string     |
| ------- | ---------- |
| Default | `optional` |
| Tags    | evolving   |

 

#### [`--rpc_default_keepalive_time_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_default_keepalive_time_ms)

If an RPC connection from a client is idle for this amount of time, the server will disconnect the client. Setting this to any negative value keeps connections always alive.

| Type    | int32    |
| ------- | -------- |
| Default | `65000`  |
| Tags    | advanced |

 

#### [`--rpc_encryption`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_encryption)

Whether to require RPC connections to be encrypted. Must be one of 'disabled', 'optional', or 'required'. If 'optional', encryption will be used when the remote end supports it. If 'required', connections which are not able to use encryption (because the remote end lacks support) are rejected. If 'disabled', encryption will not be used, and RPC authentication (--rpc_authentication) must also be disabled as well. Secure clusters should use 'required'.

| Type    | string     |
| ------- | ---------- |
| Default | `optional` |
| Tags    | evolving   |

 

#### [`--rpc_negotiation_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_negotiation_timeout_ms)

Timeout for negotiating an RPC connection.

| Type    | int64            |
| ------- | ---------------- |
| Default | `3000`           |
| Tags    | runtime,advanced |

 

#### [`--rpc_private_key_password_cmd`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_private_key_password_cmd)

A Unix command whose output returns the password used to decrypt the RPC server’s private key file specified in --rpc_private_key_file. If the .PEM key file is not password-protected, this flag does not need to be set. Trailing whitespace will be trimmed before it is used to decrypt the private key.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

 

#### [`--rpc_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_tls_ciphers)

The cipher suite preferences to use for TLS-secured RPC connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

 

#### [`--rpc_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_tls_min_protocol)

The minimum protocol version to allow when for securing RPC connections with TLS. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

 

#### [`--webserver_enabled`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_enabled)

Whether to enable the web server on this daemon. NOTE: disabling the web server is also likely to prevent monitoring systems from properly capturing metrics.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--metrics_log_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_metrics_log_interval_ms)

Interval (in milliseconds) at which the server will dump its metrics to a local log file. The log files are located in the same directory as specified by the -log_dir flag. If this is not a positive value, then metrics logging will be disabled.

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

 

#### [`--webserver_max_post_length_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_max_post_length_bytes)

The maximum length of a POST request that will be accepted by the embedded web server.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

 

#### [`--webserver_x_frame_options`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_x_frame_options)

The webserver will add an 'X-Frame-Options' HTTP header with this value to all responses. This can help prevent clickjacking attacks.

| Type    | string   |
| ------- | -------- |
| Default | `DENY`   |
| Tags    | advanced |

 

#### [`--webserver_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_advertised_addresses)

Comma-separated list of addresses to advertise externally for HTTP(S) connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound webserver address specified in --webserver_interface and --webserver_port are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--webserver_authentication_domain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_authentication_domain)

Domain used for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

 

#### [`--webserver_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_doc_root)

Files under <webserver_doc_root> are accessible via the debug webserver. Defaults to $KUDU_HOME/www, or if $KUDU_HOME is not set, disables the document root

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--webserver_enable_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_enable_doc_root)

If true, webserver may serve static files from the webserver_doc_root

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--webserver_interface`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_interface)

Interface to start debug webserver on. If blank, webserver binds to 0.0.0.0

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--webserver_num_worker_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_num_worker_threads)

Maximum number of threads to start for handling web server requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

 

#### [`--webserver_password_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_password_file)

(Optional) Location of .htpasswd file containing user names and hashed passwords for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

 

#### [`--webserver_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_tls_ciphers)

The cipher suite preferences to use for webserver HTTPS connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

 

#### [`--webserver_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_tls_min_protocol)

The minimum protocol version to allow when for webserver HTTPS connections. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

 

#### [`--compaction_minimum_improvement`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_compaction_minimum_improvement)

The minimum quality for a compaction to run. If a compaction does not improve the average height of DiskRowSets by at least this amount, the compaction will be considered ineligible.

| Type    | double                  |
| ------- | ----------------------- |
| Default | `0.0099999997764825821` |
| Tags    |                         |

 

#### [`--enable_undo_delta_block_gc`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_enable_undo_delta_block_gc)

Whether to enable undo delta block garbage collection. This only affects the undo delta block deletion background task, and doesn’t control whether compactions delete ancient history. To change what is considered ancient history use --tablet_history_max_age_sec

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | evolving |

 

#### [`--tablet_bloom_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_bloom_block_size)

Block size of the bloom filters used for tablet keys.

| Type    | int32    |
| ------- | -------- |
| Default | `4096`   |
| Tags    | advanced |

 

#### [`--tablet_bloom_target_fp_rate`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_bloom_target_fp_rate)

Target false-positive rate (between 0 and 1) to size tablet key bloom filters. A lower false positive rate may reduce the number of disk seeks required in heavy insert workloads, at the expense of more space and RAM required for bloom filters.

| Type    | double                   |
| ------- | ------------------------ |
| Default | `9.9999997473787516e-05` |
| Tags    | advanced                 |

 

#### [`--tablet_history_max_age_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_history_max_age_sec)

Number of seconds to retain tablet history. Reads initiated at a snapshot that is older than this age will be rejected. To disable history removal, set to -1.

| Type    | int32    |
| ------- | -------- |
| Default | `900`    |
| Tags    | advanced |

 

#### [`--undo_delta_block_gc_init_budget_millis`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_undo_delta_block_gc_init_budget_millis)

The maximum number of milliseconds we will spend initializing UNDO delta blocks per invocation of UndoDeltaBlockGCOp. Existing delta blocks must be initialized once per process startup to determine when they can be deleted.

| Type    | int32             |
| ------- | ----------------- |
| Default | `1000`            |
| Tags    | advanced,evolving |

 

#### [`--tablet_transaction_memory_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_transaction_memory_limit_mb)

Maximum amount of memory that may be consumed by all in-flight transactions belonging to a particular tablet. When this limit is reached, new transactions will be rejected and clients will be forced to retry them. If -1, transaction memory tracking is disabled.

| Type    | int64    |
| ------- | -------- |
| Default | `64`     |
| Tags    | advanced |

 

#### [`--heartbeat_incompatible_replica_management_is_fatal`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_incompatible_replica_management_is_fatal)

Whether incompatible replica management schemes or unsupported PREPARE_REPLACEMENT_BEFORE_EVICTION feature flag by master are fatal

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

 

#### [`--heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_interval_ms)

Interval at which the TS heartbeats to the master.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

 

#### [`--heartbeat_max_failures_before_backoff`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_max_failures_before_backoff)

Maximum number of consecutive heartbeat failures until the Tablet Server backs off to the normal heartbeat interval, rather than retrying.

| Type    | int32    |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

 

#### [`--heartbeat_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_rpc_timeout_ms)

Timeout used for the TS→Master heartbeat RPCs.

| Type    | int32    |
| ------- | -------- |
| Default | `15000`  |
| Tags    | advanced |

 

#### [`--scanner_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_ttl_ms)

Number of milliseconds of inactivity allowed for a scannerbefore it may be expired

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

 

#### [`--tablet_copy_idle_timeout_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_copy_idle_timeout_sec)

Amount of time without activity before a tablet copy session will expire, in seconds

| Type    | uint64            |
| ------- | ----------------- |
| Default | `600`             |
| Tags    | evolving,advanced |

 

#### [`--scanner_batch_size_rows`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_batch_size_rows)

The number of rows to batch for servicing scan requests.

| Type    | int32            |
| ------- | ---------------- |
| Default | `100`            |
| Tags    | runtime,advanced |

 

#### [`--scanner_default_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_default_batch_size_bytes)

The default size for batches of scan results

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

 

#### [`--scanner_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_max_batch_size_bytes)

The maximum batch size that a client may request for scan results.

| Type    | int32            |
| ------- | ---------------- |
| Default | `8388608`        |
| Tags    | runtime,advanced |

 

#### [`--scanner_max_wait_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_max_wait_ms)

The maximum amount of time (in milliseconds) we’ll hang a scanner thread waiting for safe time to advance or transactions to commit, even if its deadline allows waiting longer.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

 

#### [`--num_tablets_to_copy_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_num_tablets_to_copy_simultaneously)

Number of threads available to copy tablets from remote servers.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

 

#### [`--num_tablets_to_open_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_num_tablets_to_open_simultaneously)

Number of threads available to open tablets during startup. If this is set to 0 (the default), then the number of bootstrap threads will be set based on the number of data directories. If the data directories are on some very fast storage device such as SSD or a RAID array, it may make sense to manually tune this.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

 

#### [`--tablet_state_walk_min_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_state_walk_min_period_ms)

Minimum amount of time in milliseconds between walks of the tablet map to update tablet state counts.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

 

#### [`--env_use_fsync`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_env_use_fsync)

Use fsync(2) instead of fdatasync(2) for synchronizing dirty data to disk.

| Type    | bool              |
| ------- | ----------------- |
| Default | `false`           |
| Tags    | evolving,advanced |

 

#### [`--file_cache_expiry_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_file_cache_expiry_period_ms)

Period of time (in ms) between removing expired file cache descriptors

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

 

#### [`--disable_core_dumps`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_disable_core_dumps)

Disable core dumps when this process crashes.

| Type    | bool              |
| ------- | ----------------- |
| Default | `false`           |
| Tags    | evolving,advanced |

 

#### [`--redact`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_redact)

Comma-separated list that controls redaction context. Supported options are 'all','log', and 'none'. If 'all' is specified, sensitive data (sensitive configuration flags and row data) will be redacted from the web UI as well as glog and error messages. If 'log' is specified, sensitive data will only be redacted from glog and error messages. If 'none' is specified, no redaction will occur.

| Type    | string            |
| ------- | ----------------- |
| Default | `all`             |
| Tags    | evolving,advanced |

 

#### [`--umask`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_umask)

The umask that will be used when creating files and directories. Permissions of top-level data directories will also be modified at start-up to conform to the given umask. Changing this value may enable unauthorized local users to read or modify data stored by Kudu.

| Type    | string   |
| ------- | -------- |
| Default | `077`    |
| Tags    | advanced |

 

#### [`--metrics_retirement_age_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_metrics_retirement_age_ms)

The minimum number of milliseconds a metric will be kept for after it is no longer active. (Advanced option)

| Type    | int32            |
| ------- | ---------------- |
| Default | `120000`         |
| Tags    | advanced,runtime |

 

#### [`--enable_minidumps`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_enable_minidumps)

Whether to enable minidump generation upon process crash or SIGUSR1. Currently only supported on Linux systems.

| Type    | bool              |
| ------- | ----------------- |
| Default | `true`            |
| Tags    | evolving,advanced |

 

#### [`--max_minidumps`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_minidumps)

Maximum number of minidump files to keep per daemon. Older files are removed first. Set to 0 to keep all minidump files.

| Type    | int32    |
| ------- | -------- |
| Default | `9`      |
| Tags    | evolving |

 

#### [`--minidump_path`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_minidump_path)

Directory to write minidump files to. This can be either an absolute path or a path relative to --log_dir. Each daemon will create an additional sub-directory to prevent naming conflicts and to make it easier to identify a crashing daemon. Minidump files contain crash-related information in a compressed format. Minidumps will be written when a daemon exits unexpectedly, for example on an unhandled exception or signal, or when a SIGUSR1 signal is sent to the process. Cannot be set to an empty value.

| Type    | string      |
| ------- | ----------- |
| Default | `minidumps` |
| Tags    | evolving    |

 

#### [`--minidump_size_limit_hint_kb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_minidump_size_limit_hint_kb)

Size limit hint for minidump files in KB. If a minidump exceeds this value, then breakpad will reduce the stack memory it collects for each thread from 8KB to 2KB. However it will always include the full stack memory for the first 20 threads, including the thread that crashed.

| Type    | int32             |
| ------- | ----------------- |
| Default | `20480`           |
| Tags    | evolving,advanced |

 

#### [`--memory_limit_soft_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_memory_limit_soft_percentage)

Percentage of the hard memory limit that this daemon may consume before memory throttling of writes begins. The greater the excess, the higher the chance of throttling. In general, a lower soft limit leads to smoother write latencies but decreased throughput, and vice versa for a higher soft limit.

| Type    | int32    |
| ------- | -------- |
| Default | `80`     |
| Tags    | advanced |

 

#### [`--memory_limit_warn_threshold_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_memory_limit_warn_threshold_percentage)

Percentage of the hard memory limit that this daemon may consume before WARNING level messages are periodically logged.

| Type    | int32    |
| ------- | -------- |
| Default | `98`     |
| Tags    | advanced |

 

#### [`--memory_pressure_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_memory_pressure_percentage)

Percentage of the hard memory limit that this daemon may consume before flushing of in-memory data becomes prioritized.

| Type    | int32    |
| ------- | -------- |
| Default | `60`     |
| Tags    | advanced |

 

#### [`--tcmalloc_max_free_bytes_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tcmalloc_max_free_bytes_percentage)

Maximum percentage of the RSS that tcmalloc is allowed to use for reserved but unallocated memory.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

 

#### [`--drop_log_memory`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_drop_log_memory)

Drop in-memory buffers of log contents. Logs can grow very quickly and they are rarely read before they need to be evicted from memory. Instead, drop them from memory as soon as they are flushed to disk.

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

 

#### [`--log_backtrace_at`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_backtrace_at)

Emit a backtrace when logging at file:linenum.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--logbuflevel`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_logbuflevel)

Buffer log messages logged at this level or lower (-1 means don’t buffer; 0 means buffer INFO only; …)

| Type    | int32            |
| ------- | ---------------- |
| Default | `0`              |
| Tags    | runtime,advanced |

 

#### [`--logbufsecs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_logbufsecs)

Buffer log messages for at most this many seconds

| Type    | int32            |
| ------- | ---------------- |
| Default | `5`              |
| Tags    | runtime,advanced |

 

#### [`--logfile_mode`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_logfile_mode)

Log file mode/permissions.

| Type    | int32 |
| ------- | ----- |
| Default | `436` |
| Tags    |       |

 

------

## [`kudu-tserver` Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_supported)

### [Stable Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_stable)

Flags tagged `stable` and not `advanced` are safe to use for common configuration tasks.

#### [`--block_cache_capacity_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_block_cache_capacity_mb)

block cache capacity in MB

| Type    | int64  |
| ------- | ------ |
| Default | `512`  |
| Tags    | stable |

 

#### [`--log_force_fsync_all`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_force_fsync_all)

Whether the Log/WAL should explicitly call fsync() after each write.

| Type    | bool    |
| ------- | ------- |
| Default | `false` |
| Tags    | stable  |

 

#### [`--fs_data_dirs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fs_data_dirs)

Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--fs_metadata_dir`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fs_metadata_dir)

Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--fs_wal_dir`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fs_wal_dir)

Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--rpc_bind_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_bind_addresses)

Comma-separated list of addresses to bind to for RPC connections. Currently, ephemeral ports (i.e. port 0) are not allowed.

| Type    | string    |
| ------- | --------- |
| Default | `0.0.0.0` |
| Tags    | stable    |

 

#### [`--keytab_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_keytab_file)

Path to the Kerberos Keytab file for this server. Specifying a keytab file will cause the server to kinit, and enable Kerberos to be used to authenticate RPC connections.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--superuser_acl`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_superuser_acl)

The list of usernames to allow as super users, comma-separated. A '*' entry indicates that all authenticated users are allowed. If this is left unset or blank, the default behavior is that the identity of the daemon itself determines the superuser. If the daemon is logged in from a Keytab, then the local username from the Kerberos principal is used; otherwise, the local Unix username is used.

| Type    | string           |
| ------- | ---------------- |
| Default | none             |
| Tags    | sensitive,stable |

 

#### [`--user_acl`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_user_acl)

The list of usernames who may access the cluster, comma-separated. A '*' entry indicates that all authenticated users are allowed.

| Type    | string           |
| ------- | ---------------- |
| Default | `*`              |
| Tags    | sensitive,stable |

 

#### [`--webserver_certificate_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_certificate_file)

The location of the debug webserver’s SSL certificate file, in PEM format. If empty, webserver SSL support is not enabled. If --webserver_private_key_file is set, this option must be set as well.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--webserver_port`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_port)

Port to bind to for the web server

| Type    | int32  |
| ------- | ------ |
| Default | `0`    |
| Tags    | stable |

 

#### [`--webserver_private_key_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_private_key_file)

The full path to the private key used as a counterpart to the public key contained in --webserver_certificate_file. If --webserver_certificate_file is set, this option must be set as well.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--webserver_private_key_password_cmd`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_private_key_password_cmd)

A Unix command whose output returns the password used to decrypt the Webserver’s certificate private key file specified in --webserver_private_key_file. If the PEM key file is not password-protected, this flag does not need to be set. Trailing whitespace will be trimmed before it is used to decrypt the private key

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--tserver_master_addrs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tserver_master_addrs)

Comma separated addresses of the masters which the tablet server should connect to. The masters do not read this flag — configure the masters separately using 'rpc_bind_addresses'.

| Type    | string           |
| ------- | ---------------- |
| Default | `127.0.0.1:7051` |
| Tags    | stable           |

 

#### [`--log_filename`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_filename)

Prefix of log filename - full path is <log_dir>/<log_filename>.[INFO|WARN|ERROR|FATAL]

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--maintenance_manager_num_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_maintenance_manager_num_threads)

Size of the maintenance manager thread pool. For spinning disks, the number of threads should not be above the number of devices.

| Type    | int32  |
| ------- | ------ |
| Default | `1`    |
| Tags    | stable |

 

#### [`--memory_limit_hard_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_memory_limit_hard_bytes)

Maximum amount of memory this daemon should use, in bytes. A value of 0 autosizes based on the total system memory. A value of -1 disables all memory limiting.

| Type    | int64  |
| ------- | ------ |
| Default | `0`    |
| Tags    | stable |

 

#### [`--flagfile`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_flagfile)

load flags from file

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--help`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_help)

show help on all flags [tip: all flags can have two dashes]

| Type    | bool    |
| ------- | ------- |
| Default | `false` |
| Tags    | stable  |

 

#### [`--version`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_version)

show version and build info and exit

| Type    | bool    |
| ------- | ------- |
| Default | `false` |
| Tags    | stable  |

 

#### [`--colorlogtostderr`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_colorlogtostderr)

color messages logged to stderr (if supported by terminal)

| Type    | bool           |
| ------- | -------------- |
| Default | `false`        |
| Tags    | runtime,stable |

 

#### [`--log_dir`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_dir)

If specified, logfiles are written into this directory instead of the default logging directory.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    | stable |

 

#### [`--logtostderr`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_logtostderr)

log messages go to stderr instead of logfiles

| Type    | bool           |
| ------- | -------------- |
| Default | `false`        |
| Tags    | runtime,stable |

 

#### [`--max_log_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_max_log_size)

approx. maximum log file size (in MB). A value of 0 will be silently overridden to 1.

| Type    | int32          |
| ------- | -------------- |
| Default | `1800`         |
| Tags    | runtime,stable |

 

### [Stable, Advanced Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_stable_advanced)

Flags tagged `stable` and `advanced` are supported, but should be considered "expert" options and should be used carefully and after thorough testing.

#### [`--enable_process_lifetime_heap_profiling`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_enable_process_lifetime_heap_profiling)

Enables heap profiling for the lifetime of the process. Profile output will be stored in the directory specified by -heap_profile_path.

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--heap_profile_path`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heap_profile_path)

Output path to store heap profiles. If not set profiles are stored in /tmp/<process-name>.<pid>.<n>.heap.

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--unlock_experimental_flags`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_unlock_experimental_flags)

Unlock flags marked as 'experimental'. These flags are not guaranteed to be maintained across releases of Kudu, and may enable features or behavior known to be unstable. Use at your own risk.

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | stable,advanced |

 

#### [`--unlock_unsafe_flags`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_unlock_unsafe_flags)

Unlock flags marked as 'unsafe'. These flags are not guaranteed to be maintained across releases of Kudu, and enable features or behavior known to be unsafe. Use at your own risk.

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | stable,advanced |

 

#### [`--fromenv`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fromenv)

set flags from the environment [use 'export FLAGS_flag1=value']

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--tryfromenv`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tryfromenv)

set flags from the environment if present

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--undefok`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_undefok)

comma-separated list of flag names that it is okay to specify on the command line even if the program does not define a flag with that name. IMPORTANT: flags in this list that have arguments MUST use the flag=value format

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--helpmatch`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_helpmatch)

show help on modules whose name contains the specified substr

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--helpon`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_helpon)

show help on the modules named by this flag value

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--helppackage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_helppackage)

show help on all modules in the main package

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--helpshort`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_helpshort)

show help on only the main module for this program

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--helpxml`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_helpxml)

produce an xml version of help

| Type    | bool            |
| ------- | --------------- |
| Default | `false`         |
| Tags    | advanced,stable |

 

#### [`--log_link`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_link)

Put additional links to the log files in this directory

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

#### [`--log_prefix`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_prefix)

Prepend the log prefix to the start of each log line

| Type    | bool                    |
| ------- | ----------------------- |
| Default | `true`                  |
| Tags    | runtime,advanced,stable |

 

#### [`--minloglevel`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_minloglevel)

Messages logged at a lower level than this don’t actually get logged anywhere

| Type    | int32                   |
| ------- | ----------------------- |
| Default | `0`                     |
| Tags    | runtime,advanced,stable |

 

#### [`--stderrthreshold`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_stderrthreshold)

log messages at or above this level are copied to stderr in addition to logfiles. This flag obsoletes --alsologtostderr.

| Type    | int32                   |
| ------- | ----------------------- |
| Default | `2`                     |
| Tags    | runtime,advanced,stable |

 

#### [`--stop_logging_if_full_disk`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_stop_logging_if_full_disk)

Stop attempting to log to disk if the disk is full.

| Type    | bool                    |
| ------- | ----------------------- |
| Default | `false`                 |
| Tags    | runtime,advanced,stable |

 

#### [`--symbolize_stacktrace`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_symbolize_stacktrace)

Symbolize the stack trace in the tombstone

| Type    | bool                    |
| ------- | ----------------------- |
| Default | `true`                  |
| Tags    | runtime,advanced,stable |

 

#### [`--v`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_v)

Show all VLOG(m) messages for m ⇐ this. Overridable by --vmodule.

| Type    | int32                   |
| ------- | ----------------------- |
| Default | `0`                     |
| Tags    | runtime,advanced,stable |

 

#### [`--vmodule`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_vmodule)

per-module verbose level. Argument is a comma-separated list of <module name>=<log level>. <module name> is a glob pattern, matched against the filename base (that is, name ignoring .cc/.h./-inl.h). <log level> overrides any value given by --v.

| Type    | string          |
| ------- | --------------- |
| Default | none            |
| Tags    | advanced,stable |

 

### [Evolving Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_evolving)

Flags tagged `evolving` (or not tagged with a stability tag) are not yet considered final, and while they may be useful for tuning, they are subject to being changed or removed without notice.

#### [`--cfile_verify_checksums`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_cfile_verify_checksums)

Verify the checksum for each block on read if one exists

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | evolving |

 

#### [`--cfile_default_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_cfile_default_block_size)

The default block size to use in cfiles

| Type    | int32    |
| ------- | -------- |
| Default | `262144` |
| Tags    | advanced |

 

#### [`--cfile_default_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_cfile_default_compression_codec)

Default cfile block compression codec.

| Type    | string   |
| ------- | -------- |
| Default | `none`   |
| Tags    | advanced |

 

#### [`--cfile_write_checksums`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_cfile_write_checksums)

Write CRC32 checksums for each block

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | evolving |

 

#### [`--max_clock_sync_error_usec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_max_clock_sync_error_usec)

Maximum allowed clock synchronization error as reported by NTP before the server will abort.

| Type    | int32            |
| ------- | ---------------- |
| Default | `10000000`       |
| Tags    | runtime,advanced |

 

#### [`--consensus_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_consensus_rpc_timeout_ms)

Timeout used for all consensus internal RPC communications.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

 

#### [`--consensus_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_consensus_max_batch_size_bytes)

The maximum per-tablet RPC batch size when updating peers.

| Type    | int32     |
| ------- | --------- |
| Default | `1048576` |
| Tags    | advanced  |

 

#### [`--follower_unavailable_considered_failed_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_follower_unavailable_considered_failed_sec)

Seconds that a leader is unable to successfully heartbeat to a follower after which the follower is considered to be failed and evicted from the config.

| Type    | int32    |
| ------- | -------- |
| Default | `300`    |
| Tags    | advanced |

 

#### [`--fs_wal_dir_reserved_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fs_wal_dir_reserved_bytes)

Number of bytes to reserve on the log directory filesystem for non-Kudu usage. The default, which is represented by -1, is that 1% of the disk space on each disk will be reserved. Any other value specified represents the number of bytes reserved and must be greater than or equal to 0. Explicit percentages to reserve are not currently supported

| Type    | int64            |
| ------- | ---------------- |
| Default | `-1`             |
| Tags    | evolving,runtime |

 

#### [`--group_commit_queue_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_group_commit_queue_size_bytes)

Maximum size of the group commit queue in bytes

| Type    | int32     |
| ------- | --------- |
| Default | `4194304` |
| Tags    | advanced  |

 

#### [`--log_min_segments_to_retain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_min_segments_to_retain)

The minimum number of past log segments to keep at all times, regardless of what is required for durability. Must be at least 1.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1`              |
| Tags    | advanced,runtime |

 

#### [`--global_log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_global_log_cache_size_limit_mb)

Server-wide version of 'log_cache_size_limit_mb'. The total memory used for caching log entries across all tablets is kept under this threshold.

| Type    | int32    |
| ------- | -------- |
| Default | `1024`   |
| Tags    | advanced |

 

#### [`--log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_cache_size_limit_mb)

The total per-tablet size of consensus entries which may be kept in memory. The log cache attempts to keep all entries which have not yet been replicated to all followers in memory, but if the total size of those entries exceeds this limit within an individual tablet, the oldest will be evicted.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

 

#### [`--log_async_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_async_preallocate_segments)

Whether the WAL segments preallocation should happen asynchronously

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--log_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_preallocate_segments)

Whether the WAL should preallocate the entire segment before writing to it

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--log_segment_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_segment_size_mb)

The default size for log segments, in MB

| Type    | int32    |
| ------- | -------- |
| Default | `8`      |
| Tags    | advanced |

 

#### [`--evict_failed_followers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_evict_failed_followers)

Whether to evict followers from the Raft config that have fallen too far behind the leader’s log to catch up normally or have been unreachable by the leader for longer than follower_unavailable_considered_failed_sec

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--leader_failure_max_missed_heartbeat_periods`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_leader_failure_max_missed_heartbeat_periods)

Maximum heartbeat periods that the leader can fail to heartbeat in before we consider the leader to be failed. The total failure timeout in milliseconds is raft_heartbeat_interval_ms times leader_failure_max_missed_heartbeat_periods. The value passed to this flag may be fractional.

| Type    | double   |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

 

#### [`--raft_heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_raft_heartbeat_interval_ms)

The heartbeat interval for Raft replication. The leader produces heartbeats to followers at this interval. The followers expect a heartbeat at this interval and consider a leader to have failed if it misses several in a row.

| Type    | int32    |
| ------- | -------- |
| Default | `500`    |
| Tags    | advanced |

 

#### [`--safe_time_advancement_without_writes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_safe_time_advancement_without_writes)

Whether to enable the advancement of "safe" time in the absense of write operations

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--block_manager_max_open_files`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_block_manager_max_open_files)

Maximum number of open file descriptors to be used for data blocks. If -1, Kudu will use 40% of its resource limit as per getrlimit(). This is a soft limit. It is an error to use a value of 0.

| Type    | int64             |
| ------- | ----------------- |
| Default | `-1`              |
| Tags    | evolving,advanced |

 

#### [`--fs_data_dirs_full_disk_cache_seconds`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fs_data_dirs_full_disk_cache_seconds)

Number of seconds we cache the full-disk status in the block manager. During this time, writes to the corresponding root path will not be attempted.

| Type    | int32             |
| ------- | ----------------- |
| Default | `30`              |
| Tags    | evolving,advanced |

 

#### [`--fs_data_dirs_reserved_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fs_data_dirs_reserved_bytes)

Number of bytes to reserve on each data directory filesystem for non-Kudu usage. The default, which is represented by -1, is that 1% of the disk space on each disk will be reserved. Any other value specified represents the number of bytes reserved and must be greater than or equal to 0. Explicit percentages to reserve are not currently supported

| Type    | int64            |
| ------- | ---------------- |
| Default | `-1`             |
| Tags    | evolving,runtime |

 

#### [`--fs_target_data_dirs_per_tablet`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_fs_target_data_dirs_per_tablet)

Indicates the target number of data dirs to spread each tablet’s data across. If greater than the number of data dirs available, data will be striped across those available. A value of 0 indicates striping should occur across all healthy data dirs. Using fewer data dirs per tablet means a single drive failure will be less likely to affect a given tablet.

| Type    | int32             |
| ------- | ----------------- |
| Default | `3`               |
| Tags    | evolving,advanced |

 

#### [`--block_manager`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_block_manager)

Which block manager to use for storage. Valid options are 'file' and 'log'.

| Type    | string   |
| ------- | -------- |
| Default | `log`    |
| Tags    | advanced |

 

#### [`--log_container_excess_space_before_cleanup_fraction`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_excess_space_before_cleanup_fraction)

Additional fraction of a log container’s calculated size that must be consumed on disk before the container is considered to be inconsistent and subject to excess space cleanup at block manager startup.

| Type    | double                |
| ------- | --------------------- |
| Default | `0.10000000000000001` |
| Tags    | advanced              |

 

#### [`--log_container_max_blocks`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_max_blocks)

Maximum number of blocks (soft) of a log container. Use 0 for no limit. Use -1 for no limit except in the case of a kernel bug with hole punching on ext4 (see KUDU-1508 for details).

| Type    | int64    |
| ------- | -------- |
| Default | `-1`     |
| Tags    | advanced |

 

#### [`--log_container_max_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_max_size)

Maximum size (soft) of a log container

| Type    | uint64        |
| ------- | ------------- |
| Default | `10737418240` |
| Tags    | advanced      |

 

#### [`--log_container_preallocate_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_preallocate_bytes)

Number of bytes to preallocate in a log container when creating new blocks. Set to 0 to disable preallocation

| Type    | uint64     |
| ------- | ---------- |
| Default | `33554432` |
| Tags    | advanced   |

 

#### [`--server_thread_pool_max_thread_count`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_server_thread_pool_max_thread_count)

Maximum number of threads to allow in each server-wide thread pool. If -1, Kudu will use 10% of its running thread per effective uid resource limit as per getrlimit(). It is an error to use a value of 0.

| Type    | int64             |
| ------- | ----------------- |
| Default | `-1`              |
| Tags    | evolving,advanced |

 

#### [`--rpc_acceptor_listen_backlog`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_acceptor_listen_backlog)

Socket backlog parameter used when listening for RPC connections. This defines the maximum length to which the queue of pending TCP connections inbound to the RPC server may grow. If a connection request arrives when the queue is full, the client may receive an error. Higher values may help the server ride over bursts of new inbound connection requests.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

 

#### [`--rpc_encrypt_loopback_connections`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_encrypt_loopback_connections)

Whether to encrypt data transfer on RPC connections that stay within a single host. Encryption here is likely to offer no additional security benefit since only a local 'root' user could intercept the traffic, and wire encryption does not suitably protect against such an attacker.

| Type    | bool     |
| ------- | -------- |
| Default | `false`  |
| Tags    | advanced |

 

#### [`--rpc_callback_max_cycles`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_callback_max_cycles)

The maximum number of cycles for which an RPC callback should be allowed to run without emitting a warning. (Advanced debugging option)

| Type    | int64            |
| ------- | ---------------- |
| Default | `100000000`      |
| Tags    | runtime,advanced |

 

#### [`--remember_clients_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_remember_clients_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a client for the purpose of caching its responses. After this period without hearing from it, the client is no longer remembered and the memory occupied by its responses is reclaimed. Retries of requests older than 'remember_clients_ttl_ms' are treated as new ones.

| Type    | int64     |
| ------- | --------- |
| Default | `3600000` |
| Tags    | advanced  |

 

#### [`--remember_responses_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_remember_responses_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a response to a specific request for a client. After this period has elapsed, the response may have been garbage collected and the client might get a response indicating the request is STALE.

| Type    | int64    |
| ------- | -------- |
| Default | `600000` |
| Tags    | advanced |

 

#### [`--rpc_dump_all_traces`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_dump_all_traces)

If true, dump all RPC traces at INFO level

| Type    | bool             |
| ------- | ---------------- |
| Default | `false`          |
| Tags    | runtime,advanced |

 

#### [`--rpc_duration_too_long_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_duration_too_long_ms)

Threshold (in milliseconds) above which a RPC is considered too long and its duration and method name are logged at INFO level. The time measured is between when a RPC is accepted and when its call handler completes.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1000`           |
| Tags    | runtime,advanced |

 

#### [`--trusted_subnets`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_trusted_subnets)

A trusted subnet whitelist. If set explicitly, all unauthenticated or unencrypted connections are prohibited except the ones from the specified address blocks. Otherwise, private network (127.0.0.0/8, etc.) and local subnets of all local network interfaces will be used. Set it to '0.0.0.0/0' to allow unauthenticated/unencrypted connections from all remote IP addresses. However, if network access is not otherwise restricted by a firewall, malicious users may be able to gain unauthorized access.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16` |
| Tags    | evolving,advanced                                            |

 

#### [`--rpc_max_message_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_max_message_size)

The maximum size of a message that any RPC that the server will accept. Must be at least 1MB.

| Type    | int32            |
| ------- | ---------------- |
| Default | `52428800`       |
| Tags    | runtime,advanced |

 

#### [`--use_system_auth_to_local`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_use_system_auth_to_local)

When enabled, use the system krb5 library to map Kerberos principal names to local (short) usernames. If not enabled, the first component of the principal will be used as the short name. For example, 'kudu/foo.example.com@EXAMPLE' will map to 'kudu'.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--web_log_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_web_log_bytes)

The maximum number of bytes to display on the debug webserver’s log page

| Type    | int64            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

 

#### [`--rpc_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_advertised_addresses)

Comma-separated list of addresses to advertise externally for RPC connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound RPC addresses specified in --rpc_bind_addresses are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--rpc_num_acceptors_per_address`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_num_acceptors_per_address)

Number of RPC acceptor threads for each bound address

| Type    | int32    |
| ------- | -------- |
| Default | `1`      |
| Tags    | advanced |

 

#### [`--rpc_num_service_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_num_service_threads)

Number of RPC worker threads to run

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

 

#### [`--rpc_service_queue_length`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_service_queue_length)

Default length of queue for incoming RPC requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

 

#### [`--max_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_max_negotiation_threads)

Maximum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

 

#### [`--min_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_min_negotiation_threads)

Minimum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

 

#### [`--num_reactor_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_num_reactor_threads)

Number of libev reactor threads to start.

| Type    | int32    |
| ------- | -------- |
| Default | `4`      |
| Tags    | advanced |

 

#### [`--rpc_authentication`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_authentication)

Whether to require RPC connections to authenticate. Must be one of 'disabled', 'optional', or 'required'. If 'optional', authentication will be used when the remote end supports it. If 'required', connections which are not able to authenticate (because the remote end lacks support) are rejected. Secure clusters should use 'required'.

| Type    | string     |
| ------- | ---------- |
| Default | `optional` |
| Tags    | evolving   |

 

#### [`--rpc_default_keepalive_time_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_default_keepalive_time_ms)

If an RPC connection from a client is idle for this amount of time, the server will disconnect the client. Setting this to any negative value keeps connections always alive.

| Type    | int32    |
| ------- | -------- |
| Default | `65000`  |
| Tags    | advanced |

 

#### [`--rpc_encryption`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_encryption)

Whether to require RPC connections to be encrypted. Must be one of 'disabled', 'optional', or 'required'. If 'optional', encryption will be used when the remote end supports it. If 'required', connections which are not able to use encryption (because the remote end lacks support) are rejected. If 'disabled', encryption will not be used, and RPC authentication (--rpc_authentication) must also be disabled as well. Secure clusters should use 'required'.

| Type    | string     |
| ------- | ---------- |
| Default | `optional` |
| Tags    | evolving   |

 

#### [`--rpc_negotiation_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_negotiation_timeout_ms)

Timeout for negotiating an RPC connection.

| Type    | int64            |
| ------- | ---------------- |
| Default | `3000`           |
| Tags    | runtime,advanced |

 

#### [`--rpc_private_key_password_cmd`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_private_key_password_cmd)

A Unix command whose output returns the password used to decrypt the RPC server’s private key file specified in --rpc_private_key_file. If the .PEM key file is not password-protected, this flag does not need to be set. Trailing whitespace will be trimmed before it is used to decrypt the private key.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

 

#### [`--rpc_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_tls_ciphers)

The cipher suite preferences to use for TLS-secured RPC connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

 

#### [`--rpc_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_tls_min_protocol)

The minimum protocol version to allow when for securing RPC connections with TLS. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

 

#### [`--webserver_enabled`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_enabled)

Whether to enable the web server on this daemon. NOTE: disabling the web server is also likely to prevent monitoring systems from properly capturing metrics.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--metrics_log_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_metrics_log_interval_ms)

Interval (in milliseconds) at which the server will dump its metrics to a local log file. The log files are located in the same directory as specified by the -log_dir flag. If this is not a positive value, then metrics logging will be disabled.

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

 

#### [`--webserver_max_post_length_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_max_post_length_bytes)

The maximum length of a POST request that will be accepted by the embedded web server.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

 

#### [`--webserver_x_frame_options`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_x_frame_options)

The webserver will add an 'X-Frame-Options' HTTP header with this value to all responses. This can help prevent clickjacking attacks.

| Type    | string   |
| ------- | -------- |
| Default | `DENY`   |
| Tags    | advanced |

 

#### [`--webserver_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_advertised_addresses)

Comma-separated list of addresses to advertise externally for HTTP(S) connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound webserver address specified in --webserver_interface and --webserver_port are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--webserver_authentication_domain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_authentication_domain)

Domain used for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

 

#### [`--webserver_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_doc_root)

Files under <webserver_doc_root> are accessible via the debug webserver. Defaults to $KUDU_HOME/www, or if $KUDU_HOME is not set, disables the document root

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--webserver_enable_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_enable_doc_root)

If true, webserver may serve static files from the webserver_doc_root

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

 

#### [`--webserver_interface`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_interface)

Interface to start debug webserver on. If blank, webserver binds to 0.0.0.0

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--webserver_num_worker_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_num_worker_threads)

Maximum number of threads to start for handling web server requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

 

#### [`--webserver_password_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_password_file)

(Optional) Location of .htpasswd file containing user names and hashed passwords for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

 

#### [`--webserver_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_tls_ciphers)

The cipher suite preferences to use for webserver HTTPS connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

 

#### [`--webserver_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_tls_min_protocol)

The minimum protocol version to allow when for webserver HTTPS connections. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

 

#### [`--compaction_minimum_improvement`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_compaction_minimum_improvement)

The minimum quality for a compaction to run. If a compaction does not improve the average height of DiskRowSets by at least this amount, the compaction will be considered ineligible.

| Type    | double                  |
| ------- | ----------------------- |
| Default | `0.0099999997764825821` |
| Tags    |                         |

 

#### [`--enable_undo_delta_block_gc`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_enable_undo_delta_block_gc)

Whether to enable undo delta block garbage collection. This only affects the undo delta block deletion background task, and doesn’t control whether compactions delete ancient history. To change what is considered ancient history use --tablet_history_max_age_sec

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | evolving |

 

#### [`--tablet_bloom_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_bloom_block_size)

Block size of the bloom filters used for tablet keys.

| Type    | int32    |
| ------- | -------- |
| Default | `4096`   |
| Tags    | advanced |

 

#### [`--tablet_bloom_target_fp_rate`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_bloom_target_fp_rate)

Target false-positive rate (between 0 and 1) to size tablet key bloom filters. A lower false positive rate may reduce the number of disk seeks required in heavy insert workloads, at the expense of more space and RAM required for bloom filters.

| Type    | double                   |
| ------- | ------------------------ |
| Default | `9.9999997473787516e-05` |
| Tags    | advanced                 |

 

#### [`--tablet_history_max_age_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_history_max_age_sec)

Number of seconds to retain tablet history. Reads initiated at a snapshot that is older than this age will be rejected. To disable history removal, set to -1.

| Type    | int32    |
| ------- | -------- |
| Default | `900`    |
| Tags    | advanced |

 

#### [`--undo_delta_block_gc_init_budget_millis`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_undo_delta_block_gc_init_budget_millis)

The maximum number of milliseconds we will spend initializing UNDO delta blocks per invocation of UndoDeltaBlockGCOp. Existing delta blocks must be initialized once per process startup to determine when they can be deleted.

| Type    | int32             |
| ------- | ----------------- |
| Default | `1000`            |
| Tags    | advanced,evolving |

 

#### [`--tablet_transaction_memory_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_transaction_memory_limit_mb)

Maximum amount of memory that may be consumed by all in-flight transactions belonging to a particular tablet. When this limit is reached, new transactions will be rejected and clients will be forced to retry them. If -1, transaction memory tracking is disabled.

| Type    | int64    |
| ------- | -------- |
| Default | `64`     |
| Tags    | advanced |

 

#### [`--heartbeat_incompatible_replica_management_is_fatal`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_incompatible_replica_management_is_fatal)

Whether incompatible replica management schemes or unsupported PREPARE_REPLACEMENT_BEFORE_EVICTION feature flag by master are fatal

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

 

#### [`--heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_interval_ms)

Interval at which the TS heartbeats to the master.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

 

#### [`--heartbeat_max_failures_before_backoff`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_max_failures_before_backoff)

Maximum number of consecutive heartbeat failures until the Tablet Server backs off to the normal heartbeat interval, rather than retrying.

| Type    | int32    |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

 

#### [`--heartbeat_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_rpc_timeout_ms)

Timeout used for the TS→Master heartbeat RPCs.

| Type    | int32    |
| ------- | -------- |
| Default | `15000`  |
| Tags    | advanced |

 

#### [`--scanner_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_ttl_ms)

Number of milliseconds of inactivity allowed for a scannerbefore it may be expired

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

 

#### [`--tablet_copy_idle_timeout_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_copy_idle_timeout_sec)

Amount of time without activity before a tablet copy session will expire, in seconds

| Type    | uint64            |
| ------- | ----------------- |
| Default | `600`             |
| Tags    | evolving,advanced |

 

#### [`--scanner_batch_size_rows`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_batch_size_rows)

The number of rows to batch for servicing scan requests.

| Type    | int32            |
| ------- | ---------------- |
| Default | `100`            |
| Tags    | runtime,advanced |

 

#### [`--scanner_default_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_default_batch_size_bytes)

The default size for batches of scan results

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

 

#### [`--scanner_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_max_batch_size_bytes)

The maximum batch size that a client may request for scan results.

| Type    | int32            |
| ------- | ---------------- |
| Default | `8388608`        |
| Tags    | runtime,advanced |

 

#### [`--scanner_max_wait_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_max_wait_ms)

The maximum amount of time (in milliseconds) we’ll hang a scanner thread waiting for safe time to advance or transactions to commit, even if its deadline allows waiting longer.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

 

#### [`--num_tablets_to_copy_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_num_tablets_to_copy_simultaneously)

Number of threads available to copy tablets from remote servers.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

 

#### [`--num_tablets_to_open_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_num_tablets_to_open_simultaneously)

Number of threads available to open tablets during startup. If this is set to 0 (the default), then the number of bootstrap threads will be set based on the number of data directories. If the data directories are on some very fast storage device such as SSD or a RAID array, it may make sense to manually tune this.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

 

#### [`--tablet_state_walk_min_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_state_walk_min_period_ms)

Minimum amount of time in milliseconds between walks of the tablet map to update tablet state counts.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

 

#### [`--env_use_fsync`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_env_use_fsync)

Use fsync(2) instead of fdatasync(2) for synchronizing dirty data to disk.

| Type    | bool              |
| ------- | ----------------- |
| Default | `false`           |
| Tags    | evolving,advanced |

 

#### [`--file_cache_expiry_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_file_cache_expiry_period_ms)

Period of time (in ms) between removing expired file cache descriptors

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

 

#### [`--disable_core_dumps`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_disable_core_dumps)

Disable core dumps when this process crashes.

| Type    | bool              |
| ------- | ----------------- |
| Default | `false`           |
| Tags    | evolving,advanced |

 

#### [`--redact`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_redact)

Comma-separated list that controls redaction context. Supported options are 'all','log', and 'none'. If 'all' is specified, sensitive data (sensitive configuration flags and row data) will be redacted from the web UI as well as glog and error messages. If 'log' is specified, sensitive data will only be redacted from glog and error messages. If 'none' is specified, no redaction will occur.

| Type    | string            |
| ------- | ----------------- |
| Default | `all`             |
| Tags    | evolving,advanced |

 

#### [`--umask`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_umask)

The umask that will be used when creating files and directories. Permissions of top-level data directories will also be modified at start-up to conform to the given umask. Changing this value may enable unauthorized local users to read or modify data stored by Kudu.

| Type    | string   |
| ------- | -------- |
| Default | `077`    |
| Tags    | advanced |

 

#### [`--metrics_retirement_age_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_metrics_retirement_age_ms)

The minimum number of milliseconds a metric will be kept for after it is no longer active. (Advanced option)

| Type    | int32            |
| ------- | ---------------- |
| Default | `120000`         |
| Tags    | advanced,runtime |

 

#### [`--enable_minidumps`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_enable_minidumps)

Whether to enable minidump generation upon process crash or SIGUSR1. Currently only supported on Linux systems.

| Type    | bool              |
| ------- | ----------------- |
| Default | `true`            |
| Tags    | evolving,advanced |

 

#### [`--max_minidumps`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_max_minidumps)

Maximum number of minidump files to keep per daemon. Older files are removed first. Set to 0 to keep all minidump files.

| Type    | int32    |
| ------- | -------- |
| Default | `9`      |
| Tags    | evolving |

 

#### [`--minidump_path`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_minidump_path)

Directory to write minidump files to. This can be either an absolute path or a path relative to --log_dir. Each daemon will create an additional sub-directory to prevent naming conflicts and to make it easier to identify a crashing daemon. Minidump files contain crash-related information in a compressed format. Minidumps will be written when a daemon exits unexpectedly, for example on an unhandled exception or signal, or when a SIGUSR1 signal is sent to the process. Cannot be set to an empty value.

| Type    | string      |
| ------- | ----------- |
| Default | `minidumps` |
| Tags    | evolving    |

 

#### [`--minidump_size_limit_hint_kb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_minidump_size_limit_hint_kb)

Size limit hint for minidump files in KB. If a minidump exceeds this value, then breakpad will reduce the stack memory it collects for each thread from 8KB to 2KB. However it will always include the full stack memory for the first 20 threads, including the thread that crashed.

| Type    | int32             |
| ------- | ----------------- |
| Default | `20480`           |
| Tags    | evolving,advanced |

 

#### [`--memory_limit_soft_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_memory_limit_soft_percentage)

Percentage of the hard memory limit that this daemon may consume before memory throttling of writes begins. The greater the excess, the higher the chance of throttling. In general, a lower soft limit leads to smoother write latencies but decreased throughput, and vice versa for a higher soft limit.

| Type    | int32    |
| ------- | -------- |
| Default | `80`     |
| Tags    | advanced |

 

#### [`--memory_limit_warn_threshold_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_memory_limit_warn_threshold_percentage)

Percentage of the hard memory limit that this daemon may consume before WARNING level messages are periodically logged.

| Type    | int32    |
| ------- | -------- |
| Default | `98`     |
| Tags    | advanced |

 

#### [`--memory_pressure_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_memory_pressure_percentage)

Percentage of the hard memory limit that this daemon may consume before flushing of in-memory data becomes prioritized.

| Type    | int32    |
| ------- | -------- |
| Default | `60`     |
| Tags    | advanced |

 

#### [`--tcmalloc_max_free_bytes_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tcmalloc_max_free_bytes_percentage)

Maximum percentage of the RSS that tcmalloc is allowed to use for reserved but unallocated memory.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

 

#### [`--drop_log_memory`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_drop_log_memory)

Drop in-memory buffers of log contents. Logs can grow very quickly and they are rarely read before they need to be evicted from memory. Instead, drop them from memory as soon as they are flushed to disk.

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

 

#### [`--log_backtrace_at`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_backtrace_at)

Emit a backtrace when logging at file:linenum.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

 

#### [`--logbuflevel`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_logbuflevel)

Buffer log messages logged at this level or lower (-1 means don’t buffer; 0 means buffer INFO only; …)

| Type    | int32            |
| ------- | ---------------- |
| Default | `0`              |
| Tags    | runtime,advanced |

 

#### [`--logbufsecs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_logbufsecs)

Buffer log messages for at most this many seconds

| Type    | int32            |
| ------- | ---------------- |
| Default | `5`              |
| Tags    | runtime,advanced |

 

#### [`--logfile_mode`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_logfile_mode)

Log file mode/permissions.

| Type    | int32 |
| ------- | ----- |
| Default | `436` |
| Tags    |       |

 

------

## [Apache Kudu Unsupported Configuration Flags](http://kudu.apache.org/docs/configuration_reference.html#configuration_reference_unsupported)

|      | These flags are unsupported and are included for informational purposes only. They are subject to being changed or removed at any time. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### [`kudu-master` Unsupported Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_unsupported)

Flags not marked `stable` or `evolving` are considered experimental and are **unsupported**. They are included here for informational purposes only and are subject to being changed or removed without notice.

#### [`--block_cache_type`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_block_cache_type)

Which type of block cache to use for caching data. Valid choices are 'DRAM' or 'NVM'. DRAM, the default, caches data in regular memory. 'NVM' caches data in a memory-mapped file using the NVML library.

| Type    | string       |
| ------- | ------------ |
| Default | `DRAM`       |
| Tags    | experimental |

#### [`--min_compression_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_min_compression_ratio)

If a column compression codec is configured, but the codec is unable to achieve a compression ratio at least as good as the configured value, then the data will be written uncompressed. This will reduce CPU overhead on the read side at the expense of a small amount of extra space if the codec encounters portions of data that are not easily compressible.

| Type    | double                |
| ------- | --------------------- |
| Default | `0.90000000000000002` |
| Tags    | experimental          |

#### [`--cfile_default_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_cfile_default_block_size)

The default block size to use in cfiles

| Type    | int32    |
| ------- | -------- |
| Default | `262144` |
| Tags    | advanced |

#### [`--cfile_default_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_cfile_default_compression_codec)

Default cfile block compression codec.

| Type    | string   |
| ------- | -------- |
| Default | `none`   |
| Tags    | advanced |

#### [`--max_clock_sync_error_usec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_clock_sync_error_usec)

Maximum allowed clock synchronization error as reported by NTP before the server will abort.

| Type    | int32            |
| ------- | ---------------- |
| Default | `10000000`       |
| Tags    | runtime,advanced |

#### [`--time_source`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_time_source)

The clock source that HybridClock should use. Must be one of 'system' or 'mock' (for tests only)

| Type    | string       |
| ------- | ------------ |
| Default | `system`     |
| Tags    | experimental |

#### [`--codegen_dump_functions`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_codegen_dump_functions)

Whether to print the LLVM IR for generated functions

| Type    | bool                 |
| ------- | -------------------- |
| Default | `false`              |
| Tags    | runtime,experimental |

#### [`--codegen_dump_mc`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_codegen_dump_mc)

Whether to dump the disassembly of the machine code for generated functions.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `false`              |
| Tags    | runtime,experimental |

#### [`--codegen_cache_capacity`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_codegen_cache_capacity)

Number of entries which may be stored in the code generation cache.

| Type    | int32        |
| ------- | ------------ |
| Default | `100`        |
| Tags    | experimental |

#### [`--codegen_time_compilation`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_codegen_time_compilation)

Whether to print time that each code generation request took.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `false`              |
| Tags    | runtime,experimental |

#### [`--consensus_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_consensus_rpc_timeout_ms)

Timeout used for all consensus internal RPC communications.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

#### [`--consensus_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_consensus_max_batch_size_bytes)

The maximum per-tablet RPC batch size when updating peers.

| Type    | int32     |
| ------- | --------- |
| Default | `1048576` |
| Tags    | advanced  |

#### [`--follower_unavailable_considered_failed_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_follower_unavailable_considered_failed_sec)

Seconds that a leader is unable to successfully heartbeat to a follower after which the follower is considered to be failed and evicted from the config.

| Type    | int32    |
| ------- | -------- |
| Default | `300`    |
| Tags    | advanced |

#### [`--group_commit_queue_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_group_commit_queue_size_bytes)

Maximum size of the group commit queue in bytes

| Type    | int32     |
| ------- | --------- |
| Default | `4194304` |
| Tags    | advanced  |

#### [`--log_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_compression_codec)

Codec to use for compressing WAL segments.

| Type    | string       |
| ------- | ------------ |
| Default | `LZ4`        |
| Tags    | experimental |

#### [`--log_max_segments_to_retain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_max_segments_to_retain)

The maximum number of past log segments to keep at all times for the purposes of catching up other peers.

| Type    | int32                         |
| ------- | ----------------------------- |
| Default | `80`                          |
| Tags    | experimental,advanced,runtime |

#### [`--log_min_segments_to_retain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_min_segments_to_retain)

The minimum number of past log segments to keep at all times, regardless of what is required for durability. Must be at least 1.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1`              |
| Tags    | advanced,runtime |

#### [`--global_log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_global_log_cache_size_limit_mb)

Server-wide version of 'log_cache_size_limit_mb'. The total memory used for caching log entries across all tablets is kept under this threshold.

| Type    | int32    |
| ------- | -------- |
| Default | `1024`   |
| Tags    | advanced |

#### [`--log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_cache_size_limit_mb)

The total per-tablet size of consensus entries which may be kept in memory. The log cache attempts to keep all entries which have not yet been replicated to all followers in memory, but if the total size of those entries exceeds this limit within an individual tablet, the oldest will be evicted.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

#### [`--log_async_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_async_preallocate_segments)

Whether the WAL segments preallocation should happen asynchronously

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--log_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_preallocate_segments)

Whether the WAL should preallocate the entire segment before writing to it

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--log_segment_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_segment_size_mb)

The default size for log segments, in MB

| Type    | int32    |
| ------- | -------- |
| Default | `8`      |
| Tags    | advanced |

#### [`--evict_failed_followers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_evict_failed_followers)

Whether to evict followers from the Raft config that have fallen too far behind the leader’s log to catch up normally or have been unreachable by the leader for longer than follower_unavailable_considered_failed_sec

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--leader_failure_exp_backoff_max_delta_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_leader_failure_exp_backoff_max_delta_ms)

Maximum time to sleep in between leader election retries, in addition to the regular timeout. When leader election fails the interval in between retries increases exponentially, up to this value.

| Type    | int32        |
| ------- | ------------ |
| Default | `20000`      |
| Tags    | experimental |

#### [`--leader_failure_max_missed_heartbeat_periods`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_leader_failure_max_missed_heartbeat_periods)

Maximum heartbeat periods that the leader can fail to heartbeat in before we consider the leader to be failed. The total failure timeout in milliseconds is raft_heartbeat_interval_ms times leader_failure_max_missed_heartbeat_periods. The value passed to this flag may be fractional.

| Type    | double   |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

#### [`--raft_enable_pre_election`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_raft_enable_pre_election)

When enabled, candidates will call a pre-election before running a real leader election.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `true`               |
| Tags    | runtime,experimental |

#### [`--raft_enable_tombstoned_voting`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_raft_enable_tombstoned_voting)

When enabled, tombstoned tablets may vote in elections.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `true`               |
| Tags    | runtime,experimental |

#### [`--raft_heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_raft_heartbeat_interval_ms)

The heartbeat interval for Raft replication. The leader produces heartbeats to followers at this interval. The followers expect a heartbeat at this interval and consider a leader to have failed if it misses several in a row.

| Type    | int32    |
| ------- | -------- |
| Default | `500`    |
| Tags    | advanced |

#### [`--raft_prepare_replacement_before_eviction`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_raft_prepare_replacement_before_eviction)

When enabled, failed replicas will only be evicted after a replacement has been prepared for them.

| Type    | bool                  |
| ------- | --------------------- |
| Default | `true`                |
| Tags    | experimental,advanced |

#### [`--missed_heartbeats_before_rejecting_snapshot_scans`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_missed_heartbeats_before_rejecting_snapshot_scans)

The maximum raft heartbeat periods since the tablet has seen safe time advanced before refusing scans at snapshots that aren’t yet safe and forcing clients to try again.

| Type    | double       |
| ------- | ------------ |
| Default | `1.5`        |
| Tags    | experimental |

#### [`--safe_time_advancement_without_writes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_safe_time_advancement_without_writes)

Whether to enable the advancement of "safe" time in the absense of write operations

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--safe_time_max_lag_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_safe_time_max_lag_ms)

The maximum amount of time we allow safe time to lag behind the requested timestampbefore forcing the client to retry, in milliseconds.

| Type    | int32        |
| ------- | ------------ |
| Default | `30000`      |
| Tags    | experimental |

#### [`--block_manager_preflush_control`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_block_manager_preflush_control)

Controls when to pre-flush a block. Valid values are 'finalize', 'close', or 'never'. If 'finalize', blocks will be pre-flushed when writing is finished. If 'close', blocks will be pre-flushed when their transaction is committed. If 'never', blocks will never be pre-flushed but still be flushed when closed.

| Type    | string       |
| ------- | ------------ |
| Default | `finalize`   |
| Tags    | experimental |

#### [`--block_manager`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_block_manager)

Which block manager to use for storage. Valid options are 'file' and 'log'.

| Type    | string   |
| ------- | -------- |
| Default | `log`    |
| Tags    | advanced |

#### [`--log_container_excess_space_before_cleanup_fraction`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_excess_space_before_cleanup_fraction)

Additional fraction of a log container’s calculated size that must be consumed on disk before the container is considered to be inconsistent and subject to excess space cleanup at block manager startup.

| Type    | double                |
| ------- | --------------------- |
| Default | `0.10000000000000001` |
| Tags    | advanced              |

#### [`--log_container_live_metadata_before_compact_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_live_metadata_before_compact_ratio)

Desired ratio of live block metadata in log containers. If a container’s live to total block ratio dips below this value, the container’s metadata file will be compacted at startup.

| Type    | double       |
| ------- | ------------ |
| Default | `0.5`        |
| Tags    | experimental |

#### [`--log_container_max_blocks`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_max_blocks)

Maximum number of blocks (soft) of a log container. Use 0 for no limit. Use -1 for no limit except in the case of a kernel bug with hole punching on ext4 (see KUDU-1508 for details).

| Type    | int64    |
| ------- | -------- |
| Default | `-1`     |
| Tags    | advanced |

#### [`--log_container_max_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_max_size)

Maximum size (soft) of a log container

| Type    | uint64        |
| ------- | ------------- |
| Default | `10737418240` |
| Tags    | advanced      |

#### [`--log_container_preallocate_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_container_preallocate_bytes)

Number of bytes to preallocate in a log container when creating new blocks. Set to 0 to disable preallocation

| Type    | uint64     |
| ------- | ---------- |
| Default | `33554432` |
| Tags    | advanced   |

#### [`--default_num_replicas`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_default_num_replicas)

Default number of replicas for tables that do not have the num_replicas set.

| Type    | int32    |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

#### [`--master_failover_catchup_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_master_failover_catchup_timeout_ms)

Amount of time to give a newly-elected leader master to load the previous master’s metadata and become active. If this time is exceeded, the node crashes.

| Type    | int32                 |
| ------- | --------------------- |
| Default | `30000`               |
| Tags    | experimental,advanced |

#### [`--master_ts_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_master_ts_rpc_timeout_ms)

Timeout used for the master→TS async rpc calls.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

#### [`--max_create_tablets_per_ts`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_create_tablets_per_ts)

The number of tablets per TS that can be requested for a new table.

| Type    | int32    |
| ------- | -------- |
| Default | `20`     |
| Tags    | advanced |

#### [`--table_locations_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_table_locations_ttl_ms)

Maximum time in milliseconds which clients may cache table locations. New range partitions may not be visible to existing client instances until after waiting for the ttl period.

| Type    | int32    |
| ------- | -------- |
| Default | `300000` |
| Tags    | advanced |

#### [`--tablet_creation_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_creation_timeout_ms)

Timeout used by the master when attempting to create tablet replicas during table creation.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

#### [`--unresponsive_ts_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_unresponsive_ts_rpc_timeout_ms)

After this amount of time, the master will stop attempting to contact a tablet server in order to perform operations such as deleting a tablet.

| Type    | int32     |
| ------- | --------- |
| Default | `3600000` |
| Tags    | advanced  |

#### [`--authn_token_validity_seconds`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_authn_token_validity_seconds)

Period of time for which an issued authentication token is valid. Clients will automatically attempt to reacquire a token after the validity period expires.

| Type    | int64        |
| ------- | ------------ |
| Default | `604800`     |
| Tags    | experimental |

#### [`--master_registration_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_master_registration_rpc_timeout_ms)

Timeout for retrieving master registration over RPC.

| Type    | int32        |
| ------- | ------------ |
| Default | `1500`       |
| Tags    | experimental |

#### [`--tsk_rotation_seconds`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tsk_rotation_seconds)

Number of seconds between consecutive activations of newly generated TSKs (Token Signing Keys).

| Type    | int64                 |
| ------- | --------------------- |
| Default | `86400`               |
| Tags    | experimental,advanced |

#### [`--ipki_ca_cert_expiration_seconds`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_ipki_ca_cert_expiration_seconds)

validity interval for self-signed root CA certifcate issued by Kudu IPKI (Internal Private Key Infrastructure, a.k.a. Internal Kudu CA)

| Type    | int64        |
| ------- | ------------ |
| Default | `315360000`  |
| Tags    | experimental |

#### [`--ipki_ca_key_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_ipki_ca_key_size)

the number of bits for self-signed root CA cert used by Kudu IPKI (Internal Private Key Infrastructure, a.k.a. Internal Kudu CA)

| Type    | int32        |
| ------- | ------------ |
| Default | `2048`       |
| Tags    | experimental |

#### [`--ipki_server_cert_expiration_seconds`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_ipki_server_cert_expiration_seconds)

validity interval for server certificates issued by Kudu IPKI (Internal Private Key Infrastructure, a.k.a. Internal Kudu CA)

| Type    | int64        |
| ------- | ------------ |
| Default | `315360000`  |
| Tags    | experimental |

#### [`--tserver_unresponsive_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tserver_unresponsive_timeout_ms)

The period of time that a Master can go without receiving a heartbeat from a tablet server before considering it unresponsive. Unresponsive servers are not selected when assigning replicas during table creation or re-replication.

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

#### [`--rpc_acceptor_listen_backlog`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_acceptor_listen_backlog)

Socket backlog parameter used when listening for RPC connections. This defines the maximum length to which the queue of pending TCP connections inbound to the RPC server may grow. If a connection request arrives when the queue is full, the client may receive an error. Higher values may help the server ride over bursts of new inbound connection requests.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

#### [`--rpc_encrypt_loopback_connections`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_encrypt_loopback_connections)

Whether to encrypt data transfer on RPC connections that stay within a single host. Encryption here is likely to offer no additional security benefit since only a local 'root' user could intercept the traffic, and wire encryption does not suitably protect against such an attacker.

| Type    | bool     |
| ------- | -------- |
| Default | `false`  |
| Tags    | advanced |

#### [`--rpc_trace_negotiation`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_trace_negotiation)

If enabled, dump traces of all RPC negotiations to the log

| Type    | bool                          |
| ------- | ----------------------------- |
| Default | `false`                       |
| Tags    | experimental,advanced,runtime |

#### [`--rpc_callback_max_cycles`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_callback_max_cycles)

The maximum number of cycles for which an RPC callback should be allowed to run without emitting a warning. (Advanced debugging option)

| Type    | int64            |
| ------- | ---------------- |
| Default | `100000000`      |
| Tags    | runtime,advanced |

#### [`--remember_clients_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_remember_clients_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a client for the purpose of caching its responses. After this period without hearing from it, the client is no longer remembered and the memory occupied by its responses is reclaimed. Retries of requests older than 'remember_clients_ttl_ms' are treated as new ones.

| Type    | int64     |
| ------- | --------- |
| Default | `3600000` |
| Tags    | advanced  |

#### [`--remember_responses_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_remember_responses_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a response to a specific request for a client. After this period has elapsed, the response may have been garbage collected and the client might get a response indicating the request is STALE.

| Type    | int64    |
| ------- | -------- |
| Default | `600000` |
| Tags    | advanced |

#### [`--rpc_dump_all_traces`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_dump_all_traces)

If true, dump all RPC traces at INFO level

| Type    | bool             |
| ------- | ---------------- |
| Default | `false`          |
| Tags    | runtime,advanced |

#### [`--rpc_duration_too_long_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_duration_too_long_ms)

Threshold (in milliseconds) above which a RPC is considered too long and its duration and method name are logged at INFO level. The time measured is between when a RPC is accepted and when its call handler completes.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1000`           |
| Tags    | runtime,advanced |

#### [`--rpc_max_message_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_max_message_size)

The maximum size of a message that any RPC that the server will accept. Must be at least 1MB.

| Type    | int32            |
| ------- | ---------------- |
| Default | `52428800`       |
| Tags    | runtime,advanced |

#### [`--use_system_auth_to_local`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_use_system_auth_to_local)

When enabled, use the system krb5 library to map Kerberos principal names to local (short) usernames. If not enabled, the first component of the principal will be used as the short name. For example, 'kudu/foo.example.com@EXAMPLE' will map to 'kudu'.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--ipki_server_key_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_ipki_server_key_size)

the number of bits for server cert’s private key. The server cert is used for TLS connections to and from clients and other servers.

| Type    | int32        |
| ------- | ------------ |
| Default | `2048`       |
| Tags    | experimental |

#### [`--tsk_num_rsa_bits`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tsk_num_rsa_bits)

Number of bits in RSA keys used for token signing.

| Type    | int32        |
| ------- | ------------ |
| Default | `2048`       |
| Tags    | experimental |

#### [`--web_log_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_web_log_bytes)

The maximum number of bytes to display on the debug webserver’s log page

| Type    | int64            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

#### [`--diagnostics_log_stack_traces_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_diagnostics_log_stack_traces_interval_ms)

The interval at which the server will a snapshot of its thread stacks to the diagnostics log. In fact, the server will log at a random interval betweeen zero and twice the configured value to avoid biasing samples towards periodic processes which happen exactly on some particular schedule. If this is set to 0, stack traces will be not be periodically logged.

| Type    | uint32               |
| ------- | -------------------- |
| Default | `60000`              |
| Tags    | experimental,runtime |

#### [`--rpc_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_advertised_addresses)

Comma-separated list of addresses to advertise externally for RPC connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound RPC addresses specified in --rpc_bind_addresses are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--rpc_num_acceptors_per_address`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_num_acceptors_per_address)

Number of RPC acceptor threads for each bound address

| Type    | int32    |
| ------- | -------- |
| Default | `1`      |
| Tags    | advanced |

#### [`--rpc_num_service_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_num_service_threads)

Number of RPC worker threads to run

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

#### [`--rpc_service_queue_length`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_service_queue_length)

Default length of queue for incoming RPC requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

#### [`--max_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_negotiation_threads)

Maximum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

#### [`--min_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_min_negotiation_threads)

Minimum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

#### [`--num_reactor_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_num_reactor_threads)

Number of libev reactor threads to start.

| Type    | int32    |
| ------- | -------- |
| Default | `4`      |
| Tags    | advanced |

#### [`--rpc_ca_certificate_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_ca_certificate_file)

Path to the PEM encoded X509 certificate of the trusted external certificate authority. The provided certificate should be the root issuer of the certificate passed in '--rpc_certificate_file'.

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--rpc_certificate_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_certificate_file)

Path to a PEM encoded X509 certificate to use for securing RPC connections with SSL/TLS. If set, '--rpc_private_key_file' and '--rpc_ca_certificate_file' must be set as well.

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--rpc_default_keepalive_time_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_default_keepalive_time_ms)

If an RPC connection from a client is idle for this amount of time, the server will disconnect the client. Setting this to any negative value keeps connections always alive.

| Type    | int32    |
| ------- | -------- |
| Default | `65000`  |
| Tags    | advanced |

#### [`--rpc_negotiation_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_negotiation_timeout_ms)

Timeout for negotiating an RPC connection.

| Type    | int64            |
| ------- | ---------------- |
| Default | `3000`           |
| Tags    | runtime,advanced |

#### [`--rpc_private_key_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_private_key_file)

Path to a PEM encoded private key paired with the certificate from '--rpc_certificate_file'

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--rpc_private_key_password_cmd`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_private_key_password_cmd)

A Unix command whose output returns the password used to decrypt the RPC server’s private key file specified in --rpc_private_key_file. If the .PEM key file is not password-protected, this flag does not need to be set. Trailing whitespace will be trimmed before it is used to decrypt the private key.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

#### [`--rpc_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_tls_ciphers)

The cipher suite preferences to use for TLS-secured RPC connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

#### [`--rpc_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_rpc_tls_min_protocol)

The minimum protocol version to allow when for securing RPC connections with TLS. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

#### [`--webserver_enabled`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_enabled)

Whether to enable the web server on this daemon. NOTE: disabling the web server is also likely to prevent monitoring systems from properly capturing metrics.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--metrics_log_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_metrics_log_interval_ms)

Interval (in milliseconds) at which the server will dump its metrics to a local log file. The log files are located in the same directory as specified by the -log_dir flag. If this is not a positive value, then metrics logging will be disabled.

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

#### [`--webserver_max_post_length_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_max_post_length_bytes)

The maximum length of a POST request that will be accepted by the embedded web server.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

#### [`--webserver_x_frame_options`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_x_frame_options)

The webserver will add an 'X-Frame-Options' HTTP header with this value to all responses. This can help prevent clickjacking attacks.

| Type    | string   |
| ------- | -------- |
| Default | `DENY`   |
| Tags    | advanced |

#### [`--webserver_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_advertised_addresses)

Comma-separated list of addresses to advertise externally for HTTP(S) connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound webserver address specified in --webserver_interface and --webserver_port are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--webserver_authentication_domain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_authentication_domain)

Domain used for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

#### [`--webserver_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_doc_root)

Files under <webserver_doc_root> are accessible via the debug webserver. Defaults to $KUDU_HOME/www, or if $KUDU_HOME is not set, disables the document root

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--webserver_enable_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_enable_doc_root)

If true, webserver may serve static files from the webserver_doc_root

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--webserver_interface`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_interface)

Interface to start debug webserver on. If blank, webserver binds to 0.0.0.0

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--webserver_num_worker_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_num_worker_threads)

Maximum number of threads to start for handling web server requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

#### [`--webserver_password_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_password_file)

(Optional) Location of .htpasswd file containing user names and hashed passwords for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

#### [`--webserver_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_tls_ciphers)

The cipher suite preferences to use for webserver HTTPS connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

#### [`--webserver_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_webserver_tls_min_protocol)

The minimum protocol version to allow when for webserver HTTPS connections. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

#### [`--budgeted_compaction_target_rowset_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_budgeted_compaction_target_rowset_size)

The target size for DiskRowSets during flush/compact when the budgeted compaction policy is used

| Type    | int32                 |
| ------- | --------------------- |
| Default | `33554432`            |
| Tags    | advanced,experimental |

#### [`--compaction_approximation_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_compaction_approximation_ratio)

Approximation ratio allowed for optimal compaction calculation. A value of 1.05 indicates that the policy may use an approximate result if it is known to be within 5% of the optimal solution.

| Type    | double               |
| ------- | -------------------- |
| Default | `1.0499999523162842` |
| Tags    | experimental         |

#### [`--compaction_minimum_improvement`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_compaction_minimum_improvement)

The minimum quality for a compaction to run. If a compaction does not improve the average height of DiskRowSets by at least this amount, the compaction will be considered ineligible.

| Type    | double                  |
| ------- | ----------------------- |
| Default | `0.0099999997764825821` |
| Tags    |                         |

#### [`--deltafile_default_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_deltafile_default_block_size)

Block size for delta files. In the future, this may become configurable on a per-table basis.

| Type    | int32        |
| ------- | ------------ |
| Default | `32768`      |
| Tags    | experimental |

#### [`--deltafile_default_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_deltafile_default_compression_codec)

The compression codec used when writing deltafiles.

| Type    | string       |
| ------- | ------------ |
| Default | `lz4`        |
| Tags    | experimental |

#### [`--default_composite_key_index_block_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_default_composite_key_index_block_size_bytes)

Block size used for composite key indexes.

| Type    | int32        |
| ------- | ------------ |
| Default | `4096`       |
| Tags    | experimental |

#### [`--tablet_delta_store_major_compact_min_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_delta_store_major_compact_min_ratio)

Minimum ratio of sizeof(deltas) to sizeof(base data) before a major compaction can run (Advanced option)

| Type    | double                |
| ------- | --------------------- |
| Default | `0.10000000149011612` |
| Tags    | experimental          |

#### [`--tablet_delta_store_minor_compact_max`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_delta_store_minor_compact_max)

How many delta stores are required before forcing a minor delta compaction (Advanced option)

| Type    | int32        |
| ------- | ------------ |
| Default | `1000`       |
| Tags    | experimental |

#### [`--tablet_bloom_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_bloom_block_size)

Block size of the bloom filters used for tablet keys.

| Type    | int32    |
| ------- | -------- |
| Default | `4096`   |
| Tags    | advanced |

#### [`--tablet_bloom_target_fp_rate`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_bloom_target_fp_rate)

Target false-positive rate (between 0 and 1) to size tablet key bloom filters. A lower false positive rate may reduce the number of disk seeks required in heavy insert workloads, at the expense of more space and RAM required for bloom filters.

| Type    | double                   |
| ------- | ------------------------ |
| Default | `9.9999997473787516e-05` |
| Tags    | advanced                 |

#### [`--tablet_compaction_budget_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_compaction_budget_mb)

Budget for a single compaction

| Type    | int32        |
| ------- | ------------ |
| Default | `128`        |
| Tags    | experimental |

#### [`--tablet_history_max_age_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_history_max_age_sec)

Number of seconds to retain tablet history. Reads initiated at a snapshot that is older than this age will be rejected. To disable history removal, set to -1.

| Type    | int32    |
| ------- | -------- |
| Default | `900`    |
| Tags    | advanced |

#### [`--tablet_throttler_burst_factor`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_throttler_burst_factor)

Burst factor for write RPC throttling. The maximum rate the throttler allows within a token refill period (100ms) equals burst factor multiply base rate.

| Type    | double       |
| ------- | ------------ |
| Default | `1`          |
| Tags    | experimental |

#### [`--tablet_throttler_bytes_per_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_throttler_bytes_per_sec)

Maximum write RPC IO rate (byte/s) allowed for a tablet, write RPC exceeding this limit will be throttled. 0 means no limit.

| Type    | int64        |
| ------- | ------------ |
| Default | `0`          |
| Tags    | experimental |

#### [`--tablet_throttler_rpc_per_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_throttler_rpc_per_sec)

Maximum write RPC rate (op/s) allowed for a tablet, write RPC exceeding this limit will be throttled. 0 means no limit.

| Type    | int64        |
| ------- | ------------ |
| Default | `0`          |
| Tags    | experimental |

#### [`--flush_threshold_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_flush_threshold_mb)

Size at which MemRowSet flushes are triggered. A MRS can still flush below this threshold if it if hasn’t flushed in a while, or if the server-wide memory limit has been reached.

| Type    | int32        |
| ------- | ------------ |
| Default | `1024`       |
| Tags    | experimental |

#### [`--flush_threshold_secs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_flush_threshold_secs)

Number of seconds after which a non-empty MemRowSet will become flushable even if it is not large.

| Type    | int32        |
| ------- | ------------ |
| Default | `120`        |
| Tags    | experimental |

#### [`--tablet_transaction_memory_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_transaction_memory_limit_mb)

Maximum amount of memory that may be consumed by all in-flight transactions belonging to a particular tablet. When this limit is reached, new transactions will be rejected and clients will be forced to retry them. If -1, transaction memory tracking is disabled.

| Type    | int64    |
| ------- | -------- |
| Default | `64`     |
| Tags    | advanced |

#### [`--heartbeat_incompatible_replica_management_is_fatal`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_incompatible_replica_management_is_fatal)

Whether incompatible replica management schemes or unsupported PREPARE_REPLACEMENT_BEFORE_EVICTION feature flag by master are fatal

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

#### [`--heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_interval_ms)

Interval at which the TS heartbeats to the master.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

#### [`--heartbeat_max_failures_before_backoff`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_max_failures_before_backoff)

Maximum number of consecutive heartbeat failures until the Tablet Server backs off to the normal heartbeat interval, rather than retrying.

| Type    | int32    |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

#### [`--heartbeat_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heartbeat_rpc_timeout_ms)

Timeout used for the TS→Master heartbeat RPCs.

| Type    | int32    |
| ------- | -------- |
| Default | `15000`  |
| Tags    | advanced |

#### [`--scan_history_count`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scan_history_count)

Number of completed scans to keep history for. Determines how many historical scans will be shown on the tablet server’s scans dashboard.

| Type    | int32        |
| ------- | ------------ |
| Default | `20`         |
| Tags    | experimental |

#### [`--scanner_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_ttl_ms)

Number of milliseconds of inactivity allowed for a scannerbefore it may be expired

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

#### [`--scanner_batch_size_rows`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_batch_size_rows)

The number of rows to batch for servicing scan requests.

| Type    | int32            |
| ------- | ---------------- |
| Default | `100`            |
| Tags    | runtime,advanced |

#### [`--scanner_default_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_default_batch_size_bytes)

The default size for batches of scan results

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

#### [`--scanner_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_max_batch_size_bytes)

The maximum batch size that a client may request for scan results.

| Type    | int32            |
| ------- | ---------------- |
| Default | `8388608`        |
| Tags    | runtime,advanced |

#### [`--scanner_max_wait_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_scanner_max_wait_ms)

The maximum amount of time (in milliseconds) we’ll hang a scanner thread waiting for safe time to advance or transactions to commit, even if its deadline allows waiting longer.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

#### [`--num_tablets_to_copy_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_num_tablets_to_copy_simultaneously)

Number of threads available to copy tablets from remote servers.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

#### [`--num_tablets_to_open_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_num_tablets_to_open_simultaneously)

Number of threads available to open tablets during startup. If this is set to 0 (the default), then the number of bootstrap threads will be set based on the number of data directories. If the data directories are on some very fast storage device such as SSD or a RAID array, it may make sense to manually tune this.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

#### [`--tablet_state_walk_min_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tablet_state_walk_min_period_ms)

Minimum amount of time in milliseconds between walks of the tablet map to update tablet state counts.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

#### [`--trace_to_console`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_trace_to_console)

Trace pattern specifying which trace events should be dumped directly to the console

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--crash_on_eio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_crash_on_eio)

Kill the process if an I/O operation results in EIO. If false, I/O resulting in EIOs will return the status IOError and leave error-handling up to the caller.

| Type    | bool                  |
| ------- | --------------------- |
| Default | `false`               |
| Tags    | experimental,advanced |

#### [`--env_use_ioctl_hole_punch_on_xfs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_env_use_ioctl_hole_punch_on_xfs)

Use the XFS_IOC_UNRESVSP64 ioctl instead of fallocate(2) to punch holes on XFS filesystems.

| Type    | bool                  |
| ------- | --------------------- |
| Default | `true`                |
| Tags    | experimental,advanced |

#### [`--file_cache_expiry_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_file_cache_expiry_period_ms)

Period of time (in ms) between removing expired file cache descriptors

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

#### [`--heap_sample_every_n_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_heap_sample_every_n_bytes)

Enable heap occupancy sampling. If this flag is set to some positive value N, a memory allocation will be sampled approximately every N bytes. Lower values of N incur larger overhead but give more accurate results. A value such as 524288 (512KB) is a reasonable choice with relatively low overhead.

| Type    | int64                 |
| ------- | --------------------- |
| Default | `0`                   |
| Tags    | experimental,advanced |

#### [`--umask`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_umask)

The umask that will be used when creating files and directories. Permissions of top-level data directories will also be modified at start-up to conform to the given umask. Changing this value may enable unauthorized local users to read or modify data stored by Kudu.

| Type    | string   |
| ------- | -------- |
| Default | `077`    |
| Tags    | advanced |

#### [`--max_log_files`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_max_log_files)

Maximum number of log files to retain per severity level. The most recent log files are retained. If set to 0, all log files are retained.

| Type    | int32                |
| ------- | -------------------- |
| Default | `10`                 |
| Tags    | experimental,runtime |

#### [`--data_gc_min_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_data_gc_min_size_mb)

The (exclusive) minimum number of megabytes of ancient data on disk, per tablet, needed to prioritize deletion of that data.

| Type    | int64        |
| ------- | ------------ |
| Default | `0`          |
| Tags    | experimental |

#### [`--data_gc_prioritization_prob`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_data_gc_prioritization_prob)

The probability that we will prioritize data GC over performance improvement operations. If set to 1.0, we will always prefer to delete old data before running performance improvement operations such as delta compaction.

| Type    | double       |
| ------- | ------------ |
| Default | `0.5`        |
| Tags    | experimental |

#### [`--log_target_replay_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_target_replay_size_mb)

The target maximum size of logs to be replayed at startup. If a tablet has in-memory operations that are causing more than this size of logs to be retained, then the maintenance manager will prioritize flushing these operations to disk.

| Type    | int64        |
| ------- | ------------ |
| Default | `1024`       |
| Tags    | experimental |

#### [`--metrics_retirement_age_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_metrics_retirement_age_ms)

The minimum number of milliseconds a metric will be kept for after it is no longer active. (Advanced option)

| Type    | int32            |
| ------- | ---------------- |
| Default | `120000`         |
| Tags    | advanced,runtime |

#### [`--local_ip_for_outbound_sockets`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_local_ip_for_outbound_sockets)

IP to bind to when making outgoing socket connections. This must be an IP address of the form A.B.C.D, not a hostname. Advanced parameter, subject to change.

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--nvm_cache_allocation_retry_count`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_nvm_cache_allocation_retry_count)

The number of times that the NVM cache will retry attempts to allocate memory for new entries. In between attempts, a cache entry will be evicted.

| Type    | int32                 |
| ------- | --------------------- |
| Default | `10`                  |
| Tags    | experimental,advanced |

#### [`--nvm_cache_path`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_nvm_cache_path)

The path at which the NVM cache will try to allocate its memory. This can be a tmpfs or ramfs for testing purposes.

| Type    | string       |
| ------- | ------------ |
| Default | `/vmem`      |
| Tags    | experimental |

#### [`--memory_limit_soft_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_memory_limit_soft_percentage)

Percentage of the hard memory limit that this daemon may consume before memory throttling of writes begins. The greater the excess, the higher the chance of throttling. In general, a lower soft limit leads to smoother write latencies but decreased throughput, and vice versa for a higher soft limit.

| Type    | int32    |
| ------- | -------- |
| Default | `80`     |
| Tags    | advanced |

#### [`--memory_limit_warn_threshold_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_memory_limit_warn_threshold_percentage)

Percentage of the hard memory limit that this daemon may consume before WARNING level messages are periodically logged.

| Type    | int32    |
| ------- | -------- |
| Default | `98`     |
| Tags    | advanced |

#### [`--memory_pressure_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_memory_pressure_percentage)

Percentage of the hard memory limit that this daemon may consume before flushing of in-memory data becomes prioritized.

| Type    | int32    |
| ------- | -------- |
| Default | `60`     |
| Tags    | advanced |

#### [`--tcmalloc_max_free_bytes_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_tcmalloc_max_free_bytes_percentage)

Maximum percentage of the RSS that tcmalloc is allowed to use for reserved but unallocated memory.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

#### [`--drop_log_memory`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_drop_log_memory)

Drop in-memory buffers of log contents. Logs can grow very quickly and they are rarely read before they need to be evicted from memory. Instead, drop them from memory as soon as they are flushed to disk.

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

#### [`--log_backtrace_at`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_log_backtrace_at)

Emit a backtrace when logging at file:linenum.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--logbuflevel`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_logbuflevel)

Buffer log messages logged at this level or lower (-1 means don’t buffer; 0 means buffer INFO only; …)

| Type    | int32            |
| ------- | ---------------- |
| Default | `0`              |
| Tags    | runtime,advanced |

#### [`--logbufsecs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_logbufsecs)

Buffer log messages for at most this many seconds

| Type    | int32            |
| ------- | ---------------- |
| Default | `5`              |
| Tags    | runtime,advanced |

#### [`--logfile_mode`](http://kudu.apache.org/docs/configuration_reference.html#kudu-master_logfile_mode)

Log file mode/permissions.

| Type    | int32 |
| ------- | ----- |
| Default | `436` |
| Tags    |       |

------

### [`kudu-tserver` Unsupported Flags](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_unsupported)

Flags not marked `stable` or `evolving` are considered experimental and are **unsupported**. They are included here for informational purposes only and are subject to being changed or removed without notice.

#### [`--block_cache_type`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_block_cache_type)

Which type of block cache to use for caching data. Valid choices are 'DRAM' or 'NVM'. DRAM, the default, caches data in regular memory. 'NVM' caches data in a memory-mapped file using the NVML library.

| Type    | string       |
| ------- | ------------ |
| Default | `DRAM`       |
| Tags    | experimental |

#### [`--min_compression_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_min_compression_ratio)

If a column compression codec is configured, but the codec is unable to achieve a compression ratio at least as good as the configured value, then the data will be written uncompressed. This will reduce CPU overhead on the read side at the expense of a small amount of extra space if the codec encounters portions of data that are not easily compressible.

| Type    | double                |
| ------- | --------------------- |
| Default | `0.90000000000000002` |
| Tags    | experimental          |

#### [`--cfile_default_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_cfile_default_block_size)

The default block size to use in cfiles

| Type    | int32    |
| ------- | -------- |
| Default | `262144` |
| Tags    | advanced |

#### [`--cfile_default_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_cfile_default_compression_codec)

Default cfile block compression codec.

| Type    | string   |
| ------- | -------- |
| Default | `none`   |
| Tags    | advanced |

#### [`--max_clock_sync_error_usec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_max_clock_sync_error_usec)

Maximum allowed clock synchronization error as reported by NTP before the server will abort.

| Type    | int32            |
| ------- | ---------------- |
| Default | `10000000`       |
| Tags    | runtime,advanced |

#### [`--time_source`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_time_source)

The clock source that HybridClock should use. Must be one of 'system' or 'mock' (for tests only)

| Type    | string       |
| ------- | ------------ |
| Default | `system`     |
| Tags    | experimental |

#### [`--codegen_dump_functions`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_codegen_dump_functions)

Whether to print the LLVM IR for generated functions

| Type    | bool                 |
| ------- | -------------------- |
| Default | `false`              |
| Tags    | runtime,experimental |

#### [`--codegen_dump_mc`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_codegen_dump_mc)

Whether to dump the disassembly of the machine code for generated functions.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `false`              |
| Tags    | runtime,experimental |

#### [`--codegen_cache_capacity`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_codegen_cache_capacity)

Number of entries which may be stored in the code generation cache.

| Type    | int32        |
| ------- | ------------ |
| Default | `100`        |
| Tags    | experimental |

#### [`--codegen_time_compilation`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_codegen_time_compilation)

Whether to print time that each code generation request took.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `false`              |
| Tags    | runtime,experimental |

#### [`--consensus_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_consensus_rpc_timeout_ms)

Timeout used for all consensus internal RPC communications.

| Type    | int32    |
| ------- | -------- |
| Default | `30000`  |
| Tags    | advanced |

#### [`--consensus_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_consensus_max_batch_size_bytes)

The maximum per-tablet RPC batch size when updating peers.

| Type    | int32     |
| ------- | --------- |
| Default | `1048576` |
| Tags    | advanced  |

#### [`--follower_unavailable_considered_failed_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_follower_unavailable_considered_failed_sec)

Seconds that a leader is unable to successfully heartbeat to a follower after which the follower is considered to be failed and evicted from the config.

| Type    | int32    |
| ------- | -------- |
| Default | `300`    |
| Tags    | advanced |

#### [`--group_commit_queue_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_group_commit_queue_size_bytes)

Maximum size of the group commit queue in bytes

| Type    | int32     |
| ------- | --------- |
| Default | `4194304` |
| Tags    | advanced  |

#### [`--log_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_compression_codec)

Codec to use for compressing WAL segments.

| Type    | string       |
| ------- | ------------ |
| Default | `LZ4`        |
| Tags    | experimental |

#### [`--log_max_segments_to_retain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_max_segments_to_retain)

The maximum number of past log segments to keep at all times for the purposes of catching up other peers.

| Type    | int32                         |
| ------- | ----------------------------- |
| Default | `80`                          |
| Tags    | experimental,advanced,runtime |

#### [`--log_min_segments_to_retain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_min_segments_to_retain)

The minimum number of past log segments to keep at all times, regardless of what is required for durability. Must be at least 1.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1`              |
| Tags    | advanced,runtime |

#### [`--global_log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_global_log_cache_size_limit_mb)

Server-wide version of 'log_cache_size_limit_mb'. The total memory used for caching log entries across all tablets is kept under this threshold.

| Type    | int32    |
| ------- | -------- |
| Default | `1024`   |
| Tags    | advanced |

#### [`--log_cache_size_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_cache_size_limit_mb)

The total per-tablet size of consensus entries which may be kept in memory. The log cache attempts to keep all entries which have not yet been replicated to all followers in memory, but if the total size of those entries exceeds this limit within an individual tablet, the oldest will be evicted.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

#### [`--log_async_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_async_preallocate_segments)

Whether the WAL segments preallocation should happen asynchronously

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--log_preallocate_segments`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_preallocate_segments)

Whether the WAL should preallocate the entire segment before writing to it

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--log_segment_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_segment_size_mb)

The default size for log segments, in MB

| Type    | int32    |
| ------- | -------- |
| Default | `8`      |
| Tags    | advanced |

#### [`--evict_failed_followers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_evict_failed_followers)

Whether to evict followers from the Raft config that have fallen too far behind the leader’s log to catch up normally or have been unreachable by the leader for longer than follower_unavailable_considered_failed_sec

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--leader_failure_exp_backoff_max_delta_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_leader_failure_exp_backoff_max_delta_ms)

Maximum time to sleep in between leader election retries, in addition to the regular timeout. When leader election fails the interval in between retries increases exponentially, up to this value.

| Type    | int32        |
| ------- | ------------ |
| Default | `20000`      |
| Tags    | experimental |

#### [`--leader_failure_max_missed_heartbeat_periods`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_leader_failure_max_missed_heartbeat_periods)

Maximum heartbeat periods that the leader can fail to heartbeat in before we consider the leader to be failed. The total failure timeout in milliseconds is raft_heartbeat_interval_ms times leader_failure_max_missed_heartbeat_periods. The value passed to this flag may be fractional.

| Type    | double   |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

#### [`--raft_enable_pre_election`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_raft_enable_pre_election)

When enabled, candidates will call a pre-election before running a real leader election.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `true`               |
| Tags    | runtime,experimental |

#### [`--raft_enable_tombstoned_voting`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_raft_enable_tombstoned_voting)

When enabled, tombstoned tablets may vote in elections.

| Type    | bool                 |
| ------- | -------------------- |
| Default | `true`               |
| Tags    | runtime,experimental |

#### [`--raft_heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_raft_heartbeat_interval_ms)

The heartbeat interval for Raft replication. The leader produces heartbeats to followers at this interval. The followers expect a heartbeat at this interval and consider a leader to have failed if it misses several in a row.

| Type    | int32    |
| ------- | -------- |
| Default | `500`    |
| Tags    | advanced |

#### [`--raft_prepare_replacement_before_eviction`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_raft_prepare_replacement_before_eviction)

When enabled, failed replicas will only be evicted after a replacement has been prepared for them.

| Type    | bool                  |
| ------- | --------------------- |
| Default | `true`                |
| Tags    | experimental,advanced |

#### [`--missed_heartbeats_before_rejecting_snapshot_scans`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_missed_heartbeats_before_rejecting_snapshot_scans)

The maximum raft heartbeat periods since the tablet has seen safe time advanced before refusing scans at snapshots that aren’t yet safe and forcing clients to try again.

| Type    | double       |
| ------- | ------------ |
| Default | `1.5`        |
| Tags    | experimental |

#### [`--safe_time_advancement_without_writes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_safe_time_advancement_without_writes)

Whether to enable the advancement of "safe" time in the absense of write operations

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--safe_time_max_lag_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_safe_time_max_lag_ms)

The maximum amount of time we allow safe time to lag behind the requested timestampbefore forcing the client to retry, in milliseconds.

| Type    | int32        |
| ------- | ------------ |
| Default | `30000`      |
| Tags    | experimental |

#### [`--block_manager_preflush_control`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_block_manager_preflush_control)

Controls when to pre-flush a block. Valid values are 'finalize', 'close', or 'never'. If 'finalize', blocks will be pre-flushed when writing is finished. If 'close', blocks will be pre-flushed when their transaction is committed. If 'never', blocks will never be pre-flushed but still be flushed when closed.

| Type    | string       |
| ------- | ------------ |
| Default | `finalize`   |
| Tags    | experimental |

#### [`--block_manager`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_block_manager)

Which block manager to use for storage. Valid options are 'file' and 'log'.

| Type    | string   |
| ------- | -------- |
| Default | `log`    |
| Tags    | advanced |

#### [`--log_container_excess_space_before_cleanup_fraction`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_excess_space_before_cleanup_fraction)

Additional fraction of a log container’s calculated size that must be consumed on disk before the container is considered to be inconsistent and subject to excess space cleanup at block manager startup.

| Type    | double                |
| ------- | --------------------- |
| Default | `0.10000000000000001` |
| Tags    | advanced              |

#### [`--log_container_live_metadata_before_compact_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_live_metadata_before_compact_ratio)

Desired ratio of live block metadata in log containers. If a container’s live to total block ratio dips below this value, the container’s metadata file will be compacted at startup.

| Type    | double       |
| ------- | ------------ |
| Default | `0.5`        |
| Tags    | experimental |

#### [`--log_container_max_blocks`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_max_blocks)

Maximum number of blocks (soft) of a log container. Use 0 for no limit. Use -1 for no limit except in the case of a kernel bug with hole punching on ext4 (see KUDU-1508 for details).

| Type    | int64    |
| ------- | -------- |
| Default | `-1`     |
| Tags    | advanced |

#### [`--log_container_max_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_max_size)

Maximum size (soft) of a log container

| Type    | uint64        |
| ------- | ------------- |
| Default | `10737418240` |
| Tags    | advanced      |

#### [`--log_container_preallocate_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_container_preallocate_bytes)

Number of bytes to preallocate in a log container when creating new blocks. Set to 0 to disable preallocation

| Type    | uint64     |
| ------- | ---------- |
| Default | `33554432` |
| Tags    | advanced   |

#### [`--rpc_acceptor_listen_backlog`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_acceptor_listen_backlog)

Socket backlog parameter used when listening for RPC connections. This defines the maximum length to which the queue of pending TCP connections inbound to the RPC server may grow. If a connection request arrives when the queue is full, the client may receive an error. Higher values may help the server ride over bursts of new inbound connection requests.

| Type    | int32    |
| ------- | -------- |
| Default | `128`    |
| Tags    | advanced |

#### [`--rpc_encrypt_loopback_connections`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_encrypt_loopback_connections)

Whether to encrypt data transfer on RPC connections that stay within a single host. Encryption here is likely to offer no additional security benefit since only a local 'root' user could intercept the traffic, and wire encryption does not suitably protect against such an attacker.

| Type    | bool     |
| ------- | -------- |
| Default | `false`  |
| Tags    | advanced |

#### [`--rpc_trace_negotiation`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_trace_negotiation)

If enabled, dump traces of all RPC negotiations to the log

| Type    | bool                          |
| ------- | ----------------------------- |
| Default | `false`                       |
| Tags    | experimental,advanced,runtime |

#### [`--rpc_callback_max_cycles`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_callback_max_cycles)

The maximum number of cycles for which an RPC callback should be allowed to run without emitting a warning. (Advanced debugging option)

| Type    | int64            |
| ------- | ---------------- |
| Default | `100000000`      |
| Tags    | runtime,advanced |

#### [`--remember_clients_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_remember_clients_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a client for the purpose of caching its responses. After this period without hearing from it, the client is no longer remembered and the memory occupied by its responses is reclaimed. Retries of requests older than 'remember_clients_ttl_ms' are treated as new ones.

| Type    | int64     |
| ------- | --------- |
| Default | `3600000` |
| Tags    | advanced  |

#### [`--remember_responses_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_remember_responses_ttl_ms)

Maximum amount of time, in milliseconds, the server "remembers" a response to a specific request for a client. After this period has elapsed, the response may have been garbage collected and the client might get a response indicating the request is STALE.

| Type    | int64    |
| ------- | -------- |
| Default | `600000` |
| Tags    | advanced |

#### [`--rpc_dump_all_traces`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_dump_all_traces)

If true, dump all RPC traces at INFO level

| Type    | bool             |
| ------- | ---------------- |
| Default | `false`          |
| Tags    | runtime,advanced |

#### [`--rpc_duration_too_long_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_duration_too_long_ms)

Threshold (in milliseconds) above which a RPC is considered too long and its duration and method name are logged at INFO level. The time measured is between when a RPC is accepted and when its call handler completes.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1000`           |
| Tags    | runtime,advanced |

#### [`--rpc_max_message_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_max_message_size)

The maximum size of a message that any RPC that the server will accept. Must be at least 1MB.

| Type    | int32            |
| ------- | ---------------- |
| Default | `52428800`       |
| Tags    | runtime,advanced |

#### [`--use_system_auth_to_local`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_use_system_auth_to_local)

When enabled, use the system krb5 library to map Kerberos principal names to local (short) usernames. If not enabled, the first component of the principal will be used as the short name. For example, 'kudu/foo.example.com@EXAMPLE' will map to 'kudu'.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--ipki_server_key_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_ipki_server_key_size)

the number of bits for server cert’s private key. The server cert is used for TLS connections to and from clients and other servers.

| Type    | int32        |
| ------- | ------------ |
| Default | `2048`       |
| Tags    | experimental |

#### [`--web_log_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_web_log_bytes)

The maximum number of bytes to display on the debug webserver’s log page

| Type    | int64            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

#### [`--diagnostics_log_stack_traces_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_diagnostics_log_stack_traces_interval_ms)

The interval at which the server will a snapshot of its thread stacks to the diagnostics log. In fact, the server will log at a random interval betweeen zero and twice the configured value to avoid biasing samples towards periodic processes which happen exactly on some particular schedule. If this is set to 0, stack traces will be not be periodically logged.

| Type    | uint32               |
| ------- | -------------------- |
| Default | `60000`              |
| Tags    | experimental,runtime |

#### [`--rpc_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_advertised_addresses)

Comma-separated list of addresses to advertise externally for RPC connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound RPC addresses specified in --rpc_bind_addresses are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--rpc_num_acceptors_per_address`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_num_acceptors_per_address)

Number of RPC acceptor threads for each bound address

| Type    | int32    |
| ------- | -------- |
| Default | `1`      |
| Tags    | advanced |

#### [`--rpc_num_service_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_num_service_threads)

Number of RPC worker threads to run

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

#### [`--rpc_service_queue_length`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_service_queue_length)

Default length of queue for incoming RPC requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

#### [`--max_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_max_negotiation_threads)

Maximum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

#### [`--min_negotiation_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_min_negotiation_threads)

Minimum number of connection negotiation threads.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

#### [`--num_reactor_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_num_reactor_threads)

Number of libev reactor threads to start.

| Type    | int32    |
| ------- | -------- |
| Default | `4`      |
| Tags    | advanced |

#### [`--rpc_ca_certificate_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_ca_certificate_file)

Path to the PEM encoded X509 certificate of the trusted external certificate authority. The provided certificate should be the root issuer of the certificate passed in '--rpc_certificate_file'.

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--rpc_certificate_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_certificate_file)

Path to a PEM encoded X509 certificate to use for securing RPC connections with SSL/TLS. If set, '--rpc_private_key_file' and '--rpc_ca_certificate_file' must be set as well.

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--rpc_default_keepalive_time_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_default_keepalive_time_ms)

If an RPC connection from a client is idle for this amount of time, the server will disconnect the client. Setting this to any negative value keeps connections always alive.

| Type    | int32    |
| ------- | -------- |
| Default | `65000`  |
| Tags    | advanced |

#### [`--rpc_negotiation_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_negotiation_timeout_ms)

Timeout for negotiating an RPC connection.

| Type    | int64            |
| ------- | ---------------- |
| Default | `3000`           |
| Tags    | runtime,advanced |

#### [`--rpc_private_key_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_private_key_file)

Path to a PEM encoded private key paired with the certificate from '--rpc_certificate_file'

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--rpc_private_key_password_cmd`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_private_key_password_cmd)

A Unix command whose output returns the password used to decrypt the RPC server’s private key file specified in --rpc_private_key_file. If the .PEM key file is not password-protected, this flag does not need to be set. Trailing whitespace will be trimmed before it is used to decrypt the private key.

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

#### [`--rpc_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_tls_ciphers)

The cipher suite preferences to use for TLS-secured RPC connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

#### [`--rpc_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_rpc_tls_min_protocol)

The minimum protocol version to allow when for securing RPC connections with TLS. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

#### [`--webserver_enabled`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_enabled)

Whether to enable the web server on this daemon. NOTE: disabling the web server is also likely to prevent monitoring systems from properly capturing metrics.

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--metrics_log_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_metrics_log_interval_ms)

Interval (in milliseconds) at which the server will dump its metrics to a local log file. The log files are located in the same directory as specified by the -log_dir flag. If this is not a positive value, then metrics logging will be disabled.

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

#### [`--webserver_max_post_length_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_max_post_length_bytes)

The maximum length of a POST request that will be accepted by the embedded web server.

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

#### [`--webserver_x_frame_options`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_x_frame_options)

The webserver will add an 'X-Frame-Options' HTTP header with this value to all responses. This can help prevent clickjacking attacks.

| Type    | string   |
| ------- | -------- |
| Default | `DENY`   |
| Tags    | advanced |

#### [`--webserver_advertised_addresses`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_advertised_addresses)

Comma-separated list of addresses to advertise externally for HTTP(S) connections. Ephemeral ports (i.e. port 0) are not allowed. This should be configured when the locally bound webserver address specified in --webserver_interface and --webserver_port are not externally resolvable, for example, if Kudu is deployed in a container.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--webserver_authentication_domain`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_authentication_domain)

Domain used for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

#### [`--webserver_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_doc_root)

Files under <webserver_doc_root> are accessible via the debug webserver. Defaults to $KUDU_HOME/www, or if $KUDU_HOME is not set, disables the document root

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--webserver_enable_doc_root`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_enable_doc_root)

If true, webserver may serve static files from the webserver_doc_root

| Type    | bool     |
| ------- | -------- |
| Default | `true`   |
| Tags    | advanced |

#### [`--webserver_interface`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_interface)

Interface to start debug webserver on. If blank, webserver binds to 0.0.0.0

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--webserver_num_worker_threads`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_num_worker_threads)

Maximum number of threads to start for handling web server requests

| Type    | int32    |
| ------- | -------- |
| Default | `50`     |
| Tags    | advanced |

#### [`--webserver_password_file`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_password_file)

(Optional) Location of .htpasswd file containing user names and hashed passwords for debug webserver authentication

| Type    | string |
| ------- | ------ |
| Default | none   |
| Tags    |        |

#### [`--webserver_tls_ciphers`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_tls_ciphers)

The cipher suite preferences to use for webserver HTTPS connections. Uses the OpenSSL cipher preference list format. See man (1) ciphers for more information.

| Type    | string                                                       |
| ------- | ------------------------------------------------------------ |
| Default | `ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA` |
| Tags    | advanced                                                     |

#### [`--webserver_tls_min_protocol`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_webserver_tls_min_protocol)

The minimum protocol version to allow when for webserver HTTPS connections. May be one of 'TLSv1', 'TLSv1.1', or 'TLSv1.2'.

| Type    | string   |
| ------- | -------- |
| Default | `TLSv1`  |
| Tags    | advanced |

#### [`--budgeted_compaction_target_rowset_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_budgeted_compaction_target_rowset_size)

The target size for DiskRowSets during flush/compact when the budgeted compaction policy is used

| Type    | int32                 |
| ------- | --------------------- |
| Default | `33554432`            |
| Tags    | advanced,experimental |

#### [`--compaction_approximation_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_compaction_approximation_ratio)

Approximation ratio allowed for optimal compaction calculation. A value of 1.05 indicates that the policy may use an approximate result if it is known to be within 5% of the optimal solution.

| Type    | double               |
| ------- | -------------------- |
| Default | `1.0499999523162842` |
| Tags    | experimental         |

#### [`--compaction_minimum_improvement`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_compaction_minimum_improvement)

The minimum quality for a compaction to run. If a compaction does not improve the average height of DiskRowSets by at least this amount, the compaction will be considered ineligible.

| Type    | double                  |
| ------- | ----------------------- |
| Default | `0.0099999997764825821` |
| Tags    |                         |

#### [`--deltafile_default_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_deltafile_default_block_size)

Block size for delta files. In the future, this may become configurable on a per-table basis.

| Type    | int32        |
| ------- | ------------ |
| Default | `32768`      |
| Tags    | experimental |

#### [`--deltafile_default_compression_codec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_deltafile_default_compression_codec)

The compression codec used when writing deltafiles.

| Type    | string       |
| ------- | ------------ |
| Default | `lz4`        |
| Tags    | experimental |

#### [`--default_composite_key_index_block_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_default_composite_key_index_block_size_bytes)

Block size used for composite key indexes.

| Type    | int32        |
| ------- | ------------ |
| Default | `4096`       |
| Tags    | experimental |

#### [`--tablet_delta_store_major_compact_min_ratio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_delta_store_major_compact_min_ratio)

Minimum ratio of sizeof(deltas) to sizeof(base data) before a major compaction can run (Advanced option)

| Type    | double                |
| ------- | --------------------- |
| Default | `0.10000000149011612` |
| Tags    | experimental          |

#### [`--tablet_delta_store_minor_compact_max`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_delta_store_minor_compact_max)

How many delta stores are required before forcing a minor delta compaction (Advanced option)

| Type    | int32        |
| ------- | ------------ |
| Default | `1000`       |
| Tags    | experimental |

#### [`--tablet_bloom_block_size`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_bloom_block_size)

Block size of the bloom filters used for tablet keys.

| Type    | int32    |
| ------- | -------- |
| Default | `4096`   |
| Tags    | advanced |

#### [`--tablet_bloom_target_fp_rate`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_bloom_target_fp_rate)

Target false-positive rate (between 0 and 1) to size tablet key bloom filters. A lower false positive rate may reduce the number of disk seeks required in heavy insert workloads, at the expense of more space and RAM required for bloom filters.

| Type    | double                   |
| ------- | ------------------------ |
| Default | `9.9999997473787516e-05` |
| Tags    | advanced                 |

#### [`--tablet_compaction_budget_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_compaction_budget_mb)

Budget for a single compaction

| Type    | int32        |
| ------- | ------------ |
| Default | `128`        |
| Tags    | experimental |

#### [`--tablet_history_max_age_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_history_max_age_sec)

Number of seconds to retain tablet history. Reads initiated at a snapshot that is older than this age will be rejected. To disable history removal, set to -1.

| Type    | int32    |
| ------- | -------- |
| Default | `900`    |
| Tags    | advanced |

#### [`--tablet_throttler_burst_factor`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_throttler_burst_factor)

Burst factor for write RPC throttling. The maximum rate the throttler allows within a token refill period (100ms) equals burst factor multiply base rate.

| Type    | double       |
| ------- | ------------ |
| Default | `1`          |
| Tags    | experimental |

#### [`--tablet_throttler_bytes_per_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_throttler_bytes_per_sec)

Maximum write RPC IO rate (byte/s) allowed for a tablet, write RPC exceeding this limit will be throttled. 0 means no limit.

| Type    | int64        |
| ------- | ------------ |
| Default | `0`          |
| Tags    | experimental |

#### [`--tablet_throttler_rpc_per_sec`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_throttler_rpc_per_sec)

Maximum write RPC rate (op/s) allowed for a tablet, write RPC exceeding this limit will be throttled. 0 means no limit.

| Type    | int64        |
| ------- | ------------ |
| Default | `0`          |
| Tags    | experimental |

#### [`--flush_threshold_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_flush_threshold_mb)

Size at which MemRowSet flushes are triggered. A MRS can still flush below this threshold if it if hasn’t flushed in a while, or if the server-wide memory limit has been reached.

| Type    | int32        |
| ------- | ------------ |
| Default | `1024`       |
| Tags    | experimental |

#### [`--flush_threshold_secs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_flush_threshold_secs)

Number of seconds after which a non-empty MemRowSet will become flushable even if it is not large.

| Type    | int32        |
| ------- | ------------ |
| Default | `120`        |
| Tags    | experimental |

#### [`--tablet_transaction_memory_limit_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_transaction_memory_limit_mb)

Maximum amount of memory that may be consumed by all in-flight transactions belonging to a particular tablet. When this limit is reached, new transactions will be rejected and clients will be forced to retry them. If -1, transaction memory tracking is disabled.

| Type    | int64    |
| ------- | -------- |
| Default | `64`     |
| Tags    | advanced |

#### [`--heartbeat_incompatible_replica_management_is_fatal`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_incompatible_replica_management_is_fatal)

Whether incompatible replica management schemes or unsupported PREPARE_REPLACEMENT_BEFORE_EVICTION feature flag by master are fatal

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

#### [`--heartbeat_interval_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_interval_ms)

Interval at which the TS heartbeats to the master.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

#### [`--heartbeat_max_failures_before_backoff`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_max_failures_before_backoff)

Maximum number of consecutive heartbeat failures until the Tablet Server backs off to the normal heartbeat interval, rather than retrying.

| Type    | int32    |
| ------- | -------- |
| Default | `3`      |
| Tags    | advanced |

#### [`--heartbeat_rpc_timeout_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heartbeat_rpc_timeout_ms)

Timeout used for the TS→Master heartbeat RPCs.

| Type    | int32    |
| ------- | -------- |
| Default | `15000`  |
| Tags    | advanced |

#### [`--scan_history_count`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scan_history_count)

Number of completed scans to keep history for. Determines how many historical scans will be shown on the tablet server’s scans dashboard.

| Type    | int32        |
| ------- | ------------ |
| Default | `20`         |
| Tags    | experimental |

#### [`--scanner_ttl_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_ttl_ms)

Number of milliseconds of inactivity allowed for a scannerbefore it may be expired

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

#### [`--scanner_batch_size_rows`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_batch_size_rows)

The number of rows to batch for servicing scan requests.

| Type    | int32            |
| ------- | ---------------- |
| Default | `100`            |
| Tags    | runtime,advanced |

#### [`--scanner_default_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_default_batch_size_bytes)

The default size for batches of scan results

| Type    | int32            |
| ------- | ---------------- |
| Default | `1048576`        |
| Tags    | runtime,advanced |

#### [`--scanner_max_batch_size_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_max_batch_size_bytes)

The maximum batch size that a client may request for scan results.

| Type    | int32            |
| ------- | ---------------- |
| Default | `8388608`        |
| Tags    | runtime,advanced |

#### [`--scanner_max_wait_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_scanner_max_wait_ms)

The maximum amount of time (in milliseconds) we’ll hang a scanner thread waiting for safe time to advance or transactions to commit, even if its deadline allows waiting longer.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

#### [`--num_tablets_to_copy_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_num_tablets_to_copy_simultaneously)

Number of threads available to copy tablets from remote servers.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

#### [`--num_tablets_to_open_simultaneously`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_num_tablets_to_open_simultaneously)

Number of threads available to open tablets during startup. If this is set to 0 (the default), then the number of bootstrap threads will be set based on the number of data directories. If the data directories are on some very fast storage device such as SSD or a RAID array, it may make sense to manually tune this.

| Type    | int32    |
| ------- | -------- |
| Default | `0`      |
| Tags    | advanced |

#### [`--tablet_state_walk_min_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tablet_state_walk_min_period_ms)

Minimum amount of time in milliseconds between walks of the tablet map to update tablet state counts.

| Type    | int32    |
| ------- | -------- |
| Default | `1000`   |
| Tags    | advanced |

#### [`--trace_to_console`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_trace_to_console)

Trace pattern specifying which trace events should be dumped directly to the console

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--crash_on_eio`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_crash_on_eio)

Kill the process if an I/O operation results in EIO. If false, I/O resulting in EIOs will return the status IOError and leave error-handling up to the caller.

| Type    | bool                  |
| ------- | --------------------- |
| Default | `false`               |
| Tags    | experimental,advanced |

#### [`--env_use_ioctl_hole_punch_on_xfs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_env_use_ioctl_hole_punch_on_xfs)

Use the XFS_IOC_UNRESVSP64 ioctl instead of fallocate(2) to punch holes on XFS filesystems.

| Type    | bool                  |
| ------- | --------------------- |
| Default | `true`                |
| Tags    | experimental,advanced |

#### [`--file_cache_expiry_period_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_file_cache_expiry_period_ms)

Period of time (in ms) between removing expired file cache descriptors

| Type    | int32    |
| ------- | -------- |
| Default | `60000`  |
| Tags    | advanced |

#### [`--heap_sample_every_n_bytes`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_heap_sample_every_n_bytes)

Enable heap occupancy sampling. If this flag is set to some positive value N, a memory allocation will be sampled approximately every N bytes. Lower values of N incur larger overhead but give more accurate results. A value such as 524288 (512KB) is a reasonable choice with relatively low overhead.

| Type    | int64                 |
| ------- | --------------------- |
| Default | `0`                   |
| Tags    | experimental,advanced |

#### [`--umask`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_umask)

The umask that will be used when creating files and directories. Permissions of top-level data directories will also be modified at start-up to conform to the given umask. Changing this value may enable unauthorized local users to read or modify data stored by Kudu.

| Type    | string   |
| ------- | -------- |
| Default | `077`    |
| Tags    | advanced |

#### [`--max_log_files`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_max_log_files)

Maximum number of log files to retain per severity level. The most recent log files are retained. If set to 0, all log files are retained.

| Type    | int32                |
| ------- | -------------------- |
| Default | `10`                 |
| Tags    | experimental,runtime |

#### [`--data_gc_min_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_data_gc_min_size_mb)

The (exclusive) minimum number of megabytes of ancient data on disk, per tablet, needed to prioritize deletion of that data.

| Type    | int64        |
| ------- | ------------ |
| Default | `0`          |
| Tags    | experimental |

#### [`--data_gc_prioritization_prob`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_data_gc_prioritization_prob)

The probability that we will prioritize data GC over performance improvement operations. If set to 1.0, we will always prefer to delete old data before running performance improvement operations such as delta compaction.

| Type    | double       |
| ------- | ------------ |
| Default | `0.5`        |
| Tags    | experimental |

#### [`--log_target_replay_size_mb`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_target_replay_size_mb)

The target maximum size of logs to be replayed at startup. If a tablet has in-memory operations that are causing more than this size of logs to be retained, then the maintenance manager will prioritize flushing these operations to disk.

| Type    | int64        |
| ------- | ------------ |
| Default | `1024`       |
| Tags    | experimental |

#### [`--metrics_retirement_age_ms`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_metrics_retirement_age_ms)

The minimum number of milliseconds a metric will be kept for after it is no longer active. (Advanced option)

| Type    | int32            |
| ------- | ---------------- |
| Default | `120000`         |
| Tags    | advanced,runtime |

#### [`--local_ip_for_outbound_sockets`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_local_ip_for_outbound_sockets)

IP to bind to when making outgoing socket connections. This must be an IP address of the form A.B.C.D, not a hostname. Advanced parameter, subject to change.

| Type    | string       |
| ------- | ------------ |
| Default | none         |
| Tags    | experimental |

#### [`--nvm_cache_allocation_retry_count`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_nvm_cache_allocation_retry_count)

The number of times that the NVM cache will retry attempts to allocate memory for new entries. In between attempts, a cache entry will be evicted.

| Type    | int32                 |
| ------- | --------------------- |
| Default | `10`                  |
| Tags    | experimental,advanced |

#### [`--nvm_cache_path`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_nvm_cache_path)

The path at which the NVM cache will try to allocate its memory. This can be a tmpfs or ramfs for testing purposes.

| Type    | string       |
| ------- | ------------ |
| Default | `/vmem`      |
| Tags    | experimental |

#### [`--memory_limit_soft_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_memory_limit_soft_percentage)

Percentage of the hard memory limit that this daemon may consume before memory throttling of writes begins. The greater the excess, the higher the chance of throttling. In general, a lower soft limit leads to smoother write latencies but decreased throughput, and vice versa for a higher soft limit.

| Type    | int32    |
| ------- | -------- |
| Default | `80`     |
| Tags    | advanced |

#### [`--memory_limit_warn_threshold_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_memory_limit_warn_threshold_percentage)

Percentage of the hard memory limit that this daemon may consume before WARNING level messages are periodically logged.

| Type    | int32    |
| ------- | -------- |
| Default | `98`     |
| Tags    | advanced |

#### [`--memory_pressure_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_memory_pressure_percentage)

Percentage of the hard memory limit that this daemon may consume before flushing of in-memory data becomes prioritized.

| Type    | int32    |
| ------- | -------- |
| Default | `60`     |
| Tags    | advanced |

#### [`--tcmalloc_max_free_bytes_percentage`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_tcmalloc_max_free_bytes_percentage)

Maximum percentage of the RSS that tcmalloc is allowed to use for reserved but unallocated memory.

| Type    | int32    |
| ------- | -------- |
| Default | `10`     |
| Tags    | advanced |

#### [`--drop_log_memory`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_drop_log_memory)

Drop in-memory buffers of log contents. Logs can grow very quickly and they are rarely read before they need to be evicted from memory. Instead, drop them from memory as soon as they are flushed to disk.

| Type    | bool             |
| ------- | ---------------- |
| Default | `true`           |
| Tags    | runtime,advanced |

#### [`--log_backtrace_at`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_log_backtrace_at)

Emit a backtrace when logging at file:linenum.

| Type    | string   |
| ------- | -------- |
| Default | none     |
| Tags    | advanced |

#### [`--logbuflevel`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_logbuflevel)

Buffer log messages logged at this level or lower (-1 means don’t buffer; 0 means buffer INFO only; …)

| Type    | int32            |
| ------- | ---------------- |
| Default | `0`              |
| Tags    | runtime,advanced |

#### [`--logbufsecs`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_logbufsecs)

Buffer log messages for at most this many seconds

| Type    | int32            |
| ------- | ---------------- |
| Default | `5`              |
| Tags    | runtime,advanced |

#### [`--logfile_mode`](http://kudu.apache.org/docs/configuration_reference.html#kudu-tserver_logfile_mode)

Log file mode/permissions.

| Type    | int32 |
| ------- | ----- |
| Default | `436` |
| Tags    |       |

------