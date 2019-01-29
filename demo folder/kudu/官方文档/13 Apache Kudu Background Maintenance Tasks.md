# Apache Kudu Background Maintenance Tasks

Kudu relies on running background tasks for many important automatic maintenance activities. These tasks include flushing data from memory to disk, compacting data to improve performance, freeing up disk space, and more.

## [Maintenance manager](http://kudu.apache.org/docs/background_tasks.html#_maintenance_manager)

The maintenance manager schedules and runs background tasks. At any given point in time, the maintenance manager is prioritizing the next task based on the improvement needed at that moment, such as relieving memory pressure, improving read performance, or freeing up disk space. The number of worker threads dedicated to running background tasks can be controlled by setting `--maintenance_manager_num_threads`.

## [Flushing data to disk](http://kudu.apache.org/docs/background_tasks.html#_flushing_data_to_disk)

Flushing data from memory to disk relieves memory pressure and can improve read performance by switching from a write-optimized, row-oriented in-memory format in the `MemRowSet` to a read-optimized, column-oriented format on disk. Background tasks that flush data include `FlushMRSOp` and `FlushDeltaMemStoresOp`.

The metrics associated with these ops have the prefix `flush_mrs` and `flush_dms`, respectively.

## [Compacting on-disk data](http://kudu.apache.org/docs/background_tasks.html#_compacting_on_disk_data)

Kudu constantly performs several types of compaction tasks in order to maintain consistent read and write performance over time. A merging compaction, which combines multiple `DiskRowSets` together into a single `DiskRowSet`, is run by `CompactRowSetsOp`. There are two types of delta store compaction operations that may be run as well: `MinorDeltaCompactionOp` and `MajorDeltaCompactionOp`.

For more information on what these different types of compaction operations do, please see the [Kudu Tablet design document](https://github.com/apache/kudu/blob/master/docs/design-docs/tablet.md).

The metrics associated with these tasks have the prefix `compact_rs`, `delta_minor_compact_rs`, and `delta_major_compact_rs`, respectively.

## [Write-ahead log GC](http://kudu.apache.org/docs/background_tasks.html#_write_ahead_log_gc)

Kudu maintains a write-ahead log (WAL) per tablet that is split into discrete fixed-size segments. A tablet periodically rolls the WAL to a new log segment when the active segment reaches a configured size (controlled by `--log_segment_size_mb`). In order to save disk space and decrease startup time, a background task called `LogGCOp` attempts to garbage-collect (GC) old WAL segments by deleting them from disk once it is determined that they are no longer needed by the local node for durability.

The metrics associated with this background task have the prefix `log_gc`.

## [Tablet history GC and the ancient history mark](http://kudu.apache.org/docs/background_tasks.html#_tablet_history_gc_and_the_ancient_history_mark)

Because Kudu uses a multiversion concurrency control (MVCC) mechanism to ensure that snapshot scans can proceeed isolated from new changes to a table, periodically old historical data should be garbage-collected (removed) to free up disk space. While Kudu never removes rows or data that are visible in the latest version of the data, Kudu does remove records of old changes that are no longer visible.

The point in time in the past beyond which historical MVCC data becomes inaccessible and is free to be deleted is called the *ancient history mark* (AHM). The AHM can be configured by setting `--tablet_history_max_age_sec`.

There are two background tasks that GC historical MVCC data older than the AHM: the one that runs the merging compaction, called `CompactRowSetsOp` (see above), and a separate background task that deletes old undo delta blocks, called `UndoDeltaBlockGCOp`. Running `UndoDeltaBlockGCOp` reduces disk space usage in all workloads, but particularly in those with a higher volume of updates or upserts.

The metrics associated with this background task have the prefix `undo_delta_block`.