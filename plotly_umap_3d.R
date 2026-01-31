library(Seurat)
library(plotly)

# Simple 3D UMAP visualization using plotly

seurat_integrated <- RunUMAP(
  seurat_integrated,
  dims = 1:15,
  n.components = 3
)

umap_3d <- Embeddings(seurat_integrated, "umap")

umap_df <- data.frame(
  UMAP_1 = umap_3d[, 1],
  UMAP_2 = umap_3d[, 2],
  UMAP_3 = umap_3d[, 3],
  Sample = seurat_integrated$sample
)

color_palette <- c(
  Sham_Female_738 = "#00BFC4",
  IRad_Female_740 = "#F8766D"
)

umap_df$Sample <- factor(
  umap_df$Sample,
  levels = names(color_palette)
)

plot_ly(
  data = umap_df,
  x = ~UMAP_1,
  y = ~UMAP_2,
  z = ~UMAP_3,
  color = ~Sample,
  colors = color_palette,
  type = "scatter3d",
  mode = "markers",
  marker = list(size = 1.5, opacity = 0.8)
)
