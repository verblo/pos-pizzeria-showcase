/**
 * POS Pizzeria System - Configuration Template
 * Copy this file to config.js or set matching environment variables (.env).
 */

// ===== PRICING & PROMOTIONS =====
module.exports.PRICING = {
  // Pizza Sizes Surcharge
  LARGE_SIZE_SURCHARGE: 10.00, // Extra fee for large 40cm pizza (PLN)
  
  // Custom Ingredient Surcharges
  EXTRA_INGREDIENT_SMALL: 4.00, // Add-on ingredient for small 30cm (PLN)
  EXTRA_INGREDIENT_LARGE: 5.00, // Add-on ingredient for large 40cm (PLN)
  
  // "Custom Composition" Special Rule (kasa_id = 17)
  CUSTOM_COMPOSITION_FREE_INGREDIENTS: 5, // First 5 toppings included for free
  
  // Condiment Sauces (dynamic based on payment method)
  SAUCE_CASH: 0.30,
  SAUCE_CARD: 0.31,
  
  // Standard Local Delivery Fee
  DELIVERY_FEE: 4.00,
};

// ===== FREE TOPPINGS & SPICES =====
module.exports.FREE_TOPPINGS = [
  'tabasco',
  'arugula',
  'black_pepper'
];

// ===== DATABASE & SERVER NETWORKING =====
module.exports.SERVER_CONFIG = {
  port: process.env.PORT || 3000,
  dbPath: process.env.DB_PATH || './db.sqlite',
  corsOrigin: process.env.CORS_ORIGIN || 'http://localhost:3000',
  jwtSecret: process.env.JWT_SECRET || 'your-production-jwt-secret-here',
};

// ===== ORDER LIFECYCLE STATES =====
module.exports.ORDER_STATUSES = {
  RECEIVED: 'przyjete',
  OVEN_QUEUE: 'do pieca',
  BAKING: 'w piecu',
  PACKAGING: 'do pakowania',
  DISPATCHED: 'wydane',
  CANCELLED: 'anulowane',
};

// ===== PIZZA OVEN PARAMETERS =====
module.exports.OVEN_SETTINGS = {
  bakeTargetSeconds: 180, // 3:00 minutes baking duration
  warningThresholdSeconds: 210, // 3:30 alert when oven is delayed
};
