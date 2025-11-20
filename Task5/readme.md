# Task 5 - Exploratory Data Analysis (EDA) — Titanic Dataset

**Dataset source:** Kaggle Titanic competition — `train.csv` (https://www.kaggle.com/c/titanic/data).  

## Contents
- `EDA.ipynb` — Jupyter Notebook containing a full EDA workflow:
  - Data loading & overview
  - Data cleaning & preprocessing
  - Univariate, bivariate, and multivariate analysis
  - Visualizations: histograms, boxplots, countplots, scatterplots, heatmap, pairplot
  - Summary of findings and suggested next steps
- `report.pdf` — One-page PDF summary of key findings (simple)
- `train.csv` — **Not included**. Download from Kaggle and place it in the same folder as the notebook.

## How to get the dataset (recommended)
1. Sign in to Kaggle and go to the Titanic competition: https://www.kaggle.com/c/titanic/data
2. Download `train.csv` and place it in the same directory as the notebook.
OR use Kaggle CLI:
```bash
# Install kaggle package and place your kaggle.json in ~/.kaggle/kaggle.json
pip install kaggle
kaggle competitions download -c titanic -f train.csv
unzip train.csv.zip -d .
```

## How to run the notebook
1. Open the folder in JupyterLab / Jupyter Notebook / VS Code.
2. Ensure packages are installed:
```bash
pip install pandas matplotlib seaborn numpy scipy scikit-learn notebook
```
3. Run the cells in order. Visualizations will display inline.

