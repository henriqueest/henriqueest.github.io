---
title: "Income Inequality and Poverty by Race/Ethnicity in Brazil: A Structural Analysis (2020–2025)"
author: "Henrique Alves"
date: 2025-12-23
format: pdf
editor: visual
editor_options: 
  markdown: 
    wrap: 72

header-includes:
  - \usepackage{ragged2e}
  - \justifying
---

# Abstract

The analysis of income distribution in Brazil between 2020 and 2025
reveals the persistence of structural and racially stratified
inequalities. The Theil T and L indices indicate that total inequality
is predominantly explained by the within-group component, reflecting
pronounced income disparities within racial/color groups, with a greater
contribution from the White population. Although between-group
inequality is relatively smaller, average income levels reveal a stable
racial hierarchy, in which the Asian and White groups consistently
exhibit higher earnings than the Brown, Black, and Indigenous groups.
Intragroup dispersion indicators, such as the Gini index and the
\$\text{P90/P10}\$ ratio, point to higher internal inequality and greater
volatility among the Asian and Indigenous groups, while the Brown and
Black groups display lower relative dispersion in the central portion of
the distribution. Regarding poverty, the Foster-Greer-Thorbecke (FGT)
indices (\$\text{H}\$, \$\text{P1}\$, and \$\text{P2}\$) reveal high
vulnerability among the Indigenous, Brown, and Black groups, with
particular emphasis on the extreme severity observed among Indigenous
populations. Despite the recent reduction in poverty levels, the racial
hierarchy of poverty indicators remains unchanged.

#### Keywords

#### income inequality, multidimensional poverty, inequality decomposition, racial inequality, inequality indices.

# 

# Introduction

The analysis of income inequality in Brazil constitutes a
well-established field within the socioeconomic literature, given its
relevance for understanding distributive structures and persistent
mechanisms of social exclusion. The country exhibits historical patterns
of income concentration associated with structural processes of social
formation, such as racial discrimination, occupational segmentation, and
productive heterogeneity. Understanding the multiple determinants of
inequality requires the application of quantitative methodologies
capable of capturing both within-group disparities and average
differences across social groups. In this context, the combined use of
classical and decomposable indicators - such as the Theil indices
(Theil, 1967) - alongside complementary metrics, including the Gini
coefficient (Gini, 1912), the Lorenz curve (Lorenz, 1905), quantile
ratios, and Foster-Greer-Thorbecke (FGT) poverty measures (Foster,
Greer, & Thorbecke, 1984), constitutes a robust strategy for
characterizing distributive patterns and identifying structural
inequalities.

Moreover, contemporary analyses emphasize the role of historical
structures in sustaining inequality, as discussed by Hoffmann (1998),
Stiglitz (2012), and Piketty (2014). In this regard, recent
institutional reports, such as those produced by IPEA (2020), reinforce
the need for integrated methodological approaches to distributive
diagnostics.

The present study applies these indicators to PNAD microdata,
incorporating sampling weights and stratification by racial/color
groups. This approach enables the assessment of the role of racial
cleavages in the formation of economic inequality, integrating within-
and between-group components through entropy-based decomposition. The
proposed methodological framework aims to provide statistical precision
and interpretative depth for contemporary distributive analyses.

# Recent Literature on Racial Income Inequality

Recent scholarship has reinforced the understanding that racial income
inequality remains a persistent and structurally embedded feature of
contemporary capitalist economies, both in developed and developing
contexts. A growing body of empirical literature has moved beyond
descriptive gaps in mean income to emphasize the multidimensional,
institutional, and intergenerational mechanisms sustaining racial
disparities in labor earnings and wealth accumulation.

In the context of Latin America, Telles and Flores (2024) provide a
comprehensive comparative analysis of income inequalities by race and
ethnicity across multiple countries, challenging the longstanding
narrative of racial democracy. The authors demonstrate that substantial
income penalties associated with non-white racial identification persist
even after controlling for education, demographic characteristics, and
labor market insertion. Their findings underscore the central role of
historical stratification and structural discrimination in shaping
contemporary income distributions.

