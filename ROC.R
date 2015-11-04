library(ggplot2)
library(RColorBrewer)
mydata <- read.table("senSpecTable.txt",header = TRUE)
p <- qplot(FPR, TPR, data = mydata, geom = "blank", main = "ROC curve", 
           xlab = "False Positive Rate (1-Specificity)", 
           ylab = "True Positive Rate (Sensitivity)" )


ggplot(df,aes(FPR,TPR))+geom_line(size = 1, alpha = )+
  labs(title= "ROC curve", 
       x = "False Positive Rate (1-Specificity)", 
       y = "True Positive Rate (Sensitivity)")

basicplot <- ggplot(mydata, aes(d = D, m = M1))


library(ggplot2)

diamonds$is_expensive <- diamonds$price > 2400
is_test <- runif(nrow(diamonds)) > 0.75
train <- diamonds[is_test==FALSE,]
test <- diamonds[is_test==TRUE,]

summary(fit <- glm(is_expensive ~ carat + cut + clarity, data=train))
auc <- auc@y.values[[1]]

roc.data <- data.frame(fpr=unlist(perf@x.values),
                       tpr=unlist(perf@y.values),
                       model="GLM")
ggplot(roc.data, aes(x=fpr, ymin=0, ymax=tpr)) +
  geom_ribbon(alpha=0.2) +
  geom_line(aes(y=tpr)) +
  ggtitle(paste0("ROC Curve w/ AUC=", auc))
