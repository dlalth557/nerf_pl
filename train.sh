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
   --batch_size 8192 \
   --chunk 65536 \
   --num_epochs 20 \
   --num_gpus 2 \
   --optimizer adam \
   --lr 5e-4 \
   --lr_scheduler cosine \
   --ckpt_path ./ckpts/0914_fire/epoch=18.ckpt \
   --exp_name $2