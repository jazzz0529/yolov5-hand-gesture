#!/bin/bash
# ================================
# YOLOv5 手势识别训练脚本
# 包含两组对比实验：yolov5s 和 yolov5m
# ================================

# 数据集配置文件（如果你的文件名不同，在这里修改）
DATA_CONFIG="my_gesture.yaml"

# 训练轮数
EPOCHS=100

# 输入图片尺寸
IMG_SIZE=640

# 设备（GPU 编号，0 表示第一张显卡）
DEVICE=0

echo "=========================================="
echo "开始实验一：yolov5s (轻量快速模型)"
echo "Batch size = 32"
echo "=========================================="
python train.py \
    --img $IMG_SIZE \
    --batch 32 \
    --epochs $EPOCHS \
    --data $DATA_CONFIG \
    --weights yolov5s.pt \
    --device $DEVICE \
    --cache

echo "=========================================="
echo "实验一完成！"
echo "=========================================="

echo "=========================================="
echo "开始实验二：yolov5m (更深、精度更高)"
echo "Batch size = 24 (适配12G显存)"
echo "=========================================="
python train.py \
    --img $IMG_SIZE \
    --batch 24 \
    --epochs $EPOCHS \
    --data $DATA_CONFIG \
    --weights yolov5m.pt \
    --device $DEVICE \
    --cache

echo "=========================================="
echo "所有实验已完成！结果保存在 runs/train/ 目录下"
echo "=========================================="