# Restaurant-Order-Analysis

## Problem statement

The Taste of the World Cafe has recently introduced a new menu at the start of the year. The cafe aims to evaluate the performance of its new menu items to identify which ones are doing well and which are underperforming. Additionally, the café seeks to understand the preferences of its top customers. This analysis will support the café in making informed decisions about optimizing the menu and enhancing customer satisfaction.

## Restaurant Database Schema

### Tables

#### menu_item

| Field     | Description                        |
|-----------|------------------------------------|
| menu_item | Unique ID of a menu item           |
| item_name | Name of a menu item                |
| category  | Category or type of cuisine        |
| price     | Price of the menu item (US Dollars)|

#### order_details

| Field      | Description                                 |
|------------|---------------------------------------------|
| order_details | Unique ID of an item in an order            |
| order_id   | ID of an order                              |
| order_date | Date an order was placed (MM/DD/YY)         |
| order_time | Time an order was placed (HH:MM:SS AM/PM)   |
| item_id    | Matches the menu_item_id in the menu_item table |

## Analysis Questions

1. What were the least and most ordered items? What categories were they in?
2. What were the top 5 orders that spent the most money?
3. View the details of the highest spend order. Which specific items were purchased?
4. View the details of the top 5 highest spend orders.

## Conclusion

### Menu Insights:

1. Boost Italian and Asian Options: Top favorites among big spenders.

2. Promote American and Mexican: Use specials and discounts.

3. Seek Feedback: Ask high-spenders for their preferences.


