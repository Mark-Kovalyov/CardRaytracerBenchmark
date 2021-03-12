#!/bin/bash -v

erlc card.erl

erl -noshell -s card main -s init stop
