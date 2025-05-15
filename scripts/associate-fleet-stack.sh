#!/bin/bash

set -euo pipefail

FLEET_NAME="$FLEET_NAME"
STACK_NAME="$STACK_NAME"
REGION="${REGION:-us-east-1}"  

echo "🔗 Associando FLEET '$FLEET_NAME' com STACK '$STACK_NAME' na região '$REGION'..."

aws appstream associate-fleet \
  --fleet-name "$FLEET_NAME" \
  --stack-name "$STACK_NAME" \
  --region "$REGION"

echo "✅ Complete!"
