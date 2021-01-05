macro "Green LUT" {
    reds = newArray(256); 
    greens = newArray(256); 
    blues = newArray(256);
    for (i=0; i<256; i++)
        greens[i] = i;
    setLut(reds, greens, blues);
}