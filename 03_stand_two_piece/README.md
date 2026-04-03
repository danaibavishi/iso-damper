**Phase 2 · Press-fit Assembly**

# 03 — Two-Piece Stand

Inspired by iRetroLab crystal glass stands — a visible spring mechanism sandwiched between two press-fit pieces. Three pedestal iterations to get the geometry right.

| pieces | pedestal versions | press-fit clearance |
| --- | --- | --- |
| --- | --- | --- |
| 2 | 3 | 0.2mm |

## Assembly concept

Piece 1 (pedestal) press-fits into the spring centre hub from below. Piece 2 (cylinder + tray) grips the spring outer ring from above. The spring floats between them — no glue, no hardware.

Two-piece stand — disconnected in TinkerCAD showing the separate components

> Design reference: iRetroLab crystal stands use a similar principle — a transparent column with visible spring mechanism, aluminium tray on top, conical base below.

## Pedestal iterations

- **[v1 — rejected]** — **Hollow tapered cone + base ring** — Centre hub disconnected from cone walls — visible gap.
- **[v2 — better]** — **Solid top cap added** — Bridges walls to hub. Base ring still present.
- **[v3 — final]** — **Base ring removed** — Cone sits directly on shelf. Clean minimal form.

### Cylinder tray — 3 versions

- **[v1 — too deep]** — **18mm collar** — Much longer than spring height — wastes material.
- **[v2 — better]** — **10mm collar** — Matched to spring height + small overlap.
- **[v3 — final]** — **Spring height + 2mm** — 0.2mm press-fit clearance. Tight and clean.

## Why we moved on

The oval speaker footprint vs circular spring created a shape mismatch. Making the spring oval requires non-uniform scaling (82.9% X, 90.1% Y) which distorts the arm geometry unevenly — different stiffness on each arm, uneven load distribution.

> Solution: Collapse both pieces into a single monolithic print with the spring geometry built in at the correct scale from the start — no oval distortion needed.

## Files in this folder

pedestal_FINAL.stl
piece 1 — tapered cone, final version
cylinder_tray_FINAL.stl
piece 2 — oval cylinder + tray
piece1_pedestal.scad
OpenSCAD source for pedestal
piece2_cylinder_tray.scad
OpenSCAD source for cylinder tray