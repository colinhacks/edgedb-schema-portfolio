CREATE MIGRATION m1uzxkuj4sodt4ln6ptrgxgegq75hyoqathy5zm7zjffcvhohsejiq
    ONTO m1tqh53bdlg65um2u7yi3xgw7udrty75v5aodlnpqsvoz6qz4pqkpq
{
  ALTER TYPE default::Portfolio {
      CREATE REQUIRED PROPERTY cost_per_ton := (std::sum(.<portfolio[IS default::PortfolioProject].percentage));
  };
};
