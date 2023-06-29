
![Ethereal Artefacts_Logo](https://github.com/gerganaivvanova/swiftui_project/assets/98741805/29308243-0b03-4bd7-87a1-a18d3722ea9e)
# **SwiftUI Ethereal Artefacts App**

This is a SwiftUI project developed as part of an iOS training program.



https://github.com/gerganaivvanova/swiftui_project/assets/98741805/d1419f06-a799-484b-aa41-f332c10c36cc


## Table of Contents

* [General Information](#general-information)
* [Project Structure](#project-structure)
* [Functionalities](#Functionalities)

## General Information

The app is designed to function as a shop that lists various products. It incorporates several key functionalities, including user login, a home screen displaying all products, a product details screen, and filtering options for the home screen. Users can add products to their cart, view the total number of products in the cart, place orders to decrement product stock, and log out.

## Project Structure

The project is structured as follows:

`Models`: Contains the data models used within the application.

`Views`: Contains SwiftUI views responsible for the various screens and UI components.

`ViewModels`: Contains the view models that handle the logic and data management for each view.

`Networking`: Contains networking-related files, such as API clients or data managers.

`Helpers`: Contains helper files used throughout the project.

`Assets`: Contains any image assets or other resources used in the app. 

## Functionalities

The SwiftUI Shop App offers the following functionalities:

`Login`
Users can log in to access personalized features and maintain their cart and orders.

`Home Screen`
Displays a list of all products available in the shop.
Products are presented in a visually appealing manner, including relevant information such as name, image, price, and rating.

`Product Details`
Users can tap on a specific product to view more details about it.
The product details screen provides comprehensive information, including description, price, stock availability, and rating.

`Filtering Options`
The home screen provides options to filter the list of products based on the following criteria:
 - Categories: Users can select a specific category to view products belonging only to that category.
 - Price Range: Users can set a minimum and maximum price to display products within that price range.
 - Rating: Users can filter products based on their rating, such as displaying only products with a rating of 4 stars.
   
`Cart Management`
Users can add products to their cart by tapping on an "Add to Cart" button from the product details screen.
The cart icon displays the total number of products currently in the cart.
Users can view their cart to see a list of added products, including their names, quantities, and prices.
Removing a product from the cart will update the total count and reflect the changes accordingly.

`Placing Orders`
Users can place an order from the cart screen.
When an order is placed, the app decrements the stock quantity of the ordered products.
Appropriate notifications or feedback are provided to the user to confirm the successful placement of an order.

`Logout`
Users can log out from their account, which clears their session and returns them to the login screen.
