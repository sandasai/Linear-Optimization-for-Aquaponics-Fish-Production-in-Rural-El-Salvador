%Sensitivity analysis of fish selling price to community
%DATA STORED IN price_and_protein
Variables;
price_and_protein = [];
%Varying fish price
vary_fish_price = 0.50:0.01:1.50;

% function argument specified variables:
% no_aq
% no_fish_market_thres
% cost_repop
% utility_cost_per_cycle
% cost_labor_market
% price_fish_mark
% price_fish_comm
% cost_investaq
% labor_cost_sell_comm
% no_fish_system
% fish_death_rate
% min_family_fish_eat
                  
for i = vary_fish_price
    price_fish_comm = i;

    [x, fval] = Fam_max_rev(no_aq, ...
                                   no_fish_market_thres, ...
                                   cost_repop, ...
                                   utility_cost_per_cycle, ...
                                   cost_labor_market, ...
                                   price_fish_mark, ...
                                   price_fish_comm, ...
                                   cost_investaq, ...
                                   labor_cost_sell_comm, ...
                                   no_fish_system, ...
                                   fish_death_rate, ...
                                   BIC_growth, ...
                                   min_family_fish_eat,...
                                   fish_market_sell_fraction,...
                                   no_fam_market)
    price_and_protein = [price_and_protein; i, fval, x'];
end


 plot(price_and_protein(:,1),price_and_protein(:,2));
 title('Community Price of Fish Vs Fish in Community');
 xlabel('Community Price of Fish ($)');
 ylabel('Total Number of Fish in the Community');
 axis([0.50 1.50 0 500]);
 
figure; %new figure window
 plot(price_and_protein(:,1),price_and_protein(:,3:end));
 title('Community Price of Fish Vs Distribution of Fish');
 xlabel('Community Price of Fish ($)');
 ylabel('Number of fish');
 axis([0.50 1.50 0 175]);
 legend('BIC Fish Sold to Market', 'BIC Fish Sold to Community', 'Family Fish Sold to Market', 'Family Fish Sold to Community', 'Fish Eaten', 'Dead Fish','Location','eastoutside');
 