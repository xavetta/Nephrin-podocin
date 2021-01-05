macro "Red LUT" {
    reds = newArray(256); 
    greens = newArray(256); 
    blues = newArray(256);
    for (i=0; i<256; i++)
        reds[i] = i;
    setLut(reds, greens, blues);
}