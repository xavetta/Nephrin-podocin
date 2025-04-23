# Role_of_podocin_trial
Codes used for the image processing and data visualization in the publication "Podocin regulates the size of the glomerular pore".

# Image processing
For image processing we used the Fiji distribution of ImageJ (https://imagej.net/Fiji.html).
We determined with an ImageJ macro the Pearson’s correlation coefficient from selected and cropped images, that displayed only one cell. 
The algorithm is based on the work of Moser et al. (2016). (https://doi.org/10.1002/biot.201600332)
The macro uses two channels to determine colocalization (termed C1 and C2), and a third that marks the cell membrane (C3).
The background is subtracted after thresholding from each channel with triangle dark algorithm; outside the thresholded objects the image is cleared.
Following this, the channels are normalized to the intensity range to compensate for potential differences in the intensity of the channels.
The Pearson's correlation coefficient is calculated by Coloc2 plugin. (description from Moser et al. 2016)
The resulting Log.txt file is processed with a Python algorithm.
(Images to run the macro can be find in the coloc_sample folder)

# Data analysis and visualization
All statistical analyses were performed by Statistica software version 13.5 (Tibco Software). Renal survival rates related to different NPHS2 variants were compared by paired logrank test (Python 3.9.18., JupyterLab 3.6.7, Lifelines 0.29.0) with Bonferroni correction. Figures were made in JupyterLab 3.6.7 version with Matplotlib 3.7.1 and Seaborn 0.13.2 (Python 3.9.18).
