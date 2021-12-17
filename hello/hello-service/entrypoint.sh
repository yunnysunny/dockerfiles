#!/bin/bash

/bin/consul-register

exec "$@"