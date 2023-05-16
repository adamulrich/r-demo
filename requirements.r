
countries <- c("United States", "United Kingdom", "Germany", "France", "Japan")
for (country in countries) {
    print(country)
}

# join with other datatypes
population <- c(331900000,67330000,83200000,67750000,125700000)
gdp <- c(5.9,7.5,2.6,6.8, 1.7)
is_democracy <- c(TRUE, FALSE, TRUE, TRUE, TRUE)
imaginary <- c(1i, 2i, 3i, 4i, 5i )


df <- data.frame(countries, population, gdp, is_democracy, imaginary)

View(df)
