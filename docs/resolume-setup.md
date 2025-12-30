# Resolume Arena Setup Guide

## Enable REST API

1. Open **Resolume Arena**
2. Go to **Preferences** > **Webserver**
3. Check **Enable Webserver & REST API**
4. Note the port (default: 8080)
5. Optionally set username/password for authentication

## Layer Organization

For Team Pulse, organize your composition with these layers:

### Layer 1: Slack Effects
- Clip 1: Ripple effect (for messages)
- Clip 2: Particle burst (for reactions)
- Clip 3: Wave pattern (for threads)

### Layer 2: GitHub Effects
- Clip 1: Code rain / Matrix effect (for commits)
- Clip 2: Expanding circles (for PR opened)
- Clip 3: Celebration burst (for PR merged)
- Clip 4: Pulse effect (for issues)

### Layer 3: Jira Effects
- Clip 1: Spawn animation (ticket created)
- Clip 2: Flow/progress bars (ticket in progress)
- Clip 3: Completion burst (ticket done)
- Clip 4: Victory sequence (sprint complete)

### Layer 4: Theme/Mood Clips
- Clip 1: Flow State - Clean lines, blue/purple, steady
- Clip 2: Creative Chaos - Particle systems, rainbow, energetic
- Clip 3: Victory Lap - Gold, confetti, triumphant
- Clip 4: Deep Focus - Minimal, dark, subtle breathing
- Clip 5: Idle - Ambient, quiet, zen

## Recommended Clips/Effects

### Free Sources for VJ Content
- [Pexels Videos](https://www.pexels.com/videos/) - Free stock video
- [Videezy](https://www.videezy.com/) - Free VJ loops
- [Shutterstock Free](https://www.shutterstock.com/video/free) - Limited free content

### Effect Recommendations
- Use **Glow** effect on celebration clips
- Add **Color Correction** for dynamic color shifts
- Use **Blur** transitions between mood changes
- **Strobe** for high-energy burst moments

## API Endpoints Reference

### Trigger a Clip
```
POST /api/v1/composition/layers/{layer}/clips/{clip}/connect
```

### Set Layer Opacity
```
PUT /api/v1/composition/layers/{layer}/video/opacity
Body: { "value": 0.0 - 1.0 }
```

### Set Global BPM
```
PUT /api/v1/composition/tempocontroller/tempo
Body: { "value": 60 - 200 }
```

### Get Composition State
```
GET /api/v1/composition
```

## Testing Your Setup

1. Start Resolume Arena with REST API enabled
2. Test API connectivity:
```bash
curl http://localhost:8080/api/v1/composition
```

3. Trigger a test clip:
```bash
curl -X POST http://localhost:8080/api/v1/composition/layers/1/clips/1/connect
```

4. Set opacity:
```bash
curl -X PUT http://localhost:8080/api/v1/composition/layers/1/video/opacity \
  -H "Content-Type: application/json" \
  -d '{"value": 0.8}'
```

## Remote Access

If Resolume is running on a remote computer:
1. Ensure the remote computer's firewall allows port 8080
2. Use the remote IP address in your n8n environment variable
3. Example: `RESOLUME_ENDPOINT=http://192.168.1.100:8080`

