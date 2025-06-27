# Vegetable Disease Classification using CNN

This project focuses on detecting diseases in tomato, potato, and bell pepper crops using a Convolutional Neural Network (CNN) trained on a custom image dataset. The goal is to support early diagnosis and reduce yield loss by providing an efficient image-based disease detection pipeline.

## 📁 Dataset

- Total images: 6,000+
- Classes: 9 disease types (e.g., Late Blight, Early Blight, Leaf Mold, etc.)
- Source: Custom-labeled dataset (images collected from various agricultural datasets and open-source resources)

## 🧠 Model Architecture

- **Base model**: Custom CNN , ReLU activation, and max pooling.
- **Input shape**: 128x128 RGB images
- **Output**: 9 softmax-activated classes

## 🔧 Features

- Data preprocessing and augmentation (rotation, flipping, scaling)
- Early stopping and dropout to reduce overfitting
- Evaluation metrics: Accuracy, Precision, Recall, F1-score, Confusion Matrix
- Achieved ~92% accuracy on validation data

## 🛠️ Tools & Libraries

- Python 3.10
- TensorFlow / Keras
- NumPy, Matplotlib, OpenCV, Scikit-learn

