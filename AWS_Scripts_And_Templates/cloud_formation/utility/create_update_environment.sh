#!/usr/bin/env bash

#use example
#./create_update_environment <update or create> <stackname>

action=$1
stackName=$2

if [ $action == "update" ]
then
    #do something
    case $stackName in
        step_010_01)
            fullStackName='step-010-01-Network-VPC-Subnet-IGW-NAT-VPCPeering';
            aws cloudformation update-stack --stack-name $fullStackName \
                --template-body file://../step_010_01_network_vpc_subnet_igw_nat_vpcpeering.yaml

        ;;
        step_010_02)

        ;;
        step_020_01)

        ;;
        step_020_02)

        ;;
        step_020_03)
        ;;
    esac
elif [ $action == "create" ]
then
    #do create
        case $stackName in
        step_010_01)
            fullStackName='step-010-01-SharedServices-VPC-Subnet-IGW-NAT-VPCPeering';
            aws cloudformation create-stack --stack-name $fullStackName \
                --template-body file://../step_010_01_network_vpc_subnet_igw_nat_vpcpeering.yaml
        ;;

        step_010_02)

        ;;
        step_010_04)
            fullStackName='step-010-04-Dev-VPC-Subnet-VPCPeering';
            aws cloudformation create-stack --stack-name $fullStackName \
                --template-body file://../step_010_04_dev_vpc_subnet_vpcpeering.yaml

        ;;
        step_020_01)

        ;;
        step_020_02)

        ;;
        step_020_03)
        ;;
    esac
fi