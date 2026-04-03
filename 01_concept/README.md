**Concept · BYU Research**

# 01 — The Orthoplanar Spring

Everything starts here. A flat spring that deflects vertically — manufactured as a single piece with no assembly required.

## What is an orthoplanar spring?

An orthoplanar spring is a flat, planar mechanism that deflects out of plane (vertically) under load. Unlike a coil spring, it doesn't rotate as it deflects, can be printed as a single flat piece, and has predictable, tuneable stiffness based on arm geometry.

> BYU source: This design comes from the Compliant Mechanisms Research Group at Brigham Young University, led by Prof. Larry Howell. Their STL is the foundation for everything in this project.

*BYU orthoplanar spring — top-down anatomy · 144.78mm diameter*

## Geometry (reverse-engineered from STL)

**Outer diameter:** 144.78 mm  
**Height:** 3.81 mm  
**Centre hub radius:** ~10 mm  
**Outer ring:** r 64–72.4mm (8.4mm wide)  
**Number of arms:** 3 straight radial beams  
**Arm angular positions:** 38° / 158° / 278°  
**Arm width at r=40mm:** ~5 mm  
**Arm region:** r 21.9mm to 58.5mm  

> Why 38° offset? The arms are at 38°/158°/278° — not 0°/120°/240°. This offset prevents alignment with the primary loading axes, distributing stress more evenly across all three arms.

## How it works

The centre hub is the fixed ground — it connects to the pedestal which sits on the shelf. The outer ring is the floating platform — it connects to the cylinder that holds the speaker. The three arms bridge between them, flexing vertically under load.

```
Load applied to outer ring → arms flex in Z direction
Outer ring displaces ±0.63mm relative to fixed hub
Vibration energy absorbed → not transmitted to shelf
```

## Files in this folder

byu_orthoplanar_spring.stl
← original BYU geometry, used as reference throughout

The original spring is 144.8mm in diameter. We scale it to 0.40× (57.9mm OD) for use in the puck — see 04_compliant_puck for full scale analysis.