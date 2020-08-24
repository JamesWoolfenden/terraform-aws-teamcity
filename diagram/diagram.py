# diagram.py
# Needs diagrams from pip and graphwiz installed
# https://diagrams.mingrammer.com/

from diagrams import Diagram, Cluster
from diagrams.aws.security import WAF

diagrams.aws.management.Cloudwatch
diagrams.aws.security.IdentityAndAccessManagementIamRole, IAMRole (alias)
diagrams.aws.compute.Lambda

with Diagram("waf-global", show=False):
          WAF("Global")
