## Context

> The Numbers have no way of speaking for themselves. We speak for them. We
> imbue them with meaning.

@silverSignalNoiseArt2013

Context is the information that surrounds the data. It is the information that
tells us what the data is about. Fundamentally, data without context is
meaningless. Data with context is _information_ Context is essential both in
understanding the raw data, and presenting our findings. Without context, we
cannot hope to understand whether our analysis is accurate or not.

Often, the context is not explicit in the data. It is up to the data scientist
to find the context, and to use it to interrogate the data. This is why data
science is as much an art as a science. It is the art of finding the context,
and using it to interpret and present the data.

## Activity 4.1 How many trees are there on our planet?

This question was posed by David Spiegelhalter in his book "The Art of
Statistics" @spiegelhalterArtStatisticsLearning2019. How could we possibly
answer this? We could jump into looking at forests and working out the density
of trees, and extrapolating a value from that, but there is a more fundamental
first step, we need to know _what is a tree_? Fortunately for us, there are
definitions we can use.

> Trees are woody plants having a more or less erect perennial stem(s) capable
> of achieving at least 3 inches (7.6 cm) in diameter at breast height, or 5
> inches (12.7 cm) diameter at root collar and a height of 16.4 feet (5.0
> meters) at maturity in situ. @nelsonDefiningUnitedStates2020. Though disputed
> (e.g., @brokawDBH2000) this provides a starting point for our investigation.

## Reading Activity

Context is explored in the the first chapter of "Storytelling with Data: A Data
Visualization Guide For Professionals" by Cole Nussbaumer Knaflic. This book is
available in the library.

## Hypothesis Testing

## Ethics in Data Science

You'll cover fundamental ethics in other modules, but there are a couple of
ethical considerations that are particularly relevant to data science. These
are:

- asymmetries of information
- biases in data
- privacy and security

> What’s the most evil thing that can be done with this? [...]By asking the team
> to imagine what their impact could be if you abandon all constraints, you
> allow for a conversation that will help you identify opportunities that you
> would otherwise miss, and refine good ideas into great ones. We don’t want to
> build “evil” products, but subversive thinking is a good way to get outside
> the proverbial box. (Patil Data Driven)

### Asymmetries of Information

An asymmetry of information gives the party with more information an advantage
in a transaction. Asymmetries of information are when one party in a transaction
has more information than the other. This gives the party with more information
an advantage in the transaction. For instance, if you are buying a used car, the
seller knows more about the car than you do. This means that the seller has an
advantage in the transaction. This is an example of an asymmetry of information.

In [Week One](Week_1-Introduction.md) we considered the Financial Crisis
of 2008. No single factor caused to the financial crisis, and no single person
knew the risks. Instead it was a combination of asymmetries of information that
led to the crisis. The crisis was caused by this combination of partial truths:

**Borrowers** knew that they were taking on risky loans, but they believed that
they would be able to refinance or sell their homes before the rates went up.
**Lenders** knew that the loans they were offering were risky, but they believed
that the risk was spread across the financial system, so they would not be
affected if the loans went bad. **Investment Banks** knew that the MBS they were
buying were potentially risky, but they believed that the underlying mortgages
were sound. **Regulators** knew that the financial system was taking on more
risk, but they believed that the market would self-correct.

The lenders had more information than the borrowers, the investment banks had
more information than the lenders, and the regulators had more information than
the investment banks. This meant that the risks were not fully understood, and
the consequences were not fully appreciated.

#### Activity 5.1:

look up the seminal paper on this subject by George Akerlof, "The Market for
Lemons: Quality Uncertainty and the Market Mechanism" (1970). This paper is a
classic in the field of economics and is a clear example of how asymmetries of
information can affect markets.

https://doi-org.libezproxy.open.ac.uk/10.1016/B978-0-12-214850-7.50022-X

### Privacy and Security

Data science relies on data, and data is often personal. This means that data
science can raise privacy and security concerns. It is important to be aware of
these concerns and to take steps to protect privacy and security.

There are laws and regulations that govern the use of data. For instance the
GDPR (General Data Protection Regulation) seeks to limit the use of personal
data and to protect the privacy of individuals. It has

Whilst these uses are important, it is also important to remember that data
science can be used for good or for bad. It is important to be aware of the
ethical implications of data science and to use data science responsibly.
@zuboffAgeSurveillanceCapitalism2019 argues that data science is being used to
manipulate people and to control society. She argues that data science is being
used to create a new form of power that she calls "surveillance capitalism". It
is important to be aware of these issues and to use data science responsibly.

### now watch this:

https://www.youtube.com/watch?v=8HzW5rzPUy8

### Target's Predictive Analytics

In 2012, Forbes reported that Target (a major supermarket in the US) had sent a
teenager a coupon book for expectant mothers @hillHowTargetFigured2012. The
teenager's father was furious, but when he went to the store to complain, he
found out that his daughter was indeed pregnant. Target had used predictive
analytics to predict that the teenager was pregnant based on her shopping
habits. Whilst likely apocryphal @piatetskyDidTargetReally2014, this story
illustrates the power of predictive analytics and the ethical implications of
using data science.

### Activity:

The New York Times has a more nuanced take on this story. Read the article and
consider the ethical implications of using predictive analytics in this way.

https://www.nytimes.com/2012/02/19/magazine/shopping-habits.html
