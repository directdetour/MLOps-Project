# Import necessary libraries
import prefect
from prefect import flow, task
import mlflow
import mlflow.sklearn
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error, r2_score
from sklearn import datasets

# Set up your environment (MLflow server and database)
mlflow.set_tracking_uri("http://localhost:5000")  # Update with your MLflow server URI

@task
def load_data():

    # preloaded dataset from sklearn
    data = datasets.load_diabetes(as_frame=True)
    return data


# Split the data into training and testing sets.
@task
def split_data(data, target_col):
    X = data.data
    y = data.target
    return train_test_split(X, y, test_size=0.2, random_state=66)

# Define and train your machine learning model.
@task
def train_model(X_train, y_train):
    model = RandomForestRegressor(n_estimators=100, random_state=66)
    model.fit(X_train, y_train)
    return model

# Evaluate the trained model on the test set.
@task
def evaluate_model(model, X_test, y_test):
    y_pred = model.predict(X_test)
    mse = mean_squared_error(y_test, y_pred)
    r2score = r2_score(y_test, y_pred)
    print('Mean squared error (MSE): %.2f' % mse)      
    print('Coefficient of determination (R^2): %.2f' % r2score)

    return mse, r2score

#Use MLflow to track your experiment and log model parameters and metrics.
@task
def log_metrics_to_mlflow(mse, r2score):
    with mlflow.start_run() as run:
        mlflow.log_metric("mse", mse)
        mlflow.log_metric("r2score", r2score)


# Define and assemble the Prefect Flow using the tasks
@flow(name="Diabetes Progression Pipeline", log_prints=True)
def run_flow():
    target = "reviewStatus"
    data = load_data()
    X_train, X_test, y_train, y_test = split_data(data, target)
    model = train_model(X_train, y_train)
    mse, r2_score = evaluate_model(model, X_test, y_test)
    log_metrics_to_mlflow(mse, r2_score)

if __name__ == '__main__':
    run_flow()