# Smoker Status Prediction — Flask Web App

A lightweight Flask application that predicts whether a person is a **Smoker** or **Non-Smoker** from biometric and clinical measurements.  
Just fill in the form, pick a trained model, and get an instant colour-coded result.

> The models were built in two Jupyter notebooks:
> 
> | Notebook                                  | Strategy                                                                      |
> | ----------------------------------------- | ----------------------------------------------------------------------------- |
> | `smokerStatus_v6-MANUAL_FeatureEng.ipynb` | Domain-driven, manual feature engineering                                     |
> | `smokerStatus_v7_MATH_FeatureEng.ipynb`   | Automatic additional feature creation using pairwise (**add** / **multiply**) |

Selected exported pipelines reside in `app/models/` and are loaded dynamically at runtime. Not all exported to `app/models/` due to huge model file size



## 🎯 Course Context

This repository is submitted as **Project&nbsp;#04 — `IndonesiaAI_ML_Batch7_Project_04`**, the fourth official assignment in the **Indonesia AI Machine Learning Batch 7** program.

---

## ✨ Key Features

| Feature                  | Description                                                                                                                              |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **Interactive form**     | Collects 20 + biometric and sensory inputs such as blood pressure, cholesterol, liver enzymes, hearing & eyesight                        |
| **Model picker**         | Choose among multiple Logistic-Regression, Random-Forest, and XGBoost pipelines trained on the same dataset                              |
| **Sample-data autofill** | “Fill form with sample data” loads a random row from `static/data_contoh.csv` for a one-click demo                                       |
| **Instant feedback**     | Prediction box turns green (*Non-Smoker*) or red (*Smoker*) immediately after submission                                                 |
| **Open dataset**         | Uses the [Playground Series – Season 3, Episode 24](https://www.kaggle.com/competitions/playground-series-s3e24/overview) health dataset |

---

## 🗂️ Project Layout

```text
app/
├── app.py                 # Flask entry-point
├── .flaskenv              # Local Flask settings (optional)
├── requirements.txt       # Python dependencies
├── templates/
│   └── index.html         # Single-page UI
├── static/
│   ├── style.css
│   ├── ai-01.png
│   └── data_contoh.csv    # Sample rows for autofill
├── models/                # Trained model folders (*.pkl + scaler + modelrun.py)
└── tree.py                # Utility script (decision-tree visualisation)
```

---

## 🚀 Quick Start

1. **Clone** this repository and open a terminal in its root folder (`app/`).

2. **Create & activate** a virtual environment (Python ≥ 3.8):
   
   ```bash
   python -m venv .venv
   # Windows
   .venv\Scripts\activate
   # macOS / Linux
   source .venv/bin/activate
   ```

3. **Install dependencies**:
   
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the server**:
   
   ```bash
   # Option A – via Flask’s CLI (.flaskenv will enable debug by default)
   flask run
   # Option B – directly
   python app.py
   ```

5. Browse to [http://127.0.0.1:5000](http://127.0.0.1:5000/) and start predicting!

---

## 🏗️ How It Works

1. **Dynamic model loading**  
   On submission, `app.py` imports the chosen model’s `modelrun.py` on-the-fly and passes the form data to `runflow()` for prediction.

2. **Sample-data simulation**  
   The `/simulate` route picks a random row from `static/data_contoh.csv`, removes the true `smoking` label, pre-selects a random model, and renders the form with those values.

3. **Single-page UX**  
   All validation, radio buttons, and result styling are defined in `templates/index.html`.

---

## 📑 Training Notebooks & Dataset

| File                                      | Purpose                                             |
| ----------------------------------------- | --------------------------------------------------- |
| `smokerStatus_v6-MANUAL_FeatureEng.ipynb` | Manual feature engineering notebook                 |
| `smokerStatus_v7_MATH_FeatureEng.ipynb`   | Automatic add/multiply feature engineering notebook |

Not all model created by these two .ipynb exported to `app/models/` due to huge model file size

**Dataset:** [Playground Series – Season 3, Episode 24](https://www.kaggle.com/competitions/playground-series-s3e24/overview) (public health-check dataset for smoker-status classification).

---

Enjoy predicting — and feel free to fork, extend, or swap in your own models!


---
---
---
---
---
---
---


# Smoker Status Prediction — Web Interface Manual

This web application allows users to **predict smoking status** (Smoker or Non-Smoker) based on biometric and clinical data input. The prediction is powered by machine learning models trained on health datasets.

---

![Form Layout](https://github.com/andyp14feb/IndonesiaAI_ML_Batch7_Project_04/blob/main/docs/2025-05-15_202815_001__DokumentasiUntukManual.jpg)

## Table of Contents

1. [Input Form (No. 1)](#1-input-form)
2. [Model Selector (No. 2)](#2-model-selector)
3. [Submit Button (No. 3)](#3-submit-button)
4. [Clear Button (No. 4)](#4-clear-button)
5. [Fill Sample Button (No. 5)](#5-fill-sample-button)
6. [Prediction Result (No. 6)](#6-prediction-result)
7. [Reference Info (No. 7)](#7-reference-info)

--- 

## 1. Input Form

**Location:** Top section of the page

Enter biometric and medical data of the subject/patient.  
These include:

- Age (in 5-year intervals)
- Height (cm)
- Weight (kg)
- Waist circumference (cm)
- Eyesight (Left & Right)
- Hearing (Left & Right)
- Blood pressure (Systolic & Diastolic)
- Fasting blood sugar (mg/dL)
- Cholesterol (Total, HDL, LDL, Triglyceride)
- Hemoglobin (g/dL)
- Urine protein level (0–4)
- Serum creatinine (mg/dL)
- Liver enzymes (AST, ALT, GTP)
- Dental caries (0 = no, 1 = yes)

Refer to the reference section below for valid value ranges.

---

## 2. Model Selector

**Location:** Dropdown below the form

Choose a trained machine learning model to perform prediction.  
Available options include models like:

- Logistic Regression
- Random Forest
- XGBoost

---

## 3. Submit Button

**Label:** `Submit`

Click this to send the input data to the selected ML model.  
The model will return a prediction of whether the subject is a **Smoker** or **Non-Smoker**.

---

## 4. Clear Button

**Label:** `Clear`

This button will **clear all fields** in the form.  
Useful if you want to reset the form before entering new data.

---

## 5. Fill Sample Button

**Label:** `Fill with Example`

Click this to **autofill** the form with a random sample from the dataset.  
This is helpful for testing the app or demoing predictions.  
Note: It will exclude the actual `smoking` status during prediction.

---

## 6. Prediction Result

**Location:** Below the Submit button

- If the model predicts `Non-Smoker`, the result box will appear **green**.
- If the model predicts `Smoker`, it will appear **red**.

Use this prediction to guide further analysis or decision-making.

---

## 7. Reference Info

**Located:** At the bottom of the page

Provides:

- **Dataset origin:** [Binary Prediction of Smoker Status using Bio-Signals | Kaggle](https://www.kaggle.com/competitions/playground-series-s3e24/overview)
- **Field descriptions:** What each input represents and how it relates to smoking status

---

## Notes

- **Target:** The goal is to predict the `smoking` status (0 = Non-Smoker, 1 = Smoker)
- **Outlier Handling:** Backend has safeguards for invalid inputs

---

*Created as part of the Smoker Status Prediction Project — Machine Learning Batch 7*



