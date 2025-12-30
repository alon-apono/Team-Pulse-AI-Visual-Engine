# Team Pulse v2 - AI Visual Engine

> Transform team activity into stunning real-time visuals using n8n + Resolume Arena + AI

![Team Pulse](https://img.shields.io/badge/n8n-Workflow%20Automation-orange)
![Resolume](https://img.shields.io/badge/Resolume-Arena-purple)
![AI](https://img.shields.io/badge/AI-GPT--4o-green)

## 🎯 What is Team Pulse?

Team Pulse is a **real-time visualization system** that transforms your team's activity (Slack messages, GitHub commits, Jira tickets) into stunning, responsive visuals. A beating heart represents your team's pulse, with text overlays and effects that react to every event!

### ❤️ The Heart System (v2)

| Layer | Content | Behavior |
|-------|---------|----------|
| **Layer 1** | 🫀 Beating Heart | Always visible, represents team's pulse |
| **Layer 2** | 📝 Text Overlays | GitHub/Jira/Slack text + audio, appears for 4 sec |

### Visual Effects by Event Type

| Event | Transition | Color Effect | Extra |
|-------|------------|--------------|-------|
| 🐙 GitHub | DigiGlitch | Gray/B&W | Turbulent distortion |
| 📋 Jira | Dissolve | Blue shift | Smooth, professional |
| 💬 Slack | Zoom In | Colorful | Wobble effect |

## 🏗️ Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Data Sources   │     │  n8n Workflows  │     │ Resolume Arena  │
├─────────────────┤     ├─────────────────┤     ├─────────────────┤
│ • Slack         │────▶│ Instant Respond │────▶│ Layer 1: Heart  │
│ • GitHub        │     │ (webhook)       │     │ Layer 2: Text   │
│ • Jira          │     │                 │     │ + Effects       │
│ • Demo Script   │     │                 │     │ + Audio         │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

## 📦 Included Workflows

### Instant Responder v2 (`workflows/instant-responder.json`)
- **Trigger:** Webhook `POST /webhook/team-pulse/event`
- **Flow:** 
  1. Receive event → Map to visual settings
  2. Apply effects (saturation, hue, turbulence)
  3. Set transition style (DigiGlitch/Dissolve/Zoom In)
  4. Show text overlay (4 seconds)
  5. Clear text → Reset effects

## 🚀 Quick Start

### Prerequisites
- n8n instance (self-hosted or cloud)
- Resolume Arena with REST API enabled (port 8080)

### Resolume Setup

1. **Enable REST API:**
   - Preferences > Webserver > Enable
   - Port: 8080

2. **Layer Structure:**
   - **Layer 1:** Heart clip (clip 1)
   - **Layer 2:** GitHub (clip 1), Jira (clip 2), Slack (clip 3)

3. **Required Effects on Composition:**
   - HueRotate (for color control)
   - TASTurbulent (for distortion effects)

### n8n Setup

1. **Import Workflow:**
   ```bash
   # Import workflows/instant-responder.json via n8n UI
   ```

2. **Set Environment Variable:**
   ```
   RESOLUME_ENDPOINT=http://192.168.1.237:8080
   ```

3. **Activate Workflow**

### Testing

```bash
# Run the visual demo
cd examples
chmod +x visual-demo.sh
./visual-demo.sh demo

# Or trigger individual events
./visual-demo.sh github
./visual-demo.sh jira
./visual-demo.sh slack
```

## 🎨 Visual Mapping

### Event Types → Effects

| Event | Layer | Clip | Transition | Saturation | Hue | Turbulence |
|-------|-------|------|------------|------------|-----|------------|
| `github_commit` | 2 | 1 | DigiGlitch | 0.0 (gray) | 0.0 | 0.4 |
| `github_pr_merged` | 2 | 1 | DigiGlitch | 0.0 | 0.0 | 0.5 |
| `jira_ticket_done` | 2 | 2 | Dissolve | 0.9 | 0.55 (blue) | 0.0 |
| `jira_sprint_complete` | 2 | 2 | Dissolve | 1.0 | 0.55 | 0.1 |
| `slack_message` | 2 | 3 | Zoom In | 1.0 (color) | 0.0 | 0.2 |
| `slack_reaction` | 2 | 3 | Zoom In | 1.0 | 0.0 | 0.3 |

### Timing

| Setting | Value |
|---------|-------|
| Transition Duration | 1.5 seconds (slow, smooth) |
| Text Display | 4 seconds |
| Heart Idle (demo) | 10 seconds between events |

## 🔊 Audio

Each text clip has audio that plays automatically:
- **GitHub clip:** Announces GitHub events
- **Jira clip:** Announces Jira events  
- **Slack clip:** Announces Slack events

## 📁 Project Structure

```
Team-Pulse-AI-Visual-Engine/
├── README.md
├── workflows/
│   ├── instant-responder.json    # Main workflow (v2)
│   ├── adaptive-processor.json
│   ├── ambient-director.json
│   └── demo-trigger-panel.json
├── docs/
│   ├── resolume-setup.md
│   └── event-mapping.md          # Detailed mapping docs
└── examples/
    ├── demo-commands.sh
    └── visual-demo.sh            # Full demo script
```

## 🔧 Resolume API Reference

### Trigger a Clip
```bash
POST /api/v1/composition/layers/{layer}/clips/{clip}/connect
```

### Clear Layer (hide text)
```bash
POST /api/v1/composition/layers/2/clear
```

### Set Parameter by ID
```bash
PUT /api/v1/parameter/by-id/{paramId}
Body: { "value": <number or string> }
```

### Key Parameter IDs (from this composition)
```javascript
L2_TRANS_DUR: 1767124586747    // Transition duration
L2_TRANS_BLEND: 1767124586657  // Transition blend mode
TURB_STRENGTH: 1767124595384   // Turbulence effect
SAT_SCALE: 1767124595299       // Color saturation
HUE_ROTATE: 1767124595298      // Hue shift
```

## 🏢 Office Use Cases

1. **Lobby Display** - Visitors see company energy as a beating heart
2. **All-Hands Meetings** - Background visuals react to discussion
3. **Hackathon Events** - Visualize team progress as they code
4. **Remote Team Building** - Shared visual experience across locations
5. **Celebration Moments** - Automatic visual effects for wins

## 🏆 Competition Notes

This project demonstrates:
- **Real-time responsiveness** - Sub-second visual reactions
- **Creative visual design** - Heart metaphor with text overlays
- **Audio feedback** - Clips speak when triggered
- **Technical depth** - Webhooks, effects control, transitions
- **Visual impact** - Stunning, meaningful visualizations
- **Practical value** - Real office/event use cases

## 📄 License

MIT License - Build something amazing!

---

**Built with ❤️ using n8n + Resolume Arena**
