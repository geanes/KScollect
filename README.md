NOTE:
-----
As of latest version (0.5.0.9000), the way **RDS** files are loaded or created has changed. See **Usage** below.

KScollect
=========

Shiny application to collect subadult long-bone measurements for future inclusion in KidStats.

KidStats is based on the research of Kyra Stull PhD (http://kyrastull.weebly.com), an Associate Professor in the Department of Anthropology at University of Nevada, Reno.

Installation:
-------------

KScollect is developed with **R** version 3.3.2.

```r
install.packages("devtools")
devtools::install_github("geanes/KScollect")
```
Usage:
------

To open an existing **.rds** file, run the app with no arguments and you will be prompted to choose an existing file to edit.

```r
library(KScollect)
KScollect()
```

To create a new **.rds** file, run the app with a quoted path as the **new** argument.

```r
library(KScollect)
KScollect("/Path/to/my/newfile.rds")
```
