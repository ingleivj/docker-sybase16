Based on https://github.com/nguoianphu/docker-sybase

# CASE

Sybase is by default set up with a case-sensitive sort order, which is probably ok for most cases. For those who wonder, this requires you to reference your tables, columns etc with their exact names.
For an older legacy project I am dealing with there is a lot of lower-case/mixed SQL usage, and to migrate development environment to Docker the best way is to modify this image to be as close to production installation as possible - rather than update all that code.

In the referred repo, there are options regarding character set and sort order in the sybase-aes.rs file.
Sybase 16 does not set the sort_order with the `srvbuildres`-utility from version 16 on it seems.
> The solution is to use the `sqllocres` utility.

## Configuration values

See the `sqlloc.rs`-file. This is based on the example found in the `server installation path/init/sample-resource-files`.

## Notes/disclaimer

After the sqllocres utility has run, on starting ASE server lists a number of objectIDs that are 'SUSPECT' and should be reindexed. I am not a database expert, and have not found out how to fix this - executing `select object_name(_objectID_)` on any of these IDs simply returns nothing.


