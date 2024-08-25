# install.packages('dplyr', repos = "http://cran.us.r-project.org")
# load the library, suppressing output
library(dplyr, warn.conflicts = FALSE)
# lset up our headers
headers <- c(
    "Index", "Name",
    "DoB", "Phone"
)
# load data treating missing values as NA
data <- read.csv("bad_data.csv",
    header = FALSE,
    col.names = headers,
    na.strings = c("", "NA")
)
# print the data
print(data)
# show only rows with the NA values
print("Rows with missing values:")
print(data %>% filter(is.na(DoB) | is.na(Phone) | is.na(Name)))
