package terraform.analysis

import input as tfplan

default authz := true

authz := false {
  some rc
  rc := tfplan.resource_changes[_]
  rc.type == "aws_s3_bucket_acl"
  rc.change.after.acl == "public-read"
}

authz := false {
  some rc
  rc := tfplan.resource_changes[_]
  rc.type == "aws_s3_bucket_acl"
  rc.change.after.acl == "public-read-write"
}
