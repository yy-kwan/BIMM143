Class 7 R function and packages
================

## R functions revisited

``` r
source("http://tinyurl.com/rescale-R")
```

``` r
rescale(1:10)
```

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000

``` r
rescale(c(1,10,5,NA,6))
```

    ## [1] 0.0000000 1.0000000 0.4444444        NA 0.5555556

is.numeric(1:10)
    \!is.numeric(c(1,5,NA,10,“barry”))

``` r
rescale2(c(1:10),"barry")
```

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000

## A new function called both\_na()

Write a function to find where there are NA elements in two input
vectors. First make some simple input where I know the answer

``` r
x<-c(1,2,NA,3,NA)
y<-c(NA,3,NA,3,4)
```

Looked online and found the **is.na** function

``` r
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

and the **which()** function tells me where the TRUE values are

``` r
which(is.na(x))
```

    ## [1] 3 5

``` r
which(is.na(y))
```

    ## [1] 1 3

The AND function requires two input TRUE to give a TRUE output

``` r
is.na(x)&is.na(y)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

Taking the **sum()** of TRUE FALSE vector will tell me how many TRUE
elements I have.This is my working snippet\!

``` r
sum(is.na(x)&is.na(y))
```

    ## [1] 1

``` r
sum(c(TRUE,TRUE,FALSE,TRUE))
```

    ## [1] 3

Now turn it into a function

``` r
both_na<- function(x,y){
sum(is.na(x)&is.na(y))
}
```

``` r
both_na(x,y)
```

    ## [1] 1

Test function

``` r
x<-c(NA,NA,NA)
y1<-c(1,NA,NA)
y2<-c(1,NA,NA,NA)
```

``` r
x2<-c(NA,NA)
both_na(x2,y2)
```

    ## [1] 3

``` r
x<-c(NA,NA,NA)
y3<-c(1,NA,NA,NA,NA,NA,NA)
```

``` r
both_na2<- function(x,y){
sum(is.na(x)&is.na(y))
}
```

``` r
both_na2<-function(x,y){
  if(length(x)!=length(y)){
    stop("inputs x and y should be the same length!")
  }
  sum(is.na(x)&is.na(y))
}
```

Practice

``` r
#student1
s1<-c(100,100,100,100,100,100,100,90)
#student2
s2<-c(100,NA,90,90,90,90,97,80)

mean(s1[-which.min(s1)])
```

    ## [1] 100

``` r
which.min(s2)
```

    ## [1] 8

``` r
s2[-which.min(s2)]
```

    ## [1] 100  NA  90  90  90  90  97

``` r
mean(s2[-which.min(s2)],na.rm=TRUE)
```

    ## [1] 92.83333

We have our working code now turn it into a first function

``` r
grade<-function(x){
  if(any(is.na(x))){
    warning("Student is missing a homework")
  }
  mean(x[-which.min(x)],na.rm=TRUE)
}
```

``` r
grade2<-function(x){
  if(any(is.na(x))){
    warning("Student is missing a homework")
  }
  sum(x[-which.min(x)],na.rm=TRUE)/(length(x)-1)
}
```

``` r
url<-"http://tinyurl.com/gradeinput"
hw<-read.csv(url,row.names=1)
```
