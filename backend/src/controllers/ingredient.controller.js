const asyncHandler = require("express-async-handler");
const Ingredient = require("../models/ingredient.model");
const logger = require("../utils/log4jsutil.js");
const AppError = require("../utils/app.error");

// @desc    Get expiring ingredients
// @route   GET /api/v1/ingredients
// @access  Public
const getIngredients = asyncHandler(async (req, res) => {
  const { userId } = req.body;
  logger.trace("[ingredientController] :: getIngredient() : Start");

  const oneDayFromNow = new Date();
  oneDayFromNow.setDate(oneDayFromNow.getDate() + 1);

  const threeDaysFromNow = new Date();
  threeDaysFromNow.setDate(threeDaysFromNow.getDate() + 3);

  const sevenDaysFromNow = new Date();
  sevenDaysFromNow.setDate(sevenDaysFromNow.getDate() + 7);

  // Find ingredients and categorize

  const ingredients = await Ingredient.find({
    user: userId,
    $or: [
      { expiryDate: { $lte: oneDayFromNow } },
      { expiryDate: { $lte: threeDaysFromNow, $gt: oneDayFromNow } },
      { expiryDate: { $lte: sevenDaysFromNow, $gt: threeDaysFromNow } },
    ],
  });
  console.log(ingredients);
  if (!ingredients || ingredients.length === 0) {
    return res.status(404).json({ message: "No ingredients found." });
  }

  const categorizedIngredients = {
    expiringToday: [],
    expiringIn3Days: [],
    expiringIn7Days: [],
    expired: [],
  };

  ingredients.forEach((ingredient) => {
    if (ingredient.expiryDate < oneDayFromNow) {
      categorizedIngredients.expired.push(ingredient);
    } else if (ingredient.expiryDate <= oneDayFromNow) {
      categorizedIngredients.expiringToday.push(ingredient);
    } else if (ingredient.expiryDate <= threeDaysFromNow) {
      categorizedIngredients.expiringIn3Days.push(ingredient);
    } else {
      categorizedIngredients.expiringIn7Days.push(ingredient);
    }
  });

  if (!categorizedIngredients) {
    res.status(200).json("No ingredients expiring within the next 7 days");
  }

  res.status(200).json(categorizedIngredients);

  logger.trace("[ingredientController] :: getIngredient() : end");
});

// @desc    Create a new ingredient
// @route   POST /api/v1/ingredients
// @access  Public
const createIngredient = asyncHandler(async (req, res) => {
  const { name, expiryDate, userId } = req.body;

  logger.trace("[ingredientController] :: createIngredient() : Start");

  try {
    // Create the ingredient
    const ingredient = await Ingredient.create({
      user: userId,
      name,
      expiryDate,
    });

    res.status(201).json(ingredient);
    logger.info(
      `[ingredientController] :: createIngredient() : Ingredientcreated successfully`
    );
  } catch (error) {
    logger.error(
      `[ingredientController] :: createIngredient() : Error creating ingredient: ${error.message}`
    );
    res.status(500).json({ message: "Server Error" });
  }

  logger.trace("[ingredientController] :: createIngredient() : End");
});
