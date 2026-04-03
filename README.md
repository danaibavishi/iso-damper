**3D Printable · PETG · Open Source · Compliant Mechanism**

# Vibration Isolation Damper for Bookshelf Speakers

Stop your speaker from vibrating your shelf. Built around a real BYU orthoplanar spring — engineered from scratch in Python, iterated through TinkerCAD, tuned for the Sonos Era 100.

| pucks to print | spring scale | deflection | filament cost | design phases |
| --- | --- | --- | --- | --- |
| 3× | 0.40× | 0.63mm | ~$2 | 4 |

## Why does this exist?

The Sonos Era 100 sits directly on your shelf. At volume, cabinet vibrations travel through the shelf into the wall — and back into the bass as muddy resonance. IsoAcoustics pads fix this but cost $50–100. This builds the same thing for the price of a coffee's worth of PETG.

> The key insight: Vibration travels through rigid contact. Break that path with a compliant spring and it has nowhere to go — that's what an orthoplanar spring does.

## The final design

### Print this file — 3 copies
`04_compliant_puck/compliant_puck_FINAL.stl`
*One monolithic piece. No assembly, no hardware. Print 3, place in a triangle under the speaker.*

**Outer diameter:** 57.9 mm  
**Total height:** 24.5 mm  
**Spring arms:** 3× BYU radial legs — 2.0mm wide × 1.52mm thick  
**Arm angles:** 38° / 158° / 278° — matched from BYU STL  
**Deflection:** 0.63mm under 733g load  
**Max stress:** 45 MPa — just under PETG yield (~50 MPa)  
**Pedestal:** 10mm hollow cylinder + 7mm hemisphere dome base  
**Top surface:** 1mm flat solid disc  

*Figure 1 — Compliant puck cross-section · monolithic PETG print*

## Finding the right scale

The BYU spring is 144.8mm across — too large for 3 to fit under the speaker. Scale it down too far and the arms snap. The constraint: 0.2mm layers means arms need at least 1.2mm thickness, setting the minimum spring size.

*Figure 2 — BYU spring anatomy and scale selection*

## How we got here

Four phases, multiple iterations each — every version fixing something the last one got wrong.

1. **Isolation pad** — Simple nub-footed pads. Added BYU spring mechanism. Two versions before realising the spring needed to be structural, not decorative.
2. **Two-piece stand** — Inspired by iRetroLab crystal stands. Tapered pedestal + oval cylinder, spring sandwiched between. Three iterations fixed the connection geometry.
3. **Unified puck** — One monolithic print. Ten iterations: tapered → hollow → domed pedestal. Spring tuned to 0.40× BYU scale.
4. **Tray** — Six iterations. Final: 2mm oval plate (120×130.5mm), 3 pucks embedded below, 1mm raised border to register the speaker.

![Final tray — underside showing 3 pucks with dome feet](images/tray_final_underside.png)

## The engineering

Each arm is a fixed-guided beam — both ends locked, loaded vertically. Two equations govern everything:

```
δ = F·L³ / (12·E·I) // deflection under load
σ = 6·F·L / (w·t²) // max stress at fixed ends
```

At 0.40× with PETG (E = 1700 MPa): each arm carries 2.4N, deflects 0.63mm — just under the 50 MPa yield point.

> Why 0.40× and not smaller? Below 0.35× the arms exceed PETG yield — permanent deformation. 0.40× is the minimum viable scale at standard 0.2mm layer settings.

## What's in the repo

```
01_concept/           BYU spring STL + anatomy diagram
02_isolation_pad/     nub pad → compliant isolator iterations
03_stand_two_piece/   pedestal + cylinder tray · SCADs
04_compliant_puck/
  compliant_puck_FINAL.stl  ← print this × 3
  iterations/                  v1–v7 intermediate designs
05_tray/
  tray_FINAL.stl              ← oval plate + 3 embedded pucks
  iterations/                  tray v1–v5 exploration
docs/                 engineering_notes.md
images/               all TinkerCAD + slicer screenshots
```

## References

- **BYU Compliant Mechanisms Research Group** — Source of the orthoplanar spring design and STL files
- **Parise, Howell, Magleby** — *Ortho-Planar Linear-Motion Springs*, Mechanism and Machine Theory, Vol. 36, 2001
- **US Patent 6,983,924** — Compliant Ortho-Planar Linear Motion Spring
- **IsoAcoustics** — Commercial isolation reference — same principle, $50–100 price point
- **iRetroLab crystal stand** — Aesthetic inspiration — visible spring mechanism