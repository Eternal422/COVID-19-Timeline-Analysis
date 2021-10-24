# COVID-19-Timeline-Analysis

### The Sparks Foundation Task - 8

## Data Source

Our complete COVID-19 dataset is a collection of the COVID-19 data maintained by [_Our World in Data_](https://ourworldindata.org/coronavirus). We will update it daily throughout the duration of the COVID-19 pandemic. It includes the following data:

| Metrics                     | Source                                                    | Updated | Countries |
|-----------------------------|-----------------------------------------------------------|---------|-----------|
| Vaccinations                | Official data collated by the Our World in Data team      | Daily   | 218       |
| Tests & positivity          | Official data collated by the Our World in Data team      | Weekly  | 139       |
| Confirmed cases             | JHU CSSE COVID-19 Data                                    | Daily   | 194        |
| Confirmed deaths            | JHU CSSE COVID-19 Data                                    | Daily   | 194       |


## The data used here and our data sources


- **Confirmed cases and deaths:** our data comes from the [COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University](https://github.com/CSSEGISandData/COVID-19) (JHU). We discuss how and when JHU collects and publishes this data [here](https://ourworldindata.org/coronavirus-source-data). The cases & deaths dataset is updated daily. *Note: the number of cases or deaths reported by any institution—including JHU, the WHO, the ECDC and others—on a given day does not necessarily represent the actual number on that date. This is because of the long reporting chain that exists between a new case/death and its inclusion in statistics. **This also means that negative values in cases and deaths can sometimes appear when a country corrects historical data, because it had previously overestimated the number of cases/deaths. Alternatively, large changes can sometimes (although rarely) be made to a country's entire time series if JHU decides (and has access to the necessary data) to correct values retrospectively.***
- **Testing for COVID-19:** this data is collected by the _Our World in Data_ team from official reports; you can find further details in our post on COVID-19 testing, including our [checklist of questions to understand testing data](https://ourworldindata.org/coronavirus-testing#our-checklist-for-covid-19-testing-data), information on [geographical and temporal coverage](https://ourworldindata.org/coronavirus-testing#which-countries-do-we-have-testing-data-for), and [detailed country-by-country source information](https://ourworldindata.org/coronavirus-testing#source-information-country-by-country). The testing dataset is updated around twice a week.
- **Vaccinations against COVID-19:** this data is collected by the _Our World in Data_ team from official reports.
- **Other variables:** this data is collected from a variety of sources (United Nations, World Bank, Global Burden of Disease, Blavatnik School of Government, etc.). More information is available in [our codebook](https://github.com/owid/covid-19-data/tree/master/public/data/owid-covid-codebook.csv).



### Confirmed cases
| Variable                         | Description                                                           |
|:---------------------------------|:----------------------------------------------------------------------|
| `total_cases`                    | Total confirmed cases of COVID-19                                     |
| `new_cases`                      | New confirmed cases of COVID-19                                       |


### Confirmed deaths
| Variable                          | Description                                                             |
|:----------------------------------|:------------------------------------------------------------------------|
| `total_deaths`                    | Total deaths attributed to COVID-19                                     |
| `new_deaths`                      | New deaths attributed to COVID-19                                       |

### Tests & positivity
| Variable                          | Description                                                                                                                                                                                                                                                                                                          |
|:----------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `total_tests`                     | Total tests for COVID-19                                                                                                                                                                                                                                                                                             |
| `new_tests`                       | New tests for COVID-19 (only calculated for consecutive days)                                                                                                                                                                                                                                                        |
| `positive_rate`                   | The share of COVID-19 tests that are positive, given as a rolling 7-day average (this is the inverse of tests_per_case)                                                                                                                                                                                              |
| `tests_per_case`                  | Tests conducted per new confirmed case of COVID-19, given as a rolling 7-day average (this is the inverse of positive_rate)                                                                                                                                                                                          |


### Vaccinations
| Variable                                | Description                                                                                                                                                                                                                                                                                                                                       |
|:----------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `total_vaccinations`                    | Total number of COVID-19 vaccination doses administered                                                                                                                                                                                                                                                                                           |
| `people_vaccinated`                     | Total number of people who received at least one vaccine dose                                                                                                                                                                                                                                                                                     |
| `people_fully_vaccinated`               | Total number of people who received all doses prescribed by the vaccination protocol                                                                                                                                                                                                                                                              |
| `new_vaccinations`                      | New COVID-19 vaccination doses administered (only calculated for consecutive days)                                                                                                                                                                                                                                                                |

### Others
| Variable                     | Description                                                                                                                                                                                                                                |
|:-----------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `iso_code`                   | ISO 3166-1 alpha-3 – three-letter country codes                                                                                                                                                                                            |
| `continent`                  | Continent of the geographical location                                                                                                                                                                                                     |
| `location`                   | Geographical location                                                                                                                                                                                                                      |
| `date`                       | Date of observation                                                                                                                                                                                                                        |
| `population`                 | Population in 2020                                                                                                                                                                                                                         |

The data is updated till 17th September 2021.

Link to Data Source: [Click here](https://github.com/owid/covid-19-data/tree/master/public/data/) 


## Data Preparation & Data Exploration

- The datasets are opened in MS Excel where there name are CovidDeaths and CovidVaccinations as a csv file.
- Irrelevant columns are removed.
- The Following two data sets are then loaded into MS SQL Server.
- It is found that the Data type of all the fields are incorrect which is soleved by SQL Queary.

## Data Cleaning & Data Analysis

- We check the total number of Data present using the Count Function for both tables
- We find that the data of all the Continents are mixed up with the country, which we filter out using a where clause.
- On closer inspection of the data we find that there is Irrelevant Data being cases where the population is 0 or total_cases being 0 ,which we filter out.
- We then Calcutate the DeathPercentage, InfectionRate, MortalityRate in SQL.
- We then use a CTE to combine these aggregate Functions to mate a final table called CovidDeathsCleaned.csv .
- We then perform a INNER JOIN on the other dataset CovidVaccinations to filter out the Irrelevant values making a table called CovidVaccinations.csv .
- We then load all the tables together into Tableau.

## Data Visualization

- We then finally perform the Visualization in Tableau of :

        - Covid-19 Cases Confirmed World Map (Global)
        - Top 10 Countries with Highest Covid Cases
        - Top 10 Countries with Highest Covid Deaths  
        - Total Covid Cases (Global)
        - Total Covid Deaths (Global)
        - New Cases vs New Deaths (Global)
        - People Partially Vaccinated vs People Fully Vaccinated (Global)



## Tableau Dashboard

[Dashboard](https://public.tableau.com/views/Covid19_16337997681730/Dashboard2?:language=en-GB&:display_count=n&:origin=viz_share_link)


## Authors


[Sumit Chaudhury](www.linkedin.com/in/sumit-chaudhury)

  
## License



[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/tterb/atomic-design-ui/blob/master/LICENSEs)

  
