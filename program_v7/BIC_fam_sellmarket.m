function [x, fval] = BIC_fam_sellmarket(no_aq, ...
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
                                        min_family_fish_eat, ...
                                        fish_market_sell_fraction, ...
                                        no_fam_market)
    %linear programming
    %linear variables established like so
    % x = [n_BIC_mark
    %     n_BIC_comm
    %     n_fam_mark
    %     n_fam_comm
    %     n_eat
    %     n_dead]

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


    %Objective function, -1 to maximize

    %maximizes the fish
    f = -1 * [0; no_aq; 0; no_aq; no_aq; 0];

    %Inequality constraints

    %The revenue that the family receives after selling fish either to market
    %or community has to equal to the sum of the cost to repopulate a system
    %with fish along with fish feed, utility costs and transportation costs for
    %the fish to market. cost_repop include fish feed
    b3 = ( cost_repop +  utility_cost_per_cycle + cost_labor_market/no_fam_market);
    A3 = [0, 0, price_fish_mark, price_fish_comm, 0 , 0];

    %The 10% growth rate for which we can expand the number of systems
    b4 = (BIC_growth * cost_investaq + cost_labor_market/no_aq);
    A4 = [price_fish_mark, price_fish_comm * (1 - labor_cost_sell_comm), 0, 0, 0, 0];
    
    %The minimum number of fish the family eats
    b5 = -( min_family_fish_eat );
    A5 = -[0, 0, 0, 0, 1, 0];
    
    %The minimum number of fish the family sells to the market
    b6 = -fish_market_sell_fraction * no_fish_system;
    A6 = -[0, 0, 1, 0, 0, 0];

    %Equality constraints

    %Total number of fish in a single aquaponics system
    beq1 = no_fish_system;
    Aeq1 = [1, 1, 1, 1, 1, 1];

    %Number of dead fish per cycle
    beq2 = fish_death_rate * no_fish_system;
    Aeq2 = [0, 0, 0, 0, 0, 1];

    %negatives to switch inequalities
    b = [b5; b6];
    A = [A5; A6];
    beq = [beq1; beq2; b3; b4];
    Aeq = [Aeq1; Aeq2; A3; A4];
    lb = zeros([1, 6]);
    ub = Inf([1, 6]);
    [x, fval] = linprog(f, A, b, Aeq, beq, lb, ub);

    fval = -fval; %number of fish consumed within the community

    disp(['Family Expenses: ', num2str(b3)]);
    disp(['   Utilitiy costs: ', num2str(utility_cost_per_cycle)]);
    disp(['   Fish repopulation cost: ', num2str(cost_repop)]);
    disp(['   Cost sending fish to market: ', num2str(cost_labor_market/no_fam_market)]);
    disp(['Family Revenue: ', num2str(price_fish_mark * x(3)+ price_fish_comm * x(4))]);
    disp(['   From selling to the market: ', num2str(price_fish_mark * x(3))]);
    disp(['   From selling in community: ', num2str(price_fish_comm * x(4))]);
    disp(['BIC Revenue: ', num2str(A4 * x)]);
    disp(['   From selling to the market: ', num2str(price_fish_mark * x(1))]);
    disp(['   From selling in community: ', num2str(price_fish_comm * (1 - labor_cost_sell_comm) * x(2))]);
    
end

