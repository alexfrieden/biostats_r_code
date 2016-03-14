Week7 Notes
========================================================
author: Alexander Frieden 
date: 3/10/2016

Genetics Primer
========================================================

It has come to my attention that I need to go over some of the genetics we are doing


SNP
==========================================

Single nucleotide polymorphism

This is the result of a single basepair being swapped for a different one.  

![snp](pictures/snp.jpeg)

Indel
=========================================

* This is any insertion deletion or any multi-basepair substitution (which is really a deletion or insertion). 

* Theoretically a structural variation such as the deletion of an entire gene can be thought of as an indel

* Practically, we keep them seperate.  This is usually due to the nature of how computational algorithms call small indels vs how they call structural variations.  

Gene vs Genome
=========================================

* The gene is one of the larger strucutres of cell biology and is the key of which we map proteins that are coded from them onto.  

* The genome is the union of all genes plus the sections between the genes.  

Reads
========================================
Multiple, fragmented sequence reads must be assembled together on the basis of their overlapping areas.

Variants are then called from this person.  


Reads (continued)
========================================
![reads](pictures/reads.png)



Classification
========================================

Sometimes we don't want to predict a value i.e. how much money will I have in a year but I want to estimate a qualitative value.  

This is called classifing a valitative response or **classification**.  

Examples
========================================

* A person arrives at the emergency room with a set of symptoms that could possibly be attributed to one of three medical conditions.  Which of the three conditions does the individual have?

* An online banking service must be able to determine whether or not a transaction being performing on the site is fraudulent, on the basis of a user's IP address, past transaction history, and other features.

* On the basis of DNA variation data for a number of patients with and without a given disease, we would like to discern which variants are deleterious (disease causing) and which are not.

Note
========================================

For the computer scientists in the room, a lot of this will sound very similar to machine learning, and that is because it is.  

Instead of finding a pattern or threshold, we are finding things that fall enough outside of our distribution that they qualify for or against a classification (such as GOOD or BAD) and we can process them as such.  


Training
========================================

Just like in regression, we have a set of training observations

$$
(x_1,y_1),(x_2,y_2),...,(x_n,y_n)
$$

that we can use to build a classifier.

Training Data
========================================

We want our classifier to perform well on our training data but also on our test data.  

As a matter of practice, you *never* use the same training set as your test set.  This creates a false sense of security in your classifier and you won't be accurately testing your data.  
Default data set
==========================================

For this we will use the **default** dataset


```r
library(ISLR)
#data("Default")
#attach(Default)
#
head(Default)
```

```
  default student   balance    income
1      No      No  729.5265 44361.625
2      No     Yes  817.1804 12106.135
3      No      No 1073.5492 31767.139
4      No      No  529.2506 35704.494
5      No      No  785.6559 38463.496
6      No     Yes  919.5885  7491.559
```


Plot difference
===========================


```r
default.yes <- subset(Default,default=="Yes")
default.no <- subset(Default,default=="No")
plot(default.yes$balance,default.yes$income, col="blue")
points(default.no$balance,default.no$income,col="red")
```

![plot of chunk unnamed-chunk-2](Week7_Notes-figure/unnamed-chunk-2-1.png)

More clearly
===============================

![](pictures/gareth_4.1a.pdf)




Fisher's Exact Test
========================================


