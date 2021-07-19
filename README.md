# VCSEP Coding Challenge

## Previous abandoned investigation overwhelmed by noise
After viewing a map of deprivation levels across England supplied by the UK government's statistics department I came up with what I thought was a reasonable hypothesis:  does deprivation increase towards the two extremes of population density?

Certainly desolate Dungeness and the crowded West Midlands are very different to visit, but they both have bluer shading on the map, indicating increasing deprivation.  This ties in with Tolstoy's observation at the beginning of Anna Karenina, “All happy families are alike; each unhappy family is unhappy in its own way."

If it is true then it would lend support to the idea of specialising the response to deprived communities because their problems are very different.  People in one area may have limited public transport links to get to work and the other may suffer from poor air quality leading to increasing sickness.

After thrashing my poor laptop to find matches between different spreadsheets overnight using R, I ran a quick n dirty analysis in Excel.  Hypothesis disproved.

![image](https://user-images.githubusercontent.com/38632007/124572200-604f1200-de40-11eb-8871-86a8e080fd9a.png)


## Demonstration Shiny webpage  https://narratorjay.shinyapps.io/redcross/
Visit and compare different deprivation domains (income, access to services, health etc) between any two of England's 450 local authorities.

My insight is that there is more noise than bias, because although areas like Watford may be less deprived as a whole than Kingston-upon-Hull, the variation between the LSOAs in a local authority swamps the regional trend.  My conclusion is that there is always a requirement for charitable/ volunteer/ neighbourly help in any street in the country. 

# The remaining sections describe the coding challenge
(I was a week late but determined to learn Shiny)
 
## The challenge
Using R or Python, we would like you to run an analysis on the 2019 [English Indicies 
of Multiple Deprivation (IMD)](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019)
at the Local Authority District level. The analysis you choose to run is up to
you. It can be exploratory or inferential. You are expected to spend no more
than three hours on the analysis.

## The IMD
If you are unfamiliar with the IMD, a great place to start is [this](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/833959/IoD2019_Infographic.pdf) infographic. More information
and technical details can be found on the [following](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019)
pages.

## Data
The Local Authority District IMD data you need can be found in [File 10: local authority district summaries](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/833995/File_10_-_IoD2019_Local_Authority_District_Summaries__lower-tier__.xlsx).
For any geospatial analysis, matching boundary files can be found [here](https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-buc).

## Output
How you choose to present your findings is also up to you, but ideally you will
present the data in a visually compelling way, such as an R/Python notebook, a
Shiny/Plotly web app, blog post, etc.

## Submission Instructions
1. Fork this repository
2. Make sure the repository is public (Settings -> Manage access)
3. Ensure your respository contains all the data, files, and output you generated
(this could be a link to an external site if you posted the output as a blog post,
for example)
3. Submit a link to your forked repository no later than 12:00, 12.07.2021

## What we are looking for
- Code is well structured and follows best principles and patterns (e.g., DRY)
- The analysis is reproducible

## FAQ
1. *Who will own the code I write?*

You will. The code you write will reside on your own forked respository.
You can choose to add a license to this code.

2. *Why the IMD?*

We use the IMD frequently alongside other data to inform our work. Being able
to analyse and understand the structure of the IMD is an important skill.

3. *Do I have to use R or Python*

Yes. R and Python are the de facto tools you would be using in the role. This
dose not mean there is not scope for other languages/tools to be used in the
future.

Good luck :)
