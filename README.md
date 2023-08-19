## Kaggle
Visit kaggle.com and get api credentials save this to `./.kaggle/kaggle.json`

[Details - Visit kaggle docs](https://github.com/Kaggle/kaggle-api#api-credentials)


API command
```
/// kaggle datasets download -d adarshsng/lending-club-loan-data-csv -p data/

 -p data/
```



## Youtube Linear regression lesson
https://www.youtube.com/@DataProfessor
https://youtu.be/R15LjD8aCzc
https://github.com/dataprofessor/code/blob/master/python/linear_regression.ipynb


## .. _diabetes_dataset:

Diabetes dataset
----------------

Ten baseline variables, age, sex, body mass index, average blood
pressure, and six blood serum measurements were obtained for each of n =
442 diabetes patients, as well as the response of interest, a
quantitative measure of disease progression one year after baseline.

**Data Set Characteristics:**

  :Number of Instances: 442

  :Number of Attributes: First 10 columns are numeric predictive values

  :Target: Column 11 is a quantitative measure of disease progression one year after baseline

  :Attribute Information:
  
      - age     age in years
      - sex
      - bmi     body mass index
      - bp      average blood pressure
      - s1      tc, total serum cholesterol
      - s2      ldl, low-density lipoproteins
      - s3      hdl, high-density lipoproteins
      - s4      tch, total cholesterol / HDL
      - s5      ltg, possibly log of serum triglycerides level
      - s6      glu, blood sugar level

Note: Each of these 10 feature variables have been mean centered and scaled by the standard deviation times `n_samples` (i.e. the sum of squares of each column totals 1).

Source URL:
https://www4.stat.ncsu.edu/~boos/var.select/diabetes.html

For more information see:
Bradley Efron, Trevor Hastie, Iain Johnstone and Robert Tibshirani (2004) "Least Angle Regression," Annals of Statistics (with discussion), 407-499.
(https://web.stanford.edu/~hastie/Papers/LARS/LeastAngle_2002.pdf)


---


## Prerequisites

- [ ] Install Terraform ([info here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
- [ ] Configure AWS cli credentials
- [ ] Configure environment variables for Prefect Cloud Account https://docs.prefect.io/2.11.4/cloud/users/api-keys/

  ```
  export TF_VAR_PREFECT_API_URL="https://api.prefect.cloud/api/accounts/[ACCOUNT-ID]/workspaces/[WORKSPACE-ID]"

  export TF_VAR_PREFECT_API_KEY="[API-KEY]"
  ```

