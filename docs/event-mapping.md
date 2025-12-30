# Event Mapping Reference

## Event Types

Team Pulse responds to the following event types:

### Slack Events
| Type | Layer | Clip | Effect | Color | Intensity |
|------|-------|------|--------|-------|-----------|
| `slack_message` | 1 | 1 | Ripple | #3498db (Blue) | 0.7 |
| `slack_reaction` | 1 | 2 | Particle Burst | #f1c40f (Yellow) | 0.5 |
| `slack_thread` | 1 | 3 | Wave | #9b59b6 (Purple) | 0.6 |

### GitHub Events
| Type | Layer | Clip | Effect | Color | Intensity |
|------|-------|------|--------|-------|-----------|
| `github_commit` | 2 | 1 | Code Rain | #2ecc71 (Green) | 0.8 |
| `github_pr_opened` | 2 | 2 | Expand | #e67e22 (Orange) | 0.7 |
| `github_pr_merged` | 2 | 3 | Celebration | #f39c12 (Gold) | 1.0 |
| `github_issue` | 2 | 4 | Pulse | #e74c3c (Red) | 0.6 |

### Jira Events
| Type | Layer | Clip | Effect | Color | Intensity |
|------|-------|------|--------|-------|-----------|
| `jira_ticket_created` | 3 | 1 | Spawn | #3498db (Blue) | 0.5 |
| `jira_ticket_progress` | 3 | 2 | Flow | #1abc9c (Teal) | 0.6 |
| `jira_ticket_done` | 3 | 3 | Complete | #27ae60 (Green) | 0.9 |
| `jira_sprint_complete` | 3 | 4 | Victory | #f1c40f (Gold) | 1.0 |

## AI Mood Themes

The Ambient Director AI classifies team activity into these moods:

| Mood | Layer | Clip | Description | Color Scheme |
|------|-------|------|-------------|--------------|
| `flow_state` | 4 | 1 | Steady, productive work | Blue/Purple |
| `creative_chaos` | 4 | 2 | High energy, lots happening | Rainbow |
| `victory_lap` | 4 | 3 | Wins and celebrations | Gold/Yellow |
| `deep_focus` | 4 | 4 | Quiet concentration | Dark Blue |
| `idle` | 4 | 5 | Low/no activity | Zen/Gray |

## Activity Level Mapping

The Adaptive Processor calculates activity levels:

| Activity Level | Energy | Color Temp | BPM Range |
|----------------|--------|------------|-----------|
| 0.0 - 0.3 | Low | Cool (Blue) | 60-84 |
| 0.3 - 0.6 | Medium | Neutral | 84-108 |
| 0.6 - 1.0 | High | Warm (Orange) | 108-140 |

## Event Payload Format

Send events to the Instant Responder webhook:

```json
POST /webhook/team-pulse/event

{
  "type": "github_commit",
  "source": "github",
  "message": "Fix: resolved login bug",
  "metadata": {
    "author": "developer@company.com",
    "repo": "main-app"
  }
}
```

### Required Fields
- `type` - Event type from the mapping above
- `source` - Origin system (slack, github, jira, demo)

### Optional Fields
- `message` - Human-readable description
- `metadata` - Additional context (not used for visuals)

## Adding Custom Events

To add new event types, modify the `effectMap` in the Instant Responder workflow:

```javascript
const effectMap = {
  // Add your custom event
  'custom_event': {
    layer: 1,
    clip: 4,
    effect: 'custom_effect',
    color: '#ff6b6b',
    intensity: 0.8
  },
  // ... existing events
};
```

Then create a corresponding clip in Resolume on the specified layer.