Focusing on advanced economies, recent contributions in the United
States literature highlight the limited explanatory power of
individual-level characteristics in accounting for racial income and
wealth gaps. Using decomposition techniques and counterfactual
simulations, Darity, Hamilton, and Paul (2024) show that differences in
education, employment, and family structure explain only a small
fraction of the Black--White wealth gap, pointing instead to systemic
factors such as inherited disadvantage, discriminatory housing markets,
and unequal access to financial assets. Complementarily, Bayer and
Charles (2024) argue that intergenerational transmission mechanisms are
central to understanding the durability of racial economic inequality,
even in periods of aggregate economic growth.

Recent labor market studies further emphasize that racial disparities in
earnings are not confined to wage levels but extend to occupational
sorting, employment stability, and returns to education. Altonji and
Blank (2025) document that racial earnings gaps persist across the
entire wage distribution, with particularly pronounced disadvantages at
the upper tail, suggesting the presence of glass-ceiling effects and
differential access to high-paying occupations.

In the Brazilian context, the empirical literature has increasingly
relied on nationally representative household surveys to document
enduring racial inequalities in income. Reports synthesized by the
Observatório Brasileiro das Desigualdades (2025) reveal that, despite
modest improvements in overall income distribution, the relative income
position of Black and Brown populations remains substantially below that
of Whites. These disparities are observed across regions, educational
levels, and occupational categories, reinforcing the interpretation that
racial inequality in Brazil is fundamentally structural rather than
transitory.

Taken together, the recent literature converges on the conclusion that
racial income inequality is a robust and persistent phenomenon,
inadequately explained by human capital differences alone. Instead,
contemporary analyses increasingly emphasize the interplay between
historical legacies, institutional arrangements, and discriminatory
practices in reproducing racialized economic hierarchies over time.

# Literature Review

The literature on income inequality encompasses a consolidated set of
metrics, models, and analytical approaches. Contemporary discussions
draw upon distinct traditions, including measures derived from the
Lorenz curve (Lorenz, 1905), generalized entropy indices (Theil, 1967),
quantile ratios, and poverty measures based on the FGT class (Foster,
Greer, & Thorbecke, 1984).

## Classical Measures of Inequality

The Gini coefficient, originally proposed by Corrado Gini (1912) in the
early twentieth century, has become the most widely used indicator in
international inequality analyses. Although popular due to its intuitive
interpretation, the Gini index presents important methodological
limitations, such as imperfect additive decomposition (Hoffmann, 1998),
which restricts its applicability in studies seeking to quantify the
specific contributions of population subgroups (Cowell, 2011). Brazilian
institutional publications also reinforce this diagnosis (IPEA, 2004).

## Generalized Entropy Measures

Generalized entropy indices, particularly the Theil T and L indices
(Theil, 1967), gained prominence due to their property of exact
decomposition, allowing total inequality to be separated into within-
and between-group components (Theil, 1967). This feature has rendered
these measures central to studies aiming to understand structural
inequalities associated with gender, territory, or race, as demonstrated
by empirical research applied to the Brazilian context (Barros, 2007;
Hoffmann, 2011; Akita, 2003; Piketty & Saez, 2003).

The Theil T index is more sensitive to inequalities located at the upper
tail of the income distribution, whereas the Theil L index emphasizes
disparities among lower-income segments. This complementarity is
considered essential in analyses of countries characterized by strong
socioeconomic heterogeneity (Bourguignon, 2003).

## Quantile-Based Indicators

Quantile ratios have gained increasing prominence, particularly in
long-run analyses (Atkinson, 2015; Piketty, 2014). Indicators such as
\$P90/P10\$ or \$P80/P20\$ have been widely employed in the literature due
to their robustness to extreme values and their ability to provide
direct comparisons of distributive spread (Atkinson, 2015). These
metrics have been extensively used in international comparative studies,
especially in analyses of long-term inequality trends.

## Poverty Measures

The Foster-Greer-Thorbecke class (Foster, Greer, & Thorbecke, 1984)
constitutes the dominant framework for poverty measurement. Its
normative foundations were discussed by Sen (1973, 1976), and its
institutional application in Brazil is highlighted in IPEA reports
(IPEA, 2020).

