// Friday June 13 
// Jessica Snyder 
// Copy a step mold 

// Define step model parameters in mm
x = 30;
y = 20;
z = 10;
t = 5;

// set the number of steps 
steps = 4;

// outer box dimensions 
t1 = t; 
x2 = x;
y2 = y; 
z2 = z; 

// inner box dimensions
x1 = x2 - 2*t1;
y1 = y2 - 2*t1; 
z1 = z2;


// subtract the inner steps from the outsteps to create void 
difference(){
    
    outersteps(); 
    innersteps();
    
    }




// Model the innersteps 
module innersteps(){
    // create a loop to make the steps 
    for (i = [0:steps]){
        
        // create the box 
        // set the color as an [red, green, blue, opacity]. Each value has a minimum of 0 and maximum of 1  
        translate([-x1/2, (i-1)*y2+t1, 0])
        color([.5, .2, .2, .8])
        cube([x1, y1*(steps-i+1), i*z1]);
        
    }
    }

// Model the outersteps 
module outersteps(){
    
    // create a loop to make the steps 
    for (i = [1:steps]){
        
        // create the box 
        // set the color as an [red, green, blue, opacity]. Each value has a minimum of 0 and maximum of 1  
        translate([-x2/2, (i-1)*y2, 0])
        color([.2, .4, .5, .8])
        cube([x2, y2, i*z2+t1]);
     
        }
    }