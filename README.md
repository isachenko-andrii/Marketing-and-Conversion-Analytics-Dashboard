
![Project-logo](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/Project-logo.png)
#### [EN](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/README.md) | [UA](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/README-UA.md) This material is also available in Ukrainian.
---  
<div align="center">  
    
## Marketing and Conversion Analytics Dashboard<br>(Tableau Public)   
  
</div>  
  
## Project Description  
  
This project is dedicated to analyzing the behavior of online store users based on real (depersonalized) Google Analytics 4 (GA4) data.  
**Project Goal** — to study the customer journey from the first visit to the purchase, visualize the conversion funnel, and identify key factors that affect the drop in conversion at each stage.  
  
## Data source  
  
Public dataset [bigquery-public-data.ga4_obfuscated_sample_ecommerce](https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=ga4_obfuscated_sample_ecommerce&t=events_20210131&page=table) in Google BigQuery.  
  
## Technology stack used  
  
* **Database & SQL**: Google BigQuery (working with raw data bigquery-public-data.ga4_obfuscated_sample_ecommerce)  
* **BI tool**: Tableau Public (building an interactive dashboard)  
* **Data cleansing and transformation**: Creating flat aggregated tables at the session level using complex CTEs and SQL window functions.  
  
---  
  
## Project Implementation Steps (Step-by-Step Workflow)  
 
The project was implemented in 4 consecutive stages: from analyzing the database structure to building and designing the final dashboard.  
  
### Step 1. Exploring the data structure in BigQuery  
The first step was to analyze the table schema of the public dataset `ga4_obfuscated_sample_ecommerce`. Since GA4 data is stored in a denormalized form with nested fields (RECORD/STRUCT), a strategy for expanding parameters using the `UNNEST` operator was developed.  
  
* Key events of the user journey were explored (from `session_start` to `purchase`).  
* Event parameters (`event_params`) were determined, which are necessary for identifying sessions and traffic sources.
   
![Step 1: Working with raw data in BigQuery](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/img/mca_1.png)  
  
### Step 2. Write and optimize SQL query  
To prepare clean and lightweight data for visualization, an optimized SQL query was created.  
  
* Common Table Expressions (CTE) were used to separate the logic of collecting session attributes and funnel steps.  
* Using `REGEXP_EXTRACT` regular expressions, URLs were cleaned up to the Landing Pages level.  
* Applied aggregation (Pivot) of events into binary flags (`0` and `1`) for each funnel step, which allowed Tableau to instantly count conversions without complex calculations on the fly.  
  
![Step 2: Result of executing the optimized query](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/img/mca_2.png)   
  
### Step 3. Designing the dashboard architecture in Tableau  
Before building the visualizations, the logical structure of the future dashboard was developed in accordance with the requirements of the technical specifications and analytical standards:  
  
* A connection was created with the data extract (Extract) to ensure maximum report speed.  
* Key metrics (Calculated Fields) were calculated to calculate the conversion (Conversion Rate) and user outflow (Drop-off Rate) between stages.  
* The main dashboard grid was defined with an emphasis on the main sales funnel in the center.  
    
![Step 3: Tableau Workspace and Calculated Fields](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/img/mca_3.png)   
    
### Step 4. Final design and interactivity settings  
The final stage is visual design of the dashboard and user experience settings:  
 
* Implemented the "5-second principle" by moving the main KPIs to the top of the screen.  
* Configured interactive filters (by time, country, devices) and added the *Use as Filter* function for slice charts, which allows the user to explore data in one click.  
* Applied a restrained color palette to focus attention on key marketing performance indicators.
  
