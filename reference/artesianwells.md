# artesianwells: Artesian Well Site Assessment Data

A dataset capturing geospatial, structural, usage, and management
characteristics of artesian well sites

## Usage

``` r
artesianwells
```

## Format

A tibble with 44 rows and 29 variables

- date_submitted:

  Date when the survey or data entry was submitted

- latitude:

  Latitude coordinate of the surveyed site

- longitude:

  Longitude coordinate of the surveyed site

- artesian_well:

  Indicates whether the location of the artesian well

- district:

  Administrative district where the site is located

- traditional_authority:

  Traditional authority under which the site falls

- well_images:

  Links or filenames of images showing the well

- has_structure:

  Indicates if the well has a surrounding structure

- well_structure_type:

  Type of structure present around the well

- well_structure_type_other:

  Description of structure if Other is selected

- can_test_flow:

  Indicates if a flow test can be conducted at the site

- seconds_to_fill_20L:

  Time in seconds required to fill a 20 liter container

- use_of_site:

  Primary community usage of the water source

- other_site_use:

  Additional uses of the site (if any)

- seasonal_unavail:

  Indicates if the site becomes unavailable during certain seasons

- area_photos:

  Links or filenames of photos showing the broader site area

- abstraction_nearby:

  Indicates if there are other water abstractions near the site

- abstraction_count:

  Number of nearby water abstractions

- abs1_name:

  Name or label of the nearest water abstraction

- abs1_latitude:

  Latitude of the nearest abstraction

- abs1_longitude:

  Longitude of the nearest abstraction

- abs1_method:

  Method used at the nearest abstraction

- abs1_region:

  Region or area where the nearest abstraction is located

- recharge_known:

  Indicates if groundwater recharge source is known

- recharge_other:

  Description of recharge source if Other is selected

- river_nearby:

  Indicates if a river is near the site

- has_operator:

  Indicates if the water point has a designated operator

- mgmt_type:

  Type of management in place for the water source

- mgmt_type_other:

  Type of management in place for the water source if Other is selected

## Examples

``` r
# Load the dataset
data(artesianwells)

# View the first few rows
head(artesianwells)
#> # A tibble: 6 × 29
#>   date_submitted latitude longitude artesian_well district traditional_authority
#>   <chr>             <dbl>     <dbl> <chr>         <chr>    <chr>                
#> 1 4/3/2024          -15.3      35.0 Meleka 2 art… Balaka   TA Nkaya             
#> 2 4/3/2024          -15.3      35.0 Msunuzi Arte… Balaka   TA Nkaya             
#> 3 4/3/2024          -15.4      35.0 Mulangeni ar… Blantyre TA Chigalu           
#> 4 4/3/2024          -15.5      35.1 Jordan Artes… Blantyre TA Lundu             
#> 5 4/4/2024          -15.6      35.0 Pasani Artes… Blantyre TA Kapeni            
#> 6 4/4/2024          -15.9      34.9 Ndire         Blantyre TA Somba             
#> # ℹ 23 more variables: well_images <chr>, has_structure <chr>,
#> #   well_structure_type <chr>, well_structure_type_other <chr>,
#> #   can_test_flow <chr>, seconds_to_fill_20L <dbl>, use_of_site <chr>,
#> #   other_site_use <chr>, seasonal_unavail <chr>, area_photos <chr>,
#> #   abstraction_nearby <chr>, abstraction_count <dbl>, abs1_name <chr>,
#> #   abs1_latitude <dbl>, abs1_longitude <dbl>, abs1_method <chr>,
#> #   abs1_region <chr>, recharge_known <chr>, recharge_other <chr>, …

# Check dimensions
dim(artesianwells)
#> [1] 44 29

# Summary of districts
table(artesianwells$district)
#> 
#>   Balaka Blantyre Chikwawa  Karonga  Liwonde Machinga Mangochi   Mwanza 
#>        2        5        4        3        1       10        8        1 
#>     Neno  Ntchisi   Salima 
#>        3        4        3 
```
