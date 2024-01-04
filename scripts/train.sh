DATASET=$1
SCENE=$2
EXP_NAME=$3
N_VOCAB=0
if [ ${SCENE} = "chess" ]; then
   N_VOCAB=6100
elif [ ${SCENE} = "fire" ]; then
   N_VOCAB=4100
elif [ ${SCENE} = "heads" ]; then
   N_VOCAB=2100
elif [ ${SCENE} = "office" ]; then
   N_VOCAB=10100
elif [ ${SCENE} = "pumpkin" ]; then
   N_VOCAB=10100
elif [ ${SCENE} = "redkitchen" ]; then
   N_VOCAB=14100
elif [ ${SCENE} = "stairs" ]; then
   N_VOCAB=6100
fi

python train.py \
   --dataset_name phototourism \
   --root_dir /mnt/hdd0/leemiso/${DATASET}/${SCENE} \
   --N_samples 64 \
   --N_importance 64 \
   --img_downscale 2 \
   --use_cache \
   --N_vocab ${N_VOCAB} \
   --encode_a \
   --encode_t \
   --beta_min 0.03 \
   --batch_size 2048 \
   --num_epochs 20 \
   --num_gpus 4 \
   --optimizer adam \
   --lr 5e-4 \
   --lr_scheduler cosine \
   --exp_name ${EXP_NAME}