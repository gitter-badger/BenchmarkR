% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/benchSetter.R
\name{setTiming}
\alias{setTiming}
\title{setTiming}
\usage{
setTiming(process, start, end)
}
\arguments{
\item{process}{name for the type of function (eg. READ, WRITE).}

\item{start}{start time process}

\item{end}{end time process}
}
\value{
adds a record to ExecEnvironment$PROFILES data.frame
}
\description{
updates PROFILES data.frame by addition of given proccess duration
}

