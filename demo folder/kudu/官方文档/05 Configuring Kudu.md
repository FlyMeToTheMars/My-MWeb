# Configuring Apache Kudu

|      | Kudu is easier to configure with [Cloudera Manager](http://www.cloudera.com/content/www/en-us/products/cloudera-manager.html) than in a standalone installation. See Cloudera’s [Kudu documentation](http://www.cloudera.com/documentation/kudu/latest/topics/kudu_installation.html)for more details about using Kudu with Cloudera Manager. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## [Configure Kudu](http://kudu.apache.org/docs/configuration.html#_configure_kudu)

### [Configuration Basics](http://kudu.apache.org/docs/configuration.html#_configuration_basics)

To configure the behavior of each Kudu process, you can pass command-line flags when you start it, or read those options from configuration files by passing them using one or more `--flagfile=<file>` options. You can even include the `--flagfile` option within your configuration file to include other files. Learn more about gflags by reading [its documentation](https://gflags.github.io/gflags/).

You can place options for masters and tablet servers into the same configuration file, and each will ignore options that do not apply.

Flags can be prefixed with either one or two `-` characters. This documentation standardizes on two: `--example_flag`.

### [Discovering Configuration Options](http://kudu.apache.org/docs/configuration.html#_discovering_configuration_options)

Only the most common configuration options are documented here. For a more exhaustive list of configuration options, see the [Configuration Reference](http://kudu.apache.org/docs/configuration_reference.html).

To see all configuration flags for a given executable, run it with the `--help` option. Take care when configuring undocumented flags, as not every possible configuration has been tested, and undocumented options are not guaranteed to be maintained in future releases.

### [Directory Configurations](http://kudu.apache.org/docs/configuration.html#directory_configuration)

Every Kudu node requires the specification of directory flags. The `--fs_wal_dir` configuration indicates where Kudu will place its write-ahead logs. The `--fs_metadata_dir` configuration indicates where Kudu will place metadata for each tablet. It is recommended, although not necessary, that these directories be placed on a high-performance drives with high bandwidth and low latency, e.g. solid-state drives. If `--fs_metadata_dir` is not specified, metadata will be placed in the directory specified by `--fs_wal_dir`.

The `--fs_data_dirs` configuration indicates where Kudu will write its data blocks. This is a comma-separated list of directories; if multiple values are specified, data will be striped across the directories. If not specified, data blocks will be placed in the directory specified by `--fs_wal_dir`.

Additionally, `--fs_wal_dir` and `--fs_metadata_dir` may be the same as *one of* the directories listed in `--fs_data_dirs`, but must not be sub-directories of any of them.

|      | Once `--fs_data_dirs` is set, extra tooling is required to change it. For more details, see the [Kudu Administration docs](http://kudu.apache.org/docs/administration.html#change_dir_config). |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

|      | The `--fs_wal_dir` and `--fs_metadata_dir` configurations can be changed, provided the contents of the directories are also moved to match the flags. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### [Configuring the Kudu Master](http://kudu.apache.org/docs/configuration.html#_configuring_the_kudu_master)

To see all available configuration options for the `kudu-master` executable, run it with the `--help` option:

```
$ kudu-master --help
```

| Flag                 | Valid Options | Default     | Description                                                  |
| -------------------- | ------------- | ----------- | ------------------------------------------------------------ |
| `--master_addresses` | string        | `localhost` | Comma-separated list of all the RPC addresses for Master consensus-configuration. If not specified, assumes a standalone Master. |
| `--fs_data_dirs`     | string        |             | List of directories where the Master will place its data blocks. |
| `--fs_metadata_dir`  | string        |             | The directory where the Master will place its tablet metadata. |
| `--fs_wal_dir`       | string        |             | The directory where the Master will place its write-ahead logs. |
| `--log_dir`          | string        | `/tmp`      | The directory to store Master log files.                     |

For the full list of flags for masters, see the [Kudu Master Configuration Reference](http://kudu.apache.org/docs/configuration_reference.html#master_configuration_reference).

### [Configuring Tablet Servers](http://kudu.apache.org/docs/configuration.html#_configuring_tablet_servers)

To see all available configuration options for the `kudu-tserver` executable, run it with the `--help` option:

```
$ kudu-tserver --help
```

| Flag                      | Valid Options | Default          | Description                                                  |
| ------------------------- | ------------- | ---------------- | ------------------------------------------------------------ |
| --fs_data_dirs            | string        |                  | List of directories where the Tablet Server will place its data blocks. |
| --fs_metadata_dir         | string        |                  | The directory where the Tablet Server will place its tablet metadata. |
| --fs_wal_dir              | string        |                  | The directory where the Tablet Server will place its write-ahead logs. |
| --log_dir                 | string        | /tmp             | The directory to store Tablet Server log files               |
| --tserver_master_addrs    | string        | `127.0.0.1:7051` | Comma separated addresses of the masters which the tablet server should connect to. The masters do not read this flag. |
| --block_cache_capacity_mb | integer       | 512              | Maximum amount of memory allocated to the Kudu Tablet Server’s block cache. |
| --memory_limit_hard_bytes | integer       | 4294967296       | Maximum amount of memory a Tablet Server can consume before it starts rejecting all incoming writes. |

For the full list of flags for tablet servers, see the [Kudu Tablet Server Configuration Reference](http://kudu.apache.org/docs/configuration_reference.html#tablet_server_configuration_reference).

## [Next Steps](http://kudu.apache.org/docs/configuration.html#_next_steps)

- [Get Started With Kudu](http://kudu.apache.org/docs/quickstart.html)
- [Developing Applications With Kudu](http://kudu.apache.org/docs/developing.html)