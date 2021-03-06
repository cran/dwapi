% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_file_as_data_frame.R
\name{download_file_as_data_frame}
\alias{download_file_as_data_frame}
\title{Download dataset file onto a data frame.}
\usage{
download_file_as_data_frame(dataset, file_name)
}
\arguments{
\item{dataset}{Dataset URL or path.}

\item{file_name}{File name, including file extension.}
}
\value{
Data frame with the contents of CSV file.
}
\description{
Download dataset file onto a data frame.
}
\examples{
\dontrun{
  my_df <- dwapi::download_file_as_data_frame(
    dataset = 'user/dataset',
    file_name = 'file.csv')
}
}
