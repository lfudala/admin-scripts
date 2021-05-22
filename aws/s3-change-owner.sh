# Get the go project s3-recursive-acl
go get github.com/codingtony/s3-recursive-acl
# Update the acl to bucket-owner-full-control
s3-recursive-acl --bucket bucket-to-work-on --region us-east-1 --acl bucket-owner-full-control
# Copy objects over themselves to change owner
aws s3 cp --recursive s3://bucket-to-work-on s3://bucket-to-work-on
# Add back any explicit grants
s3-recursive-acl --bucket bucket-to-work-on --region us-east-1 --grants '[{"Grantee":{"ID":"example-id","Type":"CanonicalUser"},"Permission":"FULL_CONTROL"},{"Grantee":{"ID":"example-id2","Type":"CanonicalUser"},"Permission":"FULL_CONTROL"}]'
