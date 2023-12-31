% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test_and_trace.R
\name{test_and_trace_data}
\alias{test_and_trace_data}
\title{Contact tracing counts for United States from testandtrace.com}
\source{
\itemize{
\item \url{https://github.com/covid-projections/covid-data-public/blob/master/data/test-and-trace/state_data.csv}
}
}
\usage{
test_and_trace_data()
}
\value{
a \code{data.frame}
}
\description{
Contact tracing counts for United States from testandtrace.com
}
\details{
From the testandtrace website:
\enumerate{
\item Countries with successful test and trace programs have less than 3\% positive tests (meaning that they have enough testing capabilities to test aggressively). \href{https://medium.com/@tomaspueyo/coronavirus-how-to-do-testing-and-contact-tracing-bde85b64072e}{Source}
\item A state needs ~5-15 contact tracers per daily positive test (contact tracers interview infected patients about who they’ve had close contact with, and then call those people to help them get tested and quarantined). \href{https://medium.com/@tomaspueyo/coronavirus-how-to-do-testing-and-contact-tracing-bde85b64072e}{Source}
}

Suggested Grading Scale: Conducted on a 6 point scale with a 6/6 meaning that a state meets the necessary testing availability and tracing team size benchmarks to successfully test and trace.

Testing Grades:
\itemize{
\item 3 points for under 3\% positive tests
\item 2 point for 3-5.5\% positive tests
\item 1 point for 5.5-8\% positive tests
\item 0 points if over 8\% positive tests
}

Tracing Grades:
\itemize{
\item 3 points for 5-15+ tracers per daily positive case
\item 2 points for 2.5-5 tracers per daily positive case
\item 1 point for 1-2.5 tracers per daily positive case
\item 0 points for under 1 tracer per daily positive case
}
}
\examples{
TAndT = test_and_trace_data()
head(TAndT)
colnames(TAndT)
dplyr::glimpse(TAndT)

nyt = nytimes_state_data() \%>\% dplyr::select(-state) \%>\%
    dplyr::filter(subset=='confirmed') \%>\%
    add_incidence_column(grouping_columns = 'fips')
    
testers = TAndT \%>\%
    dplyr::mutate(date=as.Date(.data$date)) \%>\%
    dplyr::left_join(nyt, c('fips'='fips','date'='date')) \%>\%
    dplyr::mutate(tracers_per_new_case = contact_tracers_count/inc)

require(ggplot2)
testers \%>\% dplyr::filter(date==Sys.Date()-4) \%>\%
    ggplot(aes(x=reorder(iso2c,tracers_per_new_case),y=tracers_per_new_case)) +
    geom_bar(stat='identity') +
    coord_flip() +
    xlab('State or Jurisdiction') +
    ylab('Contract tracers per new case') +
    ggtitle(sprintf('Contract tracers per new case on \%s', Sys.Date() - 4), 
            subtitle='Goal is 5-15 tracers per new case')

}
\references{
\itemize{
\item \url{https://medium.com/@tomaspueyo/coronavirus-how-to-do-testing-and-contact-tracing-bde85b64072e}
\item \url{https://medium.com/@tomaspueyo/coronavirus-how-to-do-testing-and-contact-tracing-bde85b64072e}
\item \url{https://testandtrace.com/state-data/}
}
}
\seealso{
Other data-import: 
\code{\link{acaps_government_measures_data}()},
\code{\link{acaps_secondary_impact_data}()},
\code{\link{apple_mobility_data}()},
\code{\link{beoutbreakprepared_data}()},
\code{\link{cci_us_vaccine_data}()},
\code{\link{cdc_aggregated_projections}()},
\code{\link{cdc_excess_deaths}()},
\code{\link{cdc_social_vulnerability_index}()},
\code{\link{coronadatascraper_data}()},
\code{\link{coronanet_government_response_data}()},
\code{\link{cov_glue_lineage_data}()},
\code{\link{cov_glue_newick_data}()},
\code{\link{cov_glue_snp_lineage}()},
\code{\link{covidtracker_data}()},
\code{\link{descartes_mobility_data}()},
\code{\link{ecdc_data}()},
\code{\link{econ_tracker_consumer_spending}},
\code{\link{econ_tracker_unemp_data}},
\code{\link{economist_excess_deaths}()},
\code{\link{financial_times_excess_deaths}()},
\code{\link{google_mobility_data}()},
\code{\link{government_policy_timeline}()},
\code{\link{jhu_data}()},
\code{\link{jhu_us_data}()},
\code{\link{kff_icu_beds}()},
\code{\link{nytimes_county_data}()},
\code{\link{oecd_unemployment_data}()},
\code{\link{owid_data}()},
\code{\link{param_estimates_published}()},
\code{\link{us_county_geo_details}()},
\code{\link{us_county_health_rankings}()},
\code{\link{us_healthcare_capacity}()},
\code{\link{us_hospital_details}()},
\code{\link{us_state_distancing_policy}()},
\code{\link{usa_facts_data}()},
\code{\link{who_cases}()}

Other case-tracking: 
\code{\link{align_to_baseline}()},
\code{\link{beoutbreakprepared_data}()},
\code{\link{bulk_estimate_Rt}()},
\code{\link{combined_us_cases_data}()},
\code{\link{coronadatascraper_data}()},
\code{\link{covidtracker_data}()},
\code{\link{ecdc_data}()},
\code{\link{estimate_Rt}()},
\code{\link{jhu_data}()},
\code{\link{nytimes_county_data}()},
\code{\link{owid_data}()},
\code{\link{plot_epicurve}()},
\code{\link{usa_facts_data}()},
\code{\link{who_cases}()}
}
\concept{case-tracking}
\concept{data-import}
