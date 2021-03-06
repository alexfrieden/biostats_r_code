Week5_Notes
========================================================
author: Alexander Frieden
date: 02/24/2016


Extra credit
===========================
If you can fix a mistake I make in the notes, add a proof, or add an example I will give you extra credit


Paper
===========================

* Using off-target reads they are able to estimate ancestry.  

* Average off target reads is about 1-2x?

* How do we define principal components in this case according to the paper?

Paper (part 2)
===========================
* Principal Components are defined as the product of a weight vector a genotype vector, with weights reflecting the marginal information about ancestry.  

* Targeting sequencing tends to be bad at giving ancestry information.   

Paper (part 3)
==========================
* We compare each sequenced sample to a reference sample whose ancestral data is known and where the whole genome snp information is known.  

* We construct reference coordinate system.  How is this system generated?

* How do they validate this?


Validaiton
===========================

* simulate low coverage data on worldwide an european data. 

* Take targeted sequence data from 1000 genome data set.  

* Results show continental ancestry and sometimes particular areas of European ancestry.  

* To do this they built method Laser (Locating Ancestry from SEquence Reads)

World Wide Ancestry
============================

* Using data from Human Genome Diversity Panel (HGDP) consisting 938 individuals from 53 populations.  

* 700 of samples used to construct PCAs.  First four used to identify continential groups

* Accuracy assessed by comparing the ancestry estimates obtained from LASER to the PCA coordinates of test individuals using original SNP genotypes and pearson correlation coefficients and Proscrustes similiarity score.  

* Although final results were fuzzy, continental groups were well seperated.  Pearson correlation $r^2$ scores ranged from 0.7396 from PC4 to 0.9506 for PC1.  

Results
============================

![figure 2](pictures/AncestryEstimationFigure2.png)


Results (part 2)
============================

* Among samples tested, 1 European (CEU) and 1 Yoruba (YRI) nuclear family selected among the HapMap Project samples (each nuclear family included a mother, a father, and a child.)

* When using HGDP as the reference, both these families were correctly placed in the correct positions.  

Finland data set
============================

* Took 941 finnish samples from exome data set.  Used 470 individuals and at 8.4 mil SNPS with $MAF \geq 0.01$.

* Took remaining 471 individuals on this reference map using ancestry estimates derived from whole genome sequencing data as a gold standard.  How did they get whole genome data?

* Results using this were better than using exome alone.  

* $t_0 = 09763$ and $r^2 = 0.9778$ for PC1 and $r^2=0.9259$ for PC2 for LASER

* $t_0 = 08263$ and $r^2 = 0.9411$ for PC1 and $r^2=0.4373$ for PC2 for exome


Minor Allele Frequency
============================

Minor allele frequency (MAF) refers to the frequency at which the least common allele occurs in a given population. SNPs with a minor allele frequency of 5% or greater were targeted by the HapMap project.

If a SNP allele frequency is 0.05 in a population of 100 people:

Total number of alleles for each SNP: 100 * 2 = 200  (each individual has two alleles)

Total number of alleles for your SNP with a MAF of 0.05: 200 * 0.05 = 10

The minor allele is present ten times in your population. 

Minor Allele Frequency (page 2)
==============================

Note: You don't know how many heterozygote and homozygote.  What are these?

More information: http://www.ncbi.nlm.nih.gov/projects/SNP/docs/rs_attributes.html#gmaf

LASER
==============================
![laser cat](pictures/laserCat.jpg)

Its a powerful method

Step one: PCA on reference genotypes to define reference space. 
==============================

Usually the construction of principal axes follows from the classical approach to PCA, which is applied to the scaled matrix (individuals by SNPs) of observed genotypes (AA, AB, BB; say B is the minor allele in all cases).   

In this case we are doing:  Let $G$ be a matrix.  Let each $G_{ij}={0,1,2}$.  This represents the number of reference alleles at locus $j=1,...,L$ for individual $i=1,...,N$.  

$\mu_j$ is the column mean.  $\sigma_j$ is the column standard deviation.  


Step one: PCA on reference genotypes to define reference space. 
==============================

