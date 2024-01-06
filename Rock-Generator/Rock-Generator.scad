scale=30;
r_facets = rands(5,10,1)[0];
facets=r_facets;
r_height = rands(2,4,1)[0];
height=r_height;  
r_plane = rands(0,10,1)[0];
plane=r_plane;
r_top = rands(1,2,1)[0];
top=1;
r_cut = rands(0,20,1)[0];
cut=r_cut;
half=scale/1.5;
$fn=facets;

// Rock Generator
translate([0,0,-10]){
    difference(){
// Base model   
        union(){
            translate([0,0,0])
                cylinder(h=scale*height-cut,d1=scale,d2=half*3);
            translate([0,0,0+scale*height-cut])
                cylinder(h=(half*3)/top,d1=half*3,d2=plane);
        }
// Model which should be removed from the base model
        scale([0.8,0.8,0.95]){
            union(){
                translate([0,0,0])
                    cylinder(h=scale*height-cut,d1=scale,d2=half*3);
                translate([0,0,0+scale*height-cut])
                    cylinder(h=(half*3)/top,d1=half*3,d2=plane);
            }   
        }    
    }
}

// Socket
translate([50,0,-5]){
    difference(){
        cylinder(h=10,d1=scale*1.3,d2=scale*1.3, center= true);
            union(){
                translate([0,0,0])
                    cylinder(h=scale*height-cut,d1=scale,d2=half*3);
                translate([0,0,0+scale*height-cut])
                    cylinder(h=(half*3)/top,d1=half*3,d2=plane);
            }
    }
}
