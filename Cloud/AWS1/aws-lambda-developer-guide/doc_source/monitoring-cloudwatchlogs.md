# Accessing Amazon CloudWatch logs for AWS Lambda<a name="monitoring-cloudwatchlogs"></a>

AWS Lambda automatically monitors Lambda functions on your behalf, reporting metrics through Amazon CloudWatch\. To help you troubleshoot failures in a function, Lambda logs all requests handled by your function and also automatically stores logs generated by your code through Amazon CloudWatch Logs\. 

You can insert logging statements into your code to help you validate that your code is working as expected\. Lambda automatically integrates with CloudWatch Logs and pushes all logs from your code to a CloudWatch Logs group associated with a Lambda function, which is named /aws/lambda/*<function name>*\. To learn more about log groups and accessing them through the CloudWatch console, see the [Monitoring system, application, and custom log files](https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/WhatIsCloudWatchLogs.html) in the *Amazon CloudWatch User Guide*\. 

You can view logs for Lambda by using the Lambda console, the CloudWatch console, the AWS CLI, or the CloudWatch API\. The following procedure show you how to view the logs by using the Lambda console\. 

**Note**  
There is no additional charge for using Lambda logs; however, standard CloudWatch Logs charges apply\. For more information, see [CloudWatch pricing\.](https://aws.amazon.com/cloudwatch/pricing/)

**To view logs using the Lambda console**

1. Open the [Functions page](https://console.aws.amazon.com/lambda/home#/functions) of the Lambda console\.

1. Choose a function\.

1. Choose **Monitoring**\.  
![\[Events\]](http://docs.aws.amazon.com/lambda/latest/dg/images/metrics-functions-list.png)![\[Events\]](http://docs.aws.amazon.com/lambda/latest/dg/)![\[Events\]](http://docs.aws.amazon.com/lambda/latest/dg/)

   A graphical representation of the metrics for the Lambda function are shown\.

1. Choose **View logs in CloudWatch**\.

Lambda uses your function's permissions to upload logs to CloudWatch Logs\. If you don't see logs in the console, check your [execution role permissions](lambda-intro-execution-role.md)\.