library(tidyverse) 
library(janitor)

df<-tribble(
  ~MajorCode,    ~MinorCode, ~Value,
  "CCC",    "XXX13",    112,
  "CCC",  "YYY1414",    13.5,
  "AAA",    "XXX12",     12,
  "AAA",    "XXX12",    12.5,
  "AAA",   "YY1414",     12,
  "BBB",   "YY1414",    12.3,
  "CCC",    "XXX12",     12,
  "CCC",    "XXX12",    145,
  "CCC",    "XXX13",    112,    
  "BBB",   "YY1414",    12.3,
  "CCC",    "XXX12",     12,
  "CCC",    "XXX12",    145,
  "CCC",    "XXX13",    112,
  "CCC",  "YYY1414",    13.5,
  "CCC",  "YYY1414",     12
)

(df1 <- df %>% arrange(MajorCode,MinorCode)%>%
    group_by(MajorCode,MinorCode) %>%
    summarize(minValue=min(Value),
              maxValue=max(Value),
              diff=maxValue-minValue) %>%
    filter(diff>0))
df

# From Bruno:
(df1 <- df %>% 
    janitor::get_dupes(MajorCode, MinorCode) %>% 
    group_by(dupe_count) %>%
    summarize(minValue=min(Value),
              maxValue=max(Value),
              diff=maxValue-minValue) %>%
    filter(diff>0))
