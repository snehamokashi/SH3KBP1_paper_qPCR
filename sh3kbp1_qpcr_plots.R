library(dplyr)
library(tidyr)
library(ggplot2)
library(cowplot)

smalldel<-as.data.frame(smalldel)
largedel<-as.data.frame(largedel)
bclaf<-as.data.frame(bclaf)
sdbclaf<-as.data.frame(smalldelbclaf)

## bclaf3

bclaf$Sample <- factor(bclaf$Sample, levels = c("Male_1", "Male_2", "Femalecarrier_1","Both_deletion_female"))

bclaf3largedel_plot<-ggplot(bclaf, aes(x = Sample, y = bclaf3)) +
  geom_bar(stat = "identity", color="black") +
  theme_classic(base_size = 14) +
  labs(title = "Fold change in expression of BCLAF3 \nrelative to sex-matched controls", y="Fold change") +
  theme(axis.title.x = element_blank(),  # Remove X-axis title
        axis.text.x = element_text(angle=45, hjust = 1, margin = margin(b =5)), plot.title = element_text(hjust = 0.5), text = element_text(family = "Arial", color = "black"))+
  geom_hline(yintercept = 1, linetype = "dotted", color = "black")+
  scale_y_continuous(expand = c(0, 0), limits = c(0,1.5))

## largedel

largedel$Sample <- factor(largedel$Sample, levels = c("Male_1", "Male_2", "Femalecarrier_1","Both_deletion_female"))

largedel_plot<-ggplot(largedel, aes(x = Sample, y = large_del)) +
  geom_bar(stat = "identity", color="black") +
  theme_classic(base_size = 14) +
  labs(title = "Fold change in expression of the region spanning the large \ndeletion in SH3KBP1 relative to sex-matched controls", y="Fold change") +
  theme(axis.title.x = element_blank(),  # Remove X-axis title
        axis.text.x = element_text(angle=45, hjust = 1, margin = margin(b =5)), plot.title = element_text(hjust = 0.5), text = element_text(family = "Arial", color = "black"))+
  geom_hline(yintercept = 1, linetype = "dotted", color = "black")+
  scale_y_continuous(expand = c(0, 0), limits = c(0,1.5))

## smalldel

smalldel$Sample <- factor(smalldel$Sample, levels = c("Male_1", "Male_2","Male_3","Male_4","Femalecarrier_1","Femalecarrier_2","Both_deletion_female"))

smalldel_plot<-ggplot(smalldel, aes(x = Sample, y = Fold_change)) +
  geom_bar(stat = "identity", color="black") +
  theme_classic(base_size = 14) +
  labs(title = "Fold change in expression of the region spanning the small \ndeletion in SH3KBP1 relative to sex-matched controls", y="Fold change") +
  theme(axis.title.x = element_blank(),  # Remove X-axis title
        axis.text.x = element_text(angle=45, hjust = 1, margin = margin(b =5)), plot.title = element_text(hjust = 0.5), text = element_text(family = "Arial", color = "black"))+
  geom_hline(yintercept = 1, linetype = "dotted", color = "black")+
  scale_y_continuous(expand = c(0, 0), limits = c(0,12))

##smalldel bclaf3

sdbclaf$Sample <- factor(sdbclaf$Sample, levels = c("Male_1", "Male_2","Male_3","Male_4","Femalecarrier_1","Femalecarrier_2","Both_deletion_female"))

smalldelbclaf_plot<-ggplot(sdbclaf, aes(x = Sample, y = Fold_change)) +
  geom_bar(stat = "identity", color="black") +
  theme_classic(base_size = 14) +
  labs(title = "Fold change in expression of BCLAF3 \nrelative to sex-matched controls", y="Fold change") +
  theme(axis.title.x = element_blank(),  # Remove X-axis title
        axis.text.x = element_text(angle=45, hjust = 1, margin = margin(b =5)), plot.title = element_text(hjust = 0.5), text = element_text(family = "Arial", color = "black"))+
  geom_hline(yintercept = 1, linetype = "dotted", color = "black")+
  scale_y_continuous(expand = c(0, 0), limits = c(0,12))


## generating the combined figure

combined_plot<-plot_grid(largedel_plot,bclaf3largedel_plot,smalldel_plot,labels=c('A','B','C'))

ggsave("largedelplot.svg", plot = largedel_plot, width = 4, height = 4, units = "in", device = "svg")
ggsave("bclaf3_largedel_plot.svg", plot = bclaf3largedel_plot, width = 4, height = 4, units = "in", device = "svg")
ggsave("smalldel_plot.svg", plot = smalldel_plot, width = 4, height = 4, units = "in", device = "svg")
ggsave("smalldelbclaf_plot.svg", plot = smalldelbclaf_plot, width = 4, height = 4, units = "in", device = "svg")

