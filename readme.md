This repository is intended to host the formal definitions of the data products of the [LOFAR2.0 telescope.](https://www.lofar.eu) These definitions are created and maintained by the LOFAR2.0 data working group.


#### Contributing and editing
The LaTeX documents in this github repository are synced from an existing Overleaf project. Please add new documents and edit them on Overleaf only. You can commit your changes to github via (on Overleaf): Menu -> github -> Commit to github. Access to the Overleaf project needs to be requested from Marcel Loose, Sander ter Veen and Henrik Edler (subject to change).

#### Creating a new document
To create your new document, you can start from the LOFAR2-DDD-XXX-template.tex or LOFAR2-DDD-XXX-EXAMPLE.tex document. Create a new document and then copy the contents in this document. Then fill in the content. 

The different sections are also described at https://support.astron.nl/confluence/spaces/L2DWG/pages/275842318/Data+Product+Definition+Structure . You can look at the example document or other documents for inspiration.

The common_tables are shared between all documents. Note that editing these should thus be coordinated within the working group.

You can add figures in the figures directory. Please ensure a unique name to not change other documents.

You can add other files to include in the includes directory. They can be included with \input includes/filename 
This works without .tex in the filename.

TODO: Looking into a machine readable table format that can also be used by tex


#### Contributors:
The LOFAR 2.0 Data Working Group
Sander ter Veen
(add your name if you contributed)

