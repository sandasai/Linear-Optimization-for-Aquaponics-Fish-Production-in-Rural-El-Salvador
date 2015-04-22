%Variables
no_fish_system = 200; %total number of fish in a system
cost_investaq = 300;  %investment cost to install a single aquaponics system ($)
cost_babyfish = 0.05; %cost of a baby fish ($)
no_aq = 30;           %number of aquaponic systems
total_no_fish = no_fish_system * no_aq; %total number of fish in all aquaponic systems at start
cycle_length = 3; %length of the growth cycle of fish (months)

%main variables
protein_per_fish = 50; %grams of protein per fish eaten

%USE FOR SENSITIVITY ANALYSIS - THESE ARE DEFAULT VALUES
%----------------------------------------------------------
price_fish_comm = 1.0; %price of the fish in the community
price_fish_mark = 1.6; %price of the fish in the market
fish_death_rate = 0.03; %death rate of the fish
BIC_growth = 0.1; %expansion growth rate
min_family_fish_eat = 24; %minimum number of fish the family eat
fish_market_sell_fraction = 0.1; %fraction of fish that family sells to market
no_fam_market = 5; % number of families that split the cost of labor to go to market
%----------------------------------------------------------

%fish food
ff_no_bags_A = total_no_fish / 1000; %total number of bags of fish feed A needed
ff_no_bags_B = total_no_fish / 1000 * 4; %total number of bags of fish feed B needed
ff_no_bags_C = total_no_fish / 1000 * 4; %total number of bags of fish feed C needed
ff_bag_A_cost = 52; %cost of fish feed bag A ($)
ff_bag_B_cost = 46; %cost of fish feed bag B ($)
ff_bag_C_cost = 42.5; %cost of fish feed bag C ($)
ff_total_cost = ff_no_bags_A*ff_bag_A_cost + ff_no_bags_B*ff_bag_B_cost + ff_no_bags_C*ff_bag_C_cost; %total cost of fish feed
ff_cost_per_family = ff_total_cost / no_aq; %total cost of fish feed per family

%bringing fish to the market
no_laborers = 3; %number of laborers to hire to bring fish to the market
no_hours = 8;    %number of hours the laborers work in a full day
laborer_fee = 1; %wage for laborer service
base_rate = 20;  %base rate for hiring labor service
cost_labor_market = base_rate + no_laborers * no_hours * laborer_fee; %cost of labor to bring fish to market

%BIC costs
labor_cost_sell_comm = 0.2; %the fraction of the profit that laborers recieve from selling the fish within community
%BIC_labor_fish_sellrate = 0.2; %the fraction of cost of the fish selling price that goes to labor
%BIC_labor_cost_sellfish = BIC_labor_fish_sellrate * price_fish_comm; %the cost ($) of moving the fish from families

%family costs
cost_repop = no_fish_system * cost_babyfish + ff_cost_per_family; %cost to repopulate system with fish and feed
utility_cost_per_month = 6; %utility costs to operate aquaponics 6 $/month 
utility_cost_per_cycle = utility_cost_per_month * cycle_length; %total cost of the utilities for aquaponics in a growth cycle

%threshold amount of fish to sell to market to make a profit
no_fish_market_thres = cost_labor_market / price_fish_mark;


