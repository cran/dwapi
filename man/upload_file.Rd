% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/upload_file.R
\name{upload_file}
\alias{upload_file}
\title{Upload a single file to a dataset.}
\usage{
upload_file(dataset, path, file_name)
}
\arguments{
\item{dataset}{Dataset URL or path.}

\item{path}{File path on local file system.}

\item{file_name}{File name, including file extension.}
}
\value{
Server response message.
}
\description{
Upload a single file to a dataset.
}
\examples{
\dontrun{
  dwapi::upload_file(file_name = 'file.csv',
    path = 'file.csv', dataset = 'user/dataset')
}
}
