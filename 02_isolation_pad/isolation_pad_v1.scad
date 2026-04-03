// Sonos Era 100 Isolation Pad
// Material: PETG recommended
// Speaker footprint: 120mm W x 130.5mm D
// Pad adds 2mm margin on each side for easy placement

// --- Parameters ---
pad_width   = 124;   // mm (120 + 2mm margin each side)
pad_depth   = 134.5; // mm (130.5 + 2mm margin each side)
pad_height  = 6;     // mm base thickness

// Nub (isolation foot) parameters
nub_diameter  = 14;  // mm
nub_height    = 5;   // mm
nub_inset     = 12;  // mm from each corner (center of nub)
nub_fn        = 32;  // smoothness

// Corner radius for aesthetics
corner_radius = 6;   // mm

// --- Main Body (rounded rectangle base) ---
module rounded_rect(w, d, h, r) {
    hull() {
        translate([ r,  r, 0]) cylinder(r=r, h=h, $fn=nub_fn);
        translate([w-r, r, 0]) cylinder(r=r, h=h, $fn=nub_fn);
        translate([ r, d-r, 0]) cylinder(r=r, h=h, $fn=nub_fn);
        translate([w-r, d-r, 0]) cylinder(r=r, h=h, $fn=nub_fn);
    }
}

// --- Nub (vibration isolation foot) ---
// Tapered cylinder for better grip and isolation
module nub() {
    cylinder(d1=nub_diameter, d2=nub_diameter*0.7, h=nub_height, $fn=nub_fn);
}

// --- Assemble ---
union() {
    // Base pad
    rounded_rect(pad_width, pad_depth, pad_height, corner_radius);

    // Four corner nubs on the bottom (printed upside down, so they appear on top in model)
    // When printing: orient so nubs face DOWN onto the shelf surface
    translate([nub_inset,            nub_inset,            pad_height]) nub();
    translate([pad_width - nub_inset, nub_inset,            pad_height]) nub();
    translate([nub_inset,            pad_depth - nub_inset, pad_height]) nub();
    translate([pad_width - nub_inset, pad_depth - nub_inset, pad_height]) nub();
}

// --- PRINT NOTES (read before slicing) ---
// 1. Print UPSIDE DOWN (nubs facing the build plate) so nubs face DOWN in use
// 2. PETG settings: 240°C nozzle, 70-80°C bed, 3 walls, 20-30% infill
// 3. No supports needed
// 4. Print 2 copies — one per speaker
// 5. The nubs contact the shelf; the flat top supports the speaker
// 6. Optional: press small rubber O-rings or silicone bumper stickers
//    onto the nub tips for extra damping
