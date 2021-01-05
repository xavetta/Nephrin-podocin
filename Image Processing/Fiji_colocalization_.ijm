input = getDirectory("current") + "coloc_sample/"
list = getFileList(input)
function action(input, filename) {
		path = input + filename;
        open(path);
        run("Set Measurements...", "area limit redirect=None decimal=2"); 
		run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel global"); 
		run("Colors...", "foreground=white background=black selection=magenta");  
		run("Stack to Images");
       	
       	selectImage(1); 
       	p3 = "C3_"+filename;
		rename(p3); 
		runMacro("Blue LUT_");
		selectImage(2); 
		p1 = "C1_"+filename;
		rename(p1);
		runMacro("Red LUT_");
		selectImage(3);
		p2 = "C2_"+filename;
		rename(p2);
		runMacro("Green LUT_");
		radius = 50.0; 
	
	// Generate a Channel 1 image with subtracted background 
		selectImage(p1); 
		setAutoThreshold("Triangle dark");
		run("Create Selection"); 
		run("Make Inverse"); 
			getStatistics(area, mean); 
				C1bg=mean; 
			run("Select None"); 
			run("Subtract...", "value="+C1bg); 
		setAutoThreshold("Triangle dark"); 
		run("Create Selection"); 
		setBackgroundColor(0, 0, 0); 
		run("Clear Outside");
		run("8-bit");
		run("Enhance Contrast...", "equalize"); 
		
	// Generate a Channel 2 image with subtracted background 
		selectImage(p2); 
		setAutoThreshold("Triangle dark"); 
		run("Create Selection"); 
		run("Make Inverse"); 
			getStatistics(area, mean); 
				C2bg=mean; 
			run("Select None"); 
			run("Subtract...", "value="+C2bg); 
		setAutoThreshold("Triangle dark"); 
		run("Create Selection"); 
		setBackgroundColor(0, 0, 0); 
		run("Clear Outside"); 
		run("8-bit");
		run("Enhance Contrast...", "equalize"); 
		
	// Generate a Channel 3 image with subtracted background 
		selectImage(p3); 
		setAutoThreshold("Triangle dark"); 
		run("Create Selection"); 
		run("Make Inverse"); 
			getStatistics(area, mean); 
				C3bg=mean; 
			run("Select None"); 
			run("Subtract...", "value="+C3bg); 
		setAutoThreshold("Triangle dark"); 
		run("Create Selection"); 
		setBackgroundColor(0, 0, 0); 
		run("Clear Outside"); 
		run("8-bit");
		run("Enhance Contrast...", "equalize");
		
		
	//Merge
		run("Merge Channels...","c1="+p1+" c2="+p2+" c3="+p3+" keep");
		rename("RGB");
		
		
	//Coloc 2
		run("Coloc 2", "channel_1="+p1+" channel_2="+p2+" roi_or_mask=<None> threshold_regression=Bisection");

		
	//Montage-ok
		selectImage(p1);
		run("RGB Color");
		selectImage(p2);
		run("RGB Color");
		selectImage(p3);
		run("RGB Color");
		run("Concatenate...", "  title=[Stack] image1="+p1+" image2="+p2+" image3="+p3+" image4=[RGB]");
		run("Make Montage...", "columns=2 rows=2 scale=1 border=3 font=12");
		rename("Montage");
		saveAs("jpeg",input+getTitle()+"_"+filename);
		close();
		selectImage("Stack");
		close();
}

setBatchMode(true);
for (i = 0; i < list.length; i++)
	action(input, list[i]);
setBatchMode(false);