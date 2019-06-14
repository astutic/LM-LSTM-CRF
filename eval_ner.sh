#!/bin/sh

file=$(mktemp)
outfile=$(mktemp)
cat - > $file

logpath="parse_ner.log"

echo "Starting ..." >> $logpath

python3 seq_wc.py --decode_type label --load_arg checkpoint/ner_cwlm_lstm_crf.json --load_check_point checkpoint/ner_cwlm_lstm_crf.model --gpu 0 --input_file $file --output_file $outfile

echo "Done..." >> $logpath

cat $outfile



