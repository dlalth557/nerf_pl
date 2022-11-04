DATASET=$1
ROOT_DIR=/mnt/ssd0/leemiso/nerf/${DATASET}

python make_tsv.py --ROOT_DIR ${ROOT_DIR} --train_dirs seq-01 seq-02
python prepare_phototourism.py --ROOT_DIR ${ROOT_DIR} --img_downscale 2