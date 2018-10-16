#!/bin/bash

stack setup
rm sqlite.db
stack build
stack exec server-ad-lucem
