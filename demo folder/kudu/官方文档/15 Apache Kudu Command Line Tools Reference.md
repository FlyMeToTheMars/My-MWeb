# Apache Kudu Command Line Tools Reference

## [Command Hierarchy](http://kudu.apache.org/docs/command_line_tools_reference.html#_command_hierarchy)

- [cluster](http://kudu.apache.org/docs/command_line_tools_reference.html#cluster)
  - [ksck](http://kudu.apache.org/docs/command_line_tools_reference.html#cluster-ksck)
- [fs](http://kudu.apache.org/docs/command_line_tools_reference.html#fs)
  - [check](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-check)
  - [format](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-format)
  - [list](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-list)
  - [update_dirs](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-update_dirs)
  - [dump](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-dump)
    - [block](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-block)
    - [cfile](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-cfile)
    - [tree](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-tree)
    - [uuid](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-uuid)
- [local_replica](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica)
  - [copy_from_remote](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-copy_from_remote)
  - [data_size](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-data_size)
  - [delete](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-delete)
  - [list](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-list)
  - [cmeta](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-cmeta)
    - [print_replica_uuids](http://kudu.apache.org/docs/command_line_tools_reference.html#cmeta-print_replica_uuids)
    - [rewrite_raft_config](http://kudu.apache.org/docs/command_line_tools_reference.html#cmeta-rewrite_raft_config)
    - [set_term](http://kudu.apache.org/docs/command_line_tools_reference.html#cmeta-set_term)
  - [dump](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-dump)
    - [block_ids](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-block_ids)
    - [meta](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-meta)
    - [rowset](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-rowset)
    - [wals](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-wals)
- [master](http://kudu.apache.org/docs/command_line_tools_reference.html#master)
  - [set_flag](http://kudu.apache.org/docs/command_line_tools_reference.html#master-set_flag)
  - [status](http://kudu.apache.org/docs/command_line_tools_reference.html#master-status)
  - [timestamp](http://kudu.apache.org/docs/command_line_tools_reference.html#master-timestamp)
  - [list](http://kudu.apache.org/docs/command_line_tools_reference.html#master-list)
- [pbc](http://kudu.apache.org/docs/command_line_tools_reference.html#pbc)
  - [dump](http://kudu.apache.org/docs/command_line_tools_reference.html#pbc-dump)
  - [edit](http://kudu.apache.org/docs/command_line_tools_reference.html#pbc-edit)
- [perf](http://kudu.apache.org/docs/command_line_tools_reference.html#perf)
  - [loadgen](http://kudu.apache.org/docs/command_line_tools_reference.html#perf-loadgen)
- [remote_replica](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica)
  - [check](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-check)
  - [copy](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-copy)
  - [delete](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-delete)
  - [dump](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-dump)
  - [list](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-list)
  - [unsafe_change_config](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-unsafe_change_config)
- [table](http://kudu.apache.org/docs/command_line_tools_reference.html#table)
  - [delete](http://kudu.apache.org/docs/command_line_tools_reference.html#table-delete)
  - [list](http://kudu.apache.org/docs/command_line_tools_reference.html#table-list)
- [tablet](http://kudu.apache.org/docs/command_line_tools_reference.html#tablet)
  - [leader_step_down](http://kudu.apache.org/docs/command_line_tools_reference.html#tablet-leader_step_down)
  - [change_config](http://kudu.apache.org/docs/command_line_tools_reference.html#tablet-change_config)
    - [add_replica](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-add_replica)
    - [change_replica_type](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-change_replica_type)
    - [move_replica](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-move_replica)
    - [remove_replica](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-remove_replica)
- [test](http://kudu.apache.org/docs/command_line_tools_reference.html#test)
  - [mini_cluster](http://kudu.apache.org/docs/command_line_tools_reference.html#test-mini_cluster)
- [tserver](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver)
  - [set_flag](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-set_flag)
  - [status](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-status)
  - [timestamp](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-timestamp)
  - [list](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-list)
- [wal](http://kudu.apache.org/docs/command_line_tools_reference.html#wal)
  - [dump](http://kudu.apache.org/docs/command_line_tools_reference.html#wal-dump)

## [Command Details](http://kudu.apache.org/docs/command_line_tools_reference.html#_command_details)

### [`cluster`: Operate on a Kudu cluster](http://kudu.apache.org/docs/command_line_tools_reference.html#cluster)



#### [`ksck`: Check the health of a Kudu cluster ](http://kudu.apache.org/docs/command_line_tools_reference.html#cluster-ksck)

By default, ksck checks that master and tablet server processes are running, and that table metadata is consistent. Use the 'checksum' flag to check that tablet data is consistent (also see the 'tables' and 'tablets' flags). Use the 'checksum_snapshot' along with 'checksum' if the table or tablets are actively receiving inserts or updates. Use the 'verbose' flag to output detailed information on cluster status even if no inconsistency is found in metadata.
**Usage:**
`kudu cluster ksck <master_addresses> [-checksum_cache_blocks] [-checksum_scan] [-checksum_scan_concurrency=<concurrency>] [-nochecksum_snapshot] [-checksum_timeout_sec=<sec>] [-color=<color>] [-noconsensus] [-tables=<tables>] [-tablets=<tablets>] [-verbose]` 
**Arguments:**

| Name                                 | Description                                                  | Type   | Default |
| ------------------------------------ | ------------------------------------------------------------ | ------ | ------- |
| master_addresses                     | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| checksum_cache_blocks (optional)     | Should the checksum scanners cache the read blocks           | bool   | `false` |
| checksum_scan (optional)             | Perform a checksum scan on data in the cluster.              | bool   | `false` |
| checksum_scan_concurrency (optional) | Number of concurrent checksum scans to execute per tablet server. | int32  | `4`     |
| checksum_snapshot (optional)         | Should the checksum scanner use a snapshot scan              | bool   | `true`  |
| checksum_timeout_sec (optional)      | Maximum total seconds to wait for a checksum scan to complete before timing out. | int32  | `3600`  |
| color (optional)                     | Specifies whether output should be colorized. The default value 'auto' colorizes output if the output is a terminal. The other valid values are 'always' or 'never'. | string | `auto`  |
| consensus (optional)                 | Whether to check the consensus state from each tablet against the master. | bool   | `true`  |
| tables (optional)                    | Tables to check (comma-separated list of names). If not specified, checks all tables. | string | none    |
| tablets (optional)                   | Tablets to check (comma-separated list of IDs) If not specified, checks all tablets. | string | none    |
| verbose (optional)                   | Output detailed information even if no inconsistency is found. | bool   | `false` |



### [`fs`: Operate on a local Kudu filesystem](http://kudu.apache.org/docs/command_line_tools_reference.html#fs)



#### [`check`: Check a Kudu filesystem for inconsistencies ](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-check)

**Usage:**
`kudu fs check [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-repair]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |
| repair (optional)          | Repair any inconsistencies in the filesystem.                | bool   | `false` |



#### [`format`: Format a new Kudu filesystem ](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-format)

**Usage:**
`kudu fs format [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-uuid=<uuid>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |
| uuid (optional)            | The uuid to use in the filesystem. If not provided, one is generated | string | none    |



#### [`list`: List metadata for on-disk tablets, rowsets, blocks, and cfiles ](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-list)

This tool is useful for discovering and gathering information about on-disk data. Many field types can be added to the results with the --columns flag, and results can be filtered to a specific table, tablet, rowset, column, or block through flags.

Note: adding any of the 'cfile' fields to --columns will cause the tool to read on-disk metadata for each CFile in the result set, which could require large amounts of I/O when many results are returned.
**Usage:**
`kudu fs list [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-table_id=<id>] [-tablet_id=<id>] [-rowset_id=<id>] [-column_id=<id>] [-block_id=<id>] [-columns=<columns>] [-format=<format>] [-noh]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default                                      |
| -------------------------- | ------------------------------------------------------------ | ------ | -------------------------------------------- |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none                                         |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none                                         |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none                                         |
| table_id (optional)        | Restrict output to a specific table                          | string | none                                         |
| tablet_id (optional)       | Restrict output to a specific tablet                         | string | none                                         |
| rowset_id (optional)       | Restrict output to a specific rowset                         | int64  | `-1`                                         |
| column_id (optional)       | Restrict output to a specific column                         | int32  | `-1`                                         |
| block_id (optional)        | Restrict output to a specific block                          | uint64 | `0`                                          |
| columns (optional)         | Comma-separated list of fields to include in output. Possible values: table, table-id, tablet-id, partition, rowset-id, block-id, block-kind, column, column-id, cfile-data-type, cfile-nullable, cfile-encoding, cfile-compression, cfile-num-values, cfile-size, cfile-incompatible-features, cfile-compatible-features, cfile-min-key, cfile-max-key, cfile-delta-stats | string | `tablet-id, rowset-id, block-id, block-kind` |
| format (optional)          | Format to use for printing list output tables. Possible values: pretty, space, tsv, csv, and json | string | `pretty`                                     |
| h (optional)               | Pretty-print values in human-readable units                  | bool   | `true`                                       |



#### [`update_dirs`: Updates the set of data directories in an existing Kudu filesystem ](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-update_dirs)

If a data directory is in use by a tablet and is removed, the operation will fail unless --force is also used
**Usage:**
`kudu fs update_dirs [-force] [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| force (optional)           | If true, permits the removal of a data directory that is configured for use by existing tablets. Those tablets will fail the next time the server is started | bool   | `false` |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



#### [`dump`: Dump a Kudu filesystem](http://kudu.apache.org/docs/command_line_tools_reference.html#fs-dump)



##### [`block`: Dump the binary contents of a data block ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-block)

This performs no parsing or interpretation of the data stored in the block but rather outputs its binary contents directly.
**Usage:**
`kudu fs dump block <block_id> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| block_id                   | block identifier                                             | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



##### [`cfile`: Dump the contents of a CFile (column file) ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-cfile)

This interprets the contents of a CFile-formatted block and outputs the decoded row data.
**Usage:**
`kudu fs dump cfile <block_id> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-noprint_meta] [-noprint_rows]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| block_id                   | block identifier                                             | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |
| print_meta (optional)      | Include metadata in output                                   | bool   | `true`  |
| print_rows (optional)      | Print each row in the CFile                                  | bool   | `true`  |



##### [`tree`: Dump the tree of a Kudu filesystem ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-tree)

**Usage:**
`kudu fs dump tree [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



##### [`uuid`: Dump the UUID of a Kudu filesystem ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-uuid)

**Usage:**
`kudu fs dump uuid [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



### [`local_replica`: Operate on local tablet replicas via the local filesystem](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica)



#### [`copy_from_remote`: Copy a tablet replica from a remote server ](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-copy_from_remote)

**Usage:**
`kudu local_replica copy_from_remote <tablet_id> <source> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| source                     | Source RPC address of form hostname:port                     | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



#### [`data_size`: Summarize the data size/space usage of the given local replica(s). ](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-data_size)

**Usage:**
`kudu local_replica data_size <tablet_id_pattern> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-format=<format>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default  |
| -------------------------- | ------------------------------------------------------------ | ------ | -------- |
| tablet_id_pattern          | Tablet identifier pattern. This argument supports basic glob syntax: '*' matches 0 or more wildcard characters. | string | none     |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none     |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none     |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none     |
| format (optional)          | Format to use for printing list output tables. Possible values: pretty, space, tsv, csv, and json | string | `pretty` |



#### [`delete`: Delete a tablet replica from the local filesystem. By default, leaves a tombstone record. ](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-delete)

**Usage:**
`kudu local_replica delete <tablet_id> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-clean_unsafe]`
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |
| clean_unsafe (optional)    | Delete the local replica completely, not leaving a tombstone. This is not guaranteed to be safe because it also removes the consensus metadata (including Raft voting record) for the specified tablet, which violates the Raft vote durability requirements. | bool   | `false` |



#### [`list`: Show list of tablet replicas in the local filesystem ](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-list)

**Usage:**
`kudu local_replica list [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-list_detail]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |
| list_detail (optional)     | Print partition info for the local replicas                  | bool   | `false` |



#### [`cmeta`: Operate on a local tablet replica’s consensus metadata file](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-cmeta)



##### [`print_replica_uuids`: Print all tablet replica peer UUIDs found in a tablet’s Raft configuration ](http://kudu.apache.org/docs/command_line_tools_reference.html#cmeta-print_replica_uuids)

**Usage:**
`kudu local_replica cmeta print_replica_uuids <tablet_id> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



##### [`rewrite_raft_config`: Rewrite a tablet replica’s Raft configuration ](http://kudu.apache.org/docs/command_line_tools_reference.html#cmeta-rewrite_raft_config)

**Usage:**
`kudu local_replica cmeta rewrite_raft_config <tablet_id> <peers>…​ [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| peers…                     | List of peers where each peer is of form 'uuid:hostname:port' | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



##### [`set_term`: Bump the current term stored in consensus metadata ](http://kudu.apache.org/docs/command_line_tools_reference.html#cmeta-set_term)

**Usage:**
`kudu local_replica cmeta set_term <tablet_id> <term> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| term                       | the new raft term (must be greater than the current term)    | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



#### [`dump`: Dump a Kudu filesystem](http://kudu.apache.org/docs/command_line_tools_reference.html#local_replica-dump)



##### [`block_ids`: Dump the IDs of all blocks belonging to a local replica ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-block_ids)

**Usage:**
`kudu local_replica dump block_ids <tablet_id> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



##### [`meta`: Dump the metadata of a local replica ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-meta)

**Usage:**
`kudu local_replica dump meta <tablet_id> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |



##### [`rowset`: Dump the rowset contents of a local replica ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-rowset)

**Usage:**
`kudu local_replica dump rowset <tablet_id> [-dump_data] [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-metadata_only] [-nrows=<nrows>] [-rowset_index=<index>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default |
| -------------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id                  | Tablet Identifier                                            | string | none    |
| dump_data (optional)       | Dump the data for each column in the rowset.                 | bool   | `false` |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none    |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none    |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none    |
| metadata_only (optional)   | Only dump the block metadata when printing blocks.           | bool   | `false` |
| nrows (optional)           | Number of rows to dump                                       | int64  | `0`     |
| rowset_index (optional)    | Index of the rowset in local replica, default value(-1) will dump all the rowsets of the local replica | int64  | `-1`    |



##### [`wals`: Dump all WAL (write-ahead log) segments of a local replica ](http://kudu.apache.org/docs/command_line_tools_reference.html#dump-wals)

**Usage:**
`kudu local_replica dump wals <tablet_id> [-fs_data_dirs=<dirs>] [-fs_metadata_dir=<dir>] [-fs_wal_dir=<dir>] [-print_entries=<entries>] [-noprint_meta] [-truncate_data=<data>]` 
**Arguments:**

| Name                       | Description                                                  | Type   | Default   |
| -------------------------- | ------------------------------------------------------------ | ------ | --------- |
| tablet_id                  | Tablet Identifier                                            | string | none      |
| fs_data_dirs (optional)    | Comma-separated list of directories with data blocks. If this is not specified, fs_wal_dir will be used as the sole data block directory. | string | none      |
| fs_metadata_dir (optional) | Directory with metadata. If this is not specified, for compatibility with Kudu 1.6 and below, Kudu will check the first entry of fs_data_dirs for metadata and use it as the metadata directory if any exists. If none exists, fs_wal_dir will be used as the metadata directory. | string | none      |
| fs_wal_dir (optional)      | Directory with write-ahead logs. If this is not specified, the program will not start. May be the same as fs_data_dirs | string | none      |
| print_entries (optional)   | How to print entries: false\|0\|no = don’t print true\|1\|yes\|decoded = print them decoded pb = print the raw protobuf id = print only their ids | string | `decoded` |
| print_meta (optional)      | Include metadata in output                                   | bool   | `true`    |
| truncate_data (optional)   | Truncate the data fields to the given number of bytes before printing. Set to 0 to disable | int32  | `100`     |



### [`master`: Operate on a Kudu Master](http://kudu.apache.org/docs/command_line_tools_reference.html#master)



#### [`set_flag`: Change a gflag value on a Kudu Master ](http://kudu.apache.org/docs/command_line_tools_reference.html#master-set_flag)

**Usage:**
`kudu master set_flag <master_address> <flag> <value> [-force]` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| master_address   | Address of a Kudu Master of form 'hostname:port'. Port may be omitted if the Master is bound to the default port. | string | none    |
| flag             | Name of the gflag                                            | string | none    |
| value            | New value for the gflag                                      | string | none    |
| force (optional) | If true, allows the set_flag command to set a flag which is not explicitly marked as runtime-settable. Such flag changes may be simply ignored on the server, or may cause the server to crash. | bool   | `false` |



#### [`status`: Get the status of a Kudu Master ](http://kudu.apache.org/docs/command_line_tools_reference.html#master-status)

**Usage:**
`kudu master status <master_address>` 
**Arguments:**

| Name           | Description                                                  | Type   | Default |
| -------------- | ------------------------------------------------------------ | ------ | ------- |
| master_address | Address of a Kudu Master of form 'hostname:port'. Port may be omitted if the Master is bound to the default port. | string | none    |



#### [`timestamp`: Get the current timestamp of a Kudu Master ](http://kudu.apache.org/docs/command_line_tools_reference.html#master-timestamp)

**Usage:**
`kudu master timestamp <master_address>` 
**Arguments:**

| Name           | Description                                                  | Type   | Default |
| -------------- | ------------------------------------------------------------ | ------ | ------- |
| master_address | Address of a Kudu Master of form 'hostname:port'. Port may be omitted if the Master is bound to the default port. | string | none    |



#### [`list`: List masters in a Kudu cluster ](http://kudu.apache.org/docs/command_line_tools_reference.html#master-list)

**Usage:**
`kudu master list <master_addresses> [-columns=<columns>] [-format=<format>] [-timeout_ms=<ms>]` 
**Arguments:**

| Name                  | Description                                                  | Type   | Default              |
| --------------------- | ------------------------------------------------------------ | ------ | -------------------- |
| master_addresses      | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none                 |
| columns (optional)    | Comma-separated list of master info fields to include in output. Possible values: uuid, rpc-addresses, http-addresses, version, and seqno | string | `uuid,rpc-addresses` |
| format (optional)     | Format to use for printing list output tables. Possible values: pretty, space, tsv, csv, and json | string | `pretty`             |
| timeout_ms (optional) | RPC timeout in milliseconds                                  | int64  | `60000`              |



### [`pbc`: Operate on PBC (protobuf container) files](http://kudu.apache.org/docs/command_line_tools_reference.html#pbc)



#### [`dump`: Dump a PBC (protobuf container) file ](http://kudu.apache.org/docs/command_line_tools_reference.html#pbc-dump)

**Usage:**
`kudu pbc dump <path> [-oneline] [-json]` 
**Arguments:**

| Name               | Description                          | Type   | Default |
| ------------------ | ------------------------------------ | ------ | ------- |
| path               | path to PBC file                     | string | none    |
| oneline (optional) | print each protobuf on a single line | bool   | `false` |
| json (optional)    | print protobufs in JSON format       | bool   | `false` |



#### [`edit`: Edit a PBC (protobuf container) file ](http://kudu.apache.org/docs/command_line_tools_reference.html#pbc-edit)

**Usage:**
`kudu pbc edit <path>` 
**Arguments:**

| Name | Description      | Type   | Default |
| ---- | ---------------- | ------ | ------- |
| path | path to PBC file | string | none    |



### [`perf`: Measure the performance of a Kudu cluster](http://kudu.apache.org/docs/command_line_tools_reference.html#perf)



#### [`loadgen`: Run load generation with optional scan afterwards ](http://kudu.apache.org/docs/command_line_tools_reference.html#perf-loadgen)

Run load generation tool which inserts auto-generated data into an existing or auto-created table as fast as possible. If requested, also scan the inserted rows to check whether the actual count of inserted rows matches the expected one.
**Usage:**
`kudu perf loadgen <master_addresses> [-buffer_flush_watermark_pct=<pct>] [-buffer_size_bytes=<bytes>] [-buffers_num=<num>] [-error_buffer_size_bytes=<bytes>] [-flush_per_n_rows=<rows>] [-keep_auto_table] [-num_rows_per_thread=<thread>] [-num_threads=<threads>] [-run_scan] [-seq_start=<start>] [-show_first_n_errors=<errors>] [-string_fixed=<fixed>] [-string_len=<len>] [-table_name=<name>] [-table_num_buckets=<buckets>] [-table_num_replicas=<replicas>] [-use_random]` 
**Arguments:**

| Name                                  | Description                                                  | Type   | Default    |
| ------------------------------------- | ------------------------------------------------------------ | ------ | ---------- |
| master_addresses                      | Comma-separated list of master addresses to run against. Addresses are in 'hostname:port' form where port may be omitted if a master server listens at the default port. | string | none       |
| buffer_flush_watermark_pct (optional) | Mutation buffer flush watermark, in percentage of total size. | double | `0.5`      |
| buffer_size_bytes (optional)          | Size of the mutation buffer, per session (bytes).            | int32  | `4194304`  |
| buffers_num (optional)                | Number of mutation buffers per session.                      | int32  | `2`        |
| error_buffer_size_bytes (optional)    | Size of the error buffer, per session (bytes). 0 means 'unlimited'. This setting may impose an additional upper limit for the effective number of errors controlled by the '--show_first_n_errors' flag. | int32  | `16777216` |
| flush_per_n_rows (optional)           | Perform async flush per given number of rows added. Setting to non-zero implicitly turns on manual flush mode. | int32  | `0`        |
| keep_auto_table (optional)            | If using the auto-generated table, enabling this option retains the table populated with the data after the test finishes. By default, the auto-generated table is dropped after successfully finishing the test. NOTE: this parameter has no effect if using already existing table (see the '--table_name' flag): the existing tables nor their data are never dropped/deleted. | bool   | `false`    |
| num_rows_per_thread (optional)        | Number of rows each thread generates and inserts; 0 means unlimited. All rows generated by a thread are inserted in the context of the same session. | uint64 | `1000`     |
| num_threads (optional)                | Number of generator threads to run. Each thread runs its own KuduSession. | int32  | `2`        |
| run_scan (optional)                   | Whether to run post-insertion scan to verify that the count of the inserted rows matches the expected number. If enabled, the scan is run only if no errors were encountered while inserting the generated rows. | bool   | `false`    |
| seq_start (optional)                  | Initial value for the generator in sequential mode. This is useful when running multiple times against already existing table: for every next run, set this flag to (num_threads * num_rows_per_thread * column_num + seq_start). | uint64 | `0`        |
| show_first_n_errors (optional)        | Output detailed information on the specified number of first n errors (if any). The limit on the per-session error buffer space may impose an additional upper limit for the effective number of errors in the output. If so, consider increasing the size of the error buffer using the '--error_buffer_size_bytes' flag. | int32  | `0`        |
| string_fixed (optional)               | Pre-defined string to write into binary and string columns. Client generates more data per second using pre-defined string compared with auto-generated strings of the same length if run with the same CPU/memory configuration. If left empty, then auto-generated strings of length specified by the '--string_len' parameter are used instead. | string | none       |
| string_len (optional)                 | Length of strings to put into string and binary columns. This parameter is not in effect if '--string_fixed' is specified. | int32  | `32`       |
| table_name (optional)                 | Name of an existing table to use for the test. The test will determine the structure of the table schema and populate it with data accordingly. If left empty, the test automatically creates a table of pre-defined columnar structure with unique name and uses it to insert auto-generated data. The auto-created table is dropped upon successful completion of the test if not overridden by the '--keep_auto_table' flag. If running the test against an already existing table, it’s highly recommended to use a dedicated table created just for testing purposes: the existing table nor its data is never dropped/deleted. | string | none       |
| table_num_buckets (optional)          | The number of buckets to create when this tool creates a new table. | int32  | `8`        |
| table_num_replicas (optional)         | The number of replicas for the auto-created table; 0 means 'use server-side default'. | int32  | `1`        |
| use_random (optional)                 | Whether to use random numbers instead of sequential ones. In case of using random numbers collisions are possible over the data for columns with unique constraint (e.g. primary key). | bool   | `false`    |



### [`remote_replica`: Operate on remote tablet replicas on a Kudu Tablet Server](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica)



#### [`check`: Check if all tablet replicas on a Kudu Tablet Server are running ](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-check)

**Usage:**
`kudu remote_replica check <tserver_address>` 
**Arguments:**

| Name            | Description                                                  | Type   | Default |
| --------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |



#### [`copy`: Copy a tablet replica from one Kudu Tablet Server to another ](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-copy)

**Usage:**
`kudu remote_replica copy <tablet_id> <src_address> <dst_address> [-force_copy]` 
**Arguments:**

| Name                  | Description                                                  | Type   | Default |
| --------------------- | ------------------------------------------------------------ | ------ | ------- |
| tablet_id             | Tablet Identifier                                            | string | none    |
| src_address           | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |
| dst_address           | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |
| force_copy (optional) | Force the copy when the destination tablet server has this replica | bool   | `false` |



#### [`delete`: Delete a tablet replica from a Kudu Tablet Server ](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-delete)

**Usage:**
`kudu remote_replica delete <tserver_address> <tablet_id> <reason>` 
**Arguments:**

| Name            | Description                                                  | Type   | Default |
| --------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |
| tablet_id       | Tablet Identifier                                            | string | none    |
| reason          | Reason for deleting the replica                              | string | none    |



#### [`dump`: Dump the data of a tablet replica on a Kudu Tablet Server ](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-dump)

**Usage:**
`kudu remote_replica dump <tserver_address> <tablet_id>` 
**Arguments:**

| Name            | Description                                                  | Type   | Default |
| --------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |
| tablet_id       | Tablet Identifier                                            | string | none    |



#### [`list`: List all tablet replicas on a Kudu Tablet Server ](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-list)

**Usage:**
`kudu remote_replica list <tserver_address>` 
**Arguments:**

| Name            | Description                                                  | Type   | Default |
| --------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |



#### [`unsafe_change_config`: Force the specified replica to adopt a new Raft config ](http://kudu.apache.org/docs/command_line_tools_reference.html#remote_replica-unsafe_change_config)

This tool is useful when a config change is necessary because a tablet cannot make progress with its current Raft configuration (e.g. to evict followers when a majority is unavailable).

Note: The members of the new Raft config must be a subset of (or the same as) the members of the existing committed Raft config.
**Usage:**
`kudu remote_replica unsafe_change_config <tserver_address> <tablet_id> <peer uuids>…​` 
**Arguments:**

| Name            | Description                                                  | Type   | Default |
| --------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |
| tablet_id       | Tablet Identifier                                            | string | none    |
| peer uuids…     | List of peer uuids to be part of new config                  | string | none    |



### [`table`: Operate on Kudu tables](http://kudu.apache.org/docs/command_line_tools_reference.html#table)



#### [`delete`: Delete a table ](http://kudu.apache.org/docs/command_line_tools_reference.html#table-delete)

**Usage:**
`kudu table delete <master_addresses> <table_name>` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| master_addresses | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| table_name       | Name of the table to delete                                  | string | none    |



#### [`list`: List all tables ](http://kudu.apache.org/docs/command_line_tools_reference.html#table-list)

**Usage:**
`kudu table list <master_addresses> [-list_tablets]` 
**Arguments:**

| Name                    | Description                                                  | Type   | Default |
| ----------------------- | ------------------------------------------------------------ | ------ | ------- |
| master_addresses        | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| list_tablets (optional) | Include tablet and replica UUIDs in the output               | bool   | `false` |



### [`tablet`: Operate on remote Kudu tablets](http://kudu.apache.org/docs/command_line_tools_reference.html#tablet)



#### [`leader_step_down`: Force the tablet’s leader replica to step down ](http://kudu.apache.org/docs/command_line_tools_reference.html#tablet-leader_step_down)

**Usage:**
`kudu tablet leader_step_down <master_addresses> <tablet_id>` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| master_addresses | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| tablet_id        | Tablet Identifier                                            | string | none    |



#### [`change_config`: Change a tablet’s Raft configuration](http://kudu.apache.org/docs/command_line_tools_reference.html#tablet-change_config)



##### [`add_replica`: Add a new replica to a tablet’s Raft configuration ](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-add_replica)

**Usage:**
`kudu tablet change_config add_replica <master_addresses> <tablet_id> <ts_uuid> <replica_type>` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| master_addresses | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| tablet_id        | Tablet Identifier                                            | string | none    |
| ts_uuid          | UUID of the tablet server that should host the new replica   | string | none    |
| replica_type     | New replica’s type. Must be VOTER or NON-VOTER.              | string | none    |



##### [`change_replica_type`: Change the type of an existing replica in a tablet’s Raft configuration ](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-change_replica_type)

**Usage:**
`kudu tablet change_config change_replica_type <master_addresses> <tablet_id> <ts_uuid> <replica_type>` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| master_addresses | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| tablet_id        | Tablet Identifier                                            | string | none    |
| ts_uuid          | UUID of the tablet server hosting the existing replica       | string | none    |
| replica_type     | Existing replica’s new type. Must be VOTER or NON-VOTER.     | string | none    |



##### [`move_replica`: Move a tablet replica from one tablet server to another ](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-move_replica)

The replica move tool effectively moves a replica from one tablet server to another by adding a replica to the new server and then removing it from the old one. It requires that ksck return no errors when run against the target tablet. If the move fails, the user should wait for any tablet copy to complete, and, if the copy succeeds, use remove_replica manually. If the copy fails, the new replica will be deleted automatically after some time, and then the move can be retried.
**Usage:**
`kudu tablet change_config move_replica <master_addresses> <tablet_id> <from_ts_uuid> <to_ts_uuid>` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| master_addresses | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| tablet_id        | Tablet Identifier                                            | string | none    |
| from_ts_uuid     | UUID of the tablet server to move from                       | string | none    |
| to_ts_uuid       | UUID of the tablet server to move to                         | string | none    |



##### [`remove_replica`: Remove an existing replica from a tablet’s Raft configuration ](http://kudu.apache.org/docs/command_line_tools_reference.html#change_config-remove_replica)

**Usage:**
`kudu tablet change_config remove_replica <master_addresses> <tablet_id> <ts_uuid>` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| master_addresses | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none    |
| tablet_id        | Tablet Identifier                                            | string | none    |
| ts_uuid          | UUID of the tablet server hosting the existing replica       | string | none    |



### [`test`: Various test actions](http://kudu.apache.org/docs/command_line_tools_reference.html#test)



#### [`mini_cluster`: Spawn a control shell for running a mini-cluster ](http://kudu.apache.org/docs/command_line_tools_reference.html#test-mini_cluster)

The protocol for the control shell is protobuf-based and is documented in src/kudu/tools/tool.proto. It is currently considered to be highly experimental and subject to change.

Example JSON input to create and start a cluster: {"createCluster":{"numTservers":3}} {"startCluster":{}} 
**Usage:**
`kudu test mini_cluster [-serialization=<serialization>]` 
**Arguments:**

| Name                     | Description                                                  | Type   | Default |
| ------------------------ | ------------------------------------------------------------ | ------ | ------- |
| serialization (optional) | Serialization method to be used by the control shell. Valid values are 'json' (protobuf serialized into JSON and terminated with a newline character) or 'pb' (four byte protobuf message length in big endian followed by the protobuf message itself). | string | `json`  |



### [`tserver`: Operate on a Kudu Tablet Server](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver)



#### [`set_flag`: Change a gflag value on a Kudu Tablet Server ](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-set_flag)

**Usage:**
`kudu tserver set_flag <tserver_address> <flag> <value> [-force]` 
**Arguments:**

| Name             | Description                                                  | Type   | Default |
| ---------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address  | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |
| flag             | Name of the gflag                                            | string | none    |
| value            | New value for the gflag                                      | string | none    |
| force (optional) | If true, allows the set_flag command to set a flag which is not explicitly marked as runtime-settable. Such flag changes may be simply ignored on the server, or may cause the server to crash. | bool   | `false` |



#### [`status`: Get the status of a Kudu Tablet Server ](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-status)

**Usage:**
`kudu tserver status <tserver_address>` 
**Arguments:**

| Name            | Description                                                  | Type   | Default |
| --------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |



#### [`timestamp`: Get the current timestamp of a Kudu Tablet Server ](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-timestamp)

**Usage:**
`kudu tserver timestamp <tserver_address>` 
**Arguments:**

| Name            | Description                                                  | Type   | Default |
| --------------- | ------------------------------------------------------------ | ------ | ------- |
| tserver_address | Address of a Kudu Tablet Server of form 'hostname:port'. Port may be omitted if the Tablet Server is bound to the default port. | string | none    |



#### [`list`: List tablet servers in a Kudu cluster ](http://kudu.apache.org/docs/command_line_tools_reference.html#tserver-list)

**Usage:**
`kudu tserver list <master_addresses> [-columns=<columns>] [-format=<format>] [-timeout_ms=<ms>]` 
**Arguments:**

| Name                  | Description                                                  | Type   | Default              |
| --------------------- | ------------------------------------------------------------ | ------ | -------------------- |
| master_addresses      | Comma-separated list of Kudu Master addresses where each address is of form 'hostname:port' | string | none                 |
| columns (optional)    | Comma-separated list of tserver info fields to include in output. Possible values: uuid, rpc-addresses, http-addresses, version, seqno, and heartbeat | string | `uuid,rpc-addresses` |
| format (optional)     | Format to use for printing list output tables. Possible values: pretty, space, tsv, csv, and json | string | `pretty`             |
| timeout_ms (optional) | RPC timeout in milliseconds                                  | int64  | `60000`              |



### [`wal`: Operate on WAL (write-ahead log) files](http://kudu.apache.org/docs/command_line_tools_reference.html#wal)



#### [`dump`: Dump a WAL (write-ahead log) file ](http://kudu.apache.org/docs/command_line_tools_reference.html#wal-dump)

**Usage:**
`kudu wal dump <path> [-print_entries=<entries>] [-noprint_meta] [-truncate_data=<data>]` 
**Arguments:**

| Name                     | Description                                                  | Type   | Default   |
| ------------------------ | ------------------------------------------------------------ | ------ | --------- |
| path                     | path to WAL file                                             | string | none      |
| print_entries (optional) | How to print entries: false\|0\|no = don’t print true\|1\|yes\|decoded = print them decoded pb = print the raw protobuf id = print only their ids | string | `decoded` |
| print_meta (optional)    | Include metadata in output                                   | bool   | `true`    |
| truncate_data (optional) | Truncate the data fields to the given number of bytes before printing. Set to 0 to disable | int32  | `100`     |