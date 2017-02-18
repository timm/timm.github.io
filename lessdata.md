
# Many  Models Are Low-dimensional (or Not at All)



_The computing scientists main challenge is not to get confused by the complexities of (their) own making._   
-- E.W. Dijkstra

Much data is redundant, noisy, or irrelevant. For example:

- If a model can be generated from a table of data, then that table contains enough examples to learn that model.
- That is, many rows are actually echoes of a smaller number of underlying effects called _prototypes_.

So one way to use less data is to only share a small number of prototypes; i.e. use fewer rows.
Not only that, but we can use fewer columns:

- The following figure 
 argues  in the expected case, models can only use a small number of columns.
 - Otherwise, there would not be enough data to cover all the possible values of all the columns). 
 
<a href="img/dist.jpg"><img src="img/dist.jpg" width=460></a>

 That is, if we were so foolish as to try to build high-dimensional models, we would fail as the region where we can find related examples would become vanishingly small. Note that this is often called the _curse of dimensionality_.

- <em>"When the dimensionality increases, the volume of the space increases so fast that the available data becomes sparse. This sparsity is problematic for any method that requires statistical significance. In order to obtain a statistically sound and reliable result, the amount of data needed to support the result often grows exponentially with the dimensionality."</em> -- [Wikipedia](http://en.wikipedia.org/wiki/Curse_of_dimensionality)


Note this curse can also be a blessing:

- Because it is impossible to find the data to support bigger models, then all we need ever do is build small ones;
- Which, in turn, means that we might be able to build those small models for just a little data;
- Which also means that we need only share small amounts of data.

There is much empirical evidence that just because a data set has n columns, we need not use them all. Numerous researchers have examined what happens when a data miner deliberately ignores some of the columns in the training data. For example, the experiments of Ron Kohavi and George John show that, on numerous real-world datasets, over 80% of columns can be ignored. Further, ignoring those columns doesn't degrade the learner's classification accuracy (in fact, it sometimes even results in small improvements).

Further, if we combine both prototype and column selection, the net result can be a dramatic reduction in the complexity of the data:

- In the book [Sharing Data and Models in Software Enginerring, chapter 15](http://www.sciencedirect.com/science/article/pii/B9780124172951000151),
  we show experiments where 100s to 1000s of defect reports to
  tiny tables 2 dozen rows and half a cdozen columns.
- A concern with making such a short summary is that some information has been lost. To check that, Papakroni
  build defect predictors (using Random Forests) from the full data and the condensed data.
- But, in those experiments,
  the predictions from the summary were no different than those using the full data set.

The only way larger data sets can be summarized to smaller ones is
if there is some superfluous details in the larger set. Hence,
before we can advocate such summarizations we must first offer a
measure of data set simplicity and only summarize the simpler data.
The next figure offers _intrinsic dimensionality_ as such a measure and
applies it to 10 data sets with 21 columns of data. As shown in
that figure, the intrinsic dimensionality of our data sets can be
very small indeed. It is hardly surprising that such an intrinsically
low-dimensional data set can be summaried in half a dozen columns
and a few dozen rows.

<a href="img/dim.jpg"><img style="padding:7px;" border=1 src="img/dim.jpg" width=460></a>