![Step 4: Ready-made interactive dashboard](https://github.com/isachenko-andrii/Marketing-and-Conversion-Analytics-Dashboard/blob/main/img/mca_4.png)  
  
---  
  
## Key Insights  
  
After analyzing the data obtained during the project, the following conclusions can be drawn:  
  
**1. Conversion Funnel Analysis (The main problem is the “Bounce” at the start)**  
  
* Huge churn at the first step (Visit ➡️ Engagement): The most critical point of user loss. 78.79% of visitors leave the site without any interaction (conversion to engagement is only 21.21%). This indicates low quality traffic, too slow loading pages or irrelevance of the landing page to user expectations.  
* Add to cart stage (Engagement ➡️ Cart): Only 4.2% of initial users add the product to the cart. Of the engaged users, this is about 20% - a standard indicator for e-commerce, but the total volume suffers greatly due to the drop in the first step.  
* Checkout and payment (Checkout ➡️ Payment ➡️ Action):  
- The Shipping and Checkout stages have identical indicators (10,853 sessions / $3.06%), which is logical for a combined process.  
- ~28.8% of users are lost at the Payment ➡️ Action (from 6,663 to 4,745). This is a high bounce rate for the final step, which may indicate technical errors in the payment gateway, lack of local payment methods, or unforeseen additional fees at the checkout stage.
   
**2. Seasonality and dynamics (Trend Line):**  
  
* **New Year's peak:** Sales gradually increased throughout November and reached their peak in the 50th week (W50) - 760 orders. This is a classic effect of "Black Friday" and the purchase of Christmas gifts.  
* **Holiday decline:** In weeks 52 and 53 (end of December) there is a sharp drop in orders (to 232 and 137, respectively), which is associated with logistical pauses during the holidays. In January, demand gradually stabilizes.
  
**3. Geography and Mobility (Segments):**  
  
* **US dominance:** The United States generates the most traffic (155.83K sessions), but the conversion rate there is average.  
* **Mobile traffic** is an underrated driver: Mobile devices bring 141.08K sessions, but have a higher conversion rate (1.38%) than desktop (205.90K sessions with a conversion rate close to average). This indicates a high-quality mobile adaptation of the site, but desktop still dominates in terms of engagement.
  
**4. Marketing Channels (Source / Medium):**  
  
* **Direct and Organic Traffic:** Google (organic) and Direct bring the most sessions, but have lower conversion compared to referral sources (e.g. shop.googlemerchandise...), where conversion is much higher (the darkest segments on the graph are up to 3.2%).  
  
---  
  
## Suggestions and recommendations (Recommendations)  
  
Based on the analysis, the following recommendations can be made:  
  
**1. First Contact Optimization (Reducing Bounce Rate):**  
  
* **Conduct a UX/UI audit of your homepage:** Find out why nearly 80% of users don’t engage with your site. Check page load speed (especially on mobile with Google PageSpeed ​​Insights).  
* **Ad relevance:** Check your Google Ads targeting settings (cpc). CPC traffic has low conversions, which may indicate that the promises in your creatives don’t match the actual content of your site.  
  
**2. Checkout Optimization:**  
  
* **Checkout Step Analysis:** A technical audit of the checkout step should be conducted. Why do almost a third of people who enter shipping information not complete the purchase? It is recommended to implement autofill fields, add alternative quick payment methods (Apple Pay, Google Pay, PayPal).  
* **Price Transparency:** Make sure that shipping costs and taxes are shown to the user before he starts the order, and not directly at the checkout step.
    
**3. Mobile-First Marketing**  
  
Since mobile traffic converts better (1.38% vs. average 1.34%), it is worth shifting some of your advertising budget to mobile campaigns on social media (Instagram, TikTok, Facebook).  
  
**4. Working with referral traffic**  
  
Since referral sources demonstrate the highest conversion, it is necessary to scale affiliate programs and strengthen the brand presence on partner sites  
  
---  
  
## Project structure  
  
**Marketing and Conversion Analytics Dashboard**/ — project directory  
├── data/ — project data  
├── doc/ — technical specifications  
├── sql/ — BigQuery query code  
├── twbx/ — project files  
├── img/ — saved graphs and dashboards  
├── LICENSE — MIT License  
├── project-logo.png — project cover  
├── README-UA.md — project description in Ukrainian  
└── README.md — project description in English  
  
## How to view the project  
  
1. Download the project file `Marketing and Conversion Analytics Dashboard.twbx` from this repository.  
2. Open it with the free [Tableau Reader](https://www.tableau.com/products/reader) or Tableau Desktop.  
3. You can view and test the fully interactive dashboard at: [Marketing and Conversion Analytics Dashboard](https://lnk.ua/SEwCSEvTA)
   
## Contacts  
  
**Author:** [Andrii Isachenko](https://isachenko-andrii.github.io)  
**Position:** Junior Data Analyst  
**LinkedIn:** [Andrii Isachenko](https://www.linkedin.com/in/isachenko-andrii/)  
**E-mail:** andrii.isachenko@gmail.com  
  
## Acknowledgements  
  
- Thanks to the course [Data Analyst/GoIT](https://goit.global/ua/courses/data-analytics/), which was part of the work on this project.  
  
---  
  
**Project Status:** Completed.  
  
**License:** MIT License.  
  
