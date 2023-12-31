% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oecd_unemployment_data.R
\name{oecd_unemployment_data}
\alias{oecd_unemployment_data}
\title{OECD International unemployment statistics}
\source{
\url{https://data.oecd.org/unemp/unemployment-rate.htm}
}
\usage{
oecd_unemployment_data()
}
\value{
a data.frame
}
\description{
The Organisation for Economic Co-operation and Development (OECD) is an international organisation
and collects and reports broadly on economic and social factors.
}
\details{
Unemployment rate is the number of unemployed people as a percentage of the labour force, where the
latter consists of the unemployed plus those in paid or self-employment. Unemployed people are those
who report that they are without work, that they are available for work and that they have taken
active steps to find work in the last four weeks. When unemployment is high, some people become
discouraged and stop looking for work; they are then excluded from the labour force. This implies
that the unemployment rate may fall, or stop rising, even though there has been no underlying
improvement in the labour market.
}
\examples{
unemp = oecd_unemployment_data()
unemp
dplyr::glimpse(unemp)
summary(unemp)


library(ggplot2)
us_month_unemp = unemp \%>\% 
    dplyr::filter(iso3c=='USA' & frequency=='month')
p1 = ggplot(us_month_unemp,aes(x=date,y=value,color=subject)) + geom_line()
p2 = dplyr::filter(us_month_unemp,date>'2019-11-01') \%>\%
    ggplot(aes(x=date,y=value,color=subject)) + 
    geom_line() + theme(legend.position='none')
    
p1 + annotation_custom(ggplotGrob(p2), 
                       xmin = as.Date("1960-01-01"), xmax = as.Date("1990-01-01"), 
                       ymin = 10, ymax = 16)

}
\references{
OECD (2020), Unemployment rate (indicator). doi: 10.1787/997c8750-en (Accessed on 05 June 2020)
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
\code{\link{owid_data}()},
\code{\link{param_estimates_published}()},
\code{\link{test_and_trace_data}()},
\code{\link{us_county_geo_details}()},
\code{\link{us_county_health_rankings}()},
\code{\link{us_healthcare_capacity}()},
\code{\link{us_hospital_details}()},
\code{\link{us_state_distancing_policy}()},
\code{\link{usa_facts_data}()},
\code{\link{who_cases}()}
}
\author{
Sean Davis \href{mailto:seandavi@gmail.com}{seandavi@gmail.com}
}
\concept{data-import}
\concept{economy}
