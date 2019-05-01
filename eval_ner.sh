
file=$(mktemp)
cat - > $file

logpath="parse_ner.log"

echo "Starting ..." >> $logpath

python3 seq_wc.py --load_arg checkpoint/ner/ner_4_cwlm_lstm_crf.json --load_check_point checkpoint/ner_ner_4_cwlm_lstm_crf.model --gpu 0 --input_file $file --output_file output.txt

echo "Done..." >> $logpath