We then define $Q_{ij} = (G_{ij}-\mu_{ij})/\sigma_{ij}$.  They then run eigen decomposition which is the factorization of a matrix into eigenvalues and eigenvectors.  

To do this, let $M$ be an $N\times N$ matrix such that $M=QQ^T$


Matrix Tranpose
==============================
Transpose of a matrix is indicated as $A^T$.  It is a reflection about the diagonal.  
$$ 
\left[
  \begin{array}{ c c }
     1 & 2 \\
  \end{array} 
\right]^T = \left[
  \begin{array}{ c c }
     1 \\
     2
  \end{array} 
\right] \\
\left[
  \begin{array}{ c c }
     1 & 2 \\
     3 & 4
  \end{array} 
\right]^T = \left[
  \begin{array}{ c c }
     1 & 3\\
     2 & 4
  \end{array} 
\right] \\
\left[
  \begin{array}{ c c }
     1 & 2 \\
     3 & 4 \\
     5 & 6 
  \end{array} 
\right]^T = \left[
  \begin{array}{ c c }
     1 & 3 & 5\\
     2 & 4 & 6
  \end{array} 
\right] \\
$$
It has a number of properties that you can learn in any linear algebra book.  A number of these properties have parallels to group theory.  


Laser
============================
For our matrix $M$, the $k^{th}$ principal component given by $\lambda_k^{1/2}v_k$ where $\lambda_k$ is the kth eigen value of M and $v_k$ is the corresponding eigenvector.  


Laser: Simulating sequence data.  
============================

This is step two in our process.  This step is unneccesary if you have the aligned data for the reference individuals.  Why is this data not usually available?

For sample $h$ and locus $j$ let $C_{hj}$ tally the total number of overlapping reads and $S_{hj}$ tally the subset that match the reference allele.  Let $C^{\prime}$ and $S^{\prime}$ represent these matrixes.  Reference counts come from the following piecewise binomial function:
$$
S_{ij}^{\prime} | G_{ij},C_{ij}^\prime ~ \begin{cases} 
      Binomial(C_{ij}^\prime, \epsilon) & G_{ij} = 0 \\
      Binomial(C_{ij}^\prime, 0.05) & G_{ij} = 1 \\
      Binomial(C_{ij}^\prime, 1 - \epsilon) & G_{ij} = 2
   \end{cases}
$$
Where $\epsilon$ is the sequencing error rate per base.  For Illumina data this is Q30 which means about one in 1 in 1000 or 0.001


Laser: Procrustes Analysis
============================

We want to place the study sample in PCA reference space.  

To do this we need to do Procrustes Analysis.  

Procrustes Analysis
============================

Many terms that mean the same thing:

Procrustes superimposition  
Procrustes fitting  
Generalized Procrustes Analysis (GPA)  
Generalized least squares (GLS)  
Least squares fitting


Procrustes Analysis (part 2)
============================
* Centers all shapes at the origin (0,0,0)
* Usually scales all shapes to the same size (usually “unit size” or size =
1.0)
* Rotates each shape around the origin until the sum of squared distances
among them is minimized (similar to least-squares fit of a regression line)
* Ensures that the differences in shape are minimized

Procrustes Analysis (part 3)
============================
![procrustes](pictures/procrustes.png)

Procrustes Analysis (part 4)
============================
Sum of distances between corresponding landmarks of two shapes.
![procrustes](pictures/procrustesInR.png)



Full tutorial on procrustes 
============================
While this is from geology, still good examples:

http://www.indiana.edu/~g562/PBDB2013/Day%203A%20-%20Procrustes.pdf

Geosciences example part 1
============================

This use the PONDS dataset to demonstrate methods of PCA.  

The file pondsenv.csv contains the species
data (48 taxa) and pondsenv.csv contains the transformed environmental variables (15 variables) for 30 sites. 

We will use R and the vegan package to analyse these data using a variety of indirect ordination graphical display technique

Geosciences example part 2
============================
install packages, you may need to set repos

```r
install.packages("vegan", repos = "http://cran.us.r-project.org")
```

