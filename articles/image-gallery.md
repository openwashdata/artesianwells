# Artesian Wells Image Gallery

## Introduction

This vignette provides a visual showcase of the artesian wells
documented in the dataset. The images are organized by district and
displayed alongside key information about each well site.

Show code

``` r

# Prepare data with image URLs
wells_with_images <- artesianwells %>%
  filter(!is.na(well_images)) %>%
  mutate(
    # Extract first image URL if multiple are separated by semicolons
    first_well_image = str_extract(well_images, "^[^;]+"),
    first_area_photo = if_else(!is.na(area_photos), 
                               str_extract(area_photos, "^[^;]+"), 
                               NA_character_)
  ) %>%
  select(
    district,
    traditional_authority,
    latitude,
    longitude,
    has_structure,
    well_structure_type,
    seconds_to_fill_20L,
    use_of_site,
    river_nearby,
    has_operator,
    mgmt_type,
    first_well_image,
    first_area_photo
  )

# Count wells by district
district_summary <- wells_with_images %>%
  group_by(district) %>%
  summarise(
    well_count = n(),
    avg_fill_time = round(mean(seconds_to_fill_20L, na.rm = TRUE), 1),
    .groups = "drop"
  ) %>%
  arrange(desc(well_count))
```

## Overview

The dataset contains images for **43** artesian well sites across **10**
districts in Malawi.

Show code

``` r

district_summary %>%
  gt() %>%
  cols_label(
    district = "District",
    well_count = "Number of Wells",
    avg_fill_time = "Avg. Fill Time (seconds)"
  ) %>%
  tab_header(
    title = "Artesian Wells Distribution",
    subtitle = "Wells with documented images"
  ) %>%
  fmt_number(
    columns = avg_fill_time,
    decimals = 1
  ) %>%
  tab_style(
    style = cell_fill(color = "lightblue"),
    locations = cells_body(columns = well_count, rows = well_count > 5)
  )
```

| Artesian Wells Distribution  |                 |                          |
|------------------------------|-----------------|--------------------------|
| Wells with documented images |                 |                          |
| District                     | Number of Wells | Avg. Fill Time (seconds) |
| Machinga                     | 10              | 62.9                     |
| Mangochi                     | 8               | 58.2                     |
| Blantyre                     | 5               | 104.9                    |
| Chikwawa                     | 4               | 17.8                     |
| Ntchisi                      | 4               | 38.8                     |
| Karonga                      | 3               | 37.2                     |
| Neno                         | 3               | 0.0                      |
| Salima                       | 3               | 18.6                     |
| Balaka                       | 2               | 153.7                    |
| Liwonde                      | 1               | 0.0                      |

Table 1: Summary of artesian wells by district

## Wells by District

### Machinga

| Artesian Wells in Machinga |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 10 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/2ce9ed8ad4a242d582e203de44893af9) | Sitola | -15.1098, 35.2455 | Yes | Slow (\> 60s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/e60ce0f649ae4f228055dd9eee487ac4) | Sitola | -15.1133, 35.2368 | Yes | Slow (\> 60s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/08d812dc9c884cc19a3ad6f8be0994ea) | Sitola | -15.0803, 35.2369 | Yes | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/a4a87705d2cb4341a5c9b6a5e995e61d) | Sitola | -15.0813, 35.239 | Yes | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/92951c6fde6042fc83bfe2a8da2f1c1c) | Sitola | -15.078, 35.2403 | Yes | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/054b07d3f5234f9ca2e4b2edcf48d33b) | Sitola | -15.0787, 35.2427 | Yes | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/348c723e163f45a295d886dea3c161f7) | Sitola | -15.0622, 35.2344 | Yes | Slow (\> 60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/8904d3da4b584dc88f7e98fdfe9536bd) | Stola | -15.1141, 35.2379 | Yes | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/d87d698b3a9244b99c11534c2a7e929c) | Stola | -15.1141, 35.2379 | Yes | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/f7f58d6675124df1bca9c3f3bbb2f714) | Stola | -15.1026, 35.2337 | Yes | Slow (\> 60s) | Domestic | Yes |

