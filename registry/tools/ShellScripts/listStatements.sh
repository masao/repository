#!/bin/sh

echo Building with classpath $CLASSPATH
java org/dublincore/dcregistry/tools/listStatements $1
