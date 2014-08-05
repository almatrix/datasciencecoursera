## Bernoulli distribution: the result of binary outcome
# Bernoulli random variable take values only 0 or 1 with a probability p
# e.g.: 0,0,1,0,0,0,1,0,0,0
# PMF: P(X=x) = p^x * (1-p)^(1-x)
n = 10; x = 2  #suppose we observe the exampler sequence 
# then maximum likelihood estimator for p should be 2/10=0.2
# but let's see whether it is with the maximum likelihood
pvals = seq(0, 1, length=1000)  # try all possible p
# the likelihood of observing the exampler sequence under each probability
likelihood = pvals^x*(1-pvals)^(n-x) 
plot(pvals, likelihood, type="l")
# as shown in the figure, MLE of p should be 0.2


## Binomial distribution
# Binomial random variables are obtained as the sum of Bernoulli trials (p)
# e.g.: 2  (for the above Bernoulli trials)
# PMF: P(X=x) = choose(n,x) * p^x * (1-p)^(n-x)
n = 100; x=1:n; p=0.2;
px = choose(n,x) * p^x * (1-p)^(n-x)
plot(x, px)
# give a binomial observation (regardless of order), solve MLE of Bernoulli p
pvals = seq(0, 1, length=1000)  # try all possible p
n = 10; x = 2; 
# the likelihood of observing 2 successes in 10 trials under each probability
likelihood = choose(n,x) * pvals^x*(1-pvals)^(n-x) 
plot(pvals, likelihood, type="l")
# compare figure here and the one for Bernoulli trial


## Normal distribution
zval = seq(-3,3,length=1000)
plot(zval, dnorm(zval), type="l", frame=FALSE, xlab="z", ylab="Density")


## Posisson distribution 
# PMF: P(X=x,lambda) = (lambda^x * exp(-lambda))/factorial(x)
n = 100; x=1:n; lambda = 20;
px = (lambda^x * exp(-lambda))/factorial(x)
plot(x, px)
## Poisson <-> binomial (approximation)
# lambda = n * p


## the law of large numbers: LLN
n = 10000
nrn = rnorm(n)  # n normal random variables
means = cumsum(nrn)/(1:n)  # the mean of the first i normal variables
plot(1:n, means, type="l")
abline(h=0)  # the average converges to what thery are estimating


## the central limit theorem: CLT
# dices experiment
obs1 = round(runif(5000,min=0.6,max=6.4)) 
obs2 = round(runif(5000,min=0.6,max=6.4))  
obs3 = round(runif(5000,min=0.6,max=6.4))  
obs4 = round(runif(5000,min=0.6,max=6.4))  
obs5 = round(runif(5000,min=0.6,max=6.4)) 
obs6 = round(runif(5000,min=0.6,max=6.4))  
# take only one observation for each die
mean_oneobs = obs1
z_oneobs = (mean_oneobs-3.5)/1.71
# take two observations for each die
mean_twoobs = (obs1 + obs2)/2
z_twoobs = (mean_twoobs-3.5)/1.71*sqrt(2)
# take six observations for each die
mean_sixobs = (obs1 + obs2 +obs3 +obs4 +obs5 +obs6)/6
z_sixobs = (mean_sixobs-3.5)/1.71*sqrt(6)
par(mfrow=c(1,3))
plot(zval, dnorm(zval), type="l")
lines(density(as.numeric(z_oneobs)),col = "firebrick2")
plot(zval, dnorm(zval), type="l")
lines(density(as.numeric(z_twoobs)),col = "firebrick2")
plot(zval, dnorm(zval), type="l")
lines(density(as.numeric(z_sixobs)),col = "firebrick2")
par(mfrow=c(1,1))
# random variable generator:
# http://blog.csdn.net/lilanfeng1991/article/details/18505723
# coin flip example
p=0.1
flips = matrix(data=rbinom(500*20,1,p) , nrow=20, ncol=500)
# take only one observation for each die
mean_oneobs = flips[1,]
z_oneobs = (mean_oneobs-p)/(sqrt(p*(1-p)/1))
# take two observations for each die
mean_tenobs = (flips[1,] + flips[2,] + flips[3,] + flips[4,] + flips[5,] +
                  flips[6,] + flips[7,] + flips[8,] + flips[9,] + flips[10,])/10
z_tenobs = (mean_tenobs-p)/(sqrt(p*(1-p)/10))
# take six observations for each die
mean_tweobs = (flips[1,] + flips[2,] + flips[3,] + flips[4,] + flips[5,] +
                  flips[6,] + flips[7,] + flips[8,] + flips[9,] + flips[10,] +
            flips[11,] + flips[12,] + flips[13,] + flips[14,] + flips[15,] +
        flips[16,] + flips[17,] + flips[18,] + flips[19,] + flips[20,])/20
z_tweobs = (mean_tweobs-p)/(sqrt(p*(1-p)/20))
par(mfrow=c(1,3))
plot(zval, dnorm(zval), type="l")
lines(density(as.numeric(z_oneobs)),col = "firebrick2")
plot(zval, dnorm(zval), type="l")
lines(density(as.numeric(z_tenobs)),col = "firebrick2")
plot(zval, dnorm(zval), type="l")
lines(density(as.numeric(z_tweobs)),col = "firebrick2")
par(mfrow=c(1,1))



## practical use of CLT: confidence interval
