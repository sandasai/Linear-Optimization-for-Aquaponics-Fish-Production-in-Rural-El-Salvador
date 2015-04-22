%Sensitivity analysis of fish selling price to community
%DATA STORED IN death_and_protein

Variables;
BIC_growth_and_protein = [];
%Varying fish price
vary_BIC_growth_rate = 0.1:0.01:0.5;

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
                  
for i = vary_BIC_growth_rate
    BIC_growth = i;

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
                                   fish_death_rate,...
                                   BIC_growth, ...
                                   min_family_fish_eat, ...
                                   fish_market_sell_fraction,...
                                   no_fam_market)
    BIC_growth_and_protein = [BIC_growth_and_protein; i, fval, x'];
end

 plot(BIC_growth_and_protein(:,1),BIC_growth_and_protein(:,2));
 title('BIC Growth Rate Vs Fish in Community');
 xlabel('BIC Growth Rate per Year');
 ylabel('Total Number of Fish in the Community');
 axis([0.1 0.5 0 500]);
 
figure; %new figure window
 plot(BIC_growth_and_protein(:,1),BIC_growth_and_protein(:,3:end));
 title('BIC Growth Rate Vs Distribution of Fish');
 xlabel('BIC Growth Rate per Year')
 ylabel('Number of fish');
 axis([0.1 0.5 0 inf]);
 legend('BIC Fish Sold to Market', 'BIC Fish Sold to Community', 'Family Fish Sold to Market', 'Family Fish Sold to Community', 'Fish Eaten', 'Dead Fish','Location','eastoutside');