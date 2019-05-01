
file="/root/training_data.tsv"
cat - > $file

logpath="train_ner.log"

echo "$$ Starting ..." >> $logpath

python3 train_wc.py --train_file /root/training_data.tsv --checkpoint ./checkpoint/ner_ --caseless --fine_tune --high_way --co_train --least_iters 100

echo "$$ Done" >> $logpath