```

  There is a binary version available but the source version is
  later:
      binary source needs_compilation
vegan  2.3-3  2.3-4              TRUE


The downloaded source packages are in
	'/private/var/folders/sd/mk5vnyyx72qbcjpjfbtncgp00000gs/T/RtmpERZkFV/downloaded_packages'
```


Geosciences example part 3
============================


```r
install.packages("MASS", repos = "http://cran.us.r-project.org")
```

```

The downloaded binary packages are in
	/var/folders/sd/mk5vnyyx72qbcjpjfbtncgp00000gs/T//RtmpERZkFV/downloaded_packages
```

```r
library(vegan)
library(MASS)
data(varespec)
#getting dissimilarity index, ignore point is to look at procrustes  
vare.dis <- vegdist(varespec)
```

Geosciences example part 4
============================

```r
#One form of non-metric multidimensional scaling
vare.mds0 <- isoMDS(vare.dis, trace=0)
#The function provides some popular (and effective) standardization methods for community ecologists.
tmp <- wisconsin(sqrt(varespec))
#Nonmetric Multidimensional Scaling with Stable Solution from Random Starts
vare.mds <- metaMDS(varespec, trace = FALSE)
dis <- vegdist(tmp)
#One form of non-metric multidimensional scaling
vare.mds0 <- isoMDS(dis, trace = 0)
pro <- procrustes(vare.mds, vare.mds0)
```


Geosciences example part 5
============================

```r
print(pro)
```

```

Call:
procrustes(X = vare.mds, Y = vare.mds0) 

Procrustes sum of squares:
0.1568 
```


Geosciences example part 6
============================

```r
plot(pro)
```

![plot of chunk unnamed-chunk-5](Week5_Notes-figure/unnamed-chunk-5-1.png)

Laser Procrustes Analysis
============================

Using previous work (25,26) we find a transformation $f$.  This transformation includes translation, scaling, rotation, and reflection) that maximizes the similarity between $f(X)$ and $Y$ 

Remember X is the $N\times K$ matrix of reference individuals composed of K principal components from PCA on combined data. Y is the similar thing for reference only.  

Set $Z_h^*$ = f(Z_h)$ be the coordinates of the study sample in the reference coordinate space.  

Laser Procrustes Analysis (part 2)
============================

Success is then quantified by Procrustes Similarity Statistic as we saw before.  

$$
t(X,Y) = \sqrt{1 - D}
$$
Where D is the scaled minimum sum of squared Euclidean distances between $f(X)$ and Y across all possible transformations.  Values range from [0,1]

Lower Proscrustes similairty corresponds to greater uncertainty and less reliable $Z_h^*$


More notes on PCA
============================

http://www.cs.otago.ac.nz/cosc453/student_tutorials/principal_components.pdf



Bayes Theorem
============================
Last week we talked about Bayes Theorem.  Lets formally introduce it.  
$$
P(A|B) = \frac{P(B|A)P(A)}{P(B|A)P(A) + P(B| not\,A)P(not\,A)}
$$
Why is this?


Bayes Theorem (part 2)
============================
Definition of conditional probability:

$$
P(B|A) = \frac{P(A\cap B)}{P(A)}
$$
Thus
$$
P(B|A)P(A) = P(A\cap B)
$$

Bayes Theorem (part 3)
=======
$$
\begin{align}
P(A|B) & =  \frac{P(B|A)P(A)}{P(B)} \\
& = \frac{P(B|A)P(A)}{P((B\cap A)\cup(B\cap A^c))} \\
& = \frac{P(B|A)P(A)}{P(B\cap A) + P(B\cap A^c)} \\
& = \frac{P(B|A)P(A)}{P(B|A)P(A) + P(B | A^c)P(A^c)}
\end{align}
$$

This allows us to switch the conditional probability.  

PPV
======
Let $D_1$ be disease state one and let $D_2$ be disease state 2.  
Let $T^+$ be positive test result and let $T^-$ be negative test result.  

Thus 

$$
\begin{align}
P(D_1|T^+) & = \frac{P(D_1\cap T^+)}{P(T^+)} \\
& = \frac{P(D_1)P(T^+|D_1)}{P(D_1)P(T^+|D_1) + P(D_2)P(T^+|D_2)}

