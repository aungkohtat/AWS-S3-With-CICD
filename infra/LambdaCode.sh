import json
import boto3
s3_client = boto3.client('s3')
cloudfront_client = boto3.client('cloudfront')
def lambda_handler(event, context):
 	for record in event['Records']:
 		if record['s3']['object']['key'] == "index.html":
 			invalidation = cloudfront_client.create_invalidation(
				 DistributionId = "Your-distribution-ID",
				 InvalidationBatch ={
				 	'Paths': {
 						"Quantity": 1,
 						"Items": ["/*"]
 					},
					"CallerReference": str(record['eventTime'])
 				}
	 		)
 			return {
 				'statusCode': 200,
 				'body': json.dumps("Cloudfront invalidation successfully created")
 			}
 	return{
 		'statusCode': 204,
 		'body': json.dumps("No file called index.html therefore no invalidation created")
}