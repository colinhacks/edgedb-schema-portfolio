CREATE MIGRATION m14xozqe5aywna4aqnudn4heob7f2bx2or22nhdom7xawakxrozanq
    ONTO m1uzxkuj4sodt4ln6ptrgxgegq75hyoqathy5zm7zjffcvhohsejiq
{
  ALTER TYPE default::Portfolio {
      ALTER LINK projects {
          USING (SELECT
              .<portfolio[IS default::PortfolioProject]
          );
      };
  };
};
