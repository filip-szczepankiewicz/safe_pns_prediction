## Prediction of PNS in Siemens MRI systems (SAFE model)

Filip Szczepankiewicz and Thomas Witzel  
Brigham and Women's Hospital, MA, Boston  
Harvard Medical School, MA, Boston  
Massachusetts General Hospital, MA, Boston  

The main SAFE-model was coded by Thomas Witzel (twitzel@mgh.harvard.edu)  
Remaining code was written by Filip Szczepankiewicz (fszczepankiewicz@bwh.harvard.edu)

### Scope
This code aims to use the SAFE model to predict PNS in Siemens MRI systems based on any given hardware configuration. This code is not verified or validated in any way, and results should be interpreted with care!

NOTE: The characterization of the hardware IS NOT PART OF THIS CODE! These
parameters must be supplied by the user or be requested on the [IDEA forum](https://www.mr-idea.com/communities/idea/results.aspx?k=PNS%20prediction%20in%20Matlab%20using%20the%20SAFE%20model) or by [email](mailto:fszczepankiewicz@bwh.harvard.edu).

Contact either of the authors, or go to the [IDEA forum](https://www.mr-idea.com/communities/idea/results.aspx?k=PNS%20prediction%20in%20Matlab%20using%20the%20SAFE%20model), for more information.

### Reference
The PNS model is based on the SAFE-abstract:  
[SAFE-Model - A New Method for Predicting Peripheral Nerve Stimulations in MRI
by Franz X. Herbank and Matthias Gebhardt. Abstract No 2007. 
Proc. Intl. Soc. Mag. Res. Med. 8, 2000, Denver, Colorado, USA](https://cds.ismrm.org/ismrm-2000/PDF7/2007.PDF)

If you use these resources, please also consider citing:  
[Szczepankiewicz F, Westin, C-F, Nilsson M. Maxwell-compensated design of asymmetric gradient waveforms for tensor-valued diffusion encoding. Magn Reson Med. 2019;00:1–14. https://doi.org/10.1002/mrm.27828](https://onlinelibrary.wiley.com/doi/abs/10.1002/mrm.27828)


### Example predicted PNS from STE gradient waveform
![Example of predicted PNS in arbitrary gradient waveform.](safe_example_figure.jpg)