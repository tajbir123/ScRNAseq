library(Seurat)
library(dplyr)

seurat_zsgreen <- JoinLayers(seurat_zsgreen)

cluster_markers <- FindAllMarkers(
  seurat_zsgreen,
  only.pos = TRUE,
  min.pct = 0.25,
  logfc.threshold = 0.25
)

top_markers <- cluster_markers %>%
  group_by(cluster) %>%
  slice_max(order_by = avg_log2FC, n = 20, with_ties = FALSE)

head(top_markers, 10)

write.csv(
  top_markers,
  "top20_markers_per_cluster_zsgreen_only.csv",
  row.names = FALSE
)
