# Event to Visual Mapping

## Current Clip Assignments

Each event type triggers a **distinct visual** in Resolume Arena (Layer 1).

| Event Type | Clip # | Clip Name | Visual Style | Meaning |
|------------|--------|-----------|--------------|---------|
| `idle` | 2 | calmness | Peaceful, flowing | Team is quiet |
| `slack_message` | 3 | cubularwonk | Geometric, structured | Communication |
| `slack_reaction` | 12 | redripple | Red burst, attention | Engagement! |
| `github_commit` | 6 | organicspiral | Flowing, organic | Code flowing |
| `github_pr_merged` | 15 | wonkarama | Energetic, dynamic | Celebration! |
| `jira_ticket_created` | 1 | basaloopisk | Emerging, starting | New work begins |
| `jira_ticket_done` | 10 | protrusion | Burst outward | Completion! |
| `jira_sprint_complete` | 16 | wonkwobble1 | Maximum energy | Big win! 🏆 |
| `unknown` | 14 | tunneling | Mysterious | Unknown event |

## Visual Hierarchy

The clips are chosen to create a **visual narrative**:

```
Calm (idle) → Activity (messages, commits) → Celebration (merged, done) → Victory (sprint complete)
     ↓              ↓                              ↓                           ↓
 Peaceful      Geometric/Flowing            Energetic bursts           Maximum energy
```

## Event Payload Format

```json
POST /webhook/team-pulse/event

{
  "type": "github_commit",
  "source": "github",
  "message": "Fix: resolved login bug"
}
```

### Supported Event Types

**Slack Events:**
- `slack_message` - Someone sent a message
- `slack_reaction` - Someone reacted to a message

**GitHub Events:**
- `github_commit` - Code was committed
- `github_pr_merged` - Pull request was merged (celebration!)

**Jira Events:**
- `jira_ticket_created` - New ticket created
- `jira_ticket_done` - Ticket completed
- `jira_sprint_complete` - Entire sprint finished (big celebration!)

**System Events:**
- `idle` - No recent activity

## Customizing Visuals

To change which clip is triggered for an event:

1. Open the **Instant Responder** workflow in n8n
2. Edit the **Map Event to Visual** code node
3. Change the `clip` number in the `effectMap` object

Example:
```javascript
'github_commit': { 
  layer: 1, 
  clip: 7,  // Changed from 6 to 7
  name: 'CODE COMMIT',
  emoji: '💻'
},
```

## Available Clips in Your Resolume

Layer 1 has these clips loaded:
1. basaloopisk
2. calmness
3. cubularwonk
4. insidethewonk
5. insidethewonk2
6. organicspiral
7. organicspiral2
8. organinoi
9. organinoi2
10. protrusion
11. quadratik
12. redripple
13. spiralingthough
14. tunneling
15. wonkarama
16. wonkwobble1
17. wonkwobble2
18. wonkwobble4

## Running the Demo

```bash
# Default 5-second intervals
./examples/visual-demo.sh

# Faster (3 seconds)
DELAY=3 ./examples/visual-demo.sh

# Slower (10 seconds)
DELAY=10 ./examples/visual-demo.sh
```
