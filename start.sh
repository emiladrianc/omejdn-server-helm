#!/usr/bin/sh

BLUE='\033[0;34m'
NC='\033[0m' # No Color

HELM_CHART_NAME=omejdn-service

echo -e "${BLUE}Un-installing helm chart: $HELM_CHART_NAME ${NC}"
helm uninstall $HELM_CHART_NAME --namespace omejdn

echo -e "${BLUE}Update chart dependency${NC}"
helm dependency update

echo -e "${BLUE}Build chart dependency${NC}"
helm dependency build

echo -e "${BLUE}Installing helm chart: $HELM_CHART_NAME ${NC}"
helm install $HELM_CHART_NAME --set install.omejdn=true --namespace omejdn --create-namespace .

echo -e "${BLUE}Waiting for the deployments to be available${NC}"
kubectl wait deployment -n omejdn --for condition=Available --timeout=90s omejdn-service

echo -e "${BLUE}Forwarding ports${NC}"
kubectl port-forward svc/omejdn-service 4567:4567 -n omejdn