@echo off
set host_url=%1
set app_name=%2
copy ".\environment.template" ".\environment.prod.ts"
copy ".\environment.template" ".\environment.ts"
set production="true"
set development="false"
set deploy_url=http://%host_url%/%app_name%/
set graph_ql_server_url=http://%host_url%/api/graphql
set graph_ql_subscription_server_url=ws://%host_url%/api/graphqlws
echo Production Environment Started...
powershell -Command "(gc .\environment.prod.ts) -replace '{{PRODUCTION}}', '%production%' | Out-File -encoding ASCII .\environment.prod.ts"
powershell -Command "(gc .\environment.prod.ts) -replace '{{TEMPLATE_DEPLOY_URL}}', '%deploy_url%' | Out-File -encoding ASCII .\environment.prod.ts"
powershell -Command "(gc .\environment.prod.ts) -replace '{{TEMPLATE_GRAPHQL_URL}}', '%graph_ql_server_url%' | Out-File -encoding ASCII .\environment.prod.ts"
powershell -Command "(gc .\environment.prod.ts) -replace '{{TEMPLATE_GRAPHQL_SUBSCRIPTION_SERVER_URL}}', '%graph_ql_subscription_server_url%' | Out-File -encoding ASCII .\environment.prod.ts"
echo Production Environment File Created!!
echo "==============Prod================="
type ".\environment.prod.ts"
echo "==================================="
echo Development Environment Started...
powershell -Command "(gc .\environment.ts) -replace '{{PRODUCTION}}', '%development%' | Out-File -encoding ASCII .\environment.ts"
powershell -Command "(gc .\environment.ts) -replace '{{TEMPLATE_DEPLOY_URL}}', '%deploy_url%' | Out-File -encoding ASCII .\environment.ts"
powershell -Command "(gc .\environment.ts) -replace '{{TEMPLATE_GRAPHQL_URL}}', '%graph_ql_server_url%' | Out-File -encoding ASCII .\environment.ts"
powershell -Command "(gc .\environment.ts) -replace '{{TEMPLATE_GRAPHQL_SUBSCRIPTION_SERVER_URL}}', '%graph_ql_subscription_server_url%' | Out-File -encoding ASCII .\environment.ts"
echo Development Environment File Created!!
echo "==============dev================="
type ".\environment.ts"
echo "==================================="
echo EOE.......!!!
rem Changes in environment files should be added in template files
