# Humanized-mice-model_DNA-seq_analysis

Overview
----------
We are using the software Bowtie2 to align DNA-seq to the human genome and the mouse genome. After finishing alignment, we will remove those reads that are mapped to the human and mouse genomes, and then use the software pipeline MetAMOS to do assembling, gene prediction, and taxonomic classification with the remaining reads. When we subtract the sequences which align with mouse and human data, we are working with the microbial sequences— which is will be analyzed through MetAMOS. Those sequences matching exclusively with human genome can be used to characterize the humanized mice model.
![alt text](https://github.com/chen496/Humanized-mice-model_DNA-seq_analysis/blob/4494f75eda653a4faf3da1bc419a48918d1347d6/MetAMOS.png
)

Background:
----------
Initial stages of HIV pathogenesis are now strongly believed to be reliant on microbial translocation from the gut which drives the systemic inflammation needed for
HIV/SIV.

Hypothesis : EcoHIV, a modified HIV which can infect mouse cells, would recapitulate early consequences of HIV-1 at the systemic level, such as bacterial translocation, and inquired whether combination of infection with opiates would worsen these symptoms.

Humanized mice model:
----------
Most infectious models have focused on “humanizing” the mice either by creating transgenic mice with human HIV co-receptors or generating chimeric mice with human immune cell grafts. 

![alt text](https://github.com/chen496/Humanized-mice-model_DNA-seq_analysis/blob/4494f75eda653a4faf3da1bc419a48918d1347d6/EcoHIV.png
)

Goal:
----------
Explore the  bacterial translocation in tissues after EcoHIV-infection, and characterize the humanized mice model

The pipeline has 4 steps:

Input: Humanized mice DNA-seq
1. Aligned reads to mouse genome(UCSC mm10)
2. Aligned the remained reads to human genome (NCBI GRCh38)

3. Analyzed the sequences matching exclusively with human genome, which can be used to
characterize the humanized mice model
3.1 Calculated the reads counts and did differential gene expression analysis
3.2 Performed Annovar to find the human genes’ ID in the mapped results
3.3 Counted the frequencies of genes, and the genes with with top frequencies can be used to characterize the humanized mice model

4. Subtracted the sequences which align with mouse and human genome, the remained are microbial sequences, used MetAMOS to analyze the microbial communities.

Software:
----------
1. Bowtie2 -Fast and sensitive read alignment
2. HSTseq - count the number of mapped reads
3. Annovar- find the gene names 
4. MetAMOS- microbial communities analysis



Reference:
----------
[1] Sindberg, Gregory M., et al. "An infectious murine model for studying the systemic effects of opioids on early HIV pathogenesis in the gut." Journal of Neuroimmune Pharmacology 10.1 (2015): 74-87.

[2] Langmead, Ben, and Steven L. Salzberg. "Fast gapped-read alignment with Bowtie 2." Nature methods 9.4 (2012): 357.

[3] Yang, Hui, and Kai Wang. "Genomic variant annotation and prioritization with ANNOVAR and wANNOVAR." Nature protocols 10.10 (2015): 1556-1566.

[4] Anders, Simon, Paul Theodor Pyl, and Wolfgang Huber. "HTSeq—a Python framework to work with high-throughput sequencing data." Bioinformatics 31.2 (2015): 166-169.

[5] Treangen, Todd J., et al. "MetAMOS: a modular and open source metagenomic assembly and analysis pipeline." Genome biology 14.1 (2013): 1-20.