\end{align}
$$

ROC Curves
======================================
* In theory, we can have a test that is highly sensitive and highly specific.  

* In practice, this never happens.  

* ROC curves were first used during WWII to analyze radar effectiveness. In the early days of radar, it was sometimes hard to tell a bird from a plane. The British pioneered using ROC curves to optimize the way that they relied on radar for detecting incoming German planes.

ROC Curves (part 2)
==========

Set up our data (make sure everyone can add this library):

```r
library(ROCR)
data(ROCR.simple)
head(cbind(ROCR.simple$predictions, ROCR.simple$labels), 5)
```

```
          [,1] [,2]
[1,] 0.6125478    1
[2,] 0.3642710    1
[3,] 0.4321361    0
[4,] 0.1402911    0
[5,] 0.3848959    0
```

ROC Curves (part 3)
==========
Now, let's makde the prediction object and show its contents

```r
pred <- prediction(ROCR.simple$predictions,ROCR.simple$labels)
slotNames(pred)
```

```
 [1] "predictions" "labels"      "cutoffs"     "fp"          "tp"         
 [6] "tn"          "fn"          "n.pos"       "n.neg"       "n.pos.pred" 
[11] "n.neg.pred" 
```

```r
sn = slotNames(pred)
```

We see here we are getting back these "slots".  What are they?

Slots are linked to S4 objects. A slot can be seen as a part, element or a "property" of an object. Say you have a car object, then you can have the slots "price", "number of doors", "type of engine", "mileage".  

While this example is somewhat trivial, each slot can again be a complex object.  

ROC Curves (part 4)
===============

Let's use the ROCR.hiv dataset to show how this works if more than one set of predictions and labels are supplied. 

Here we pass a list of (10) predictions and a list of labels to the prediction function:


```r
data(ROCR.hiv)
manypred = prediction(ROCR.hiv$hiv.nn$predictions, ROCR.hiv$hiv.nn$labels)
sapply(sn, function(x) length(slot(manypred, x)))
```

```
predictions      labels     cutoffs          fp          tp          tn 
         10          10          10          10          10          10 
         fn       n.pos       n.neg  n.pos.pred  n.neg.pred 
         10          10          10          10          10 
```


ROC Curves (part 5)
====================

We see that all the slots are still lists, but now they have length (10), corresponding to the (10) predictions/labels. 

We would get the same result if the 2 arguments were matrices, but that would require all predictions and labels to have the same length. Using a list of predictions/labels is a bit more flexible.

Code on next page.

ROC Curves (part 6)
====================




```r
sapply(sn, function(x) class(slot(manypred, x)))
```

```
predictions      labels     cutoffs          fp          tp          tn 
     "list"      "list"      "list"      "list"      "list"      "list" 
         fn       n.pos       n.neg  n.pos.pred  n.neg.pred 
     "list"      "list"      "list"      "list"      "list" 
```


Performance Method
============================
We see that the first argument is a prediction object, and the second is a measure. If you run ?performance, you can see all the performance measures implemented.

We will do example of some commonly estimated measures: receiver operating characteristic (ROC) curves and area under the curve (AUC)


```r
#performance(prediction.obj, measure, x.measure="cutoff", ...)
```

false positive rate (FPR)
==============================
The false positive rate is the percentage of healthy individuals who incorrectly receive a positive test result.

true positive rate (TPR)
==============================
The proportion of positives that are correctly identified as such.  Also called the sensitivity.  

ROC
==============================

We will do an ROC curve, which plots the false positive rate (FPR) on the x-axis and the true positive rate (TPR) on the y-axis:
<img src="Week5_Notes-figure/myplot-1.png" title="plot of chunk myplot" alt="plot of chunk myplot" width="1920px" />

ROC
==============================
* At every cutoff, the TPR and FPR are calculated and plotted. 

* The smoother the graph, the more cutoffs the predictions have. 

* We also plotted a 45-degree line, which represents, on average, the performance of a Uniform(0, 1) random variable. 

* The further away from the diagonal line, the better. Overall, we see that we see gains in sensitivity (true positive rate, (> 80%)), trading off a false positive rate (1- specificity), up until about 15% FPR. After an FPR of 15%, we don't see significant gains in TPR for a tradeoff of increased FPR.


