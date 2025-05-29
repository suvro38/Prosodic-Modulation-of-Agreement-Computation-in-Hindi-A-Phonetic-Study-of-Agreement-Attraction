library(ggplot2)
library(tidyr)

dat2 <- dat %>%
  filter(region != "gap" & region != "pc")

str(dat2)

dat2$condition <- factor(dat2$condition, levels = c("mismatch", "match"))
dat2$region <- factor(dat2$region, levels = c("v", "a1", "a2"))
contrasts(dat2$condition) <- contr.sum(2)
# mismatch coded as 1
contrasts(dat2$condition)
contrasts(dat2$region)

duration <- lmer(duration ~ condition * region + (1 | item) + (1 | speaker), dat2)
summary(duration)
# mismatch are shorter (-60 ms) than match on avg, but not statistically significant.
# aux2 is significantly less duration (-136 ms) than v [t = -5.615]
# interaction with aux1: match/mismatch difference in duration of V is not significantly
# lower (-97 ms) than that at aux1 [t =-1.997]
# agreement resolution likely occurs at boundary of V and aux1
# interestingly, main verb duration gets reduced for mismatch conditions.

residualsd <- residuals(duration)
residualsd <- as.numeric(residualsd)
qqnorm(residualsd)
qqline(residualsd, col = "red")
# residuals are normally distributed 

intensity <- lmer(intensity ~ condition * region + (1 | item) + (1 | speaker), dat2)
summary(intensity)
# match/mismatch intensity are not that different over regions
# avg intensity for mismatch at aux2 is significantly less (-2.16 dB) than at aux1 (t = -3.17)

residuals(intensity)
residualsi <- as.numeric(residualsi)
qqnorm(residualsi)
qqline(residualsi, col = "red")
# residuals are normally distributed dat2$pitch <- as.numeric(dat2$pitch)

pitch <- lmer(pitch ~ condition * region + (1 | item) + (1 | speaker), dat2)
summary(pitch)
# avg pitch for mismatch are significantly higher (24 Hz) (t = 2.25)
# interaction with V: match/mismatch difference in pitch decreases (-10 Hz) at aux1 compared to V;
# but not significant (t = -2.2). 

cor(dat2[, c("duration", "pitch", "intensity")], use = "complete.obs")
# pitch and duration are not correlated.