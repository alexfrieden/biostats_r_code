Week6_Notes: Hardy Weinberg, More PCA
========================================================
author: Alexander Frieden
date: 3/07/2016



Hardy Weinberg
========================================================
In 1908 the Mathematician G.H. Hardy wrote in Science about an observation he had.  

It turned out a German Physician Wilhelm Weinberg had come up with the same thing.  

Thus this equation that was known as Hardy's law was now Hardy Weinberg



The Hardy–Weinberg principle, also known as the Hardy–Weinberg equilibrium, model, theorem, or law, states that allele and genotype frequencies in a population will remain constant from generation to generation in the absence of other evolutionary influences. 

Example
============================================================

![allele frequency](pictures/alleleFrequencyCalc.jpg)


Example (part 2)
===================================
In general we let $f_{A/A}$,$f_{A/a}$, and $f_{a/a}$ be the three genotype frequencies at a locus with two alleles then the population frequencies of alleles A are given by 
$$
\begin{align}
p&=f_{A/A} + 1/2f_{A/a} \\
q&=f_{a/a} + 1/2f_{A/a}
\end{align}
$$

Note that p + q = 1.  


Hardy Weinberg Part 3
========================================================
How can we get genotype frequencies from allele 
frequencies?

Assuming random mating, the equilibrium genotype 
frequencies will be

$$
\begin{align}
&f_{A/A} = p^2 \\
&f_{A/a} = 2pq \\
&f_{a/a} = q^2
\end{align}
$$

These proportions are obtained after a single generation of
random mating.

Hardy Weinberg Part 4
========================================================
What are the allele frequencies in the next generation?

We compute:
$$
\begin{align}
p' &= f_{A/A} + \frac{1}{2}f_{A/a} \\
   &=p^2 + \frac{1}{2}(2pq) = p^2 + pq \\
   &=p(p + q) = p(1) = p

\end{align}
$$

The allele frequencies are unchanged!


Hardy Weinberg Part 5
========================================================
!["hardy weinberg"](pictures/hardyWeinberg.png)

Hardy Weinberg Part 5 Explanation
========================================================
Hardy–Weinberg proportions for two alleles: the horizontal axis shows the two allele frequencies p and q 

the vertical axis shows the expected genotype frequencies. 

Each line shows one of the three possible genotypes.

Hardy Weinberg Part 6
========================================================

Note that rare alleles are rarely found in homozygotes


HWE Example
=======================================
Albinism is a rare genetically inherited trait that is only expressed in the phenotype of homozygous recessive individuals (aa).  

The most characteristic symptom is a marked deficiency in the skin and hair pigment melanin. 

This condition can occur among any human group as well as among other animal species.  The average human frequency of albinism in North America is only about 1 in 20,000.

HWE Example (part 2)
=======================================

Referring back to the Hardy-Weinberg equation (p² + 2pq + q² = 1), the frequency of homozygous recessive individuals (aa) in a population is q².  Therefore, in North America the following must be true for albinism:
$$
q^2 = \frac{1}{20,000} = 0.00005
$$

By taking the square root of both sides of this equation, we get:   

$$
q=.00707
$$

In other words, the frequency of the recessive albinism allele (a) is $.00707$ or about 1 in 140.  Knowing one of the two variables $(q)$ in the Hardy-Weinberg equation, it is easy to solve for the other $(p)$.

HWE Example (part 3)
=======================================

Solving:
$$
\begin{align}
p &= 1 - q \\
  &= 1 - 0.00707 \\
  &= 0.99293
\end{align}
$$
The frequency of the dominant, normal allele (A) is, therefore, .99293 or about 99 in 100.

HWE Example (part 4)
=======================================
The next step is to plug the frequencies of p and q into the Hardy-Weinberg equation:


$$
p^2 + 2pq + q^2 = 1 \\
(.993)^2 + 2 (.993)(.007) + (.007)^2 = 1 \\
.986 + .014 + .00005 = 1
$$

HWE Example (part 4)
========================================
This gives us the frequencies for each of the three genotypes for this trait in the population:

$p^2$ =
predicted frequency
of homozygous
dominant individuals	 = .986 = 98.6%

$2pq$ =
predicted frequency
of heterozygous
individuals	 = .014 = 1.4%

$q^2$ =
predicted frequency
of homozygous
recessive individuals 
(the albinos)	 = .00005 = .005%

HWE Example (part 5)
========================================

