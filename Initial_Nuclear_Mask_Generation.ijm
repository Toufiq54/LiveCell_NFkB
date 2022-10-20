// This script is written to generate the initial nuclear mask from the SPY650-DNA or Sir-DNA nuclear dye.
// Give the destination directory --->
//---------------------------------------------------------------------------------------------------------------------
dest_dir = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)/images/s";
// --------------------------------------------------------------------------------------------------------------------
// Give the input filte directory --->
input_dir = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)/";
// --------------------------------------------------------------------------------------------------------------------
num_stage = 40;


for (i=1; i<=num_stage; i++){
	Rawfilename = dest_dir + i + "-3.tif";
	// Rawfilename = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/06.02.2021_Old_primary_microglia_106w_M_DKin_TNFalpha/images/s" + i + "-3.tif";
	open(Rawfilename);
	//run("Mean 3D...", "x=2 y=2 z=2");
	//run("Enhance Contrast...", "saturated=0.3 normalize process_all");
	//run("Make Binary", "method=IsoData background=Default calculate black");
	//run("Remove Outliers...", "radius=5 threshold=50 which=Bright stack");
	run("Median...", "radius=4 stack");
	//run("Enhance Contrast...", "saturated=0.2 normalize process_all");
	run("Make Binary", "method=Li background=Default calculate black");

	//run("Make Binary", "method=Intermodes background=Default calculate black list");
	OutputFilename = input_dir + "/images/Labels_s" + i + ".tif";
   	// OutputFilename = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/06.02.2021_Old_primary_microglia_106w_M_DKin_TNFalpha/images/Labels_s" + i + ".tif";
	saveAs("Tiff", OutputFilename);
	run("Close");
	//selectWindow("Labels_s1.gif");

}
