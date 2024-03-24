import os
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer


class RecipeGenerateService:
    def generate_recommendations(self, user_allergens, user_ingredients):
        csv_file_path = os.path.join(os.path.dirname(__file__), '..', 'utils', 'FinalModifiedDataset.csv')

        try:
            df = pd.read_csv(csv_file_path, encoding="utf-8")
        except UnicodeDecodeError:
            df = pd.read_csv(csv_file_path, encoding="latin1")

        # Filter out recipes containing the user's allergens
        if len(user_allergens) == 1:
            df = df[~df['Allergens'].str.contains(user_allergens[0], na=False)]
        elif len(user_allergens) == 2:
            df = df[~df['Allergens'].str.contains(user_allergens[0], na=False) & ~df['Allergens'].str.contains(
            user_allergens[1], na=False)]

        # Drop rows with missing values in the 'Ingredients' column
        df = df.dropna(subset=['Ingredients'])

        # Combine all ingredients into one string for each recipe
        df['Ingredients_str'] = df['Ingredients'].apply(lambda x: ' '.join(x.split(', ')))

        # Combine user ingredients into one string
        user_ingredients_str = ', '.join(user_ingredients)

        user_ingredients_str = user_ingredients_str.replace('\n', '')

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

        # Select top 5 recommended recipes
        top_5_recipes = df[['Srno', 'RecipeName', 'Ingredients', 'Calorie', 'TotalTimeInMins', 'Instructions']].head(5)

        # Convert top 5 recipes DataFrame to JSON format
        result_json = top_5_recipes.to_json(orient='records')

        return result_json