The parameter \$\alpha\$ allows the sensitivity of the metric to be
adjusted, ranging from incidence measures (\$P_0\$) to severity measures
(\$P_2\$), which assign greater weight to individuals further below the
poverty line.

Applications of the FGT class to Brazilian data reveal the persistence
of structural inequality patterns and substantial differences across
racial and regional groups (Soares, 2006; Paes Barros, 2003).

# Theoretical Framework

The literature on economic inequality is anchored in two central
traditions: measures derived from the Lorenz curve (Lorenz, 1905), such
as the Gini coefficient (Gini, 1912), and generalized entropy measures,
such as the Theil indices (Theil, 1967). Although the Gini index is
widely disseminated due to its intuitive interpretation, it exhibits
limitations related to imperfect decomposition, thereby reducing its
analytical capacity when the objective is to understand the relative
contribution of specific social groups to total inequality.

The class of generalized entropy measures and the FGT poverty measures
(Foster, Greer, & Thorbecke, 1984), which include the Theil T and Theil
L indices, overcome this limitation by exhibiting exact additive
decomposition. This property enables total inequality to be
disaggregated into a between-group component, associated with
differences in mean income across groups, and a within-group component,
associated with internal heterogeneity within each segment. This
characteristic renders the Theil indices central instruments for
analyses seeking to understand hierarchical and racialized inequality
structures, as in the Brazilian case.

Quantile ratios and contemporary approaches to inequality, particularly
those emphasized by Piketty (2014) and Stiglitz (2012), complement the
theoretical framework adopted in this study. These indicators are
frequently employed to characterize relative dispersion between upper
and lower strata, contributing to diagnostics aimed at public policy
formulation.

Finally, the Foster-Greer-Thorbecke (FGT) measures constitute the
dominant model for estimating monetary poverty, differing according to
the parameter \$\alpha\$, which determines the sensitivity of the measure
to income gaps. The indicator \$H\$ measures incidence, \$P_1\$ measures
depth, and \$P_2\$ measures severity of poverty. The adoption of the
poverty line defined at R\$ 606,00 follows recent recommendations for
studies based on PNAD data. Moreover, these measures allow for the
characterization of monetary poverty under different sensitivity levels.
Normative discussions related to welfare and deprivation were structured
by Sen (1973, 1976).

# Methodology

The methodology follows classical applications of inequality indices,
with emphasis on entropy decomposition as formulated by Theil (1967) and
extended by studies such as Akita (2003). The sensitivity of the indices
to different segments of the income distribution follows analyses such
as those by Piketty and Saez (2003), while discussions on Brazilian
inequality incorporate contributions from Hoffmann (1998). Measurement
and standardization procedures follow institutional recommendations
issued by IPEA (2020).

The analysis is based on PNAD microdata, organized into quarterly strata
of adjusted per capita household income, restricted to positive values.
Weighting by sampling weights ensures population representativeness of
the estimates. The racial/color classification - White, Black, Brown,
Asian, Indigenous, and Ignored - is employed in the temporal evolution
of weighted mean income, calculated as the ratio between total weighted
income and total weights. For the remaining indicators, the Ignored
racial/color group was excluded due to its atypical behavior, which may
indicate inconsistencies in the information reported for this category.

## Data Sources and Key Variables

The indicators are computed using microdata from the National Household
Sample Survey (PNAD), which provides quarterly information on the labor
market and income (Foster, Greer, & Thorbecke, 1984).

# Results

Figure 1 illustrates the evolution of quarterly average income across
racial/color groups in Brazil from 2020 to 2025, revealing persistent
structural inequality patterns alongside short-term fluctuations
associated with economic shocks, post-pandemic reopening, and
heterogeneous recovery trajectories across social groups. The income
hierarchy follows a historically documented pattern: individuals
classified as White and Asian consistently exhibit higher average
incomes, with an upward trajectory throughout the analyzed period, while
Black, Brown, and Indigenous populations remain concentrated in the
lower strata of the income distribution, displaying persistently lower
income levels. The group classified as "Ignored" exhibits anomalous
income spikes, likely resulting from low sample representativeness or
classification inconsistencies commonly observed in microdata. The
persistence of this income gradient indicates that racial income
inequality is structural and stable over the observed horizon, even in
the presence of macroeconomic fluctuations.

