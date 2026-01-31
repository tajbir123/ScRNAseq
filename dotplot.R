library(Seurat)
library(ggplot2)
library(scales)

endmt_markers <- c(
  "Myh11", "Acta2", "Tagln", "Cnn1", "Pdgfrb",
  "Spp1", "Sox9", "Fn1", "Lum", "Dcn",
  "Col1a1", "Col3a1", "Col4a2", "Col5a1",
  "Timp1", "Mmp3",
  "Cdkn1a",
  "Il6", "Il1b",
  "Ccl2", "Ccl7", "Ccl8",
  "Cxcl1", "Cxcl2",
  "Nfkb1",
  "S100a8", "S100a9"
)

DotPlot(
  seurat_smc_only,
  features = endmt_markers,
  dot.min = 0.01
) +
  coord_flip() +
  scale_color_gradientn(
    colors = c("white", "khaki", "darkorange3", "red4"),
    limits = c(0, NA),
    oob = scales::squish,
    na.value = "white"
  ) +
  theme_minimal(base_size = 16) +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold", size = 16),
    axis.text.y = element_text(face = "bold", size = 16),
    axis.title = element_text(face = "bold", size = 18),
    legend.title = element_text(face = "bold", size = 18),
    legend.text  = element_text(face = "bold", size = 16)
  ) +
  labs(
    x = "Gene",
    y = "Cluster",
    color = "Avg Exp (scaled)"
  )
