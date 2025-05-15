AWS AppStream Terraform Automation
Automate your AWS AppStream fleet and stack provisioning with Terraform — no manual clicking, no guesswork, 100% codified infrastructure.

Why This Project Matters
Managing AWS AppStream setups by hand? Painful, slow, error-prone. This project flips the script:

Infrastructure as Code (IaC): Define AppStream fleets, stacks, IAM roles, and associations with clean Terraform modules.

Production-Grade Automation: Spin up or tear down your AppStream environment instantly, with zero human errors.

CI/CD Integration Ready: Plug into GitHub Actions for peer-reviewed, safe infrastructure changes.

Cost & Time Efficient: Automatically manage resources to avoid overspending and wasted time.

Security Focused: Implements least privilege IAM roles and best-practice security policies.

Real-World Impact
Faster Delivery: Reduce environment setup from hours/days to minutes.

Scalability & Flexibility: Easily adapt fleet size to user demand or project phase.

Reliable Deployments: Consistent infra across dev, staging, and production.

Business Value: Cut operational overhead, reduce security risks, speed up app delivery.

Tech Stack & Skills Showcased
Terraform (modules, state management, outputs)

AWS AppStream, IAM, and related services

Shell scripting for automation hooks

GitHub Actions CI/CD pipelines

Cloud security best practices

How to Use
Customize variables in terraform.tfvars.

Run terraform init && terraform apply to provision.

Use the GitHub Actions workflow for automated testing and deployment.

Use the generated outputs to connect your AppStream fleet and stack.

(Optional) Use the included bash script for manual fleet-to-stack association if needed.

