# Engineering Notes

## Acoustic isolation principles

Speaker cabinets vibrate at the frequencies they reproduce. Vibration transmits through rigid shelf contact, re-radiating as coloured bass and low-frequency energy through walls. Two mechanisms break the path:

1. **Compliance** — a flexible interface absorbs vibrational energy rather than transmitting it
2. **Minimal contact area** — dome/spike contact points reduce the surface area for lateral shear wave transmission

This design uses both.

---

## Fixed-guided beam mechanics

Each spring arm behaves as a fixed-guided beam — both ends constrained against rotation, loaded vertically.

```
Deflection:    δ = F·L³ / (12·E·I)
Max stress:    σ = 6·F·L / (w·t²)
Second moment: I = w·t³ / 12
```

**Material — PETG:**

| Property | Value |
|---|---|
| Young's modulus (E) | 1700 MPa |
| Yield strength | ~50 MPa |
| Target safety factor | ≥ 1.1× |

---

## Scale sensitivity

When scaling the BYU spring uniformly by factor S, both δ and σ scale as 1/S. A smaller spring is stiffer but also lower stress. The constraint is printability: arms need ≥ 6 layers at 0.2mm = 1.2mm minimum thickness.

**At 0.40× scale (chosen):**
- Load per arm: 2.2kg ÷ 3 pucks ÷ 3 arms = 2.4N
- Arm length: 72.4mm × 0.40 - hub = 14.6mm
- Arm size: 2.0mm × 1.52mm
- Deflection: **0.63mm** ✓
- Max stress: **45 MPa** (yield margin 1.11×) ✓

---

## BYU spring geometry (reverse-engineered from STL)

```
Outer diameter:         144.78mm
Height:                  3.81mm
Centre hub radius:       ~10mm
Hub ring outer edge:     ~21.9mm
Outer ring inner edge:   ~64mm
Outer ring outer edge:   ~72.4mm
Arm positions:           38°, 158°, 278° (120° spacing, 38° offset)
Arm width at r=40mm:     ~5mm
Arm region:              r = 21.9mm to 58.5mm
```

The 38° offset prevents arms aligning with primary loading axes, distributing stress more evenly.

---

## Non-uniform scaling risk

Scaling the circular spring non-uniformly to fit an oval footprint distorts arm geometry — different stiffness in X vs Y. This is why the design uses a **circular spring at 0.40× uniform scale** placed under an oval plate, rather than stretching the spring to match the oval.

---

## Why PETG over PLA or TPU

| Material | E (MPa) | Yield (MPa) | Notes |
|---|---|---|---|
| PLA | 3500 | 55 | Too stiff — spring barely deflects |
| **PETG** | **1700** | **50** | **Sweet spot** |
| TPU 95A | 30–50 | 8–15 | Too soft — poor dimensional accuracy |
