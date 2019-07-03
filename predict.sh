#!/bin/bash

./scripts/retrieval-baseline predict ./metalwoz-retrieval-model \
../data_out_metalwoz/metalwoz-v1-normed.zip \
--test-spec test-spec-cross-task.txt --nlg-eval-out-dir ./out
