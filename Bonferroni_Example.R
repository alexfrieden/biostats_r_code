# Bonferonni Example
pvals = c(.001, .001, .001, .02, .22, .59, .87)
BONF = p.adjust(pvals, "bonferroni")
BH = p.adjust(pvals, "BH")
res = cbind(pvals, BH=round(BH, 3), BONF=round(BONF, 3))

matplot(res, ylab="p-values", xlab="sorted outcomes")
abline(h=0.05, lty=2)
matlines(res)
legend(1, .9, legend=c("Bonferroni", "Benjamini-Hochberg", "Unadjusted"), 
       col=c(3, 2, 1), lty=c(3, 2, 1), cex=0.7)
