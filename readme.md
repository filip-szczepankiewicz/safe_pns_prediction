This code aims to use the SAFE-model to predict PNS in Siemens MRI systems
based on any given hardware configuration. This code is not verified or 
validated in any way, and results should be interpreted with care.

NOTE: The characterization of the hardware IS NOT PART OF THIS CODE! These
parameters must be supplied by the user.

The PNS model is based on the SAFE-abstract:
SAFE-Model - A New Method for Predicting Peripheral Nerve Stimulations in MRI
by Franz X. Herbank and Matthias Gebhardt. Abstract No 2007. 
Proc. Intl. Soc. Mag. Res. Med. 8, 2000, Denver, Colorado, USA
https://cds.ismrm.org/ismrm-2000/PDF7/2007.PDF

The main SAFE-model was coded by Thomas Witzel @ Martinos Center, MGH, HMS, Boston, MA, USA.
twitzel@mgh.harvard.edu

Remaining code was written by Filip Szczepankiewicz @ LMI, BWH, HMS, Boston, MA, USA.
fszczepankiewicz@bwh.harvard.edu

Contact either of the authors, or go to the [IDEA forum](https://www.mr-idea.com/communities/idea/Lists/Discussion/Flat.aspx?RootFolder=%2Fcommunities%2Fidea%2FLists%2FDiscussion%2FPNS%20prediction%20in%20Matlab%20using%20the%20SAFE%20model&FolderCTID=0x012002005635B5AD41B3E240BA0B9023C8B21F60), for more information.


![Example of predicted PNS in arbitrary gradient waveform.](safe_example_figure.jpg)

