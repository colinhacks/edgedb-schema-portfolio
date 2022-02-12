CREATE MIGRATION m1tqh53bdlg65um2u7yi3xgw7udrty75v5aodlnpqsvoz6qz4pqkpq
    ONTO m1taxismukmjil2vp4knd35swk77ytkhgz6yaotcfp6ddyjyiog6zq
{
  ALTER TYPE default::Project {
      CREATE REQUIRED PROPERTY cost -> std::int64 {
          SET REQUIRED USING (0);
      };
  };
};
