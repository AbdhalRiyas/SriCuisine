import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer

# Load the dataset
df = pd.read_csv("Demo_IndianFoodDataset.csv")

# Let the user enter their allergies and ingredients
user_allergens = input("Enter your allergies (comma-separated): ").strip().split(",")
user_ingredients = input("Enter the ingredients you have at home (comma-separated): ").strip().split(",")

# Filter out recipes containing the user's allergens
for allergen in user_allergens:
    df = df[~df['Allergens'].str.contains(allergen, na=False)]

# Drop rows with missing values in the 'Ingredients' column
df = df.dropna(subset=['Ingredients'])

# Combine all ingredients into one string for each recipe
df['Ingredients_str'] = df['Ingredients'].apply(lambda x: ' '.join(x.split(', ')))

# Combine user ingredients into one string
user_ingredients_str = ', '.join(user_ingredients)

# Combine user ingredients with recipe ingredients
all_ingredients = df['Ingredients_str'].tolist()
all_ingredients.append(user_ingredients_str)

# Vectorize ingredients using CountVectorizer
vectorizer = CountVectorizer()
X = vectorizer.fit_transform(all_ingredients)

# Calculate cosine similarity
cosine_sim = cosine_similarity(X[:-1], X[-1])

# Add cosine similarity to the DataFrame
df['CosineSimilarity'] = cosine_sim.flatten()

# Sort recipes by cosine similarity in descending order
df = df.sort_values(by='CosineSimilarity', ascending=False)

# Display top ten relevant records for recommended recipes
print("Recommended Recipes:")
print(df[['Srno', 'RecipeName', 'Ingredients', 'TotalTimeInMins', 'Instructions']].head(10))
