<!--
title: 'Kubeless Serverless Simple function example in Python'
description: 'This example demonstrates a simple function example in Python.'
layout: Doc
framework: v1
platform: Kubeless
language: Python
authorLink: 'https://github.com/andresmgot'
authorName: Andres
authorAvatar: 'https://avatars0.githubusercontent.com/u/4025665?v=4&s=140'
-->
# Serverless Boilerplate - Kubeless - Python

Make sure `kubeless` and `serverless` are installed. See the respective installation guides:
* [Kubeless](https://github.com/kubeless/kubeless/blob/master/README.md#usage)
* [Serverless](https://github.com/serverless/serverless#quick-start)

Please see the [this guide for more information](https://github.com/serverless/serverless-kubeless/blob/master).

## 1. Install Service Dependencies
Run `npm install` in this directory to download the modules from `package.json`.

## 2. Deploy
Run `serverless deploy` in order to deploy the function defined in `serverless.yml`

```bash
$ serverless deploy
Serverless: Packaging service...
Serverless: Deploying function: hello...
Serverless: Function hello succesfully deployed
```

## 3. Invoke deployed function
Run `serverless invoke --function hello --log --data "Bob"`

In your terminal window you should see the response from Kubernetes.

```bash
$ sls invoke --function hello --data 'Bob' --log
Serverless: Calling function: hello...
--------------------------------------------------------------------
Hello Bob!
```

**For more information on the Serverless Kubeless plugin, please see the project repository: [https://github.com/serverless/serverless-kubeless](https://github.com/serverless/serverless-kubeless).**
