# Overview

Web app to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access & teacher-to-pupil ratios.

## Project Plan

* [Link](https://trello.com/invite/b/MexcHCSu/ATTIdec260745c755e60868ae543b0189d643224ED12/agile-development-with-azure) to Trello board
* [Link](https://github.com/JonasKnaup/Agile-Development-with-Azure/blob/main/project-management.xlsx) to a spreadsheet that includes the project plan

## Instructions

First of all, the archtitecture of the web app project.
![Architectural Diagram](/Diagramm.png "Architectural Diagram")
If the source code gets pushed to Github, the GitHub Action is triggered for testing. At the same time the Azure Pipeline is triggered for building the application and deplyong it to the Azure App Service.

## Here are the steps to run the app

1. Open Azure cloud shell
2. Generate a SHH Key and copy it to your Github Account

```bash
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
```

3. Clone the project from Github

```bash
git@github.com:JonasKnaup/Agile-Development-with-Azure.git
```

![Screenshot project cloned](/project_cloned.png "Screenshot cloned project")
4. Create a python environment, install the dependencies an run the tests

```bash
python3 -m venv ~/.flask-ml-azure
source ~/.flask-ml-azure/bin/activate

cd Agile-Development-with-Azure
make install
```

![Screenshot tests passed](/tests_passed.png "Screenshot tests passed")
5. Deploy the application to Azure App Service

```bash
az webapp up --resource-group Azuredevops --name jk-agile-development-with-azure --sku F1--location eastus --verbose
```

6. You can run the app

```bash
./make_predict_azure_app.sh
```

![Prediction](/prediction.png "Prediction")

## CI / CD

### Successful Github Action test

![Screenshot Github Action Success](/github_action_success.png "Screenshot Github Action Success")

### Successful Pipeline build

![Screenshot Pipeline Build success](/pipeline_success.png "Screenshot Pipeline Build success")
![Screenshot Pipeline Build success](/pipeline_success_2.png "Screenshot Pipeline Build success")

## Logging

You can start logging with the following command:
```
az webapp log tail --name jk-agile-development-with-azure --resource-group Azuredevops
```
![Screenshot Logging](/logging.png "Screenshot Logging")

## Load test with locust

You can run a load test with locust
```
pip install locust

locust --headless --users 10 --spawn-rate 1 -H https://jk-agile-development-with-azure.azurewebsites.net/
```
![Screenshot Locust](/locust.png "Screenshot Locust")

## Enhancements

You can improve the project by using branches for a improved development process. For a real project you would need multiple stages like development and production.

## Demo 

Link to Demo at Youtube: [Link](https://youtu.be/jMfzbl7z25A)


