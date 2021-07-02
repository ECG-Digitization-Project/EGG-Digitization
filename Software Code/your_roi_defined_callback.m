function your_roi_defined_callback(h,e)
            [mask, labels, n] = roiwindow.getROIData;
            delete(roiwindow); 
end