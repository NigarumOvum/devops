# Using AWS Lambda extensions<a name="using-extensions"></a>

You can use Lambda extensions to augment your Lambda functions\. For example, use Lambda extensions to integrate functions with your preferred monitoring, observability, security, and governance tools\. You can choose from a broad set of tools provided by [AWS Lambda Partners](http://aws.amazon.com/lambda/partners/), or you can [create your own Lambda extensions](runtimes-extensions-api.md)\.

Lambda supports internal and external extensions\. An external extension runs as an independent process in the execution environment and continues to run after the function invocation is fully processed\. Because extensions run as separate processes, they can be written in a different language than the function\.

An internal extension runs as part of the runtime process\. Your function accesses internal extensions by using wrapper scripts or in\-process mechanisms such as `JAVA_TOOL_OPTIONS`\. For more information, see [Modifying the runtime environment](runtimes-modify.md)\.

You can add extensions to a function using the Lambda console, the AWS Command Line Interface \(AWS CLI\), or infrastructure as code \(IaC\) services and tools such as AWS CloudFormation, AWS Serverless Application Model \(AWS SAM\), and Terraform\.

The following [Lambda runtimes](lambda-runtimes.md) support external extensions:
+ \.NET Core 3\.1 \(C\#/PowerShell\) \(`dotnetcore3.1`\)
+ Custom runtime \(`provided`\)
+ Custom runtime on Amazon Linux 2 \(`provided.al2`\)
+ Java 11 \(Corretto\) \(`java11`\)
+ Java 8 \(Corretto\) \(`java8.al2`\)
+ Node\.js 12\.x \(`nodejs12.x`\)
+ Node\.js 10\.x \(`nodejs10.x`\)
+ Python 3\.8 \(`python3.8`\)
+ Python 3\.7 \(`python3.7`\)
+ Ruby 2\.7 \(`ruby2.7`\)
+ Ruby 2\.5 \(`ruby2.5`\)

You are charged for the execution time consumed by the extension \(in 100 ms increments\)\. For more information on pricing for extensions, see [AWS Lambda Pricing](http://aws.amazon.com/lambda/pricing/)\. For pricing information about partner extensions, see those partners' websites\. There is no cost to install your own extensions\.

## Execution environment<a name="using-extensions-env"></a>

Lambda invokes your function in an [execution environment](runtimes-context.md), which provides a secure and isolated runtime environment\. The execution environment manages the resources required to run your function\. The execution environment also provides lifecycle support for the function's runtime and extensions\.

The lifecycle of the execution environment includes the following phases:
+ `Init`: In this phase, Lambda creates or unfreezes an execution environment with the configured resources, downloads the code for the function and all layers, initializes any extensions, initializes the runtime, and then runs the function’s initialization code \(i\.e\. the code outside the main handler\)\. The `Init` phase happens either during the first invocation, or in advance of function invokes if you have enabled [provisioned concurrency](configuration-concurrency.md#configuration-concurrency-provisioned)\.

  The `Init` phase is split into three sub\-phases: `Extension init`, `Runtime init` and `Function init`\. These sub\-phases ensure that all extensions and the runtime complete their setup tasks before the function code runs\.
+ `Invoke`: In this phase, Lambda invokes the function handler\. After the function runs to completion, Lambda prepares to handle another function invocation\.
+ `Shutdown`: This phase is triggered if the Lambda function does not receive any invokes for a period of time\. In the `Shutdown` phase, Lambda terminates the runtime, alerts the extensions to let them stop cleanly, and then removes the environment\. Lambda sends a `Shutdown` event to each extension, which tells the extension that the environment is about to be shut down\.

During the `Init` phase, Lambda extracts layers containing extensions into the `/opt` directory in the execution environment\. Lambda looks for extensions in the `/opt/extensions/` directory, interprets each file as an executable bootstrap for launching the extension, and start all extensions in parallel\.

## Impact on performance and resources<a name="using-extensions-reg"></a>

The size of your function's extensions counts towards the deployment package size limit\. The total unzipped size of the function and all extensions cannot exceed the unzipped deployment package size limit of 250 MB\.

Extensions can impact the performance of your function because they share function resources such as CPU, memory, and storage\. For example, if an extension performs compute\-intensive operations, you may see your function’s execution duration increase\.

Each extension must complete its initialization before Lambda invokes the function\. Therefore, an extension that consumes significant initialization time can increase the latency of the function invocation\.

To measure the extra time that the extension takes after the function execution, you can use the `PostRuntimeExecutionDuration` [function metric](monitoring-metrics.md)\. To measure the increase in memory used, you can use the `MaxMemoryUsed` metric\. To understand the impact of a specific extension, you can run different versions of your functions side by side\.

## Permissions<a name="using-extensions-permissions"></a>

Extensions have access to the same resources as functions\. Because extensions are executed within the same environment as the function, permissions are shared between the function and the extension\.

You can create an AWS CloudFormation template to simplify the task of attaching the same extension configuration—including AWS Identity and Access Management \(IAM\) permissions—to multiple functions\.

## Configuring extensions<a name="using-extensions-config"></a>

To use an external extension, you add the extension to your function as a [Lambda layer](configuration-layers.md)\. Using layers enables you to share extensions across your organization or to the entire community of Lambda developers\. You can add one or more extensions to a layer\. You can register up to 10 extensions for a function\.

You add the extension to your function using the same method as you would for any layer\. For more information, see [Configuring a function to use layers](configuration-layers.md#configuration-layers-using)\.

**Add an extension to your function \(console\)**

1. Open the [Functions page](https://console.aws.amazon.com/lambda/home#/functions) of the Lambda console\.

1. Choose a function\.

1. Under **Designer**, choose **Layers**\.

1. Under **Layers**, choose **Add a layer**\.

1. For **Choose a layer**, choose **Specify an ARN**\.

1. For **Specify an ARN**, enter the Amazon Resource Name \(ARN\) of an extension layer\.

1. Choose **Add**\.

## Next steps<a name="using-extensions-next"></a>

To learn more about extensions, we recommend the following resources:
+ To walk through a simple working example, see the [ Building Extensions for AWS Lambda](https://aws.amazon.com/blogs/compute/building-extensions-for-aws-lambda-in-preview/) blog post\. 
+ For information about extensions that are available from AWS Lambda Partners, see the [ Introducing AWS Lambda Extensions](https://aws.amazon.com/blogs/compute/introducing-aws-lambda-extensions-in-preview/) blog post\. 
+ Example extensions and wrapper scripts are available in the [GitHub repository of example extensions](https://github.com/aws-samples/aws-lambda-extensions/tree/main/custom-runtime-extension-demo)\. 