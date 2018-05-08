#!/bin/bash
erlc card.erl
erl -noshell -s card main -s init stop
