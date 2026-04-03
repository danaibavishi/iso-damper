// ============================================================
//  PIECE 1 — Tapered Hollow Pedestal
//  Sonos Era 100 Isolation Stand
//  Material: PETG — 240°C nozzle, 75°C bed
//  Print upright, no supports needed
// ============================================================

$fn = 128;

// ── Spring interface dimensions (from STL analysis) ──────────
SPRING_HUB_R     = 8.7;    // scaled hub radius (fits into spring centre)
PIN_R            = SPRING_HUB_R - 0.2;  // 0.2mm press-fit clearance
PIN_H            = 4.0;    // pin height that inserts into spring hub

// ── Pedestal body ─────────────────────────────────────────────
PED_H            = 50.0;   // 5cm tall
PED_R_TOP        = 18.0;   // narrow top (near spring)
PED_R_BOT        = 38.0;   // wide base
WALL             = 8.0;    // 8mm thick walls (hollow cone)

// ── Base disc ─────────────────────────────────────────────────
BASE_R           = PED_R_BOT + 6.0;  // slightly wider than cone base
BASE_H           = 3.0;

// ── Assembly ──────────────────────────────────────────────────
union() {

    // 1. Base disc — sits on shelf
    cylinder(r=BASE_R, h=BASE_H);

    // 2. Hollow tapered cone
    //    Outer cone minus inner (offset by WALL)
    difference() {
        // Outer cone
        translate([0, 0, BASE_H])
            cylinder(r1=PED_R_BOT, r2=PED_R_TOP, h=PED_H);

        // Inner hollow — same taper, wall inset by WALL
        translate([0, 0, BASE_H - 0.01])
            cylinder(
                r1 = PED_R_BOT - WALL,
                r2 = max(PED_R_TOP - WALL, 2.0),
                h  = PED_H + 0.02
            );
    }

    // 3. Press-fit pin at top — inserts into spring centre hub
    translate([0, 0, BASE_H + PED_H])
        cylinder(r=PIN_R, h=PIN_H);
}

// ── PRINT NOTES ───────────────────────────────────────────────
// Orientation : upright (base on build plate)
// Supports    : none needed
// Infill      : 20% gyroid for base disc, walls are solid by geometry
// PETG        : 240°C / 75°C bed / 3 perimeters
// After print : press pin up into spring centre hub
