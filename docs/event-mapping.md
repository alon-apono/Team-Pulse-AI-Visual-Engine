# Team Pulse v2 - Event Mapping

## Layer Structure

| Layer | Content | Behavior |
|-------|---------|----------|
| **Layer 1** | Heart clip | Always beating (constant) |
| **Layer 2** | Text overlays | Shows for 4 seconds on event, then clears |

## Layer 2 Clip Mapping

| Clip | Name | Event Types |
|------|------|-------------|
| Clip 1 | GitHub | `github_commit`, `github_pr_merged` |
| Clip 2 | Jira | `jira_ticket_done`, `jira_sprint_complete` |
| Clip 3 | Slack | `slack_message`, `slack_reaction` |

## Event → Visual Effects

### 🐙 GitHub Events
| Setting | Value | Description |
|---------|-------|-------------|
| Layer | 2 | Text overlay |
| Clip | 1 | GitHub text + audio |
| Transition | DigiGlitch | Glitchy, techy feel |
| Saturation | 0.0 | Gray/Black & White |
| Hue | 0.0 | No shift |
| Turbulence | 0.4 | Wavy distortion |

### 📋 Jira Events
| Setting | Value | Description |
|---------|-------|-------------|
| Layer | 2 | Text overlay |
| Clip | 2 | Jira text + audio |
| Transition | Dissolve | Smooth, professional |
| Saturation | 0.9 | Slightly desaturated |
| Hue | 0.55 | Blue shift (Jira blue) |
| Turbulence | 0.0 | No distortion |

### 💬 Slack Events
| Setting | Value | Description |
|---------|-------|-------------|
| Layer | 2 | Text overlay |
| Clip | 3 | Slack text + audio |
| Transition | Zoom In | Energetic, attention-grabbing |
| Saturation | 1.0 | Full color (colorful) |
| Hue | 0.0 | No shift |
| Turbulence | 0.2 | Light wobble effect |

## Resolume Parameter IDs

These are the specific parameter IDs from the composition:

```javascript
const PARAM_IDS = {
  L2_TRANS_DUR: 1767124586747,    // Layer 2 transition duration
  L2_TRANS_BLEND: 1767124586657,  // Layer 2 transition blend mode
  TURB_STRENGTH: 1767124595384,   // TASTurbulent effect strength
  SAT_SCALE: 1767124595299,       // HueRotate saturation scale
  HUE_ROTATE: 1767124595298       // HueRotate hue shift
};
```

## Timing

| Setting | Value | Description |
|---------|-------|-------------|
| Transition Duration | 1.5 sec | Slow, smooth transitions |
| Text Display | 4 sec | How long text overlay shows |
| Heart Idle | 10 sec | Time between events (demo) |

## Audio

Each text clip has audio attached:
- **GitHub clip**: Speaks when GitHub events trigger
- **Jira clip**: Speaks when Jira events trigger
- **Slack clip**: Speaks when Slack events trigger

Audio plays automatically when the clip is connected!

## API Endpoints Used

### Trigger Clip
```
POST /api/v1/composition/layers/{layer}/clips/{clip}/connect
```

### Clear Layer (hide text)
```
POST /api/v1/composition/layers/2/clear
```

### Set Parameter
```
PUT /api/v1/parameter/by-id/{paramId}
Body: { "value": <number or string> }
```

### Available Transitions
- `Alpha` - Standard fade
- `DigiGlitch` - Digital glitch effect
- `Dissolve` - Pixel dissolve
- `Zoom In` - Zooming transition
- `Zoom Out` - Reverse zoom
- `Wipe Ellipse` - Circular wipe
- And many more...
