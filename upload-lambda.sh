#!/bin/bash

# Variables
LAMBDA_FUNCTION_DIR="function"
ZIP_FILE="function.zip"
S3_BUCKET="[YOUR-S3-BUCKET-NAME]"
S3_KEY="function.zip"

# Create the lambda directory if it doesn't exist
mkdir -p $LAMBDA_FUNCTION_DIR

# Copy server.js to the lambda directory
cp server.js $LAMBDA_FUNCTION_DIR/

# Copy package.json and package-lock.json to the lambda directory
cp package.json $LAMBDA_FUNCTION_DIR/
cp package-lock.json $LAMBDA_FUNCTION_DIR/

# Navigate to the lambda directory
cd $LAMBDA_FUNCTION_DIR

#	 Install node modules
npm install --production

# Zip the Lambda function code along with node_modules
zip -r $ZIP_FILE .

# Upload the ZIP file to S3
aws s3 cp $ZIP_FILE s3://$S3_BUCKET/$S3_KEY

# Navigate back to the original directory
cd -

# Output the S3 URL
echo "Lambda function uploaded to s3://$S3_BUCKET/$S3_KEY"