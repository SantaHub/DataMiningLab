df_groceries <- read.csv("groceries.csv")

df_sorted <- df_groceries[order(df_groceries$Member_number),]
df_sorted$Member_number <- as.numeric(df_sorted$Member_number)

library(plyr); library(dplyr)

df_itemList <- ddply(df_groceries,c("Member_number","Date"), 
                     function(df1)paste(df1$itemDescription, 
                                        collapse = ","))

df_itemList$Member_number <- NULL
df_itemList$Date <- NULL

colnames(df_itemList) <- c("itemList")
write.csv(df_itemList,"ItemList.csv", row.names = TRUE)

library(arules)

txn = read.transactions(file="ItemList.csv", rm.duplicates= TRUE, format="basket",sep=",",cols=1);
basket_rules <- apriori(txn,parameter = list(sup = 0.01, conf = 0.5,target="rules"));

df_basket <- as(basket_rules,"data.frame")
View(df_basket)

library(arulesViz)
plot(basket_rules)
plot(basket_rules, method = "grouped", control = list(k = 5))
plot(basket_rules, method="graph", control=list(type="items"))
plot(basket_rules, method="paracoord",  control=list(alpha=.5, reorder=TRUE))
plot(basket_rules,measure=c("support","lift"),shading="confidence",interactive=T)

itemFrequencyPlot(txn, topN = 5)