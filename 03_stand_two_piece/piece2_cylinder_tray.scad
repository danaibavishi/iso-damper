// ============================================================
//  PIECE 2 — Oval Cylinder + Tray
//  Sonos Era 100 Isolation Stand
//  Material: PETG — 240°C nozzle, 75°C bed
//  Print upside-down (tray face on build plate), no supports
// ============================================================

$fn = 128;

// ── Speaker base footprint (Era 100) ─────────────────────────
SPK_W            = 120.0;   // width
SPK_D            = 130.5;   // depth

// ── Oval cylinder dimensions ──────────────────────────────────
// Outer ellipse matches speaker base exactly
CYL_A            = SPK_W / 2;        // semi-axis X = 60mm
CYL_B            = SPK_D / 2;        // semi-axis Y = 65.25mm
CYL_WALL         = 5.0;              // 5mm wall thickness
CYL_H            = 30.0;             // 3cm tall

// Inner ellipse (hollow interior)
CYL_A_IN         = CYL_A - CYL_WALL;
CYL_B_IN         = CYL_B - CYL_WALL;

// ── Tray plate ────────────────────────────────────────────────
TRAY_THICK       = 2.0;    // 2mm flat top plate
LIP_H            = 2.0;    // raised lip height
LIP_T            = 1.0;    // lip thickness

// ── Spring outer ring interface (press-fit collar) ────────────
// Outer ring of scaled spring: inner r ~53mm oval, outer r ~60/65mm
// Collar sits at bottom of cylinder, grips spring outer ring
COLLAR_H         = 5.0;    // how deep the collar grips the spring
COLLAR_EXTRA     = 1.5;    // collar is slightly thicker for grip

// ── Scaled spring reference (for sizing collar) ───────────────
// Original spring outer ring: r 64–72.4mm circular
// Scaled to oval 120x130.5: outer edge IS the cylinder outer wall
// Collar inner matches spring outer ring inner edge
COLLAR_A_IN      = CYL_A_IN - COLLAR_EXTRA;
COLLAR_B_IN      = CYL_B_IN - COLLAR_EXTRA;

// ── Helper: oval prism via scale on cylinder ──────────────────
module oval_solid(a, b, h) {
    scale([1, b/a, 1]) cylinder(r=a, h=h);
}

module oval_shell(a_out, b_out, a_in, b_in, h) {
    difference() {
        oval_solid(a_out, b_out, h);
        translate([0, 0, -0.01])
            oval_solid(a_in, b_in, h + 0.02);
    }
}

// ── Tray Z reference ──────────────────────────────────────────
// Tray plate at top: z = CYL_H to CYL_H + TRAY_THICK
// Lip above that:    z = CYL_H + TRAY_THICK to CYL_H + TRAY_THICK + LIP_H

union() {

    // 1. Oval cylinder walls
    oval_shell(CYL_A, CYL_B, CYL_A_IN, CYL_B_IN, CYL_H);

    // 2. Thickened press-fit collar at bottom (grips spring outer ring)
    oval_shell(CYL_A, CYL_B, COLLAR_A_IN, COLLAR_B_IN, COLLAR_H);

    // 3. Tray top plate — solid oval disc
    translate([0, 0, CYL_H])
        oval_solid(CYL_A, CYL_B, TRAY_THICK);

    // 4. Raised perimeter lip on tray
    //    Outer lip edge = tray outer edge
    //    Inner lip edge = tray outer - LIP_T
    translate([0, 0, CYL_H + TRAY_THICK])
        oval_shell(
            CYL_A,        CYL_B,
            CYL_A - LIP_T, CYL_B - LIP_T,
            LIP_H
        );
}

// ── PRINT NOTES ───────────────────────────────────────────────
// Orientation : UPSIDE DOWN (tray plate on build plate)
//               This puts the collar at the top during printing
//               and avoids overhangs on the tray underside
// Supports    : none needed in this orientation
// Infill      : 15% gyroid
// PETG        : 240°C / 75°C bed / 3 perimeters
// After print : press collar down over spring outer ring
//               Spring sits inside collar, gripped by friction
