## Prediction of PNS in Siemens MRI systems (SAFE model)

Filip Szczepankiewicz and Thomas Witzel  
  
Brigham and Women's Hospital, MA, Boston  
Harvard Medical School, MA, Boston  
Massachusetts General Hospital, MA, Boston  

The main SAFE-model was written by Thomas Witzel
Remaining code was written by Filip Szczepankiewicz (filip.szczepankiewicz@med.lu.se)

### Scope
This code aims to use the SAFE model to predict PNS in Siemens MRI systems based on any given hardware configuration. This code is not verified or validated in any way, and results should be interpreted with care!

**Note** that the characterization of the hardware is **not part of the open source code**! These
parameters must be supplied by the user (as described below) or be requested on the [IDEA forum](https://www.mr-idea.com/communities/idea/results.aspx?k=PNS%20prediction%20in%20Matlab%20using%20the%20SAFE%20model).

### How to extract system specific SAFE model parameters
Paramters that are relevant to the SAFE model prediction are found in 'measperm' files, which can be found on the scanner host or in the IDEA simuation environment ```(...\n4\pkg\MrServers\MrMeasSrv\Config\InitMeas\)```. These ```.asc``` files have names starting with ```MP_GPA_```, the rest of the file name depends on the gradient system. The gradient system name can be found by calling ```imprint``` at the scanner console. More details are provided via the [IDEA forum](https://www.mr-idea.com/communities/idea/results.aspx?k=PNS%20prediction%20in%20Matlab%20using%20the%20SAFE%20model).

In the framework provided herein, the relevant parameters are mapped to the Matlab structure as follows:
```'flgSWDStimulationLimit*'``` to ```'stim_limit'```  
```'flgSWDStimulationThreshold*'``` to ```'stim_thresh'```  
```'flgSWDTau*[*]'``` to ```'tau*'```  
```'flgSWDAX[*]'``` to ```'a*'```  

You can transfer them manually and check if you filled in the numbers correctly by calling:  
```safe_hw_verify(hardware_structure)```  

### Reference
The PNS prediction is based on the SAFE model by Herbank and Gebhardt (ISMRM abstract):  
[SAFE-Model - A New Method for Predicting Peripheral Nerve Stimulations in MRI
by Franz X. Herbank and Matthias Gebhardt. Abstract No 2007. 
Proc. Intl. Soc. Mag. Res. Med. 8, 2000, Denver, Colorado, USA](https://cds.ismrm.org/ismrm-2000/PDF7/2007.PDF)

If you use these resources, please consider citing:  
[_F. Szczepankiewicz, C-F. Westin, M. Nilsson. Gradient waveform design for tensor-valued encoding in diffusion MRI._ Journal of Neuroscience Methods 348, 2021.](https://www.sciencedirect.com/science/article/pii/S0165027020304301)


### Example figure
![Example of predicted PNS in arbitrary gradient waveform.](safe_example_figure.jpg)

The example gradient waveform yields spherical diffusion encoding, and taken by itself (ignoring the imaging gradients and the readout) it causes approximately 80% of the allowed PNS, i.e. we predict that this waveform does not exceed the PNS limit. However, it should be analyzed together with the EPI waveform to detect potential interactions between the two. 

### Related resources can be found at the [FWF sequence GIT repository](https://github.com/filip-szczepankiewicz/fwf_seq_resources)