### Mangochi

| Artesian Wells in Mangochi |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 8 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/d37a7f7c7cf54c11bca8f69185ef74db) | Chimwala | -14.7534, 35.1993 | Yes | Slow (\> 60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/e83d9fd2395c4b8e97a656e3c43b82f1) | Chimwala | -14.7533, 35.1993 | Yes | Moderate (30-60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/fc144e7f672c4da09f18090322b48169) | Chimwala | -14.7234, 35.1723 | Yes | Slow (\> 60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/b62f5d66104e47e1b6c4f00f1e66945f) | Chimwala | -14.7523, 35.202 | Yes | Fast (\< 30s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/6beb0521282c46ada3d73844afe4886c) | Chimwala | -14.4832, 35.2643 | Yes | Slow (\> 60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/4b9c1c2b168e40bbb015d7666203a545) | Chimwala | -14.7341, 35.189 | Yes | Slow (\> 60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/3e0fd7ad0d334ef4bcfe93b51b6297e2) | Chimwala | -14.7358, 35.1906 | Yes | Fast (\< 30s) | Domestic | No |
| ![](https://api.mwater.co/v3/images/8745ddfeb5b940e9b5d933a4c9461c6c) | TA Chimwala | -14.7526, 35.2042 | Yes | Moderate (30-60s) | Domestic | Yes |

### Blantyre

| Artesian Wells in Blantyre |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 5 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/09fc4d1abda74f8c9193ca71499a5f61) | Machinjiri | -15.7578, 35.0025 | No | Fast (\< 30s) | Other | NA |
| ![](https://api.mwater.co/v3/images/3d7632482a30449a8df249f29bf77653) | TA Chigalu | -15.3765, 34.9852 | Yes | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/a9cb9f672b4344d8bcd28f6ee987e778) | TA Kapeni | -15.6469, 35.0212 | Yes | Slow (\> 60s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/259f2c6a64e04de3abb96b4162d5835a) | TA Lundu | -15.4958, 35.1109 | Yes | Slow (\> 60s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/4491cfd484f54a89a3145e1fe18b80bd) | TA Somba | -15.9172, 34.9365 | Yes | Moderate (30-60s) | Domestic | No |

### Chikwawa

| Artesian Wells in Chikwawa |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 4 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/fda58d40905242248a2a3f186b554922) | Mankhuwila | -16.2437, 35.0101 | Yes | Moderate (30-60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/b6020c7c782140dda68385fc512b6396) | Mgabu | -16.3001, 34.8412 | Yes | Fast (\< 30s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/10b5d3f8eec647fca8c5861810562e33) | Mgabu | -15.8398, 34.3957 | Yes | Fast (\< 30s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/2189e78bd3bc4e458db258b85956934e) | TA Maseya | -16.0369, 34.9116 | Yes | Fast (\< 30s) | Domestic | NA |

### Ntchisi

| Artesian Wells in Ntchisi |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 4 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/a2be8f1b02db4818a31746e685fcea97) | Chikho | -13.4189, 34.058 | NA | Fast (\< 30s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/eedc3d0aa4484808a90e553a769fb50b) | Kasakula | -13.3739, 34.0964 | Yes | Fast (\< 30s) | Irrigation | No |
| ![](https://api.mwater.co/v3/images/b44cb14aabcc4049a9fddd059409fa95) | Kasakula | -13.3793, 34.0665 | Yes | Moderate (30-60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/5579b85dc2c947d7bd55ff90605fa99b) | Malenga | -13.3333, 33.8693 | Yes | Slow (\> 60s) | Domestic | Yes |

### Karonga

| Artesian Wells in Karonga |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 3 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/4997d6f764564f068e45e601e7ed2a5f) | Kyungu | -10.1265, 34.0035 | Yes | Fast (\< 30s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/30e9164a50474f448f435109d7f17547) | Kyungu | -9.9465, 33.8672 | Yes | Moderate (30-60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/598dc0cd56594a6abdbc46eb1f6ab830) | Mwilangombe | -10.3061, 34.1245 | Yes | Moderate (30-60s) | Domestic | NA |

