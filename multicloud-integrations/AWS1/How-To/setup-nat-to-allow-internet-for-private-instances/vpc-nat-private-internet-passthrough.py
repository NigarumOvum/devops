#!/usr/bin/python
# -*- coding: utf-8 -*-

# Using NAT Instances to connect Private instance to internet

import boto3

globalVars  = {}
globalVars['REGION_NAME']           = "ap-south-1"
globalVars['AZ1']                   = "ap-south-1a"
globalVars['AZ2']                   = "ap-south-1b"
globalVars['CIDRange']              = "10.241.0.0/24"
globalVars['tagName']               = "miztiik-nat-demo-02"
globalVars['EC2-AMI-ID']            = "ami-f9daac96"
globalVars['NAT-AMI-ID']            = "ami-48dcaa27"
globalVars['EC2-InstanceType']      = "t2.micro"
globalVars['EC2-KeyName']           = "edx-key"


# Creating a VPC, Subnet, and Gateway
ec2         = boto3.resource ( 'ec2', region_name = globalVars['REGION_NAME'] )
ec2Client   = boto3.client   ( 'ec2', region_name = globalVars['REGION_NAME'] )
vpc         = ec2.create_vpc ( CidrBlock = globalVars['CIDRange']  )


# AZ1 Subnets
az1_pvtsubnet   = vpc.create_subnet( CidrBlock = '10.241.0.0/25'   , AvailabilityZone = globalVars['AZ1'] )
az1_pubsubnet   = vpc.create_subnet( CidrBlock = '10.241.0.128/26' , AvailabilityZone = globalVars['AZ1'] )
az1_sparesubnet = vpc.create_subnet( CidrBlock = '10.241.0.192/26' , AvailabilityZone = globalVars['AZ1'] )


# Enable DNS Hostnames in the VPC
vpc.modify_attribute( EnableDnsSupport = { 'Value': True } )
vpc.modify_attribute( EnableDnsHostnames = { 'Value': True } )

# Create the Internet Gatway & Attach to the VPC
intGateway  = ec2.create_internet_gateway()
intGateway.attach_to_vpc( VpcId = vpc.id )

# Create another route table for Public & Private traffic
routeTable = ec2.create_route_table( VpcId = vpc.id )
routeTable.associate_with_subnet( SubnetId = az1_pubsubnet.id )
routeTable.associate_with_subnet( SubnetId = az1_pvtsubnet.id )


# Create a route for internet traffic to flow out
intRoute = ec2Client.create_route( RouteTableId = routeTable.id , DestinationCidrBlock = '0.0.0.0/0' , GatewayId = intGateway.id )

# Tag the resources
tag = vpc.create_tags               ( Tags=[{'Key': tagName , 'Value':'vpc'}] )
tag = az1_pvtsubnet.create_tags     ( Tags=[{'Key': tagName , 'Value':'az1-private-subnet'}] )
tag = az1_pubsubnet.create_tags     ( Tags=[{'Key': tagName , 'Value':'az1-public-subnet'}] )
tag = az1_sparesubnet.create_tags   ( Tags=[{'Key': tagName , 'Value':'az1-spare-subnet'}] )
tag = intGateway.create_tags        ( Tags=[{'Key': tagName , 'Value':'igw'}] )
tag = routeTable.create_tags        ( Tags=[{'Key': tagName , 'Value':'rtb'}] )

# Let create the Public & Private Security Groups
pubSecGrp = ec2.create_security_group( DryRun = False, 
                              GroupName='pubSecGrp',
                              Description='Public_Security_Group',
                              VpcId= vpc.id
                            )

pvtSecGrp = ec2.create_security_group( DryRun = False, 
                              GroupName='pvtSecGrp',
                              Description='Private_Security_Group',
                              VpcId= vpc.id
                            )
pubSecGrp.create_tags(Tags=[{'Key': tagName ,'Value':'public-security-group'}])
pvtSecGrp.create_tags(Tags=[{'Key': tagName ,'Value':'private-security-group'}])


# Add a rule that allows inbound SSH, HTTP, HTTPS traffic ( from any source )
ec2Client.authorize_security_group_ingress( GroupId  = pubSecGrp.id ,
                                        IpProtocol= 'tcp',
                                        FromPort=80,
                                        ToPort=80,
                                        CidrIp='0.0.0.0/0'
                                        )
ec2Client.authorize_security_group_ingress( GroupId  = pubSecGrp.id ,
                                        IpProtocol= 'tcp',
                                        FromPort=443,
                                        ToPort=443,
                                        CidrIp='0.0.0.0/0'
                                        )
ec2Client.authorize_security_group_ingress( GroupId  = pubSecGrp.id ,
                                        IpProtocol= 'tcp',
                                        FromPort=22,
                                        ToPort=22,
                                        CidrIp='0.0.0.0/0'
                                        )

# Create the  Private Instance
pvtInstance = ec2.create_instances(ImageId = globalVars['EC2-AMI-ID'],
                                    MinCount=1,
                                    MaxCount=1,
                                    KeyName=globalVars['EC2-KeyName'] ,
                                    SecurityGroupIds=[ pvtSecGrp.id ],
                                    SubnetId = az1_pvtsubnet.id,
                                    InstanceType = globalVars['EC2-InstanceType']
                                    )
NetworkInterfaces=[
        {
            'NetworkInterfaceId': 'string',
            'DeviceIndex': 123,
            'SubnetId': 'string',
            'Description': 'string',
            'PrivateIpAddress': 'string',
            'Groups': [
                'string',
            ],
            'DeleteOnTermination': True,
            'PrivateIpAddresses': [
                {
                    'Primary': True
                },
            ],
            'AssociatePublicIpAddress': False
        },
    ],




"""
Function to clean up all the resources
"""
def cleanAll(resourcesDict=None):

    ids=[]
    for i in pvtInstance:
        ids.append(i.id)

    ec2.instances.filter(InstanceIds=ids).terminate()

    intGateway.delete()

    # Delete Subnets
    az1_pvtsubnet.delete()
    az1_pubsubnet.delete()
    az1_sparesubnet.delete()

    vpc.delete()