DATASET=$1
SCENE=$2
ROOT_DIR=/mnt/hdd0/leemiso/${DATASET}/${SCENE}

# python make_tsv.py --root_dir ${ROOT_DIR} --train_dirs seq-02
python prepare_phototourism.py --root_dir ${ROOT_DIR} --img_downscale 2