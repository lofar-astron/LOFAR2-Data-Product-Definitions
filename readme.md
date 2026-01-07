This repository is intended to host the formal definitions of the data products of the [LOFAR2.0 telescope.](https://www.lofar.eu) These definitions are created and maintained by the LOFAR2.0 data working group.


#### Contributing and editing
The LaTeX documents in this github repository are synced from an existing Overleaf project. Please add new documents and edit them on Overleaf only. You can commit your changes to github via (on Overleaf): Menu -> github -> Commit to github. Access to the Overleaf project needs to be requested from Marcel Loose, Sander ter Veen and Henrik Edler (subject to change).

#### Creating a new document
To create your new document, you can start from the LOFAR2-DDD-XXX-template.tex or LOFAR2-DDD-XXX-EXAMPLE.tex document. Create a new document and then copy the contents in this document. Then fill in the content. 

The different sections are also described at https://support.astron.nl/confluence/spaces/L2DWG/pages/275842318/Data+Product+Definition+Structure . You can look at the example document or other documents for inspiration.

The common_tables are shared between all documents. Note that editing these should thus be coordinated within the working group.

You can add figures in the figures directory. Please ensure a unique name to not change other documents.

To include other documents, please create a folder LOFAR2-DDD-XXX-includes. They can be included with \input includes/filename 
This works without .tex in the filename.

The tables containing the metadata should be saved as JSON so they can be used for development. An example is available in includes/test-json-input.json and test-json-table.tex and rendered with json-table-test.tex . To use these in your document, store the relevant table.tex and input.json in the include directory for your document, e.g. LOFAR2-DDD-XXX-includes and then include the table in the tex document "\input LOFAR2-DDD-XXX-includes/table-filename". Change \myJSONdata to a unique, relevant descriptor in the table.tex file. 
Ongoing issues:
- The JSON data currently is not actual JSON as is doesn't have a key
- Help page for the package: 
- Underscores should be escaped. This is set by \JSONParseSet{escape={all}}. This also escapes other characters, see help page.https://ctan.math.illinois.edu/macros/latex/contrib/jsonparse/jsonparse-doc.pdf
- The common_tables should still be converted to this format but include the table file should work both before and after the conversion



#### Contributors:
The LOFAR 2.0 Data Working Group
Sander ter Veen
(add your name if you contributed)

