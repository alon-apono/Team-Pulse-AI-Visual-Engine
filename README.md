# Team Pulse - AI Visual Engine

> Transform team activity into stunning real-time visuals using n8n + Resolume Arena + AI

![Team Pulse](https://img.shields.io/badge/n8n-Workflow%20Automation-orange)
![Resolume](https://img.shields.io/badge/Resolume-Arena-purple)
![AI](https://img.shields.io/badge/AI-GPT--4o-green)

## 🎯 What is Team Pulse?

Team Pulse is a **real-time visualization system** that transforms your team's activity (Slack messages, GitHub commits, Jira tickets) into stunning, responsive visuals. Using n8n for orchestration and AI for creative direction, it creates a living, breathing representation of your team's energy.

### The Three-Layer Response System

| Layer | Latency | What Happens |
|-------|---------|--------------|
| **Instant** | < 1 sec | Every event triggers immediate visual pulse |
| **Adaptive** | 5 sec | Activity frequency adjusts colors, BPM, intensity |
| **Ambient** | 30 sec | AI interprets mood and triggers theme changes |

## 🏗️ Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Data Sources   │     │  n8n Workflows  │     │ Resolume Arena  │
├─────────────────┤     ├─────────────────┤     ├─────────────────┤
│ • Slack         │────▶│ Instant Respond │────▶│ • Clip Triggers │
│ • GitHub        │     │ Adaptive Process│     │ • BPM Control   │
│ • Jira          │     │ Ambient Director│     │ • Color Shifts  │
│ • Demo Panel    │     │ (with AI)       │     │ • Effects       │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

## 📦 Included Workflows

### 1. Instant Responder (`workflows/instant-responder.json`)
- **Trigger:** Webhook
- **Purpose:** Sub-second visual reactions to every event
- **Features:** Event-type mapping, random positioning, intensity control

### 2. Adaptive Processor (`workflows/adaptive-processor.json`)
- **Trigger:** Every 5 seconds
- **Purpose:** Analyzes activity patterns and adjusts visual parameters
- **Features:** BPM calculation, color temperature, master opacity

### 3. Ambient Director (`workflows/ambient-director.json`)
- **Trigger:** Every 30 seconds
- **Purpose:** AI interprets team mood and sets visual themes
- **Features:** GPT-4o integration, mood classification, theme transitions

### 4. Demo Trigger Panel (`workflows/demo-trigger-panel.json`)
- **Trigger:** Webhook
- **Purpose:** Competition demo - rapid-fire event simulation
- **Commands:** `slack`, `github`, `jira`, `celebration`, `burst`

## 🚀 Quick Start

### Prerequisites
- n8n instance (self-hosted or cloud)
- Resolume Arena with REST API enabled
- Azure OpenAI or OpenAI API key (for AI features)

### Setup

1. **Import Workflows to n8n:**
   ```bash
   # Import each workflow JSON file via n8n UI or API
   ```

2. **Configure Environment Variables in n8n:**
   ```
   RESOLUME_ENDPOINT=http://your-resolume-ip:8080
   N8N_WEBHOOK_URL=https://your-n8n-instance.com
   ```

3. **Set up Resolume Arena:**
   - Enable REST API in Preferences > Webserver
   - Organize clips by layer:
     - Layer 1: Slack effects (ripple, particles)
     - Layer 2: GitHub effects (code rain, celebration)
     - Layer 3: Jira effects (progress, complete)
     - Layer 4: Theme clips (5 moods)

4. **Activate Workflows:**
   - Activate all 4 workflows in n8n
   - Test with demo panel

### Testing the Demo

```bash
# Trigger Slack events
curl -X POST https://your-n8n/webhook/team-pulse/demo \
  -H "Content-Type: application/json" \
  -d '{"demo_type": "slack"}'

# Trigger celebration sequence
curl -X POST https://your-n8n/webhook/team-pulse/demo \
  -H "Content-Type: application/json" \
  -d '{"demo_type": "celebration"}'

# Trigger 20-event burst
curl -X POST https://your-n8n/webhook/team-pulse/demo \
  -H "Content-Type: application/json" \
  -d '{"demo_type": "burst"}'
```

## 🎨 Visual Mapping

### Event Types → Effects

| Event | Layer | Effect | Color |
|-------|-------|--------|-------|
| `slack_message` | 1 | Ripple | Blue |
| `slack_reaction` | 1 | Particle Burst | Yellow |
| `github_commit` | 2 | Code Rain | Green |
| `github_pr_merged` | 2 | Celebration | Gold |
| `jira_ticket_done` | 3 | Complete | Green |
| `jira_sprint_complete` | 3 | Victory | Gold |

### AI Moods → Themes

| Mood | Theme | Color Scheme |
|------|-------|--------------|
| `flow_state` | Steady, productive | Blue/Purple |
| `creative_chaos` | High energy | Rainbow |
| `victory_lap` | Celebration | Gold |
| `deep_focus` | Minimal, calm | Dark Blue |
| `idle` | Ambient, quiet | Zen |

## 🏢 Office Use Cases

1. **Lobby Display** - Visitors see company energy in real-time
2. **All-Hands Meetings** - Background visuals react to discussion
3. **Hackathon Events** - Visualize team progress as they code
4. **Remote Team Building** - Shared visual experience across locations
5. **Celebration Moments** - Automatic visual fireworks for wins

## 📁 Project Structure

```
Team-Pulse-AI-Visual-Engine/
├── README.md
├── workflows/
│   ├── instant-responder.json
│   ├── adaptive-processor.json
│   ├── ambient-director.json
│   └── demo-trigger-panel.json
├── docs/
│   ├── resolume-setup.md
│   └── event-mapping.md
└── examples/
    └── demo-commands.sh
```

## 🔧 Resolume API Reference

### Trigger a Clip
```
POST /api/v1/composition/layers/{layer}/clips/{clip}/connect
```

### Set Layer Opacity
```
PUT /api/v1/composition/layers/{layer}/video/opacity
Body: { "value": 0.0 - 1.0 }
```

### Set BPM
```
PUT /api/v1/composition/tempocontroller/tempo
Body: { "value": 60 - 200 }
```

## 🏆 Competition Notes

This project demonstrates:
- **Real-time responsiveness** - Sub-second visual reactions
- **AI creativity** - GPT-4o as a "Creative Director"
- **Practical value** - Real office/event use cases
- **Technical depth** - Webhooks, scheduling, AI, HTTP orchestration
- **Visual impact** - Stunning, meaningful visualizations

## 📄 License

MIT License - Build something amazing!

---

**Built with ❤️ using n8n + Resolume Arena + AI**