![Figure 1: Temporal Distribution of Average Income (R\$).](images/clipboard-3570098504.png)

The trajectories of higher-income groups, particularly Whites and
Asians, display smoothly increasing trends, with more pronounced gains
from 2023 onward. This behavior suggests that post-pandemic economic
recovery disproportionately benefited these segments, possibly due to
their greater representation in formal, higher-paying occupations
characterized by lower wage volatility. In contrast, lower-income
groups - Black, Brown, and Indigenous - exhibit significantly lower
income levels, reduced volatility, and slower recovery, with nearly
parallel and stable curves over time. This pattern is consistent with
structural mechanisms of occupational segmentation and persistent
barriers to economic mobility, which limit these groups' responsiveness
to business-cycle dynamics and reproduce their concentration in more
precarious labor market segments.

The trajectory of the "Ignored" category is marked by abrupt
oscillations, with income peaks exceeding values compatible with
plausible demographic patterns. Such behavior likely reflects low sample
size, the presence of unsmoothed outliers, reporting errors, or the
occasional concentration of high-income individuals within this
category. Given these characteristics, methodological caution is
warranted when using this classification. Techniques such as trimmed
means, winsorization, or controlled exclusion may be considered
depending on the analytical objective. In the present study, this
category was excluded in a controlled manner.

From a distributive dynamics perspective, there is no evidence of racial
income convergence during the analyzed period. On the contrary, a slight
widening of the average income gap between higher-income groups - Asian
and White - and lower-income groups - Black, Brown, and Indigenous - is
observed, particularly after 2023. This phenomenon is consistent with
contexts of unequal economic recovery, in which groups more strongly
embedded in high-skill segments capture growth gains more rapidly.
Figure 1 thus highlights the persistence of racial income inequality in
Brazil, characterized by pronounced stratification, limited short-term
mobility, and heightened vulnerability among Black, Brown, and
Indigenous populations, as well as a relative widening of disparities
toward the end of the series. Overall, the figure confirms robust,
well-documented patterns and provides new evidence of the intertemporal
reproduction of racialized socioeconomic inequalities in the country.

The evidence presented in Figure 1 justifies the use of inequality
metrics introduced in the methodology to further detail how inequality
across racial/color groups unfolds. In this context, Figure 2, which
presents the quarterly evolution of the Gini coefficient by racial/color
group between 2020 and 2025, reveals a relatively stable inequality
pattern over time, with systematic differences across groups. Although
temporal variations are modest, the ranking of inequality levels remains
highly consistent, indicating a rigid distributive structure with low
sensitivity to short-term macroeconomic shocks.

![Figure 2: Gini Inequality Index.](images/clipboard-3158677898.png)

The Asian and Indigenous groups consistently exhibit the highest levels
of within-group inequality, with Gini coefficients fluctuating around or
slightly above 0.50 throughout the entire period. These values indicate
substantial intragroup heterogeneity, likely associated with the
coexistence of high-income occupations and low-wage segments, resulting
in wide distributive dispersion. The Asian group, in particular,
displays inequality peaks approaching 0.55 in certain quarters,
reinforcing the presence of a more polarized distributive structure.
White individuals also exhibit elevated inequality levels, albeit
slightly lower than those observed for the previous two groups, with the
Gini coefficient remaining stable around 0.50. This stability suggests
that income distribution within this group is relatively robust and
minimally affected by cyclical labor market fluctuations, reflecting a
consolidated pattern of internal wage heterogeneity.

By contrast, the Brown and Black groups display consistently lower
levels of internal inequality, with Gini coefficients predominantly
ranging between 0.42 and 0.47 over the analyzed period. This lower
dispersion is compatible with an occupational structure concentrated in
low- and middle-wage segments, which compresses the internal income
distribution but does not imply superior socioeconomic performance.
Rather, the reduced intragroup inequality reflects persistent structural
constraints limiting access to higher-paying occupations.

