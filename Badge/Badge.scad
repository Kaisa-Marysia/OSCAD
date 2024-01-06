string = "Name"; // Name which should be printed
logo = "Logo.svg"; // Path To File
logopos = -50; // Logoposition
center = true; // [true/false]

font = "Ubuntu:style=bold"; // Font name and style
letter_size = 50;
height = 10;
offset = 20;
spacing = 0.9;
current_color = "ALL";
hi_color = "#3FFF21";
lo_color = "#FB48C4";

module multicolor(color) {
    if (current_color != "ALL" && current_color != color) { 
    } else {
        color(color)
        children();
    }        
}

union(){
   translate([logopos,-5,0]) {
        union(){
            multicolor(lo_color) resize([0,0,5]) translate([0,0,-0.8]) { 
               linear_extrude(1) offset(offset*1.5) resize([letter_size*2,letter_size*2,0]) {
                import(logo, center=center);
                }
            }
        translate([0,0,0.1]){ 
            multicolor(hi_color) linear_extrude(height) resize([letter_size*2,letter_size*2,0]) {
                import(logo, center=center);
            }
        }
        }
    }
}

union(){
    multicolor(lo_color) resize([0,0,5]) translate([0,0,-0.8]) { 
        linear_extrude(1) offset(offset*1.5) text(string, size = letter_size, font = font, $fn = 64, spacing = spacing);
    }
 translate([0,0,0.1]){ 
    multicolor(hi_color) linear_extrude(height) text(string, size = letter_size, font = font, $fn = 64, spacing = spacing);
    }
}
translate([0,0,0.1]){ 
    multicolor(hi_color) difference(){
       union(){
            linear_extrude(height) offset(offset*1.5) text(string, size = letter_size, font = font, $fn = 64, spacing = spacing);
        
        translate([logopos,-5,0]) {    
            linear_extrude(height) offset(offset*1.5) resize([letter_size*2,letter_size*2,0]) {
                import(logo, center=center);
                }
            }
        }
        
       multicolor(hi_color) union(){
            linear_extrude(height*1.1) offset(offset) text(string, size = letter_size, font = font, $fn = 64, spacing = spacing);
            translate([logopos,-5,0]) {    
                linear_extrude(height*1.1) offset(offset) resize([letter_size*2,letter_size*2,0]) {
                    import(logo, center=center);
                }
            }
        }
    }
}
