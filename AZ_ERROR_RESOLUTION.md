# Availability Zone (AZ) Error Resolution

## Issue Description

During the initial deployment of AWS infrastructure using Terraform, an error related to availability zone selection was encountered. The error message was as follows:

```
Error: creating EC2 Subnet: InvalidParameterValue: Value (ap-northeast-1b) for parameter availabilityZone is invalid. Subnets can currently only be created in the following availability zones: ap-northeast-1a, ap-northeast-1c, ap-northeast-1d.
```

This error occurred because while trying to create subnets in an availability zone (ap-northeast-1b) that was not available in my AWS account for the specified region.

## Root Cause

The root cause of this issue was the static assignment of availability zones in Terraform configuration. Different AWS accounts may have access to different sets of availability zones within a region.

## Resolution

To resolve this issue and make Terraform configuration more robust, the following changes were implemented:

1. Removed static AZ assignments from Terraform variables.
2. Implemented dynamic AZ selection using the `aws_availability_zones` data source.
3. Updated subnet module to use the dynamically selected AZs.

Here's an example of the change in our `modules/subnets/main.tf` file:

```hcl
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_1a_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  # ... other configurations
}
```

## Lessons Learned

1. Always use dynamic AZ selection in Terraform configurations to ensure portability across different AWS accounts and regions.
2. Regularly update and test infrastructure code to catch and resolve such issues early in the development process.
3. Pay attention to AWS resource limitations and availabilities, which can vary between accounts and regions.


## Conclusion

By implementing dynamic AZ selection, Terraform configuration becomes more robust and portable. This change ensures that the infrastructure can be deployed consistently across different AWS accounts and regions, regardless of specific AZ availability.