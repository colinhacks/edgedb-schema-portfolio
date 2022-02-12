module default {
  type Project {
    required property name -> str;
    required property cost_per_ton -> int32;
    property description -> str;
  }

  type Portfolio {
    required property name -> str;
    required property cost_per_ton := (
      with projects := .<portfolio[is PortfolioProject]
      select 1 / sum(projects.percentage * projects.project.cost_per_ton)
    );
  }

  type PortfolioProject {
    required link portfolio -> Portfolio; 
    required link project -> Project; 
    required property percentage -> float64;
  }
}
