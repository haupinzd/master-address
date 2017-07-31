@echo off
.\liquibase --logLevel=severe --defaultsFile="LocalConfig\liquibase.properties.dev" %*