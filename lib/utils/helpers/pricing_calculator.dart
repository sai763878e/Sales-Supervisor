class CPricingCalculator {
  static double calculateTotalPrice(double priceValue, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = priceValue * taxRate;

    double shippingCost = getShippingCost(location);
    return priceValue + taxAmount + shippingCost;
  }

  static double getTaxRateForLocation(String location) {
    return 0.15;
  }

  static double getShippingCost(String location) {
    return 50;
  }
}
