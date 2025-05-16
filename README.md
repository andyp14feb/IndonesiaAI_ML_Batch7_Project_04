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
