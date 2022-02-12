CREATE MIGRATION m1rpzv2xcqelvpwmpb25oyyes4mw2smj72as5iwr6qpo6uxf5gqwsa
    ONTO m14xozqe5aywna4aqnudn4heob7f2bx2or22nhdom7xawakxrozanq
{
  ALTER TYPE default::Portfolio {
      DROP LINK projects;
  };
  ALTER TYPE default::Project {
      ALTER PROPERTY cost {
          RENAME TO cost_per_ton;
      };
  };
  ALTER TYPE default::Project {
      ALTER PROPERTY cost_per_ton {
          SET TYPE std::int32;
      };
  };
  ALTER TYPE default::Portfolio {
      ALTER PROPERTY cost_per_ton {
          USING (WITH
              projects := 
                  .<portfolio[IS default::PortfolioProject]
          SELECT
              (1 / std::sum((projects.percentage * projects.project.cost_per_ton)))
          );
      };
  };
  ALTER TYPE default::Portfolio {
      CREATE REQUIRED PROPERTY name -> std::str {
          SET REQUIRED USING ('');
      };
  };
  ALTER TYPE default::Project {
      DROP LINK portfolios;
  };
  ALTER TYPE default::Project {
      CREATE PROPERTY description -> std::str;
  };
};
