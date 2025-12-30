#!/bin/bash

# Team Pulse Visual Demo
# Each event triggers a DISTINCT visual in Resolume

N8N_URL="${N8N_URL:-https://n8n.staging.apono.io}"
DELAY="${DELAY:-5}"

trigger_event() {
    local type=$1
    local message=$2
    curl -s -X POST "$N8N_URL/webhook/team-pulse/event" \
        -H "Content-Type: application/json" \
        -d "{\"type\": \"$type\", \"message\": \"$message\"}" > /dev/null
}

echo "╔════════════════════════════════════════════════════╗"
echo "║     TEAM PULSE - Visual Demo (${DELAY}s intervals)     ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""

# Event mapping:
# ┌─────────────────────┬────────┬─────────────────────────────┐
# │ Event               │ Clip   │ Visual Style                │
# ├─────────────────────┼────────┼─────────────────────────────┤
# │ idle                │ 2      │ calmness - Peaceful         │
# │ slack_message       │ 3      │ cubularwonk - Geometric     │
# │ slack_reaction      │ 12     │ redripple - Red burst       │
# │ github_commit       │ 6      │ organicspiral - Flowing     │
# │ github_pr_merged    │ 15     │ wonkarama - Celebration     │
# │ jira_ticket_created │ 1      │ basaloopisk - Starting      │
# │ jira_ticket_done    │ 10     │ protrusion - Burst out      │
# │ jira_sprint_complete│ 16     │ wonkwobble1 - Max celebrate │
# └─────────────────────┴────────┴─────────────────────────────┘

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "1️⃣  IDLE STATE - Calm, zen visual"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
trigger_event "idle" "System idle"
echo "→ Clip 2: calmness - Peaceful ambient"
sleep $DELAY

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "2️⃣  SLACK MESSAGE - Team communication"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
trigger_event "slack_message" "Hey team, standup in 5!"
echo "→ Clip 3: cubularwonk - Geometric, structured"
sleep $DELAY

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "3️⃣  SLACK REACTION - Someone liked it!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
trigger_event "slack_reaction" "👍 reaction"
echo "→ Clip 12: redripple - Red burst, attention!"
sleep $DELAY

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "4️⃣  GITHUB COMMIT - Code flowing"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
trigger_event "github_commit" "Fix: login validation bug"
echo "→ Clip 6: organicspiral - Flowing, code-like"
sleep $DELAY

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "5️⃣  JIRA TICKET DONE - Task complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
trigger_event "jira_ticket_done" "PROJ-123 completed!"
echo "→ Clip 10: protrusion - Burst outward, completion"
sleep $DELAY

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "6️⃣  🚀 PR MERGED! - Celebration!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
trigger_event "github_pr_merged" "PR #42 merged! Feature complete!"
echo "→ Clip 15: wonkarama - Energetic celebration!"
sleep $DELAY

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "7️⃣  🏆 SPRINT COMPLETE! - Big win!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
trigger_event "jira_sprint_complete" "Sprint 42 DONE! 🎉"
echo "→ Clip 16: wonkwobble1 - Maximum celebration!"

echo ""
echo "╔════════════════════════════════════════════════════╗"
echo "║              DEMO COMPLETE! 🎉                     ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""
echo "Usage: DELAY=3 ./visual-demo.sh  # Faster demo"
echo "       DELAY=10 ./visual-demo.sh # Slower demo"

