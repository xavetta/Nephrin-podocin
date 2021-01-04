# Codes_for_Role_of_podocin
Codes used for the image processing and data analyzis in the publication "Podocin regulates the size of the glomerular pore".

# Image processing
For image processing, we determined the Pearson’s correlation coefficient from selected and cropped images, that displayed only one cell. 
The algorithm is based on the work of Moser et al. (2016). 
The macro uses two channels to determine colocalization (termed C1 and C2), and a third that marks the cell membrane (C3).
The background is subtracted after thresholding from each channel with triangle dark algorithm; outside the thresholded objects the image is cleared.
Following this, the channels are equalized to the intensity range so that the following thresholding finds equal conditions for both channels.
The Pearson's correlation coefficient is calculated by Coloc2 plugin. (description based on Moser et al. 2016)
The resulting Log.txt file is processed with a Python algorithm.

# Data analyzis and visualization