ROC
======================

In general we want to optimize the area under the curve in an attempt to get as close to one as possible (Why one?)

Motivation
======================
Let us begin with a special case. Our data is a a Binomial random variable $X$ with
parameters 10 and $p_0$. The parameter $p_0$ is a fixed constant, unknown to us. That is:
$$
f(x;p_0) = P_{p_0}(X = x) = \binom {a}{b}p_0^x(1-p_0)^{n-x}
$$
Suppose that we observe $X=3$.  This we regard as our fixed data.  

Our goal, as in all point estimation problems, is to estimate the actual parameter value
p0 based on the available data.

Motivation (part 2)
======================
We consider now some thought experiments. We do not know $p_0$.  However we can consider the scenario in which the value of $p_0$ is 1/2.  

Under this particular assumption, the probability of generating the data which we actually saw – namely X = 3 - is
$$
f(3;0.5) = P_{0.5}(X=3) = \binom {10}{3}(0.5)^3(0.5)^{7} \approx 0.117
$$

We can calculate this probability under the assumption that $p_0 = p$ for each $p \in [0, 1]$. For a given $p$, this probability is
$$
f(3;p) = P_p(X=3) = \binom{10}{3}p^3(1-p)^7
$$

Motivation (part 3)
======================
We thus obtain a function $f(3;p)$.  This function is called the **likelihood function**.  We denote this by $L(p;3)$

The principle of maximum likelihood says we should use as our estimate of $p_0$ the value
$p$ which makes $L(p; 3)$ as large as possible. 

Makes sense: we pick the parameter value $p$ which makes the observed data most likely when assuming $p_0$ equals $p$.

Motivation (part 4)
========================

Notice that since log is an increasing function, the value of $p$ which maximizes $L(p; 3)$ is the same value which maximizes $\log L(p; 3)$.

It is often convenient to maximizes the logarithm of the likelihood function instead of the function itself, so we give this function a name and notation: we write $\ell(p; 3)$ for the log-likelihood function:
$$
\ell(p; 3) = \log L(p;3)
$$

Motivation (part 4)
========================

Here we get:
$$
\ell(p;3) = 3\log(p) + 7\log(1-p) + \log(\binom{n}{k}) 
$$

Motivation (part 5)
========================
We note in particular the $\ell$ has a unique maximum at the single critical point.  


![Plot of log likelihood](pictures/logLikelihoodPlot.png)

Motivation (part 6)
========================

Let us compute:
$$
\begin{align}
0 &= \frac{\partial\ell}{\partial{p}}(p;3) \\
0 &= \frac{3}{p} - \frac{7}{1-p} \\
0 &= 3(1-p) - 7p \\
p &= \frac{3}{10}
\end{align}
$$
Thus the value of p maximizing $\ell(p;3)$ is $p=\frac{3}{10}$.  We call this the **maximum likelihood estimate** of $p_0$ for $X=3$

Maximum Likelihood
=====================
Lets generalize this:

if $X=k$ where $k=0,1,...,n$ the maximum likelihood estimate $p_0$ would be k/n.  

Thus, the estimate is determined by the value of X, and we have the estimator $\hat{\mu}(X) = \bar{X}$

Poisson Distribution
=====================
a discrete frequency distribution that gives the probability of a number of independent events occurring in a fixed time.


Suppose we conduct a Poisson experiment, in which the average number of successes within a given region is $\mu$. Then, the Poisson probability is:
$$
p(x;\mu) = \frac{e^{-\mu}\mu^x}{x!}
$$
where x is the actual number of successes that result from the experiment.  The mean for this and the variance for this is equal to $\mu$

Example Poisson experiment
=====================
The average number of homes sold by the Acme Realty company is 2 homes per day. What is the probability that exactly 3 homes will be sold tomorrow.  

