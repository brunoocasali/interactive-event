#!/bin/sh

psql -c 'create database travis_ci_test;' -U postgres
psql -U postgres -q -d travis_ci_test -f db/structure.sql
cp -f config/database.yml.travis config/database.yml
