// Give the destination directory --->
//---------------------------------------------------------------------------------------------------------------------
dest_dir = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)/images/s";
// --------------------------------------------------------------------------------------------------------------------
// Give the input filte directory --->
input_dir = "E:/rahmans4/EXPERIMENTAL DATA/NIA_Experiment/08-26-2021_primaryBMDM_LPS_Flagelin_CpG_Poly(I_C)/";
// --------------------------------------------------------------------------------------------------------------------
num_stage = 40;

// Give the file name --->	
// ------------------------------------------------------------------------------------
FName = "Young_Old_BMDM_LPSultra_Flagellin_CpG_Poly(IC)_2021_08_26__14_34_10-Create Image Subset-01-Scene-";
// ------------------------------------------------------------------------------------
FName1 = FName + "0"; 

for (i=1; i<=9; i++){


Fullname = input_dir + FName1 + i + ".czi";

run("Bio-Formats Importer", "open=Fullname autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");

run("Duplicate...", "duplicate channels=1");

DestFileNameString1 = dest_dir + i + "-1" + ".TIF";
saveAs("Tiff", DestFileNameString1);
close();


//selectWindow("Primary_Old_BMDM_GFP_relA_mScarlet_cRel_TLR_ligands_2020_09_03-Scene-01.czi");
run("Duplicate...", "duplicate channels=2");

DestFileNameString1 = dest_dir + i + "-2" + ".TIF";
saveAs("Tiff", DestFileNameString1);
close();

//selectWindow("Primary_Old_BMDM_GFP_relA_mScarlet_cRel_TLR_ligands_2020_09_03-Scene-01.czi");
run("Duplicate...", "duplicate channels=3");

DestFileNameString1 = dest_dir + i + "-3" + ".TIF";
saveAs("Tiff", DestFileNameString1);
close();
close();

}

for (i=10; i<=num_stage; i++){


Fullname = input_dir + FName + i + ".czi";

run("Bio-Formats Importer", "open=Fullname autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");

run("Duplicate...", "duplicate channels=1");

DestFileNameString1 = dest_dir + i + "-1" + ".TIF";
saveAs("Tiff", DestFileNameString1);
close();


//selectWindow("Primary_Old_BMDM_GFP_relA_mScarlet_cRel_TLR_ligands_2020_09_03-Scene-01.czi");
run("Duplicate...", "duplicate channels=2");

DestFileNameString1 = dest_dir + i + "-2" + ".TIF";
saveAs("Tiff", DestFileNameString1);
close();

//selectWindow("Primary_Old_BMDM_GFP_relA_mScarlet_cRel_TLR_ligands_2020_09_03-Scene-01.czi");
run("Duplicate...", "duplicate channels=3");

DestFileNameString1 = dest_dir + i + "-3" + ".TIF";
saveAs("Tiff", DestFileNameString1);
close();
close();

}