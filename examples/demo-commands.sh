#!/bin/bash

# Team Pulse Demo Commands
# Replace YOUR_N8N_URL with your actual n8n instance URL

N8N_URL="${N8N_URL:-https://n8n.staging.apono.io}"

echo "Team Pulse Demo Commands"
echo "========================"
echo "Using n8n URL: $N8N_URL"
echo ""

# Function to trigger demo
trigger_demo() {
    local demo_type=$1
    echo "Triggering: $demo_type"
    curl -s -X POST "$N8N_URL/webhook/team-pulse/demo" \
        -H "Content-Type: application/json" \
        -d "{\"demo_type\": \"$demo_type\"}" | jq .
    echo ""
}

# Menu
case "${1:-menu}" in
    slack)
        trigger_demo "slack"
        ;;
    github)
        trigger_demo "github"
        ;;
    jira)
        trigger_demo "jira"
        ;;
    celebration)
        trigger_demo "celebration"
        ;;
    burst)
        trigger_demo "burst"
        ;;
    all)
        echo "Running all demos with 3 second delays..."
        trigger_demo "slack"
        sleep 3
        trigger_demo "github"
        sleep 3
        trigger_demo "jira"
        sleep 3
        trigger_demo "celebration"
        sleep 3
        trigger_demo "burst"
        ;;
    *)
        echo "Usage: $0 {slack|github|jira|celebration|burst|all}"
        echo ""
        echo "Commands:"
        echo "  slack       - Trigger 3-7 Slack message events"
        echo "  github      - Trigger 4 GitHub events (3 commits + 1 PR merge)"
        echo "  jira        - Trigger 3 Jira events"
        echo "  celebration - Trigger victory celebration sequence"
        echo "  burst       - Trigger rapid-fire 20 events!"
        echo "  all         - Run all demos in sequence"
        echo ""
        echo "Environment:"
        echo "  N8N_URL     - Set your n8n instance URL (default: https://n8n.staging.apono.io)"
        echo ""
        echo "Example:"
        echo "  N8N_URL=https://my-n8n.com $0 celebration"
        ;;
esac

