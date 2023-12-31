% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cdc_aggregated_projections.R
\name{cdc_aggregated_projections}
\alias{cdc_aggregated_projections}
\title{Projected deaths from COVID-19 models}
\usage{
cdc_aggregated_projections()
}
\value{
a data.frame
}
\description{
The US CDC gathers projections from several groups around
the world and aggregates them into a single data resource.
See the reference below for details of the models.
}
\details{
These models are not updated daily but more like weekly.
This function will attempt to grab the latest version.
}
\examples{
res = cdc_aggregated_projections()
head(res)
dplyr::glimpse(res)

# available models
table(res$model)

# projection targets
table(res$target)

min(res$forecast_date)
max(res$target_week_end_date)

library(dplyr)
library(ggplot2)

# FACET view
res_ny = res \%>\%
    dplyr::filter(location_name=='New York' & grepl('cum death', target)) \%>\%
    dplyr::filter(model!='UMass-MechBayes')
res_ny \%>\%
    dplyr::filter(location_name=='New York') \%>\%
    ggplot(aes(x=model, y=point, color=model)) +
    geom_errorbar(aes(ymin= quantile_0.025, ymax =  quantile_0.975)) +
    facet_wrap(facets='target_week_end_date') +
    geom_point() +
    labs(y='Projected Deaths') +
    theme_bw() +
    theme(axis.text.x=element_blank()) +
    ggtitle('Projected New York deaths for week ending')
#'
# combined view
pd <- position_dodge(width = 3) # use this to offset points and error bars
res_ny \%>\%
    ggplot(aes(x=target_week_end_date, y=point, color=model)) +
    geom_errorbar(aes(ymin= quantile_0.025, ymax =  quantile_0.975), position=pd) +
    geom_point(position=pd) +
    labs(y='Projected Deaths') +
    geom_line(position=pd) +
    theme_bw() +
    theme(legend.position='bottom') +
    ggtitle('Projected New York deaths for week ending')


}
\references{
\itemize{
\item \url{https://www.cdc.gov/coronavirus/2019-ncov/covid-data/forecasting-us.html}
}
}
\seealso{
Other data-import: 
\code{\link{acaps_government_measures_data}()},
\code{\link{acaps_secondary_impact_data}()},
\code{\link{apple_mobility_data}()},
\code{\link{beoutbreakprepared_data}()},
\code{\link{cci_us_vaccine_data}()},
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
\concept{projections}