With a frequency of .005% (about 1 in 20,000), albinos are extremely rare.  However, heterozygous carriers for this trait, with a predicted frequency of 1.4% (about 1 in 72), are far more common than most people imagine.  There are roughly 278 times more carriers than albinos.  Clearly, though, the vast majority of humans (98.6%) probably are homozygous dominant and do not have the albinism allele.

Value of HWE
==========================================

By the outset of the 20th century, geneticists were able to use Punnett squares to predict the probability of offspring genotypes for particular traits based on the known genotypes of their two parents when the traits followed simple Mendelian rules of dominance and recessiveness.  

The Hardy-Weinberg equation essentially allowed geneticists to do the same thing for entire populations.

Hardy Weinberg Implementation
=========================================

```r
install.packages("HardyWeinberg", repos = "http://cran.us.r-project.org")
```

```

The downloaded binary packages are in
	/var/folders/sd/mk5vnyyx72qbcjpjfbtncgp00000gs/T//Rtmp2cAfW7/downloaded_packages
```

```r
library("HardyWeinberg")
```


R Example 
==================================
We store the genotype counts (298, 489 and 213 for $MM$, $MN$ and $NN$ respectively)

```r
x <- c(MM = 298, MN = 489, NN = 213)
HW.test <- HWChisq(x, verbose = TRUE)
```

```
Chi-square test with continuity correction for Hardy-Weinberg equilibrium
Chi2 =  0.1789563 p-value =  0.6722717 D =  -3.69375 f =  0.01488253 
```

R Example (part 2)
=============================================

This shows that the chi-square statistic has value 0.179, and that the corresponding p value
for the test is 0.6723. Taking Taking a significance level of $\alpha = 0.05$, we do not reject HWE
for the mn locus. 

R Example (part 3)
=============================================

