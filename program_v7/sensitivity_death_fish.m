%Sensitivity analysis of fish selling price to community
%DATA STORED IN death_and_protein

Variables;
death_and_protein = [];
%Varying fish price
vary_death_rate = 0.01:0.01:0.5;

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

for i = vary_death_rate
    fish_death_rate = i;

    [x, fval] = BIC_fam_sellmarket(no_aq, ...
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
                                   min_family_fish_eat,...
                                   fish_market_sell_fraction,...
                                   no_fam_market)
    death_and_protein = [death_and_protein; i, fval, x'];
end

 plot(death_and_protein(:,1),death_and_protein(:,2));
 title('Death Rate Vs Fish in Community');
 xlabel('Death Rate of Fish');
 ylabel('Total Number of Fish in the Community');
 axis([0 0.5 0 4500]);
 
figure; %new figure window
 plot(death_and_protein(:,1),death_and_protein(:,3:end));
 title('Death Rate Vs Distribution of Fish');
 xlabel('Death Rate of Fish');
 ylabel('Number of fish');
 axis([0.1 0.5 0 inf]);
 legend('BIC Fish Sold to Market', 'BIC Fish Sold to Community', 'Family Fish Sold to Market', 'Family Fish Sold to Community', 'Fish Eaten', 'Dead Fish','Location','eastoutside');