From a dynamic perspective, no clear trend of convergence or divergence
across groups is observed. The curves follow largely parallel and stable
trajectories, suggesting that intragroup inequalities are strongly
determined by structural factors and exhibit limited responsiveness to
short-term economic fluctuations. Minor inflections observed in 2023 and
2024 occur synchronously across groups, reinforcing the hypothesis that
macroeconomic shocks affect income distribution in a broadly homogeneous
manner within each racial category, without substantially altering their
relative inequality ranking.

Overall, Figure 2 demonstrates that within-group income inequality
remains high across all groups, particularly among Asian, Indigenous,
and White populations. The persistence of this structure suggests that
distributive disparities are fundamentally structural in nature and that
policies aimed at reducing racial inequality must simultaneously address
both between-group differences and deep, persistent intragroup
inequalities.

Figure 3 depicts the evolution of the Theil T inequality index and its
decomposition into within- and between-group components by racial/color
group from 2020 to 2025, revealing a structural pattern characterized by
the predominance of within-group inequality. The within-group component
accounts for the majority of total inequality, remaining systematically
high - around 0.40 to 0.42 - throughout the entire period. This
stability indicates that most inequality arises within racial groups
themselves, reflecting substantial internal heterogeneity in income
distribution and demonstrating that intragroup disparities persist
regardless of cyclical labor market fluctuations.

![Figure 3: Theil T and Theil L Inequality Indices: between-group, within-group, and total.](images/clipboard-569021486.png)

The between-group component is substantially smaller, ranging
approximately between 0.03 and 0.05, and follows an essentially stable
trajectory with only minor variations over time. This constancy at
relatively low levels indicates that total inequality is not primarily
driven by differences in average income across racial groups, but rather
by income dispersion within each category. Nonetheless, the stability of
between-group inequality suggests the persistence of relative income
gaps, reflecting enduring structural hierarchies. The total Theil T
curve, resulting from the weighted sum of the within- and between-group
components, closely mirrors the behavior of within-group inequality,
fluctuating around 0.44 to 0.47 during the period. Its moderate
variations - with slight reductions during economic downturns and
gradual recomposition during recovery phases - reinforce the notion that
macroeconomic shocks primarily affect internal income dispersion, while
between-group differences exhibit greater resilience to cyclical
changes.

The evolution of the Theil L inequality index reveals a structural
pattern similar to that observed for Theil T, with a clear predominance
of the within-group component as the main determinant of total
inequality throughout the analyzed period. The within-group Theil L
values remain stable between approximately 0.40 and 0.42, indicating
that income dispersion within racial/color groups remains high and
relatively insensitive to short-term fluctuations. By contrast,
between-group inequality is substantially smaller, oscillating around
0.03 to 0.04, indicating that average income differences across groups
contribute only marginally to aggregate inequality. Consequently, the
total Theil L curve closely follows the trajectory of the within-group
component, with values ranging between 0.43 and 0.46 and only minor
quarterly variations. This joint behavior demonstrates that even for an
index more sensitive to lower-income segments, within-group inequality
remains the central element of the distributive structure, while
between-group differences persist at low but stable levels relative to
internal heterogeneity.

Taken together, Figure 3 reveals not only the structural stability of
inequality over the analyzed period, but also the unequivocal
predominance of within-group inequality as the central mechanism shaping
the Theil indices. The low magnitude of between-group inequality does
not imply the absence of racial disparities; rather, it indicates that
such disparities coexist with substantial internal variation within each
group. Consequently, public policies focused exclusively on average
income differences across racial categories are insufficient to
substantially alter aggregate inequality levels, given the dominant
contribution of persistent intragroup heterogeneity.

Figure 4 shows that the self-identified White population contributes the
most to within-group inequality in Brazil, for both the Theil T and
Theil L indices. In the within-group Theil T, the contribution of the
White group fluctuates around 0.30, remaining significantly higher than
that of other groups. The Brown group exhibits the second-largest
contribution, with stable values around 0.13. Black, Indigenous, and
Asian groups display considerably smaller and stable contributions over
time, with the Black group consistently contributing less than 0.05.

![Figure 4: Contribution of Racial/Color Groups to the Theil T and Theil L Indices.](images/clipboard-2293657139.png)

