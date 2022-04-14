setwd("Job/ARCA/course-open-science/code/attachment/01-attachment-base/")
rm(list = ls())

my_data <-readxl::read_excel("att-quest.xlsx")
my_data <- as.data.frame(my_data)

str(my_data)

# Data munging

my_data$id = factor(my_data$id)
my_data$classe = factor(my_data$classe)
my_data$genere<-factor(my_data$genere)

# Compute questionnaire score

#  - ssm
my_data$ssm1 = abs(my_data$ssm1 - 5)
my_data$ssm3 = abs(my_data$ssm3 - 5)
my_data$ssm4 = abs(my_data$ssm4 - 5)
my_data$ssm9 = abs(my_data$ssm19 - 5)
my_data$ssm10 = abs(my_data$ssm10 - 5)
my_data$ssm13 = abs(my_data$ssm13 - 5)
my_data$ssm15 = abs(my_data$ssm15 - 5)

my_data$ssm_tot <- (my_data$ssm1 +my_data$ssm2+ my_data$ssm3 +my_data$ssm4+my_data$ssm5 +my_data$ssm6+my_data$ssm7 + my_data$ssm8+my_data$ssm9+
  my_data$ssm10+ my_data$ssm11+my_data$ssm12+my_data$ssm13+my_data$ssm14 + my_data$ssm15)/15

# - sdq

my_data$sdq7 = abs(my_data$sdq7 - 2)
my_data$sdq11 = abs(my_data$sdq11 - 2)
my_data$sdq14 = abs(my_data$sdq14 - 2)
my_data$sdq21 = abs(my_data$sdq21 - 2)
my_data$sdq25 = abs(my_data$sdq25 - 2)

my_data$int_tot<-my_data$sdq3+my_data$sdq6+my_data$sdq8 +my_data$sdq11+ my_data$sdq13+my_data$sdq14 + 
  my_data$sdq16+my_data$sdq19+my_data$sdq23+my_data$sdq24
my_data$ext_tot<-my_data$sdq2+my_data$sdq5+ my_data$sdq7+my_data$sdq10 +my_data$sdq12+my_data$sdq15 +
  my_data$sdq18+my_data$sdq21+ my_data$sdq22 +my_data$sdq25

my_data =my_data[, c("id", "classe", "genere", "età", "ssm_tot", "int_tot", "ext_tot")]

# Descriptive stat
summary(my_data)
table(my_data$genere, my_data$classe) 

library('ggplot2')
theme_set(theme_bw())

ggplot(my_data) +
  geom_bar(aes(x = ext_tot), fill = "firebrick", alpha = .8)
sd(my_data$ext_tot)

ggplot(my_data) +
  geom_bar(aes(x = ext_tot), fill = "firebrick", alpha = .8)+
  facet_grid(classe~genere)

tapply(my_data$ext_tot, INDEX = list(my_data$genere, my_data$classe), FUN = mean)
tapply(my_data$ext_tot, INDEX = list(my_data$genere, my_data$classe), FUN = sd)

ggplot(my_data) +
  geom_bar(aes(x = ext_tot), fill = "firebrick", alpha = .8)+
  facet_grid(classe~genere)

tapply(my_data$ext_tot, INDEX = list(my_data$genere, my_data$classe), FUN = mean)
tapply(my_data$ext_tot, INDEX = list(my_data$genere, my_data$classe), FUN = sd)

ggplot(my_data) +
  geom_jitter(aes(x = ssm_tot, y = ext_tot), width= .01, height = .2) +
  facet_grid(classe~genere)

# Models
fit <-lm(ext_tot ~ ssm_tot * genere * classe, data = my_data)
summary(fit)

anova(fit)
car::Anova(fit)
int_emmeans <- emmeans::emtrends(fit, pairwise ~ classe*genere, var = 'ssm_tot', adjust = "mvt")
int_emmeans

ggplot(as.data.frame(effects::effect("ssm_tot * genere * classe", fit, xlev = 20))) +
  geom_ribbon(aes(x= ssm_tot, ymin = lower, ymax=upper, fill =genere), alpha = .4) +
  geom_line(aes(x= ssm_tot, y = fit, color =genere), size = 1.2) +
  geom_rug(data = my_data[my_data$genere == 0,],
           aes(x= ssm_tot, color = genere, y = ext_tot), size = 1.2, alpha = .7,
           position = position_jitter(width = .02, height = 0), sides = "t") +
  geom_rug(data = my_data[my_data$genere == 1,],
           aes(x= ssm_tot, color = genere, y = ext_tot), size = 1.2, alpha = .7,
           position = position_jitter(width = .02, height = 0), sides = "b") +
  facet_grid(classe~.) +
  theme(legend.position = "top")



