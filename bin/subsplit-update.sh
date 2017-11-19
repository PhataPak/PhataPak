#!/usr/bin/env bash

git subsplit update

git subsplit publish "
    dev:git@github.com:PhataPak/dev.git
    packages:git@github.com:PhataPak/_registry.git
    packages/vcs:git@github.com:PhataPak/vcs.git
    packages/vcs/commit:git@github.com:PhataPak/vcs-commit.git
    packages/vcs/commit/types:git@github.com:PhataPak/vcs-commit-types.git
" --heads=master