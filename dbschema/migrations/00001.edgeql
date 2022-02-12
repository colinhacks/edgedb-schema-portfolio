CREATE MIGRATION m1taxismukmjil2vp4knd35swk77ytkhgz6yaotcfp6ddyjyiog6zq
    ONTO initial
{
  CREATE TYPE default::Portfolio;
  CREATE TYPE default::PortfolioProject {
      CREATE REQUIRED LINK portfolio -> default::Portfolio;
      CREATE REQUIRED PROPERTY percentage -> std::float64;
  };
  ALTER TYPE default::Portfolio {
      CREATE MULTI LINK projects := (.<portfolio[IS default::PortfolioProject]);
  };
  CREATE TYPE default::Project {
      CREATE REQUIRED PROPERTY name -> std::str;
  };
  ALTER TYPE default::PortfolioProject {
      CREATE REQUIRED LINK project -> default::Project;
  };
  ALTER TYPE default::Project {
      CREATE MULTI LINK portfolios := (.<project[IS default::PortfolioProject]);
  };
};
