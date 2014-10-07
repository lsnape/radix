#!/bin/sh
# Making this script because we can't accept a password during `lein release` and don't want to add keys IDs to project.clj

lein vcs assert-committed
lein change version leiningen.release/bump-version release
lein vcs commit
lein vcs tag
lein deploy clojars
lein change version leiningen.release/bump-version
lein vcs commit
lein vcs push
