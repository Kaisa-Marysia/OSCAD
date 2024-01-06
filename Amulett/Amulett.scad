RING = "ring1.svg"; // Outer Ring Graphic
SYM = "symbol1.svg"; // Inner Symbol Graphic

union() { // Union block for amulett and ring
  translate([0,0,0]) { // on which height should outer ring and symbol start
    scale([1,1,10]) { // scale and thinkness of outer ring and symbol
      color([0.5,0.5,0.5]) linear_extrude(1) {
        import(file = RING, center = true, dpi = 300); // import outer ring vector graphic with a dpi of 300 }
        import(file = SYM, center = true, dpi = 300); // import inner symbol vector graphic with a dpi of 300
      }
    }
  };

  color([0.2,0.2,0.2]) cylinder(h = 8, r = 128, center = true); // the base on which ring + symbol should be printed

  translate([-4,135,-4]){ // move ring for chain on top of amulett
    color([0.2,0.2,0.2]) difference() { // create a diference between two cylinders to a ring for a chain
      cylinder(h = 14, r = 20, center = false); // cylinder with filling
        translate([0,0,-1])
          cylinder(h=20,r=16, center= false); // cylinder which is cut off
    };
  };
};
