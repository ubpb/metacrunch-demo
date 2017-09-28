metacrunch-demo
===============

This repository contains several examples on how to use the [metacrunch ETL toolkit](https://github.com/ubpb/metacrunch).

To run the examples clone this repo, install metacrunch and use the `metacrunch` CLI command to run the examples (see examples below).

*This demos are aimed to work with the latest release version of metacrunch.*


Download
--------

##### Clone with git

```
$ git clone https://github.com/ubpb/metacrunch-demo.git
```

##### Download

[Download ZIP](https://github.com/ubpb/metacrunch-demo/archive/master.zip)

Installation
------------

```
$ cd metacrunch-demo/examples
$ bundle install
```


Examples
--------

#### 01 // Hello world

The inevitable "Hello World" for metacrunch.

```
$ bundle exec metacrunch 01_hello_world.metacrunch
```

#### 02 // A very simple job

This shows how to use a `source` and `transformation`s.

```
$ bundle exec metacrunch 02_simple_job.metacrunch
```

#### 03 // A job with options

metacrunch has build-in support to parameterize jobs. Using the `options` hook you can declare options that can be set/overridden by the CLI. This example shows how to do this.

```
# Show the available options
$ bundle exec metacrunch 03_job_with_options.metacrunch --help

# Lets give a name (the name option is required)
$ bundle exec metacrunch 03_job_with_options.metacrunch --name "John Doe"

# Set the count to 25
$ bundle exec metacrunch 03_job_with_options.metacrunch --name "John Doe" -c 25
```

#### 04 // Reading files

*To work with files use the [metacrunch-file](https://github.com/ubpb/metacrunch-file) package.*

This example shows how to use the `Metacrunch::File::Source` class to read file contents.

```
# Read a regular file
$ bundle exec metacrunch 04_reading_files.metacrunch ../assets/regular_file.txt

# Read a compressed regular file
$ bundle exec metacrunch 04_reading_files.metacrunch ../assets/regular_file.txt.gz

# Read a tar archive
$ bundle exec metacrunch 04_reading_files.metacrunch ../assets/archive.tar

# Read a compressed tar archive
$ bundle exec metacrunch 04_reading_files.metacrunch ../assets/archive.tar.gz
```

#### 05 // Reading from a SQL database

*To work with SQL databases use the [metacrunch-db](https://github.com/ubpb/metacrunch-db) package.*

This example shows how to use the `Metacrunch::DB::Source` class to read data from a SQL database.

```
$ bundle exec metacrunch 05_reading_from_database.metacrunch
```


#### 06 // Writing to a SQL Database

*To work with SQL databases use the [metacrunch-db](https://github.com/ubpb/metacrunch-db) package.*

This example shows how to use the `Metacrunch::DB::Destination` class to write data to a SQL database.

```
$ bundle exec metacrunch 06_writing_to_database.metacrunch
```

#### 07 // Writing to a Redis queue

*To work with Redis use the [metacrunch-redis](https://github.com/ubpb/metacrunch-redis) package.*

This example shows how to use the `Metacrunch::Redis::QueueDestination` class to write data into a Redis queue. To run this example make sure you have a running Redis instance at `localhost:6379` (Redis default).

```
$ bundle exec metacrunch 07_writing_to_redis_queue.metacrunch
```


#### 8 // Reading from a Redis queue

TODO

#### 9 // Writing to elasticsearch

TODO

#### 10 // Reading from elasticsearch

TODO

#### 11 // Working with MARCXML

TODO
