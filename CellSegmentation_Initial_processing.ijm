// This script is written to generate the initial Cell segmentation based on GFP or Scarlet signal.
// Give the destination directory --->
//---------------------------------------------------------------------------------------------------------------------
dest_dir = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)/images/";
// --------------------------------------------------------------------------------------------------------------------
// Give the input filte directory --->
input_dir = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)/";
// --------------------------------------------------------------------------------------------------------------------
// Give number of stage position --->
num_stage = 40;
//---------------------------------------------------------------------------------------------------------------------
// Give the light channel you want to use in segmentation
nameChannel = "-2.tif";


for (i=1; i<=40; i++){
	Rawfilename = dest_dir + "/s" + i + nameChannel;
	//Rawfilename = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/06.14.2021_Old_BMDM_8_TLR_ligands/images/s" + i + "-1.tif";
	open(Rawfilename);
	run("Median...", "radius=2 stack");
	// run("Enhance Contrast...", "saturated=0.3 normalize process_all");
	run("Make Binary", "method=Li background=Default calculate black");
	run("Remove Outliers...", "radius=5 threshold=50 which=Bright stack");

// run("Make Binary", "method=Intermodes background=Default calculate black list");
   OutputFilename = dest_dir + "/SegCell_s" + i + ".tif";
   //OutputFilename = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/PrimaryBMDM_GFP_RelA_mScarlet_cRel_two_LPS/images/SegCell_s" + i + ".tif";
saveAs("Tiff", OutputFilename);
run("Close");
//selectWindow("Labels_s1.gif");
}