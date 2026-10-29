CREATE DATABASE IF NOT EXISTS RestaurantDB1;
USE RestaurantDB1;

CREATE TABLE IF NOT EXISTS Restaurants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (name, cuisine, rating)
VALUES
('Spice Garden', 'South Indian', 4.5),
('Dragon Palace', 'Chinese', 4.2),
('Food Corner', 'North Indian', 3.8),
('Golden Wok', 'Chinese', 4.7),
('Dosa House', 'South Indian', 4.1),
('Pizza Point', 'Italian', 3.9);

SELECT * FROM Restaurants;

/*
let
    Source = Excel.CurrentWorkbook(){[Name="CuisineParameter"]}[Content],
    Cuisine = Source{0}[Cuisine]
in
    Cuisine*/

/*
let
    Source = Sql.Database("YOUR_SERVER", "YOUR_DATABASE"),
    Restaurants = Source{[Schema="dbo", Item="Restaurants"]}[Data],
    FilteredRows = Table.SelectRows(
        Restaurants,
        each [cuisine] = CuisineValue
    )
in
    FilteredRow*/
    
    /*
    
    let
    Source = Sql.Database("YOUR_SERVER", "YOUR_DATABASE"),
    Restaurants = Source{[Schema="dbo", Item="Restaurants"]}[Data],
    HighRated = Table.SelectRows(
        Restaurants,
        each [rating] > 4.0
    )
in
    HighRated*/
    
    /*
    
    let
    Source = Sql.Database("YOUR_SERVER", "YOUR_DATABASE"),
    Result = Value.NativeQuery(
        Source,
        "SELECT name, cuisine, rating
         FROM dbo.Restaurants
         WHERE rating BETWEEN @MinRating AND @MaxRating",
        [
            MinRating = 3.5,
            MaxRating = 5.0
        ]
    )
in
    Result*/