A similar pattern is observed for the within-group Theil L, albeit with
slightly lower magnitudes, as expected given the greater sensitivity of
Theil L to lower incomes. The contribution of the White population
remains dominant, fluctuating around 0.20, while the Brown group ranks
second, with values around 0.16. Contributions from the remaining groups
(Black, Indigenous, and Asian) remain close to zero. Although the
greater sensitivity of Theil L to lower incomes slightly compresses the
contribution of groups with less dispersion at the top of the
distribution, it does not alter the relative hierarchy of contributions
to within-group inequality.

Taken together, the decomposition analysis (between- and within-group)
and the within-group composition analysis reveal not only the structural
stability of inequality, but also the unequivocal predominance of
within-group inequality as the central mechanism shaping the Theil
indices. Moreover, the high contribution of the White and Brown groups
to within-group inequality indicates that income dispersion within the
most populous groups and/or those with greater concentration of high
incomes constitutes the primary driver of overall inequality. The low
magnitude of between-group inequality and the limited intragroup
contributions of minority groups do not imply the absence of racial
disparities, but rather indicate that such disparities coexist with
substantial internal variation that dominates aggregate inequality
dynamics.

Figure 5 presents three inequality indicators computed from percentile
ratios (\$P90/P10\$, \$P80/P20\$, and \$P50/P10\$), disaggregated by
racial/color group for the period 2020--2025. This analysis provides a
detailed view of income dispersion within each group, focusing on
different segments of the distribution: the lower tail (\$P50/P10\$), the
central segment (\$P80/P20\$), and overall dispersion (\$P90/P10\$).

![Figure 5: Inequality Indicators Based on Percentile Ratios.](images/clipboard-2348214895.png)

The \$P90/P10\$ ratio, which captures inequality between the upper and
lower tails of the distribution, exhibits the largest inequality
magnitudes across all groups. The Asian group and, notably, the
Indigenous group display high volatility, with the most pronounced
inequality peaks. The Indigenous group records an extreme peak close to
13.5 in the 2023--4 quarter, indicating strong instability in extreme
incomes. The Asian group also shows pronounced peaks, reaching values
close to 14.10 (in 2022--2). White, Brown, and Black groups tend to
cluster at lower levels with less volatility, generally between 6.5 and
9.5, with notable convergence between the Brown and Black groups in the
middle of the period, suggesting similar disparities between \$P90\$ and
\$P10\$ for both groups.

The \$P80/P20\$ indicator focuses on inequality in the central portion of
the distribution. Under this metric, the Asian group consistently
exhibits the highest inequality levels, with values ranging from 4.10 to
6.3 over the period and notable peaks in 2021--2. Indigenous and White
groups generally occupy the second and third highest positions,
respectively, with values fluctuating around 3.5 to 4.5. By contrast,
the Brown and Black groups consistently display the lowest inequality
levels in this range, with the Black group often remaining below 2.8,
suggesting a more compact income distribution in the central segment for
these groups.

The \$P50/P10\$ ratio measures inequality at the lower end of the
distribution. Differences across groups are less pronounced, with most
values concentrated between 2.0 and 3.5. Once again, the Indigenous
group stands out for its high volatility, exhibiting an extreme peak
close to 5.0 in 2023--4. Excluding this outlier, the Brown and White
groups frequently display the highest inequality at the bottom, while
Asian and Black groups tend to show lower values in most quarters. This
indicates that the income of the \$P10\$ is less distant from the median
for Asian and Black groups compared to others.

In sum, the percentile ratio analysis confirms intense within-group
inequality across all categories. The Indigenous group, in particular,
exhibits the highest sensitivity to short-term shocks, with pronounced
volatility at both ends of the distribution. The contribution of the
upper tail (\$P90\$) emerges as the most relevant factor driving overall
inequality across all groups, as evidenced by the magnitude of the
\$P90/P10\$ ratio. The lower dispersion observed for the Black and Brown
groups in the central segment (\$P80/P20\$) suggests that, although these
groups face significant between-group disparities, their internal income
heterogeneity - particularly at the top - is relatively smaller than
that observed for White and especially Asian and Indigenous groups.

Figure 6 presents the evolution of the main Foster-Greer-Thorbecke (FGT)
poverty indicators - Incidence Rate (\$H\$), Poverty Gap (\$P_1\$), and
Poverty Severity (\$P_2\$) - by racial/color group over the period
2020--2025. The joint analysis of these indices reveals the structural
hierarchy of poverty and its severity, with profound racial disparities
that persist over time.

