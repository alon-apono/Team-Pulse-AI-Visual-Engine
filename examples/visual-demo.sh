#!/bin/bash

# Team Pulse v2 - Visual Demo Script
# Heart + Text Overlay System with Cool Transitions & Audio
#
# Layer Structure:
#   Layer 1: Heart (always beating, less effects)
#   Layer 2: Logo (always on)
#   Layer 3: Text overlays - GitHub (clip 1), Jira (clip 2), Slack (clip 3)
#
# Effects:
#   GitHub: Gray + Light Turbulence (0.15) + DigiGlitch transition
#   Jira: Blue hue shift + Dissolve transition
#   Slack: Colorful + Wobble + Zoom In transition

RESOLUME="${RESOLUME_ENDPOINT:-http://192.168.1.237:8080}"

# Parameter IDs from Resolume composition
L3_TRANS_DUR=1767124586747
L3_TRANS_BLEND=1767124586657
TURB_STRENGTH=1767124595384
SAT_ID=1767124595299
HUE_ID=1767124595298

# Timing settings
TRANSITION_DURATION=1.5  # Slow, smooth transitions
TEXT_DISPLAY_TIME=4      # Text shows for 4 seconds
HEART_IDLE_TIME=8        # Heart alone for 8 seconds

echo "╔════════════════════════════════════════════════════════════╗"
echo "║     TEAM PULSE v2 - Heart + Text Overlay Demo              ║"
echo "║     Transition: ${TRANSITION_DURATION}s | Text: ${TEXT_DISPLAY_TIME}s | Heart: ${HEART_IDLE_TIME}s         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "Resolume: $RESOLUME"
echo ""

# Setup function
setup() {
    echo "⚙️  Setting up..."
    # Set transition duration (Layer 3)
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$L3_TRANS_DUR" \
        -H "Content-Type: application/json" \
        -d "{\"value\": $TRANSITION_DURATION}" > /dev/null
    
    # Reset effects to normal
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$SAT_ID" \
        -H "Content-Type: application/json" -d '{"value": 1.0}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$HUE_ID" \
        -H "Content-Type: application/json" -d '{"value": 0.0}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$TURB_STRENGTH" \
        -H "Content-Type: application/json" -d '{"value": 0.0}' > /dev/null
    
    # Start heart on Layer 1
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/1/clips/1/connect" > /dev/null
    
    # Clear Layer 3 (text overlays)
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clear" > /dev/null
    
    echo "✓ Ready!"
    echo ""
}

# Reset effects to normal
reset_effects() {
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$SAT_ID" \
        -H "Content-Type: application/json" -d '{"value": 1.0}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$HUE_ID" \
        -H "Content-Type: application/json" -d '{"value": 0.0}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$TURB_STRENGTH" \
        -H "Content-Type: application/json" -d '{"value": 0.0}' > /dev/null
}

# GitHub event
trigger_github() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🐙 GITHUB - DigiGlitch + Gray + Turbulent + Audio"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Set effects: gray, less turbulent, digiglitch transition
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$L3_TRANS_BLEND" \
        -H "Content-Type: application/json" -d '{"value": "DigiGlitch"}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$SAT_ID" \
        -H "Content-Type: application/json" -d '{"value": 0.0}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$TURB_STRENGTH" \
        -H "Content-Type: application/json" -d '{"value": 0.15}' > /dev/null
    
    # Show GitHub text (clip 1 on layer 3)
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clips/1/connect" > /dev/null
    
    sleep $TEXT_DISPLAY_TIME
    
    # Hide text and reset
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clear" > /dev/null
    reset_effects
    echo "   ✓ Back to heart"
}

# Jira event
trigger_jira() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📋 JIRA - Dissolve + Blue + Audio"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Set effects: blue hue, dissolve transition
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$L3_TRANS_BLEND" \
        -H "Content-Type: application/json" -d '{"value": "Dissolve"}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$HUE_ID" \
        -H "Content-Type: application/json" -d '{"value": 0.55}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$SAT_ID" \
        -H "Content-Type: application/json" -d '{"value": 0.9}' > /dev/null
    
    # Show Jira text (clip 2 on layer 3)
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clips/2/connect" > /dev/null
    
    sleep $TEXT_DISPLAY_TIME
    
    # Hide text and reset
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clear" > /dev/null
    reset_effects
    echo "   ✓ Back to heart"
}

# Slack event
trigger_slack() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "💬 SLACK - Zoom In + Colorful + Wobble + Audio"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Set effects: colorful, wobble, zoom in transition
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$L3_TRANS_BLEND" \
        -H "Content-Type: application/json" -d '{"value": "Zoom In"}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$SAT_ID" \
        -H "Content-Type: application/json" -d '{"value": 1.0}' > /dev/null
    curl -s -X PUT "$RESOLUME/api/v1/parameter/by-id/$TURB_STRENGTH" \
        -H "Content-Type: application/json" -d '{"value": 0.2}' > /dev/null
    
    # Show Slack text (clip 3 on layer 3)
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clips/3/connect" > /dev/null
    
    sleep $TEXT_DISPLAY_TIME
    
    # Hide text and reset
    curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clear" > /dev/null
    reset_effects
    echo "   ✓ Back to heart"
}

# Main demo sequence
run_demo() {
    setup
    
    echo "🫀 Heart beating (${HEART_IDLE_TIME}s idle)..."
    sleep $HEART_IDLE_TIME
    
    trigger_github
    echo ""
    echo "🫀 Heart (${HEART_IDLE_TIME}s)..."
    sleep $HEART_IDLE_TIME
    
    trigger_jira
    echo ""
    echo "🫀 Heart (${HEART_IDLE_TIME}s)..."
    sleep $HEART_IDLE_TIME
    
    trigger_slack
    echo ""
    
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║              DEMO COMPLETE! 🎉                             ║"
    echo "╚════════════════════════════════════════════════════════════╝"
}

# Command line interface
case "${1:-demo}" in
    demo)
        run_demo
        ;;
    github)
        setup
        trigger_github
        ;;
    jira)
        setup
        trigger_jira
        ;;
    slack)
        setup
        trigger_slack
        ;;
    setup)
        setup
        echo "🫀 Heart is now beating. Ready for events!"
        ;;
    reset)
        reset_effects
        curl -s -X POST "$RESOLUME/api/v1/composition/layers/3/clear" > /dev/null
        echo "✓ Effects reset, text cleared"
        ;;
    *)
        echo "Usage: $0 {demo|github|jira|slack|setup|reset}"
        echo ""
        echo "Commands:"
        echo "  demo    - Run full demo sequence (default)"
        echo "  github  - Trigger GitHub event only"
        echo "  jira    - Trigger Jira event only"
        echo "  slack   - Trigger Slack event only"
        echo "  setup   - Initialize heart and clear text"
        echo "  reset   - Reset all effects to normal"
        echo ""
        echo "Environment:"
        echo "  RESOLUME_ENDPOINT - Resolume Arena URL (default: http://192.168.1.237:8080)"
        ;;
esac
