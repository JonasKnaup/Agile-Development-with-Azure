#!/bin/bash
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
git clone git@github.com:JonasKnaup/Agile-Development-with-Azure.git
python3 -m venv ~/.flask-ml-azure
source ~/.flask-ml-azure/bin/activate
make install
./make_prediction.sh
az webapp up --resource-group Azuredevops --name jk-agile-development-with-azure --sku F1--location eastus --verbose
./make_predict_azure_app.sh