metacrunch-demo
===============

This repo contains a bunch of examples for the [metacrunch ETL toolkit](https://github.com/ubpb/metacrunch).
To run the examples clone this repo, install metacrunch and use the metacrunch run command in your terminal. In `common` you will find examples that you can run on common ruby interpreters like MRI (the Ruby you know). In `jruby` you will find examples that you can run on JRuby.

Usage
-----

```
$ git clone https://github.com/ubpb/metacrunch-demo.git
$ cd metacrunch-demo/common
$ bundle install
$ bundle exec metacrunch run ./common/simple_job.metacrunch
```