When verbose is set to FALSE (default) the test is silent, and HW.test is
a list object containing the results of the test (chi-square statistic, the p value of the test,
half the deviation from HWE (D) for the heterozygote $D = \frac{1}{2}(f_{AB} − e_{AB})$, the minor allele
frequency $p$ and the inbreeding coefficient $f$. 

The coefficient of inbreeding ("f") is a measure of the likelihood of genetic effects due to inbreeding to be expected based on a known pedigree (i.e. a fully documented genealogy e.g. due to a fixed system of breeding).

R Example (part 4)
=============================================

By default, HWChisq applies a continuity correction. This is not recommended for low minor allele frequencies. In order to perform a chi-square test without Yates’ continuity correction, it is necessary to set the cc parameter to zero.  

HWE with Correction
=============================================


```r
HW.test <- HWChisq(x, cc = 0, verbose = TRUE)
```

```
Chi-square test for Hardy-Weinberg equilibrium
Chi2 =  0.2214896 p-value =  0.6379073 D =  -3.69375 f =  0.01488253 
```

There is no significant deviation from HWE.  

Chi-Square Distribution
=======================================

```r
plotChi<-function(){
x=seq(0,30,0.1)
plot(x,dchisq(x,1),main="Chi-distribution",type="l",col="black")
colors <- c("red", "blue", "darkgreen", "gold", "black")
degf <- c(1, 3, 8, 30)
for (i in 1:4){lines(x,dchisq(x,degf[i]), lwd=2, col=colors[i])}
labels <- c("df=2", "df=3", "df=8", "df=30", "df=1")
legend("topright", inset=.05, title="Chi Square Distribution",labels, lwd=2, lty=c(1, 1, 1, 1, 2), col=colors)
}
```


Chi-Square Distribution (part 2)
=======================================

```r
plotChi()
```

<img src="Week6_Notes-figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="500px" height="500px" />

Chi-Square Test
=======================================

* A statistical test that can test out ratios is the Chi-Square aka Goodness of Fit test.

* An important question to answer in any genetic experiment is how can we decide if our data fits any of the Mendelian ratios we have discussed.

Chi-Square Test (part 2)
=======================================

Chi-Square Formula:

$$
\chi^2 = \sum\frac{(Observed\,Value - Expected\,Value)^2}{Expected\,Value}
$$

Degrees of freedom (df) = n-1 where n is the number of classes


Chi-Square Example 
============================

The chi-square test provides a method for testing the association between the row and column variables in a two-way table. The null hypothesis $H_0$ assumes that there is no association between the variables (in other words, one variable does not vary according to the other variable)

The alternative hypothesis $H_a$ claims that some association does exist. The alternative hypothesis does not specify the type of association, so close attention to the data is required to interpret the information provided by the test.


Chi-Square Example (part 2)
============================

Original

|Goals|4|5|6|
|----|---------------|---------------|----|
| Grades | 49 | 50 |69|
| Popular |24 |36 |38|
| Sports |19|22|28|

Expected

|Goals|4|5|6|
|----|---------------|---------------|----|
| Grades |46.1|54.2|67.7|
| Popular |26.9|31.6|39.5|
| Sports |18.9|22.2|27.8|
Grade 4 with "grades" chosen to be most important, is calculated to be 168*92/335 = 46.1, for example.



Chi-Square Example (part 2)
============================

The chi-square statistic for the above example is computed as follows: 
$$
X^2 = \frac{(49 - 46.1)^2}{46.1} + \frac{(50 - 54.2)^2}{54.2} + \frac{(69 - 67.7)^2}{67.7} \\
+ .... + \frac{(28 - 27.8)^2}{27.8} \\
= 0.18 + 0.33 + 0.03 + .... + 0.01  \\
= 1.51
$$

Chi-Square Example (part 3)
============================

The degrees of freedom are equal to (3-1)(3-1) = 2*2 = 4, so we are interested in the probability P($X^2$ > 1.51) = 0.8244 on 4 degrees of freedom. 

This indicates that there is no association between the choice of most important factor and the grade of the student -- the difference between observed and expected values under the null hypothesis is negligible.

Similiar thing in R
==================================


```r
## From Agresti(2007) p.39
M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(M) <- list(gender = c("F", "M"),
                    party = c("Democrat","Independent", "Republican"))
(Xsq <- chisq.test(M))  # Prints test summary
```

```

	Pearson's Chi-squared test

data:  M
X-squared = 30.07, df = 2, p-value = 2.954e-07
```

Similiar thing in R (part 2)
==================================

We can also get the following metadata:

```r
Xsq$observed   # observed counts (same as M)
```

```
      party
gender Democrat Independent Republican
     F      762         327        468
     M      484         239        477
```

```r
Xsq$expected   # expected counts under the null
```

```
      party
gender Democrat Independent Republican
     F 703.6714    319.6453   533.6834
     M 542.3286    246.3547   411.3166
```

Similiar thing in R (part 3)
==================================


```r
Xsq$residuals  # Pearson residuals
```

```
      party
gender   Democrat Independent Republican
     F  2.1988558   0.4113702 -2.8432397
     M -2.5046695  -0.4685829  3.2386734
```

```r
Xsq$stdres     # standardized residuals
```

```
      party
gender   Democrat Independent Republican
     F  4.5020535   0.6994517 -5.3159455
     M -4.5020535  -0.6994517  5.3159455
```

Example #2
===================================

```r
data(Markers)
Markers[1:12,]
```

```
   SNP1   iG   iT SNP2 SNP3
1    TT  641 1037   AA   GG
2    GT 1207  957   AC   AG
3    TT 1058 1686   AA   GG
4    GG 1348  466   CC   AA
5    GT 1176  948   AC   AG
6    GG 1906  912   CC   AA
7    GG 1844  705   CC   AA
8    GG 2007  599   CC   AA
9    GT 1369 1018   AC   AG
10   GG 1936  953   CC   AA
11   GG 1952  632   AC   AG
12 <NA>  947  920   AC   AG
```

Example #2 part 2
======================================

Note that this data is at the level of each individual. Dataframe Markers contains one SNP
with missings (SNP1), the two allele intensities of that SNP (iG and iT) and two covariate
markers (SNP2 and SNP3). Here, the covariates have no missing values. We first test SNP1 for
HWE using a chi-square test and ignoring the missing genotypes:


Example #3 part 4
======================================
The data we just looked at is in a data frame, but the Hardy-Weinberg Chi Square test only takes a vector of genotype counts.  How do we convert between these two?  

Example #3 part 3
======================================

Answer: We need to take one vector from the Markers data frame.  

```r
Xt <- table(Markers[,1])
Xv <- as.vector(Xt)
names(Xv) <- names(Xt)
HW.test <- HWChisq(Xv,cc=0,verbose=TRUE)
```

```
Chi-square test for Hardy-Weinberg equilibrium
Chi2 =  8.67309 p-value =  0.003229431 D =  -6.77551 f =  0.297491 
```


Inbreeding coefficient
==========================================


HWE Power
======================================
Tests for HWE have low power for small samples with a low minor allele frequency or samples that deviate only moderately from HWE. It is therefore important to be able to compute power. 

The function **HWPower** can be used to compute the power of a test for HWE. Function mac is used to compute the minor allele count. When setting $\theta=4$ we get the type 1 error rate of the test.  

Type 2 occurs when the null hypothesis is false, but erroneously fails to be rejected.  
Type 1 occurs when the null hypothesis $H_0$ is true, but is rejected

HWE Power (part 2)
=======================================


```r
 x <- c(MM = 298, MN = 489, NN = 213)
n <- sum(x)
nM <- mac(x)
pw4 <- HWPower(n, nM, alpha = 0.05, test = "exact", theta = 4,
               pvaluetype = "selome")
print(pw4)
```

```
[1] 0.04822774
```

HWE Power (part 3)
=========================================

```r
 pw8 <- HWPower(n, nM, alpha = 0.05, test = "exact", theta = 8,
                pvaluetype = "selome")
print(pw8)
```

```
[1] 0.9996853
```

HWE Power (part 4)
==========================================
These computations show that for a large sample like this one, the type I error rate (0.0482) is very close to the nominal rate, 0.05

Also the standard exact test has good power (0.9997) for detecting deviations as large $\theta = 8$, which is a doubling of the number of heterozygotes
with respect to HWE. 

Type I error rate and power for the chi-square test can be calculated
by setting **test="chisq"**. 

With the allele frequency of this sample (0.5425), $\theta = 8$ amounts to an inbreeding coefficient of -0.1698.


Plotting HWE
================================
Genetic association studies, genome-wide association studies in particular, use many genetic markers. 

In this context graphics such as ternary plots, log-ratio plots and Q-Q plots become particularly useful, because they can reveal whether HWE is a reasonable assumption for the whole data set. 

We begin to explore the Han Chinese HapMap data set by making a ternary plot.

Plotting HWE (part 2)
================================

```r
data("HapMapCHBChr1", package = "HardyWeinberg")
HWTernaryPlot(HapMapCHBChr1, region = 1, vbounds = FALSE)
```

<img src="Week6_Notes-figure/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" width="500px" height="500px" />

```
$minp
[1] 0.243975

$maxp
[1] 0.756025

$inrange
[1] 87

$percinrange
[1] 38.67

$nsignif
[1] 10
```


Plotting HWE (part 3)
==================================

```r
HWTernaryPlot(HapMapCHBChr1, region = 7, vbounds = FALSE)
```

<img src="Week6_Notes-figure/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="500px" height="500px" />

```
$minp
[1] 0.243975

$maxp
[1] 0.756025

$inrange
[1] 87

$percinrange
[1] 38.67

$nsignif
[1] 4
```


Using Vcf
==================================

Install required packages

```r
source("https://bioconductor.org/biocLite.R")
biocLite("VariantAnnotation")
```

```

The downloaded binary packages are in
	/var/folders/sd/mk5vnyyx72qbcjpjfbtncgp00000gs/T//Rtmp2cAfW7/downloaded_packages
```

Using Vcf part 2
===============================


```r
library(VariantAnnotation)
fl <- system.file("extdata", "ex2.vcf", package="VariantAnnotation")
vcf <- readVcf(fl, "hg19")
```


Using Vcf part 3
================================


```r
## The return value is a data.frame with genotype counts
## and allele frequencies.
df <- snpSummary(vcf)
df
```

```
               g00 g01 g11    a0Freq    a1Freq  HWEzscore HWEpvalue
rs6054257        1   1   1 0.5000000 0.5000000 -0.5773503 0.5637029
20:17330_T/A     2   1   0 0.8333333 0.1666667 -0.3464102 0.7290345
rs6040355       NA  NA  NA        NA        NA         NA        NA
20:1230237_T/.  NA  NA  NA        NA        NA         NA        NA
microsat1       NA  NA  NA        NA        NA         NA        NA
```

Using Vcf part 4
================================


```r
## Compare to ranges in the VCF object:
rowRanges(vcf)
```

```
GRanges object with 5 ranges and 5 metadata columns:
                 seqnames             ranges strand | paramRangeID
                    <Rle>          <IRanges>  <Rle> |     <factor>
       rs6054257       20 [  14370,   14370]      * |         <NA>
    20:17330_T/A       20 [  17330,   17330]      * |         <NA>
       rs6040355       20 [1110696, 1110696]      * |         <NA>
  20:1230237_T/.       20 [1230237, 1230237]      * |         <NA>
       microsat1       20 [1234567, 1234569]      * |         <NA>
                            REF                ALT      QUAL      FILTER
                 <DNAStringSet> <DNAStringSetList> <numeric> <character>
       rs6054257              G                  A        29        PASS
    20:17330_T/A              T                  A         3         q10
       rs6040355              A                G,T        67        PASS
  20:1230237_T/.              T                           47        PASS
       microsat1            GTC             G,GTCT        50        PASS
  -------
  seqinfo: 1 sequence from hg19 genome
```


Using Vcf part 5
===================================

 * No statistics were computed for the variants in rows 3, 4 and 5. 
 
 * They were omitted because row 3 has two alternate alleles, row 4 has none and row 5 is not a SNP.

```
                                   ALT      QUAL      FILTER
                 <DNAStringSetList> <numeric> <character>
       rs6054257                  A        29        PASS
    20:17330_T/A                  A         3         q10
       rs6040355                G,T        67        PASS
  20:1230237_T/.                           47        PASS
       microsat1             G,GTCT        50        PASS
```

PCA worked example part 1
================================

Lets go through a worked example.

Let us analyze the following 3-variate dataset with 10 observations. Each observation consists of 3 measurements on a wafer: thickness, horizontal displacement, and vertical displacement.

PCA worked example part 2
================================

$$
X=
\left[
\begin{array}
{ccc}
7 & 4 & 3 \\
4 & 1 & 8 \\
6 & 3 & 5 \\
8 & 6 & 1 \\
8 & 5 & 7 \\
7 & 2 & 9 \\
5 & 3 & 3 \\
9 & 5 & 8 \\
7 & 4 & 5 \\
8 & 2 & 2 \\
\end{array}
\right]
$$

PCA worked example part 3
================================
First compute the correlation matrix.

$$
R=
\left[
\begin{array}
{ccc}
1.00 & 0.67 & -0.10 \\
0.67 & 1.00 & -0.29 \\
-0.10 & -0.29 & 1.00 \\
\end{array}
\right]
$$

I don't think the variance has to be 1, I think the data may have just be chosen cleverly?

PCA worked example part 4
================================

I have constructed the data in R because finding eigenvalues sucks.  


```r
R<-cbind(c(1,0.67,-0.1), c(0.67,1,-0.29),c(-0.1,-0.29,1))
R
```

```
      [,1]  [,2]  [,3]
[1,]  1.00  0.67 -0.10
[2,]  0.67  1.00 -0.29
[3,] -0.10 -0.29  1.00
```

PCA worked example part 5
================================
Lets compute eigenvalues and eigenvectors


```r
eigen(R)
```

```
$values
[1] 1.7703534 0.9277398 0.3019068

$vectors
           [,1]       [,2]       [,3]
[1,]  0.6415972 0.38675484  0.6624000
[2,]  0.6866832 0.09519199 -0.7206974
[3,] -0.3417884 0.91725633 -0.2045031
```

PCA worked example part 6
================================

A couple of notes:

* Each eigenvalue satisfies $|R−\lambda I|=0$.

* The sum of the $eigenvalues=3=p$, which is equal to the trace of **R** (i.e., the sum of the main diagonal elements).

* The determinant of R is the product of the eigenvalues.

* The product is $lambda_1×\lambda_2×\lambda_3=0.499$.

PCA worked example part 6
================================

Substituting the first eigenvalue of 1.769 and **R** in the appropriate equation we obtain

$$
R=
\left[
\begin{array}
{ccc}
−0.769 & 0.670 & −0.100 \\
0.67 & 1.00 & -0.29 \\
-0.10 & -0.29 & −0.769 \\
\end{array}
\right]
\left[
\begin{array}
{c}
v_{11} \\
v_{21} \\
v_{31} \\
\end{array}
\right] = 
\left[
\begin{array}
{c}
0 \\
0 \\
0 \\
\end{array}
\right]
$$

PCA worked example part 7
================================

This is the matrix expression for three homogeneous equations with three unknowns and yields the first column of V:   0.64  0.69  -0.34  (again, a computerized solution is indispensable).

Repeating this procedure for the other two eigenvalues yields the matrix V.

$$
V=
\left[
\begin{array}
{ccc}
0.64 & 0.38 & -0.66 \\
0.69 & 0.10 & 0.72 \\
-0.34 & 0.91 & 0.20 \\
\end{array}
\right]
$$

PCA worked example part 8
================================

Now form the matrix $L^{1/2}$, which is a diagonal matrix whose elements are the square roots of the eigenvalues of R.


$$
L^{1/2}=
\left[
\begin{array}
{ccc}
1.33 & 0 & 0 \\
0 & 0.96 & 0 \\
0 & 0 & 0.55 \\
\end{array}
\right]
$$

PCA worked example part 9
================================

Then obtain **S**, the factor structure, using $S=VL^{1/2}$.

$$
S=
\left[
\begin{array}
{ccc}
0.64 & 0.38 & -0.66 \\
0.69 & 0.10 & 0.72 \\
-0.34 & 0.91 & 0.20 \\
\end{array}
\right]
\left[
\begin{array}
{ccc}
1.33 & 0 & 0 \\
0 & 0.96 & 0 \\
0 & 0 & 0.55 \\
\end{array}
\right]
=
\left[
\begin{array}
{ccc}
0.85 & 0.37 & -0.37 \\
0.91 & 0.10 & 0.40 \\
-0.45 & 0.88 & 0.11 \\
\end{array}
\right]
$$

This can be read as 0.91 is the correlation between the second variable and the first principal component.  Similiarly for other elements.  

PCA worked example part 10
================================

Next compute the communality, using the first two eigenvalues only.

$$
SS^{\prime} = 
\left[
\begin{array}
{cc}
0.85 & 0.37 \\
0.91 & 0.10 \\
-0.45 & 0.88 \\
\end{array}
\right]
\left[
\begin{array}
{cc}
0.85 & 0.91 & -0.45 \\
  0.37 & 0.09 & 0.88 \\
\end{array}
\right] = 
\left[
\begin{array}
{ccc}
0.8662 & 0.8140 & −0.0606 \\
0.8140 & 0.8420 & −0.3321 \\
−0.0606 & −0.3321 & 0.9876 \\
\end{array}
\right]
$$

PCA worked example part 11
================================
So we see from this the following results:

$$
1	0.8662 \\
2	0.8420 \\
3	0.9876 \\

$$

This means that the first two principal components "explain" 86.62% of the first variable, 84.20% of the second variable, and 98.76% of the third.

PCA worked example part 12
================================
The coefficient matrix, $B$, is formed using the reciprocals of the diagonals of $L^{1/2}$

$$
B = VL^{-1/2} = \left[
\begin{array}
{ccc}
0.48 & 0.40 & −1.20 \\
0.52 & 0.10 & 1.31 \\
-0.26 & 0.95 & 0.37 \\
\end{array}
\right]
$$

PCA worked example part 13
================================

Finally, we can compute the factor scores from ZB, where Z is X converted to standard score form. These columns are the principal factors.  

We find these values by taking the original values, subtracting the column mean, then multiplying that new matrix of the principal components coefficients matrix B.  

PCA worked example part 14
================================

$$
F = ZB = \left[
\begin{array}
{ccc}
0.41 & -0.69 & 0.06 \\
-2.11 & 0.07 & 0.63 \\
-0.46 & -0.32 & 0.30 \\
1.62 & -1.00 & 0.70 \\
0.70 & 1.09 & 0.65 \\
-0.86 & 1.32 & -0.85 \\
-0.60 & -1.31 & 0.86 \\
0.94 & 1.72 & -0.04 \\
0.22 & 0.03 & 0.34 \\
0.15 & -0.91 & -2.65 
\end{array}
\right]
$$



Google Genomics
================================
A couple years ago, Google announced an effort to collection Genomics data and work to build tools for scale.  


Google Genomics
=================================
Google has a number of tools, one of which is a tool for running Hardy Weinberg

http://googlegenomics.readthedocs.org/en/latest/use_cases/analyze_variants/hardy_weinberg_equilibrium.html

This allows to make calls to the Google Genomics endpoints to analyze our data and return the metadata we need in R.  



Using Google Genomics
===================================
Download correct files

~~~~~~~
~/projects]$ git clone git@github.com:googlegenomics/codelabs.git
~~~~~~~

Run BigQuery Analysis
===================================
~~~~~~~
sortAndLimit <- "ORDER BY ChiSq DESC, reference_name, start, alternate_bases LIMIT 1000"
result <- DisplayAndDispatchQuery("./sql/hardy-weinberg.sql",
                                  project=project,
                                  replacements=c("#_ORDER_BY_"=sortAndLimit,
                                                 queryReplacements))
~~~~~~~~






