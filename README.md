# Spam Detector

## Overview

**Spam Detector** is a cross-platform project combining a **Flutter application** for the frontend and a **Python-based machine learning model** for backend text classification. The app classifies input text messages as **Spam** or **Ham** using a pre-trained ML model.

## App Preview

![App Screenshot](assets/app_preview.jpg)

## Features

## Model Performance

Spam classification model accuracy: **98%**

## Model Explanation

The spam detection model is built using machine learning techniques in Python. It uses a TF-IDF vectorizer to convert text messages into numerical features and a classification algorithm (such as Naive Bayes) trained on the `spam.csv` dataset. The model predicts whether a message is spam or ham based on learned patterns from the training data. The pre-trained model and vectorizer are stored in `spam_model.pkl` and `vectorizer.pkl` for fast inference in the app.

## How to Run

### Backend (Python)

1. Make sure you have Python 3 installed.
2. Install required packages:
   ```bash
   pip install -r requirements.txt
   ```
3. Start the backend server:
   ```bash
   python app.py
   ```

### Frontend (Flutter)

1. Install Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install).
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```
   You can specify a device or platform (web, android, ios, windows, etc.) as needed.
