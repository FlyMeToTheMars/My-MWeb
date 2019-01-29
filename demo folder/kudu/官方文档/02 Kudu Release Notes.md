# Apache Kudu 1.7.1 Release Notes

## [Fixed Issues](http://kudu.apache.org/docs/release_notes.html#rn_1.7.1_fixed_issues)

Apache Kudu 1.7.1 is a bug-fix release which fixes critical issues in Kudu 1.7.0.

- Fixed and issue where a leader replica could report a follower’s health status as FAILED instead of FAILED_UNRECOVERABLE. In configurations where the tablet replication factor equals to the total number of tablet servers in the cluster, that lead to situations where the tablet could not be automatically recovered until a new leader was elected or corresponding tablet servers were restarted. (see [KUDU-2367](https://issues.apache.org/jira/browse/KUDU-2367)).
- Fixed an issue where Kudu would fail to start if RLIMIT_NPROC was set to -1. (see [KUDU-2377](https://issues.apache.org/jira/browse/KUDU-2377)).
- Fixed an issue where `kudu-spark` was unable to connect to secure clusters. (see [KUDU-2379](https://issues.apache.org/jira/browse/KUDU-2379)).
- Fixed an issue where the `kudu-python` client would not compile in environments where `__int128` is not supported. This was most commonly el6 environments. (see [KUDU-2412](https://issues.apache.org/jira/browse/KUDU-2412)).
- Fixed an issue where unaligned loads of `__int128` integers could result in a crash. (see [KUDU-2378](https://issues.apache.org/jira/browse/KUDU-2378)).
- Fixed a bug in `PartialRow.setMin` that could lead to incorrect partition pruning when a `decimal` column is part of the tables range partition but not a part of the query predicate. (see [KUDU-2416](https://issues.apache.org/jira/browse/KUDU-2416)).
- Fixed an equality check on `decimal` column predicates that could result in pruning that is too conservative.
- Fixed an issue where ColumnSchema.toString() would throw a NullPointerException on non-decimal types.
- Added an optimization that improves the performance when scanning tables with large consecutive runs of deleted rows. For example, users may use 'DELETE' all rows in a table or partition before re-adding them, or they may delete all data corresponding to some prefix of the PK.
- Fixed an issue where moving single-replica tablets via `kudu tablet change_config move_replica` does not work. (see [KUDU-2443](https://issues.apache.org/jira/browse/KUDU-2443)).

# [Apache Kudu 1.7.0 Release Notes](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_release_notes)

## [Upgrade Notes](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_upgrade_notes)

- Upgrading directly from Kudu 1.6.0 is supported and no special upgrade steps are required. A rolling upgrade of the server side will *not* work because the default replica management scheme changed, and running masters and tablet servers with different replica management schemes is not supported, see [Incompatible Changes in Kudu 1.7.0](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_incompatible_changes) for details. However, mixing client and server sides of different versions is not a problem. You can still update your clients before your servers or vice versa. When upgrading to Kudu 1.7, it is required to first shut down all Kudu processes across the cluster, then upgrade the software on all servers, then restart the Kudu processes on all servers in the cluster.

## [Obsoletions](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_obsoletions)

- The `tcmalloc_contention_time` metric, which previously tracked the amount of time spent in memory allocator lock contention, has been removed.

## [Deprecations](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_deprecations)

- Support for Java 7 has been deprecated since Kudu 1.5.0 and may be removed in the next major release.

## [New features](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_new_features)

- Kudu now supports the decimal column type. The decimal type is a numeric data type with fixed scale and precision suitable for financial and other arithmetic calculations where the imprecise representation and rounding behavior of float and double make those types impractical. The decimal type is also useful for integers larger than int64 and cases with fractional values in a primary key. See [Decimal Type](http://kudu.apache.org/docs/schema_design.html#decimal) for more details.
- The strategy Kudu uses for automatically healing tablets which have lost a replica due to server or disk failures has been improved. The new re-replication strategy, or replica management scheme, first adds a replacement tablet replica before evicting the failed one. With the previous replica management scheme, the system first evicts the failed replica and then adds a replacement. The new replica management scheme allows for much faster recovery of tablets in scenarios where one tablet server goes down and then returns back shortly after 5 minutes or so. The new scheme also provides substantially better overall stability on clusters with frequent server failures. (see [KUDU-1097](https://issues.apache.org/jira/browse/KUDU-1097)).
- The `kudu fs update_dirs` tool now supports removing directories. Unless the `--force` flag is specified, Kudu will not allow the removal of a directory across which tablets are configured to spread data. If specified, all tablet replicas configured to use that directory will fail upon starting up and be replicated elsewhere, provided a majority exists elsewhere.
- Users can use the new `--fs_metadata_dir` to specify the directory in which to place tablet-specific metadata. It is recommended, although not necessary, that this be placed on a high-performance drive with high bandwidth and low latency, e.g. a solid-state drive. If not specified, metadata will be placed in the directory specified by `--fs_wal_dir`, or in the directory specified by the first entry of `--fs_data_dirs` if metadata already exists there from a pre-Kudu 1.7 deployment. Kudu will not automatically move existing metadata based on this configuration.
- Kudu 1.7 introduces a new scan read mode READ_YOUR_WRITES. Users can specify READ_YOUR_WRITES when creating a new scanner in C++, Java and Python clients. If this mode is used, the client will perform a read such that it follows all previously known writes and reads from this client. Reads in this mode ensure read-your-writes and read-your-reads session guarantees, while minimizing latency caused by waiting for outstanding write transactions to complete. Note that this is still an experimental feature which may be stabilized in future releases.
- The tablet server web UI scans dashboard (/scans) has been improved with several new features, including: showing the most recently completed scans, a pseudo-SQL scan descriptor that concisely shows the selected columns and applied predicates, and more complete and better documented scan statistics.
- Kudu daemons now expose a web page `/stacks` which dumps the current stack trace of every thread running in the server. This information can be helpful when diagnosing performance issues.

## [Optimizations and improvements](http://kudu.apache.org/docs/release_notes.html#_optimizations_and_improvements)

- By default, each tablet replica will now stripe data blocks across 3 data directories instead of all data directories. This decreases the likelihood that any given tablet will be affected in the event of a single disk failure. No substantial performance impact is expected due to this feature based on [performance testing](https://github.com/apache/kudu/commit/60276c54a221d554287c6645df7df542fe6d6443). This change only affects new replicas created after upgrading to Kudu 1.7.
- Kudu servers previously offered the ability to enable a separate metrics log which stores periodic snapshots of all metrics available on a server. This functionality is now available as part of a more general “diagnostics log” which is enabled by default. The diagnostics log includes periodic dumps of server metrics as well as collections of thread stack traces. The default configuration ensures that no more than 640MB of diagnostics logs are retained, and typically the space consumption is significantly less due to compression. The format and contents of this log file are documented in the [Administration guide](http://kudu.apache.org/docs/administration.html).
- The handling of errors in the synchronous Java client has been improved so that, when an exception is thrown, the stack trace indicates the correct location where the client function was invoked rather than a call stack of an internal worker thread. The original call stack from the worker thread is available as a “suppressed exception”.
- The logging of errors in the Java client has been improved to exclude exception stack traces for expected scenarios such as failure to connect to a server in a cluster. Instead, only a single line informational message will be logged in such cases to aid in debugging.
- The Java client now uses a predefined prioritized list of TLS ciphers when establishing an encrypted connection to Kudu servers. This cipher list matches the list of ciphers preferred for server-to-server communication and ensures that the most efficient and secure ciphers are preferred. When the Kudu client is running on Java 8 or newer, this provides a substantial speed-up to read and write performance.
- Reporting for the `kudu cluster ksck` tool has been updated so tablets and tables with on-going tablet copies are shown as "recovering". Additional reporting changes have been made to make various common scenarios, particularly tablet copies, less alarming.
- The performance of inserting rows containing many string or binary columns has been improved, especially in the case of highly concurrent write workloads.
- By default, Spark tasks that scan Kudu will now be able to scan non-leader replicas. This allows Spark to more easily schedule kudu-spark tasks local to the data. Users can disable this behavior by passing 'leader_only' to the 'kudu.scanLocality' option."
- The number of OS threads used in the steady state and during bursts of activity (such as in Raft leader elections triggered by a node failure) has been drastically reduced and should no longer exceed the value of `ulimit -u`. As such, it should no longer be necessary to increase the value of `ulimit -u` (or of /proc/sys/kernel/threads-max) in order to run a Kudu tablet server in most cases. (see [KUDU-1913](https://issues.apache.org/jira/browse/KUDU-1913)).
- An issue where sparse column predicates could cause excessive data-block reads has been fixed. Previously in certain scans with sparsely matching predicates on multiple columns, Kudu would read and decode the same data blocks many times. The improvement typically results in a 5-10x performance increase for the affected scans. (see [KUDU-2231](https://issues.apache.org/jira/browse/KUDU-2231)).
- The efficiency and on-disk size of large updated values has been improved. This will improve update-heavy workloads which overwrite large (1KiB+) values. (see [KUDU-2253](https://issues.apache.org/jira/browse/KUDU-2253)).

## [Fixed Issues](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_fixed_issues)

- Fixed a scenario where the on-disk data of a tablet server was completely erased and and a new tablet server was started on the same host. This issue could prevent tablet replicas previously hosted on the server from being evicted and re-replicated. Tablets now immediately evict replicas that respond with a different server UUID than expected. (see [KUDU-1613](https://issues.apache.org/jira/browse/KUDU-1613)).
- Fixed a rare race condition when connecting to masters during their startup which might cause a client to get a response without a CA certificate and/or authentication token. This would cause the client to fail to authenticate with other servers in the cluster. The leader master now always sends a CA certificate and an authentication token (when applicable) to a Kudu client with a successful ConnectToMaster response. (see [KUDU-1927](https://issues.apache.org/jira/browse/KUDU-1927)).
- The Kudu Java client now will retry a connection if no master is discovered as a leader, and the user has a valid authentication token. This avoids failure in recoverable cases when masters are in the process of the very first leader election after starting up. (see [KUDU-2262](https://issues.apache.org/jira/browse/KUDU-2262)).
- The Java client will now automatically attempt to re-acquire Kerberos credentials from the ticket cache when the prior credentials are about to expire. This allows client instances to persist longer than the expiration time of a single Kerberos ticket so long as some other process renews the credentials in the ticket cache. Documentation on interacting with Kerberos authentication has been added to the Javadoc for the `AsyncKuduClient` class. (see [KUDU-2264](https://issues.apache.org/jira/browse/KUDU-2264)).
- Follower masters are now able to verify authentication tokens even if they have never been a leader. Prior to this fix, if a follower master had never been a leader, clients would be unable to authenticate to that master, resulting in spurious error messages being logged. (see [KUDU-2265](https://issues.apache.org/jira/browse/KUDU-2265)).
- Fixed a tablet server crash when a tablet replica is deleted during a scan. (see [KUDU-2295](https://issues.apache.org/jira/browse/KUDU-2295)).
- The evaluation order of predicates in scans with multiple predicates has been made deterministic. Due to a bug, this was not necessarily the case previously. Predicates are applied in most to least selective order, with ties broken by column index. The evaluation order may change in the future, particularly when better column statistics are made available internally. (see [KUDU-2312](https://issues.apache.org/jira/browse/KUDU-2312)).
- Previously, the `kudu tablet change_config move_replica` tool required all tablet servers in the cluster to be available when performing a move. This restriction has been relaxed: only the tablet server that will receive a replica of the tablet being moved and the hosts of the tablet’s existing replicas need to be available for the move to occur. (see [KUDU-2331](https://issues.apache.org/jira/browse/KUDU-2331)).
- Fixed a bug in the Java client which prevented the client from locating the new leader master after a leader failover in the case that the previous leader either remained online or restarted quickly. This bug resulted in the client timing out operations with errors indicating that there was no leader master. (see [KUDU-2343](https://issues.apache.org/jira/browse/KUDU-2343)).
- The Unix process username of the client is now included inside the exported security credentials, so that the effective username of clients who import credentials and subsequently use unauthenticated (SASL PLAIN) connections matches the client who exported the security credentials. For example, this is useful to let the Spark executors know which username to use if the Spark driver has no authentication token. This change only affects clusters with encryption disabled using `--rpc-encryption=disabled`. (see [KUDU-2259](https://issues.apache.org/jira/browse/KUDU-2259)).

## [Wire Protocol compatibility](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_wire_compatibility)

Kudu 1.7.0 is wire-compatible with previous versions of Kudu:

- Kudu 1.7 clients may connect to servers running Kudu 1.0 or later. If the client uses features that are not available on the target server, an error will be returned.
- Rolling upgrade between Kudu 1.6 and Kudu 1.7 servers is believed to be possible though has not been sufficiently tested. Users are encouraged to shut down all nodes in the cluster, upgrade the software, and then restart the daemons on the new version.
- Kudu 1.0 clients may connect to servers running Kudu 1.7 with the exception of the below-mentioned restrictions regarding secure clusters.

The authentication features introduced in Kudu 1.3 place the following limitations on wire compatibility between Kudu 1.7 and versions earlier than 1.3:

- If a Kudu 1.7 cluster is configured with authentication or encryption set to "required", clients older than Kudu 1.3 will be unable to connect.
- If a Kudu 1.7 cluster is configured with authentication and encryption set to "optional" or "disabled", older clients will still be able to connect.

## [Incompatible Changes in Kudu 1.7.0](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_incompatible_changes)

- The newly introduced replica management scheme is not compatible with the old scheme, so it’s not possible to run pre-1.7 Kudu masters with 1.7 Kudu tablet servers or vice versa. This is a server-side incompatibility only and it does not affect client compatibility. In other words, Kudu clients of prior versions are compatible with upgraded Kudu clusters.
  - Kudu masters of 1.7 version will not register Kudu tablet servers of 1.6 and prior versions.
  - Kudu tablet servers of 1.7 version will not work with Kudu masters of 1.6 and prior versions.
- The format of the previously-optional metrics log has changed to include a human-readable timestamp on each line. The path of the log file has also changed with the word “diagnostics” replacing the word “metrics” in the file name. The metrics log has been optimized to only include those metrics which have changed in between successive samples, and to not include entity attributes such as tablet partition information in the log. (see [KUDU-2297](https://issues.apache.org/jira/browse/KUDU-2297)).

### [Client Library Compatibility](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_client_compatibility)

- The Kudu 1.7 Java client library is API- and ABI-compatible with Kudu 1.6. Applications written against Kudu 1.6 will compile and run against the Kudu 1.7 client library and vice-versa.
- The Kudu 1.7 C++ client is API- and ABI-forward-compatible with Kudu 1.6. Applications written and compiled against the Kudu 1.6 client library will run without modification against the Kudu 1.7 client library. Applications written and compiled against the Kudu 1.7 client library will run without modification against the Kudu 1.6 client library.
- The Kudu 1.7 Python client is API-compatible with Kudu 1.6. Applications written against Kudu 1.6 will continue to run against the Kudu 1.7 client and vice-versa.
- Kudu 1.7 clients that attempt to create a table with a decimal column on a target server running Kudu 1.6 or earlier will receive an error response. Similarly Kudu clients running Kudu 1.6 or earlier will result in an error when attempting to access any table containing containing a decimal column.

## [Known Issues and Limitations](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_known_issues)

Please refer to the [Known Issues and Limitations](http://kudu.apache.org/docs/known_issues.html) section of the documentation.

## [Contributors](http://kudu.apache.org/docs/release_notes.html#rn_1.7.0_contributors)

Kudu 1.7 includes contributions from 22 people, including two first-time contributors, Clemens Valiente and Tsuyoshi Ozawa.

Thank you for helping to make Kudu even better!

## [Resources](http://kudu.apache.org/docs/release_notes.html#resources_and_next_steps)

- [Kudu Website](http://kudu.apache.org/)
- [Kudu GitHub Repository](http://github.com/apache/kudu)
- [Kudu Documentation](http://kudu.apache.org/docs/index.html)
- [Release notes for older releases](http://kudu.apache.org/docs/prior_release_notes.html)

## [Installation Options](http://kudu.apache.org/docs/release_notes.html#_installation_options)

For full installation details, see [Kudu Installation](http://kudu.apache.org/docs/installation.html).

## [Next Steps](http://kudu.apache.org/docs/release_notes.html#_next_steps)

- [Kudu Quickstart](http://kudu.apache.org/docs/quickstart.html)
- [Installing Kudu](http://kudu.apache.org/docs/installation.html)
- [Configuring Kudu](http://kudu.apache.org/docs/configuration.html)