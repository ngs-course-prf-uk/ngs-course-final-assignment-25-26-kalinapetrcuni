library(ggplot2)

CHROM_DP <- read.table("CHROM_DP", sep="\t", header=FALSE)
colnames(CHROM_DP) <- c("CHROM", "DP")


CHROM_DP_plot <- ggplot(CHROM_DP, aes(x=CHROM, y=DP)) +
    geom_boxplot(outlier.shape=NA) +
    coord_cartesian(ylim = c(0, 120)) +
    theme(axis.text.x = element_text(angle=90, vjust=0.5))

ggsave("CHROM_DP_plot.png", CHROM_DP_plot, width=16, height=6, dpi=300)

DP_counts <- read.table("DP_counts", header=FALSE)
colnames(DP_counts) <- c("DP", "Count")

DP_plot <- ggplot(DP_counts, aes(x=DP, y=Count)) +
  geom_bar(stat="identity", fill="steelblue") +
  coord_cartesian(xlim = c(0, 300)) +
  xlab("Read Depth (DP)") +
  ylab("Number of Variants") +
  theme_minimal()

ggsave("DP_distribution_plot.png", DP_plot, width=10, height=6, dpi=300)
