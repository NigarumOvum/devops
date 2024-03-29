<!--
title: 'OpenWhisk Serverless Simple example in PHP'
description: 'This example demonstrates a simple example in PHP.'
layout: Doc
framework: v1
platform: OpenWhisk
language: PHP
authorLink: 'https://github.com/jthomas'
authorName: 'James Thomas'
authorAvatar: 'https://avatars2.githubusercontent.com/u/2322?v=4&s=140'
-->
# Serverless Boilerplate - OpenWhisk - PHP

Make sure `serverless` is installed. [See installation guide](https://serverless.com/framework/docs/providers/openwhisk/guide/installation/).

You will also need to set up your OpenWhisk account credentials using environment variables or a configuration file. Please see the [this guide for more information](https://serverless.com/framework/docs/providers/openwhisk/guide/credentials/).

## 1. Install Project Dependencies
`npm install` in this directory to download the modules from `package.json`.

## 2. Deploy
`serverless deploy` or `sls deploy`. `sls` is shorthand for the Serverless CLI command

```
Serverless: Packaging service...
Serverless: Compiling Functions...
Serverless: Compiling API Gateway definitions...
Serverless: Compiling Rules...
Serverless: Compiling Triggers & Feeds...
Serverless: Deploying Functions...
Serverless: Deployment successful!

Service Information
platform:	openwhisk.ng.bluemix.net
namespace:	_
service:	php-service

actions:
php-service-dev-greeting
```

## 3. Invoke deployed function
`serverless invoke --function greeting` or `serverless invoke -f greeting`

`-f` is shorthand for `--function`

In your terminal window you should see the response from Apache OpenWhisk

```bash
$ serverless invoke -f greeting
{
    "greeting": "Hello stranger!"
}
$ serverless invoke -f greeting -d '{"name": "James"}'
{
    "greeting": "Hello James!"
}
```

**For more information on the Serverless OpenWhisk plugin, please see the project repository: [https://serverless.com/framework/docs/providers/openwhisk/guide/credentials/](https://serverless.com/framework/docs/providers/openwhisk/guide/credentials/).**
