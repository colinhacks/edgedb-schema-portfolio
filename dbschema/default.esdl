module default {
  type Project {
    required property name -> str;
    multi link portfolios := .<project[is PortfolioProject];
    required property cost -> int64;
  }

  type Portfolio {
    multi link projects := (select .<portfolio[is PortfolioProject]);
    required property cost_per_ton := (
      with projects := .<portfolio[is PortfolioProject]
      select projects.percentage * projects.project.cost
    )
  }

  type PortfolioProject {
    required link portfolio -> Portfolio; 
    required link project -> Project; 
    required property percentage -> float64;
  }
}