![Figure 6: Poverty Incidence Indicator.](images/clipboard-3349640886.png)

The top panel of Figure 6, which displays the poverty incidence rate
(\$H\$ or \$P_0\$), reveals a stable racial hierarchy in the proportion of
individuals living in poverty. Indigenous, Brown, and Black groups
consistently exhibit the highest rates, while White and Asian groups
record the lowest values. Specifically, the Brown and Black groups
remain at elevated levels, with the Brown group displaying the highest
rates for most of the period, fluctuating between approximately 0.15 and
0.10. The Indigenous group stands out for its high volatility, with a
sharp peak near 0.20 in 2023--3, reflecting heightened vulnerability to
economic shocks and instability at the lower end of the income
distribution. In contrast, White and Asian groups remain at low and
relatively stable levels, generally below 0.08. Although a downward
trend is observed for the most affected groups from 2024 onward, the
incidence hierarchy remains unchanged.

The Poverty Gap Index (\$P_1\$) measures poverty depth, indicating the
average shortfall of poor individuals' income relative to the poverty
line. The hierarchy observed for \$H\$ is replicated here, albeit with
differences in magnitude: the Indigenous group exhibits the greatest
poverty depth, with the index reaching a notable peak of approximately
0.085 in 2023--3, corroborating its extreme vulnerability. Brown and
Black groups follow, with values generally between 0.04 and 0.07,
indicating that the average income of the poor in these groups lies
further below the poverty line. By contrast, White and Asian groups
display the smallest poverty gaps, consistently below 0.03. After
2024--1, \$P_1\$ declines for the most affected groups, mirroring the
reduction in poverty incidence and suggesting a concomitant decrease in
poverty depth.

The Poverty Severity Index (\$P_2\$) captures inequality among the poor
and is sensitive to income dispersion within this population. The
Indigenous group continues to exhibit the highest poverty severity, with
an extreme \$P_2\$ peak of approximately 0.055 in 2023--3. This indicates
not only a large number of individuals in poverty and far below the
poverty line, but also substantial inequality among the poor themselves.
Brown and Black groups subsequently display the next highest severity
levels, fluctuating between approximately 0.02 and 0.04, suggesting
significant internal inequality among their poor populations. In
contrast, White and Asian groups record the lowest \$P_2\$ values,
consistently below 0.02. The general post-2023 trend for all groups is a
gradual decline in poverty severity, indicating reduced inequality among
the poor.

In summary, the FGT indices confirm a poverty structure with a strong
racial component. Brown, Black, and especially Indigenous groups -
marked by high volatility and extreme severity - face the greatest
challenges in terms of poverty incidence, depth, and severity. The
persistence of high rates and indices for these groups throughout the
period, despite cyclical fluctuations, underscores the structural nature
of racial inequality in income access and the extreme vulnerability of
these social segments.

# Conclusion and Public Policy Implications

The body of evidence analyzed points to the coexistence of two crucial
phenomena in the Brazilian inequality and poverty structure. First, the
predominance of within-group inequality as the main driver of aggregate
inequality, reinforced by the high contribution of White and Brown
groups to internal dispersion. Second, the rigidity of the racial
hierarchy at both the bottom and the top of the income distribution,
evidenced by differences in average income and poverty rates.

The Indigenous group emerges as the most vulnerable and volatile across
all indicators, facing the highest levels of severity and instability.
The results suggest that public policies focused exclusively on average
income differences across racial groups (between-group inequality) are
insufficient to substantially alter aggregate inequality levels.

It is imperative to develop strategies that operate simultaneously on
two fronts: (1) **Reduction of within-group inequality**, addressing
internal income heterogeneity through measures such as high-quality
professional training and progressive taxation; and (2) **Combating
racially concentrated extreme poverty**, through income support policies
targeting the lower tail of the distribution - particularly for
Indigenous, Brown, and Black groups - aimed not only at reducing poverty
incidence (\$H\$), but also its depth (\$P_1\$) and severity (\$P_2\$). The
high sensitivity of the most vulnerable groups to macroeconomic shocks
further reinforces the need for permanent and robust social protection
mechanisms.

