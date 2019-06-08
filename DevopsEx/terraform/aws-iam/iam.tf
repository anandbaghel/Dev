#create group 
resource "aws_iam_group" "admins" {
 name = "admins"
}

#attach policy to group
resource "aws_iam_policy_attachment" "admins-policy-attach" {
 name = "admins-policy-attach"
 groups = ["${aws_iam_group.admins.name}"]
 policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#create a user in IAM
resource "aws_iam_user" "opsadmin" {
 name = "opsadmin"
}

resource "aws_iam_user" "sysadmin" {
 name = "sysadmin"
}

resource "aws_iam_group_membership" "admin-users" {
 name = "admin-users"
 users = [ 
          "${aws_iam_user.opsadmin.name}", 
          "${aws_iam_user.sysadmin.name}"
         ]
 group = "${aws_iam_group.admins.name}"
}

output "warning" {
    value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}
