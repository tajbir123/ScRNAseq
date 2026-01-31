library(Seurat)
library(ggplot2)

# FeaturePlot of Acta2 expression on UMAP

acta2_plot <- FeaturePlot(
  seurat_integrated,
  features = "Acta2",
  reduction = "umap",
  pt.size = 0.8
) +
  scale_color_gradientn(
    colors = c("darkgrey", "darkred"),
    limits = c(0, NA)
  ) +
  labs(title = "Acta2 expression") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    axis.title = element_text(face = "bold"),
    axis.text  = element_text(face = "bold"),
    panel.grid = element_blank()
  )

acta2_plot
