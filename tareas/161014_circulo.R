library(tidyr)
library(dplyr)
library(ggplot2)
theme_set(theme_minimal())

obs <- replicate(2, runif(10000, -1.5,1.5)) %>% 
  data.frame() %>% 
  mutate(
    clase = ifelse( sqrt(X1^2 + X2^2) <=1, 1, 0 )
  )
obs %>% head

ggplot(obs, aes(x = X1, y = X2, color = factor(clase))) + 
  geom_point()  + 
  coord_equal()

write.table(obs, "../datos_clase/circulo.csv", row.names = F, sep = ",")





obs <- replicate(2, runif(10000, -10,10)) %>% 
  data.frame() %>% 
  mutate(
    circ = ifelse( sqrt( (X1 - (-6))^2 + (X2 - (1))^2) <= 3, 1, 
                   ifelse( sqrt( (X1 - (1))^2 + (X2 - (-5))^2) <= 1.7, 1, 
                           ifelse( sqrt( (X1 - (5))^2 + (X2 - (5))^2) <= 4.5, 1, 0)
                   ))
  ) 
ggplot(obs, 
       aes(x = X1, y = X2, color = factor( circ) )) + 
  geom_point()  + 
  coord_equal()

write.table(obs, "../datos_clase/circulos2.csv", row.names = F, sep = ",")