Example
=====================
Let $X_1,...,X_n$ be iid collection of Poisson($\mu$) random variables where $\mu > 0$.  Then our likelihood is:
$$
\begin{align}
L(\mu;x) &= \prod_{i=1}^n\frac{e^{-\mu}\mu^{x_i}}{x_i!} \\
&= e^{-n\mu}\mu^{\sum_{i=1}^{n}x_i}\frac{1}{\prod_{i=1}^{n}x_i!}
\end{align}
$$
Thus
$$
\ell(\mu;x) = -n\mu + \sum_{i=1}^{n}x_i\log\mu - \log\prod_{i=1}^{n}x_i!
$$

Example (part 2)
=====================
Note that $\ell$ is differentiable over (0,$\infty$).  Lets calculate the critical points:

$$
\begin{align}
0 &= \frac{\partial\ell}{\partial\mu}(\mu;x) \\
&= -n + \frac{\sum_{i=1}^{n}x_i}{\mu}
\end{align}
$$
So we get $\mu=\bar{x}$.  And note the average of $x$ here means
$$
\bar{x} = \frac{\sum_{i=1}^{n}x_i}{n}
$$
Using some further calculus we see that this is not just a local maximum but in fact a global maximum and $\hat{\mu(X)} = \bar{X}$

More on this
========================

http://www.math.utah.edu/~levin/M5080/mle.pdf

Maximum Likelihood definition as it pertains to applications
======================

Maximum likelihood, also called the maximum likelihood method, is the procedure of finding the value of one or more parameters for a given statistic which makes the known likelihood distribution a maximum. 

The maximum likelihood estimate for a parameter $\mu$ is denoted $\hat{\mu}$

MLE proceeds to maximise a likelihood function, which in turn maximises the agreement between the model and the data.

Maximum Likelihood (part 2)
======================

First generate data

```r
set.seed(1001)
N <- 100
x <- rnorm(N, mean = 3, sd = 2)
mean(x)
```

```
[1] 2.998305
```

```r
sd(x)
```

```
[1] 2.288979
```

Maximum Likelihood (part 3)
======================
formulate the log-likelihood function

```r
LL <- function(mu, sigma) {
R = dnorm(x, mu, sigma)
-sum(log(R))
  }
```


Maximum Likelihood (part 4)
======================
MLE to estimate the two parameters (mean and standard deviation) for which the normal distribution best describes the data.

```r
library(stats4)
mle(LL, start = list(mu = 1, sigma=1))
```

```

Call:
mle(minuslogl = LL, start = list(mu = 1, sigma = 1))

Coefficients:
      mu    sigma 
2.998305 2.277506 
```


Maximum Likelihood (part 5)
======================

```r
dnorm(x, 1, -1)
```

```
  [1] NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
 [18] NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
 [35] NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
 [52] NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
 [69] NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
 [86] NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN
```
What?  Why are we getting all these NaNs?

Maximum Likelihood (part 6)
======================
They are produced when negative values are attempted for the standard deviation.

There are two ways to sort this out. The first is to apply constraints on the parameters. The mean does not require a constraint but we insist that the standard deviation is positive.


```r
mle(LL, start = list(mu = 1, sigma=1), method = "L-BFGS-B", lower = c(-Inf, 0),
      upper = c(Inf, Inf))
```

```

Call:
mle(minuslogl = LL, start = list(mu = 1, sigma = 1), method = "L-BFGS-B", 
    lower = c(-Inf, 0), upper = c(Inf, Inf))

Coefficients:
      mu    sigma 
2.998304 2.277506 
```

Maximum Likelihood (part 7)
======================

This works because mle() calls optim(), which has a number of optimisation methods. The default method is BFGS. An alternative, the L-BFGS-B method, allows box constraints.

Another reason to look at R docs.  

Maximum Likelihood (part 8)
======================
The maximum-likelihood values for the mean and standard deviation are damn close to the corresponding sample statistics for the data. 

Of course, they do not agree perfectly with the values used when we generated the data: the results can only be as good as the data. 

If there were more samples then the results would be closer to these ideal values.

Fitting Linear Model (part 1)
======================
Lets try fitting a linear model.  

runif generates random deviates for the uniform distribution.  What does a uniform distribution look like?

Lets generate some more data.  

```r
x <- runif(N)
y <- 5 * x + 3 + rnorm(N)
```