# References

-   **Akita, T.** (2003). Decomposing Regional Income Inequality in
    China and Indonesia Using the Theil Index. *European Journal of
    Comparative Economics*, 1, 99--114.
-   **Altonji, J., & Blank, R.** (2025). Racial Inequality in the Labor
    Market. In: *Handbook of Labor Economics*, vol. 6, pp. 1--54.
    Elsevier. <doi:10.1016/bs.heslab.2025.01.002>.
-   **Atkinson, A. B.** (2015). Inequality Measurement. In: *Handbook of
    Income Distribution*.
-   **Atkinson, A. B.** (2015). *Inequality: What Can Be Done?*
    Cambridge: Harvard University Press.
-   **Barros, R., Henriques, R., & Mendonça, R.** (2007). A Descrição da
    Desigualdade Racial no Brasil. *Revista Brasileira de Ciências
    Sociais*.
-   **Bayer, P., & Charles, K. K.** (2024). Setting the Record Straight
    on Racial Wealth Inequality. *AEA Papers and Proceedings*, 114,
    88--92. <doi:10.1257/pandp.20241102>.
-   **Bourguignon, F.** (2003). *The Theory of Economic Inequality*.
    Cambridge University Press.
-   **Cowell, F.** (2011). *Measuring Inequality*. Oxford University
    Press.
-   **Darity, W., Hamilton, D., & Paul, M.** (2024). Quantifying
    Specific and Systemic Factors in the Black--White Wealth Gap.
    *Journal of Economics, Race, and Policy*, 7(1), 1--24.
    <doi:10.1007/s41996-024-00160-4>.
-   **Foster, J., Greer, J., & Thorbecke, E.** (1984). A Class of
    Decomposable Poverty Measures. *Econometrica*, 52, 761--766.
-   **Gini, C.** (1912). *Variabilità e mutabilità*. Bologna: Cuppini.
-   **Hoffmann, R.** (1998). Desigualdade da Distribuição de Renda no
    Brasil. *Revista Brasileira de Economia*, 52, 273--297.
-   **Hoffmann, R.** (2011). Desigualdade da Distribuição de Renda no
    Brasil: 1995--2009. *Economia e Sociedade*.
-   **IPEA.** (2004). *Desigualdade no Brasil: Relatório Técnico*.
    Brasília: Instituto de Pesquisa Econômica Aplicada.
-   **IPEA.** (2020). *Relatório sobre Desigualdade de Renda no Brasil*.
    Brasília: Instituto de Pesquisa Econômica Aplicada.
-   **Lorenz, M. O.** (1905). Methods of Measuring the Concentration of
    Wealth. *Publications of the American Statistical Association*, 9,
    209--219.
-   **Observatório Brasileiro das Desigualdades.** (2025). *Relatório
    Anual das Desigualdades no Brasil 2025*. Brasília.
-   **Paes de Barros, R., & Carvalho, M.** (2003). *Pobreza e
    Distribuição de Renda*. IPEA.
-   **Piketty, T.** (2014). *Capital in the Twenty-First Century*.
    Harvard University Press.
-   **Piketty, T., & Saez, E.** (2003). Income Inequality in the United
    States, 1913--1998. *Quarterly Journal of Economics*, 118, 1--39.
-   **Sen, A.** (1973). *On Economic Inequality*. Oxford University
    Press.
-   **Sen, A.** (1976). Poverty: An Ordinal Approach to Measurement.
    *Econometrica*, 44, 219--231.
-   **Soares, S. S. D.** (2006). *Programas Sociais e Pobreza no
    Brasil*. IPEA.
-   **Stiglitz, J.** (2012). *The Price of Inequality*. New York: W. W.
    Norton.
-   **Telles, E., & Flores, R.** (2024). Within the cracks of the cosmic
    race: Income inequalities by race and ethnicity in Latin America.
    *World Development*, 176, 106528.
    <doi:10.1016/j.worlddev.2024.106528>.
-   **Theil, H.** (1967). *Economics and Information Theory*. Amsterdam:
    North-Holland.
