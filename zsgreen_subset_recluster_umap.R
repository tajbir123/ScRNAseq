library(Seurat)
library(ggplot2)

# Subset ZsGreen+ cells and re-cluster

DefaultAssay(seurat_integrated) <- "RNA"

seurat_integrated$ZsGreen_Positive <-
  FetchData(seurat_integrated, vars = "ZsGreen")[, 1] > 0

print(table(seurat_integrated$ZsGreen_Positive))

seurat_zsgreen <- subset(seurat_integrated, subset = ZsGreen_Positive)

seurat_zsgreen <- NormalizeData(seurat_zsgreen, verbose = FALSE)
seurat_zsgreen <- FindVariableFeatures(
  seurat_zsgreen,
  selection.method = "vst",
  nfeatures = 2000,
  verbose = FALSE
)

seurat_zsgreen <- ScaleData(
  seurat_zsgreen,
  vars.to.regress = "percent.mt",
  verbose = FALSE
)

seurat_zsgreen <- RunPCA(seurat_zsgreen, npcs = 30, verbose = FALSE)

seurat_zsgreen <- FindNeighbors(seurat_zsgreen, dims = 1:12, verbose = FALSE)
seurat_zsgreen <- FindClusters(seurat_zsgreen, resolution = 0.4, verbose = FALSE)
seurat_zsgreen <- RunUMAP(seurat_zsgreen, dims = 1:12, verbose = FALSE)

DimPlot(
  seurat_zsgreen,
  group.by = "seurat_clusters",
  label = TRUE,
  pt.size = 1.8
) +
  theme_minimal() +
  theme(axis.text = element_text(face = "bold"))

DimPlot(
  seurat_zsgreen,
  group.by = "sample",
  pt.size = 3
) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.ticks = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.text = element_text(face = "bold"),
    axis.text = element_text(face = "bold"),
    axis.title = element_text(face = "bold")
  ) +
  guides(color = guide_legend(override.aes = list(size = 4)))
