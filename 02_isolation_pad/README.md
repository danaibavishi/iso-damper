**Phase 1 · First Iteration**

# 02 — Isolation Pad

The first attempt. Simple pads that evolved into proper spring mechanisms — before we realised the spring needed to be structural, not decorative.

## The idea

Start simple: flat pads with small nub feet to create a standoff between speaker and shelf. Minimal contact area = less vibration transmission. Then add a spring inside to get real compliance.

Early pad iteration — tapered pedestal form in TinkerCAD

## Iterations

### v1 — Nub pad

Flat rectangular pad (122×132.5mm). Four tapered nubs on the underside create a standoff. No spring mechanism — pure decoupling through minimal contact area.

> Problem: Nubs reduce contact area but don't provide compliance. The speaker still transmits vibration directly through the rigid pad body.

### v2 — Compliant isolator v1

Added an orthoplanar spring mechanism inside the pad. Three curved arms connecting a centre hub to an outer ring.

> Problem: The arm geometry was disconnected — inner plate floated with no structural connection to the outer ring.

### v3 — Compliant isolator v2

Fixed the arm connections. Hub properly bridges to outer ring. This version works mechanically but the flat disc form factor doesn't provide enough vertical clearance for spring travel.

> Key learning: A flat pad is too low-profile. The spring needs height — the deflection path requires vertical clearance below the speaker. This realisation drove the two-piece stand concept.

## Files in this folder

isolation_pad_v1.stl
nub pad — no spring
isolation_pad_v1.scad
OpenSCAD source
compliant_isolator_v2.stl
fixed spring geometry