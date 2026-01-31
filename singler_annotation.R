library(Seurat)
library(SingleR)
library(celldex)
library(ggplot2)

ref <- MouseRNAseqData()

seurat_matrix <- GetAssayData(seurat_zsgreen, assay = "RNA", slot = "data")

annotations <- SingleR(
  test = seurat_matrix,
  ref = ref,
  labels = ref$label.main
)

seurat_zsgreen$celltype <- annotations$labels

DimPlot(seurat_zsgreen, group.by = "celltype", label = TRUE, repel = TRUE) +
  ggtitle("SingleR cell type annotations") +
  theme_minimal()
