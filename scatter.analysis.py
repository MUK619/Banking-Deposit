import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = dataset.copy()
df.columns = ['State', 'Growth', 'Average', 'Total Deposits']

df['Category'] = df['Total Deposits'].apply(
lambda x: 'High Deposit' if x > df['Total Deposits'].mean() else 'Low Deposit'
)

sns.set(style="whitegrid")
plt.figure(figsize=(20,10))

sns.scatterplot(
data=df,
x='Total Deposits',
y='Growth',
size='Average',
hue='Category',
sizes=(50,500),
alpha=0.8
)

sns.regplot(
data=df,
x='Total Deposits',
y='Growth',
scatter=False,
color='black'
)

top = df.loc[df['Total Deposits'].idxmax()]
plt.text(
top['Total Deposits'],
top['Growth'],
f"Top: {top['State']}",
fontsize=10,
color='black'
)

plt.ticklabel_format(style='plain', axis='x')
plt.ticklabel_format(style='plain', axis='y')

plt.title("Growth vs Deposits (Cluster + Trend Analysis)", fontsize=16)
plt.xlabel("Total Deposits", fontsize=12)
plt.ylabel("Growth", fontsize=12)

plt.tight_layout()
plt.show()