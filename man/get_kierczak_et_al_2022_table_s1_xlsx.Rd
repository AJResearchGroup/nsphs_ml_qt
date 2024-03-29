% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_kierczak_et_al_2022_table_s1_xlsx.R
\name{get_kierczak_et_al_2022_table_s1_xlsx}
\alias{get_kierczak_et_al_2022_table_s1_xlsx}
\title{Get Supplementary Table 1 of Kierczak et al., 2022,
which links the 414 proteins to their gene and OLink panel}
\usage{
get_kierczak_et_al_2022_table_s1_xlsx(
 
    kierczak_et_al_2022_table_s1_xlsx_filename = file.path(rappdirs::app_dir("nsphsmlqt")$data(),
    "TableS1.xlsx"),
 
    url = "https://assets.researchsquare.com/files/rs-625433/v1/58f8efdc8eed0b5b5f177ded.xlsx"
)
}
\arguments{
\item{kierczak_et_al_2022_table_s1_xlsx_filename}{name of the file to
save the Excel sheet to}

\item{url}{the URL}
}
\value{
a table
}
\description{
Quote from text: 'In this study, we have analysed SNVs and indels,
identified by deep coverage WGS, in relation to the protein expression
levels of 414 plasma proteins'
}
\note{
The article is in pre-print as of 2021. As I predict the publication
will be in 2022, I will use that in the function name.
Pre-print of article is at URL \url{10.21203/rs.3.rs-625433/v1}

Also, the protein \verb{IL-12B} is present twice, as it is detected by
panels \verb{INF_157_IL-12B} and \verb{NEU_186_IL-12B}
}
\examples{
get_kierczak_et_al_2022_table_s1_xlsx()
}
\author{
Richèl J.C. Bilderbeek
}