### Neno

| Artesian Wells in Neno |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 3 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/ae37749fa87e498f96625e4e052706f0) | Simon | -15.2908, 34.9987 | Yes | Fast (\< 30s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/13c2eb429404473cb71d5f9d34988459) | Simoni | -15.3235, 34.978 | Yes | Fast (\< 30s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/3161047383eb4316a99cd3893aa6ebcf) | Symon | -15.2908, 34.9986 | Yes | Fast (\< 30s) | Domestic | No |

### Salima

| Artesian Wells in Salima |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 3 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/d54c1566338f4d2fbdce2c73d54b4ddb) | Khombedza | -13.6473, 34.1564 | Yes | Moderate (30-60s) | Domestic | Yes |
| ![](https://api.mwater.co/v3/images/b74f8c3274fe4d8b8b0421148cc4d109) | Maganga | -13.7322, 34.5687 | Yes | Fast (\< 30s) | Irrigation | No |
| ![](https://api.mwater.co/v3/images/1b1986e3714842d2befc5d0edae941e3) | Maganga | -13.733, 34.5687 | Yes | Fast (\< 30s) | Irrigation | No |

### Balaka

| Artesian Wells in Balaka |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 2 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/206a64b194bd4fd7bc64f816dbeae1a0) | TA Nkaya | -15.2984, 35.0069 | Yes | Slow (\> 60s) | Domestic | NA |
| ![](https://api.mwater.co/v3/images/92bd789c0a2c4a40a74e61438c949785) | TA Nkaya | -15.2886, 35.0102 | Yes | Slow (\> 60s) | Domestic | NA |

### Liwonde

| Artesian Wells in Liwonde |  |  |  |  |  |  |
|:---|:---|---:|:---|:---|:---|:---|
| 1 well sites documented |  |  |  |  |  |  |
| Well Image | Traditional Authority | Coordinates | Structure | Fill Rate | Primary Use | Operator |
| ![](https://api.mwater.co/v3/images/b086ebc03ac940d7992e850108d641c0) | Sitola | -15.1105, 35.2576 | Yes | Fast (\< 30s) | Domestic | Yes |

## Image Grid View

For a quick visual overview, here’s a grid displaying all well images
organized in rows of 4:

![Balaka - TA
Nkaya](https://api.mwater.co/v3/images/206a64b194bd4fd7bc64f816dbeae1a0)

Balaka - TA Nkaya

![Balaka - TA
Nkaya](https://api.mwater.co/v3/images/92bd789c0a2c4a40a74e61438c949785)

Balaka - TA Nkaya

![Blantyre - TA
Chigalu](https://api.mwater.co/v3/images/3d7632482a30449a8df249f29bf77653)

Blantyre - TA Chigalu

![Blantyre - TA
Lundu](https://api.mwater.co/v3/images/259f2c6a64e04de3abb96b4162d5835a)

Blantyre - TA Lundu

![Blantyre - TA
Kapeni](https://api.mwater.co/v3/images/a9cb9f672b4344d8bcd28f6ee987e778)

Blantyre - TA Kapeni

![Blantyre - TA
Somba](https://api.mwater.co/v3/images/4491cfd484f54a89a3145e1fe18b80bd)

Blantyre - TA Somba

![Liwonde -
Sitola](https://api.mwater.co/v3/images/b086ebc03ac940d7992e850108d641c0)

Liwonde - Sitola

![Machinga -
Sitola](https://api.mwater.co/v3/images/2ce9ed8ad4a242d582e203de44893af9)

Machinga - Sitola

![Chikwawa - TA
Maseya](https://api.mwater.co/v3/images/2189e78bd3bc4e458db258b85956934e)

Chikwawa - TA Maseya

![Machinga -
Sitola](https://api.mwater.co/v3/images/e60ce0f649ae4f228055dd9eee487ac4)

Machinga - Sitola

![Machinga -
Stola](https://api.mwater.co/v3/images/8904d3da4b584dc88f7e98fdfe9536bd)

Machinga - Stola

![Machinga -
Stola](https://api.mwater.co/v3/images/d87d698b3a9244b99c11534c2a7e929c)

Machinga - Stola

![Machinga -
Stola](https://api.mwater.co/v3/images/f7f58d6675124df1bca9c3f3bbb2f714)

Machinga - Stola

![Machinga -
Sitola](https://api.mwater.co/v3/images/08d812dc9c884cc19a3ad6f8be0994ea)

Machinga - Sitola

![Machinga -
Sitola](https://api.mwater.co/v3/images/a4a87705d2cb4341a5c9b6a5e995e61d)

Machinga - Sitola

![Machinga -
Sitola](https://api.mwater.co/v3/images/92951c6fde6042fc83bfe2a8da2f1c1c)

Machinga - Sitola

![Machinga -
Sitola](https://api.mwater.co/v3/images/054b07d3f5234f9ca2e4b2edcf48d33b)

Machinga - Sitola

![Chikwawa -
Mankhuwila](https://api.mwater.co/v3/images/fda58d40905242248a2a3f186b554922)

Chikwawa - Mankhuwila

![Machinga -
Sitola](https://api.mwater.co/v3/images/348c723e163f45a295d886dea3c161f7)

Machinga - Sitola

![Karonga -
Kyungu](https://api.mwater.co/v3/images/4997d6f764564f068e45e601e7ed2a5f)

Karonga - Kyungu

![Karonga -
Mwilangombe](https://api.mwater.co/v3/images/598dc0cd56594a6abdbc46eb1f6ab830)

Karonga - Mwilangombe

![Ntchisi -
Malenga](https://api.mwater.co/v3/images/5579b85dc2c947d7bd55ff90605fa99b)

Ntchisi - Malenga

![Ntchisi -
Chikho](https://api.mwater.co/v3/images/a2be8f1b02db4818a31746e685fcea97)

Ntchisi - Chikho

![Ntchisi -
Kasakula](https://api.mwater.co/v3/images/eedc3d0aa4484808a90e553a769fb50b)

Ntchisi - Kasakula

![Ntchisi -
Kasakula](https://api.mwater.co/v3/images/b44cb14aabcc4049a9fddd059409fa95)

Ntchisi - Kasakula

![Salima -
Maganga](https://api.mwater.co/v3/images/b74f8c3274fe4d8b8b0421148cc4d109)

Salima - Maganga

![Salima -
Maganga](https://api.mwater.co/v3/images/1b1986e3714842d2befc5d0edae941e3)

Salima - Maganga

![Salima -
Khombedza](https://api.mwater.co/v3/images/d54c1566338f4d2fbdce2c73d54b4ddb)

Salima - Khombedza

![Blantyre -
Machinjiri](https://api.mwater.co/v3/images/09fc4d1abda74f8c9193ca71499a5f61)

Blantyre - Machinjiri

![Karonga -
Kyungu](https://api.mwater.co/v3/images/30e9164a50474f448f435109d7f17547)

Karonga - Kyungu

![Chikwawa -
Mgabu](https://api.mwater.co/v3/images/b6020c7c782140dda68385fc512b6396)

Chikwawa - Mgabu

![Chikwawa -
Mgabu](https://api.mwater.co/v3/images/10b5d3f8eec647fca8c5861810562e33)

Chikwawa - Mgabu

![Mangochi -
Chimwala](https://api.mwater.co/v3/images/d37a7f7c7cf54c11bca8f69185ef74db)

Mangochi - Chimwala

![Mangochi -
Chimwala](https://api.mwater.co/v3/images/e83d9fd2395c4b8e97a656e3c43b82f1)

Mangochi - Chimwala

![Mangochi -
Chimwala](https://api.mwater.co/v3/images/fc144e7f672c4da09f18090322b48169)

Mangochi - Chimwala

![Mangochi - TA
Chimwala](https://api.mwater.co/v3/images/8745ddfeb5b940e9b5d933a4c9461c6c)

Mangochi - TA Chimwala

![Mangochi -
Chimwala](https://api.mwater.co/v3/images/b62f5d66104e47e1b6c4f00f1e66945f)

Mangochi - Chimwala

![Mangochi -
Chimwala](https://api.mwater.co/v3/images/6beb0521282c46ada3d73844afe4886c)

Mangochi - Chimwala

![Neno -
Symon](https://api.mwater.co/v3/images/3161047383eb4316a99cd3893aa6ebcf)

Neno - Symon

![Neno -
Simon](https://api.mwater.co/v3/images/ae37749fa87e498f96625e4e052706f0)

Neno - Simon

## Usage Patterns

Show code

``` r

wells_with_images %>%
  count(use_of_site) %>%
  mutate(use_of_site = fct_reorder(use_of_site, n)) %>%
  ggplot(aes(x = n, y = use_of_site, fill = use_of_site)) +
  geom_col() +
  geom_text(aes(label = n), hjust = -0.2) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(
    x = "Number of Wells",
    y = "Primary Use",
    title = "Primary Usage of Artesian Wells"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
```

![](image-gallery_files/figure-html/fig-usage-distribution-1.png)

Figure 1: Distribution of artesian wells by primary use

## Flow Rate Analysis

Show code

``` r

wells_with_images %>%
  filter(!is.na(seconds_to_fill_20L)) %>%
  group_by(district) %>%
  summarise(
    n_tested = n(),
    min_time = min(seconds_to_fill_20L, na.rm = TRUE),
    avg_time = mean(seconds_to_fill_20L, na.rm = TRUE),
    max_time = max(seconds_to_fill_20L, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  gt() %>%
  cols_label(
    district = "District",
    n_tested = "Wells Tested",
    min_time = "Min (s)",
    avg_time = "Average (s)",
    max_time = "Max (s)"
  ) %>%
  fmt_number(
    columns = c(min_time, avg_time, max_time),
    decimals = 1
  ) %>%
  tab_header(
    title = "Flow Rate Statistics",
    subtitle = "Time to fill 20-liter container"
  ) %>%
  data_color(
    columns = avg_time,
    colors = scales::col_numeric(
      palette = c("green", "yellow", "red"),
      domain = NULL
    )
  )
```

| Flow Rate Statistics            |              |         |             |         |
|---------------------------------|--------------|---------|-------------|---------|
| Time to fill 20-liter container |              |         |             |         |
| District                        | Wells Tested | Min (s) | Average (s) | Max (s) |
| Balaka                          | 2            | 64.1    | 153.7       | 243.3   |
| Blantyre                        | 5            | 0.0     | 104.9       | 361.4   |
| Chikwawa                        | 4            | 0.0     | 17.8        | 41.4    |
| Karonga                         | 3            | 24.6    | 37.2        | 46.7    |
| Liwonde                         | 1            | 0.0     | 0.0         | 0.0     |
| Machinga                        | 10           | 0.0     | 62.9        | 221.3   |
| Mangochi                        | 8            | 0.0     | 58.2        | 140.5   |
| Neno                            | 3            | 0.0     | 0.0         | 0.0     |
| Ntchisi                         | 4            | 0.0     | 38.8        | 96.5    |
| Salima                          | 3            | 0.0     | 18.6        | 37.5    |

Table 2: Flow rate statistics by district

## Data Notes

- Images are hosted on the mwater API and may require internet
  connection to display
- Some wells have multiple images; only the first image is displayed in
  this gallery
- Flow rate data is not available for all wells
- The dataset was collected in April 2024
