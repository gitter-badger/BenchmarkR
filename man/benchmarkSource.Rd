% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/benchmarkSource.R
\name{benchmarkSource}
\alias{benchmarkSource}
\title{Simple Benchmark/Profiling Tool For R Scripts}
\usage{
benchmarkSource(file,timed_fun)
}
\arguments{
\item{file}{R script to benchmark}

\item{timed_fun}{a data.frame whith 4 columns. Column 1: function; column 2: package; column 3: process category eg. READ/WRITE but never BENCHMARK; column 4: function type, currently only 'IO'.}
}
\value{
returns a dubble with running time of last benchmark and prints all session benchmark records to console
}
\description{
This script will benchmark the running time of the given input file. Time used by functions defined in timed_fun data.frame will be subtracted from total running time.
}
\details{
benchmarkSource
}
\author{
Parham Solaimani

Maarten-Jan Kallen

Alexander Bertram
}
\keyword{benchmark}
\keyword{benchmarking}
\keyword{file}
\keyword{profiling}
\keyword{r}
\keyword{script}
\keyword{timing}

