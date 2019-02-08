
# Base Plotting
# Using plot() to study continous variables

ir<-iris
dim(iris)
str(iris)
plot(x=iris$Petal.Width,y=iris$Petal.Length)

# Adding xlabels,ylabels and title
plot(x=ir$Petal.Width,y=ir$Petal.Length, main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"), ylab=c("Petal Length"))

# Adding colours
plot(x=ir$Petal.Width,y=ir$Petal.Length, main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"), ylab=c("Petal Length"),col="red")

#Adding different plotting symbol
plot(x=ir$Petal.Width,y=ir$Petal.Length, main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"), ylab=c("Petal Length"),col="red",pch=2)


plot(x=ir$Petal.Width,y=ir$Petal.Length, main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"), ylab=c("Petal Length"),col="red",pch=3)

plot(x=ir$Petal.Width,y=ir$Petal.Length, main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"), ylab=c("Petal Length"),col="red",pch=4)

# Adding more option
plot(x=ir$Petal.Width,y=ir$Petal.Length, main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"), ylab=c("Petal Length"),col="red",pch=4,lwd=2)


# Making conditional bivariate plot
# Seeing relationship across different species

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col=ir$Species)

# Different symbols for different species

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=as.numeric(ir$Species))

# Changing the size of the points for different species

plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),cex=as.numeric(ir$Species))

# Simultaniously changing the size and colour for different species
plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),cex=as.numeric(ir$Species),col=ir$Species)

# Adding legends
plot(x=ir$Petal.Width,y=ir$Petal.Length,main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),pch=as.numeric(ir$Species),col=ir$Species)

legend(0.2,7,c("setosa","versicolor","virginica"),pch=1:3)

# Studying univariate plots: boxplot(),hist()
# Box plots
boxplot(ir$Petal.Length)
summary(ir$Petal.Length)# Mean< Median : negatively skewed

boxplot(ir$Sepal.Width)
summary(ir$Sepal.Width)# Mean > Median : positively skewed

# Improving the asethetics of the boxplot 
boxplot(ir$Petal.Length,col="red",main="Distribution of petal length")

# Plotting sepal width(continious variable) across all the species(categorical variable)
plot(x=ir$Species,y=ir$Sepal.Width,xlab="Species",ylab="Sepal Width",
     main="Sepal Width across Species")

# Histogram: used to visualize the count of a continious variable
# hist():function used
# breaks:the number of bins
# label: labels the frequency of each bin
# xlim: sets the range for x-axis

hist(ir$Sepal.Width,col="orange")
hist(ir$Sepal.Width,col="orange",labels = TRUE)
hist(ir$Sepal.Width,col="orange",freq = FALSE)
hist(ir$Sepal.Width,col="orange",freq = FALSE,labels = TRUE)
lines(density(ir$Sepal.Width))

# Displaying more than one plot : par(), mfrow()

# Adding multiple plots in single plotting window
par(mfrow=c(1,2))
plot(x=ir$Species,y=ir$Sepal.Width,xlab="Species",ylab="Sepal Width across species",
     col="red")
plot(x=ir$Species,y=ir$Sepal.Length,xlab="Species",ylab="Sepal Length across species",
     col="red")
dev.off() # Return to default state


## GGPLOT2()
# Grammer of graphics: Aesthetic mapping,Geom,Stastical transformation,coordinate system and scales
# Setting aesthetic mapping
# p<- ggplot(ch,aes(x=variable to be mapped to x axis,y= variable to be mapped
#      on y axis,colour=variable by which the color should change...etc...))
# p+geom_type of geometry(stat="stastical transformation of data")

setwd("C:\\Git\\Data_Visualization_with_R")
dm<- read.csv("dm.csv")
names(dm)
library(ggplot2)
# Direct marketing data

#Understanding the relationship between Salary and Amount Spent
p<- ggplot(dm,aes(x=Salary,y=AmountSpent))
p+geom_point()

# Understand the conditional relationship based on gender
p+geom_point(aes(colour=Gender))

# Improving the aesthetics
p+geom_point(aes(colour=Gender))+xlab("Salary in $")+ylab("Expenditure in $")

# Histogram
p<- ggplot(dm,aes(x=AmountSpent))
p+geom_histogram()

# Understanding gender wise distribution
p+geom_histogram(aes(fill=Gender))
# Modifying the position
p+geom_histogram(aes(fill=Gender),position = "dodge")

# Alternative is faceted graphs
p+geom_histogram(aes(fill=Gender))+facet_grid(Gender~.)

# Polishing the graph
p+geom_histogram(aes(fill=Gender,colour=Gender),alpha=0.3)+facet_grid(Gender~.)

# Boxplot
p<- ggplot(dm,aes(x=Gender,y=AmountSpent,fill=Gender))
p+geom_boxplot()

# Density plot
options(scipen=999)
p<-ggplot(dm,aes(x=AmountSpent))
p+geom_density()


# Conditional density plot
p+geom_density(aes(fill=Gender))

#Improving the plot
p+geom_density(aes(fill=Gender,colour=Gender),alpha=0.4)

# Understanding bivariate counts: 2d bivariate plots, 2d heatmaps
p<-ggplot(dm,aes(x=Salary,y=AmountSpent))
p+geom_bin2d()



# Visualize Heart Disease dataset
# Set the working directory
setwd("C:\\Git\\Data_Visualization_with_R")

# Read the data set
HD<- read.csv("case_study_heart_disease_data_set.csv")
head(HD)
str(HD)

# Checking and changing the data types
HD$Sex <-as.factor(HD$Sex)
HD$cp<- as.factor(HD$cp)
HD$fbs<-as.factor(HD$fbs)
HD$restecg<-as.factor(HD$restecg)
HD$exang<-as.factor(HD$exang)
HD$slope<- as.factor(HD$slope)
HD$num<- as.factor(HD$num)
HD$DV<- as.factor(HD$DV)

names(HD)
# Resting blood pressure
p<-ggplot(HD,aes(x=trestbps))
p+geom_histogram(aes(fill=as.factor(DV)),position = "dodge")+facet_grid(Sex+thal~cp+exang)

# Categorical variable in the chart:
# Gender+summary of heart condition("3"=normal,"6"=fixed defect,"7"=reversible defect)
# chest pain type + exang(Indicator of whether the angina is exercise induced ("1"=yes, "0"=no))

# Boxplots

# Relation of: Resting blood pressure (in mm Hg on admission to the hospital)
# across Gender and chest pain type

p<-ggplot(HD,aes(y=trestbps,x=as.factor(DV),fill=as.factor(DV)))
p+geom_boxplot()+facet_grid(Sex~cp)






