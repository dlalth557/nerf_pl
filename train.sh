DATASET=$1
N_VOCAB=0
if [ ${DATASET} == "fire" ]; then
N_VOCAB=4100
fi

python train.py \
   --dataset_name phototourism \
   --root_dir /mnt/ssd0/leemiso/nerf/${DATASET} \
   --N_samples 128 \
   --N_importance 128 \
   --img_downscale 2 \
   --use_cache \
   --N_vocab ${N_VOCAB} \
   --encode_a \
   --encode_t \
   --beta_min 0.03 \
   --batch_size 4096 \
   --chunk 65536 \
   --num_epochs 20 \
   --num_gpus 2 \
   --optimizer adam \
   --lr 5e-4 \
   --lr_scheduler cosine \
   --exp_name $2