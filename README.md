# 📊 Put Call Prodigy
----------------
Put Call Prodigy is a educational platform developed to teach user option trading strategies through simplifying and gamifying options trading. Put Call Prodigy allows users to trade options with in-game currency using live quotes.


![Demo](https://thumbs.gfycat.com/SilverFrighteningButterfly-size_restricted.gif)


## 📈 Simplification & Gamification
-----------------------
There are several aspects to options trading that often confuse users and overcomplicate simple concepts. Traditional educational platforms tend to overload the user with too much information. To make the user experience easier, we sought to simplify several aspects of options trading.  


**Underlying Assets** We eliminated the fact that exercising options results in purchasing an underlying asset for portfolio building. Portfolio building is a tedious act when one is trying to learn the underlying concepts of options trading.


**Option Premiums** We eliminate options premiums. Options are priced based on duration, volatility, price, and the underlying stock. Instead of real-time options premiums we take a percentage of the users in game currency dependent on the price of the stock and the duration of the option. Therefore there is no tedious calculations of risk passed on to the user


**Time Intervals** Options come in several different durations. Most common are 30, 60, and 90 day durations. This does not provide the user with instantaneous feedback and takes away from user experience. To combat this, we created options contracts with smaller time intervals at 1, 5, 15, 30, and 60 minutes. By creating smaller time intervals, the user gets quicker feedback about the payoff of their positions.


**Payoff System** Options are valuable in that you can purchase (or sell) an underlying asset at a price that is lower (or higher) than market price and at the price the option contract outlines. Because the concept of underlying assets has been eliminated from the platform, the amount of payoff is calculated as a percentage change in the asset that the option contract was purchased for.


**Incremental Introduction to Information**
Many of the traditional platforms that introduce users to options trading assume that the user is well versed in equity trading. We did not take this approach in development. We tried to simplify all components of options trading so that my 90 year old grandmother could develop a logical approach to options trading. Technical indicators, trading strategies, and other concepts are introduced incrementally as the user progresses through levels, not overloading the user with information.  



## 📈 Education
----------------------
Our main goal for Put Call Prodigy was to teach our users about options trading strategies. To do this we needed to provide our users with an incremental introduction to the subject matter. By implementing level progression we were able to limit the amount of information given to our users. At first, the user is introduced to buying a call and buying a put. Once they have achieved a certain amount of return for each of the trading strategies, the user then progresses to the next level which incrementally introduces a more complex trading strategy with each new level. This reduces confusion and increases user retention.


![Level Progression](https://github.com/blanklist/put-call-prodigy/blob/master/levels.png?raw=true)



## 📈 API Integration
----------------------
The Yahoo Finance API was the standard when we were doing our research in this project. Yet, three days into the project, Yahoo discontinued the API leaving many of our gems and open source resources to come to waste at an instant. This pushed us to explore API’s that were underutilized in the world of Ruby. The two API’s that stood out to us in terms of documentation and dexterity were Quandl and AlphaVantage.


**AlphaVantgage**
Due to our desire to build a platform that operated with live market data, finding an API that provided real time information was crucial. Many of the APIs that provided what we were looking for were premium and did not offer a trail. Que AlphaVantage. AlphaVantage was dependable, well built, and thorough. Best of all it was free. We used AlphaVantage for our pricing information, as well as our technical indicators. If you are trying to explore a capital market API. I highly suggest [AlphaVantage](https://www.alphavantage.co/).


**Quandl**
Quandl provided our project with historical information. If we need to populate our real-time graph with data that exceed the 3 month time horizon, Quandl provided the answer. If you are interested in doing equity research or any other type of historical quantitative analysis, I highly recommend exploring [Quandl](https://www.quandl.com/tools/api)


## 📈 User Story
-----------------------
Below is a collection of screenshots from the demo above with an explanation of the user interaction.

**Log-In and Instructor Assignment**
![Log-In and Instructor Assignment](https://media.giphy.com/media/N3knJvc4m63UQ/giphy.gif)

**Log-In**
![Log-In and Instructor Assignment](https://media.giphy.com/media/N3knJvc4m63UQ/giphy.gif)

**Log-In**
![Log-In and Instructor Assignment](https://media.giphy.com/media/N3knJvc4m63UQ/giphy.gif)

**Log-In**
![Log-In and Instructor Assignment](https://media.giphy.com/media/N3knJvc4m63UQ/giphy.gif)

**Log-In**


**Log-In**


## Team
------------------
📌 Joe H. ([blanklist](https://github.com/blanklist))

📌 Peter M. ([pentaquant](https://github.com/pentaquant))

📌 Tim P. ([timparkyn](https://github.com/timparkyn))

📌 Joanna J. ([elainefirefly](https://github.com/elainefirefly))