Fitting Linear Model (part 2)
======================

Fit this model using least squares regression.

```r
fit <- lm(y ~ x)
summary(fit)
```

```

Call:
lm(formula = y ~ x)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.96206 -0.59016 -0.00166  0.51813  2.43778 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   3.1080     0.1695   18.34   <2e-16 ***
x             4.9516     0.2962   16.72   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.8871 on 98 degrees of freedom
Multiple R-squared:  0.7404,	Adjusted R-squared:  0.7378 
F-statistic: 279.5 on 1 and 98 DF,  p-value: < 2.2e-16
```

Fitting Linear Model (part 3)
======================
Lets look at a visualization

```r
plot(x, y)
abline(fit, col = "red")
```

![plot of chunk plot_linear_fit](Week5_Notes-figure/plot_linear_fit-1.png)

Fitting Linear Model (part 4)
======================
Now lets perform Maximum Likelihood Estimation.  

First we need a likelihood function. The model is not a PDF, so we can’t proceed in precisely the same way that we did with the normal distribution. 

However, if you fit a linear model then you want the residuals to be normally distributed. So the likelihood function fits a normal distribution to the residuals.

Fitting Linear Model (part 5)
======================
Remember we are estimating beta0 and beta1

```r
LL <- function(beta0, beta1, mu, sigma) {
    # Find residuals
    #
    R = y - x * beta1 - beta0
    #
    # Calculate the likelihood for the residuals (with mu and sigma as parameters)
    #
    R = suppressWarnings(dnorm(R, mu, sigma))
    #
    # Sum the log likelihoods for all of the data points
    #
    -sum(log(R))
}
```


Fitting Linear Model (part 6)
======================
We can actually refine our function to move the log inside the dnorm.  This will give our p values as log(p)

```r
#LL <- function(beta0, beta1, mu, sigma) {
#    R = y - x * beta1 - beta0
#    #
#    R = suppressWarnings(dnorm(R, mu, sigma, log = TRUE))
#    #
#    -sum(R)
#}
```

Fitting Linear Model (part 7)
======================
It turns out that the initial guess is again rather important and a poor choice can result in errors.  Here we have chosen poorly

```r
# This will produce errors
#fit <- mle(LL, start = list(beta0 = 3, beta1 = 1, mu = 0, sigma=1))
```

But if we choose values that are reasonably close then we get a decent outcome.

```r
fit <- mle(LL, start = list(beta0 = 4, beta1 = 2, mu = 0, sigma=1))
```

Fitting Linear Model (part 8)
======================
Now lets look at the values

```r
summary(fit)
```

```
Maximum likelihood estimation

Call:
mle(minuslogl = LL, start = list(beta0 = 4, beta1 = 2, mu = 0, 
    sigma = 1))

Coefficients:
        Estimate   Std. Error
beta0  3.5540217 1.186328e+04
beta1  4.9516133 2.931924e-01
mu    -0.4459783 1.186328e+04
sigma  0.8782272 6.209970e-02

-2 log L: 257.8177 
```


Fitting Linear Model (part 9)
======================

It stands to reason that we actually want to have the zero mean for the residuals. We can apply this constraint by specifying mu as a fixed parameter. 

Another option would be to simply replace mu with 0 in the call to dnorm(), but the alternative is just a little more flexible.

Fitting Linear Model (part 10)
======================


```r
fit <- mle(LL, start = list(beta0 = 2, beta1 = 1.5, sigma=1), fixed = list(mu = 0),
             nobs = length(y))
summary(fit)
```

```
Maximum likelihood estimation

Call:
mle(minuslogl = LL, start = list(beta0 = 2, beta1 = 1.5, sigma = 1), 
    fixed = list(mu = 0), nobs = length(y))

Coefficients:
       Estimate Std. Error
beta0 3.1080423 0.16779428
beta1 4.9516164 0.29319233
sigma 0.8782272 0.06209969

-2 log L: 257.8177 
```


Fitting Linear Model (part 11)
======================
The resulting estimates for the slope and intercept are rather good. And we have standard errors for these parameters as well.

Next week
======================
Hardy-Weinberg Equilibrium


