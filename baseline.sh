#!/bin/bash
./scripts/retrieval-baseline train ../data_out_metalwoz/metalwoz-v1-normed.zip \
--preproc-dir ../data_out_reddit \
--output-dir  ./metalwoz-retrieval-model \
--eval-domain dialogues/ALARM_SET.txt --test-domain dialogues/EVENT_RESERVE.txt
