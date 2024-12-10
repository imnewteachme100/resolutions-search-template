# unsc-initialization-template

## A Live, Accessible, and Scalable Search Platform
This project provides a blueprint for a single-page application (SPA) designed to facilitate fast, scalable, and accurate semantic search for UN General Assembly resolutions, Security Council resolutions, and Presidential statements. The solution integrates a Vue.js frontend, a serverless AWS Lambda/API Gateway backend, and a preconfigured MongoDB Atlas cluster to enable users to perform natural language queries with instant results.

## Solution Overview
1. Text Extraction and Structuring
Raw text was extracted from resolution PDFs using Amazon Textract.
A custom Go script parsed and segmented these documents into individual resolutions using Regex. (link to the script when publicly available).
The structured data was made searchable by converting decades of resolutions into query-ready formats.
2. Search-Ready Database
Resolutions were stored in MongoDB Atlas, optimized for semantic search.
An [adapted Node.js script](https://www.mongodb.com/docs/atlas/atlas-vector-search/create-embeddings/) processed and uploaded the data as 1,536-dimension vector embeddings.
3. User-Friendly Interface
Built with Vue.js, the frontend provides a simple, intuitive interface.
Users can type natural language queries (e.g., “respect for humanitarian law”) and receive precise results instantly.
4. Scalable Backend on AWS
Backend services leverage AWS Lambda and API Gateway for scalability and cost efficiency.
The entire application is hosted as a subdomain for seamless accessibility.
5. Collaboration and Open Source
The project is designed as a blueprint for others.
In collaboration with the ICRC, the solution is being prepared for release as open-source under their Open Source Program Office (OSPO).
Usage

## Usage 

1. Create a Fine-Grained Personal Access Token (PAT)
Generate a Personal Access Token (PAT) with fine-grained permissions for the organization.
Optionally, test access to ensure the token works:
bash
Copy code
curl -H "Authorization: token <your_github_pat>"
https://api.github.com/repos/projectrefuge/unsc-initialization-template

2. Create an SSM Parameter for the GitHub Token
Save your PAT in AWS Systems Manager Parameter Store as a secure parameter for use by Lambda or other services.

3. Configure Application Repository
In your app's settings under Branch Settings, click "Reconnect Repository."
Allow the installation of the Amplify app, scoped to your repository.

4. Create a Source Bucket and Upload Lambda Code
Set up an S3 bucket to serve as the source for your Lambda function.
Upload the Lambda function code into the bucket. (In the future, this process will be automated via a shell script.)

## Features
Natural Language Search: Query decades of resolutions instantly using semantic search.
Scalable Infrastructure: Built on AWS Lambda for cost-effectiveness and high availability.
Open Source Blueprint: Enable other organizations to adapt and reuse the tool.
Installation & Setup
Clone the repository:

## License
This project is licensed under the Apache License 2.0.