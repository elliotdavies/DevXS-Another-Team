<div class="page-header">
  <h2>University: {{_id}}</h2>
</div>

<img style="float:right;" src="http://maps.googleapis.com/maps/api/staticmap?center={{lat}},{{long}}&size=200x200&sensor=false&zoomlevel=10">

{{#guardian}}
  <h3>Guardian Data</h3>

  <dl>
    <dt>2012 Rank</dt>
    <dd>{{rank12}}</dd>
    <dt>2011 Rank</dt>
    <dd>{{rank11}}</dd>
    <dt>2010 Rank</dt>
    <dd>{{rank10}}</dd>
    <dt>2009 Rank</dt>
    <dd>{{rank09}}</dd>
    <dt>Entry Tariff</dt>
    <dd>{{entry_tariff}}</dd>
    <dt>Student:staff ratio</dt>
    <dd>{{student_staff_ratio}}</dd>
    <dt>Expenditure</dt>
    <dd>{{expenditure}}</dd>
    <dt>Career prospects</dt>
    <dd>{{carreer_prospects_pc}}</dd>
    <dt>NSS teaching %</dt>
    <dd>{{nss_teaching_pc}}</dd>
    <dt>NSS feedback %</dt>
    <dd>{{nss_feedback_pc}}</dd>
    <dt>NSS overall</dt>
    <dd>{{nss_overall}}</dd>
    <dt>Average teaching score</dt>
    <dd>{{avg_teaching_score}}</dd>
    <dt>Average teaching score</dt>
    <dd>{{avg_teaching_score}}</dd>
    <dt>Value added score</dt>
    <dd>{{value_added_score}}</dd>
    <dt>Full time students 2009</dt>
    <dd>{{ft_first_students}}</dd>
    <dt>Dropout first entrants 2008</dt>
    <dd>{{dropout_first_entrants08}}</dd>
  </dl>

{{/guardian}}


{{#council_tax}}
  <h3>Council tax</h3>

   <dl>
    <dt>Percentage change in total bill</dt>
    <dd>{{percentage_change_in_total_bill}}</dd>
    <dt>Amount councile levies</dt>
    <dd>{{amount_council_levies}}</dd>
    <dt>Change in council portion</dt>
    <dd>{{change_in_council_portion}}</dd>
    <dt>Difference from national average</dt>
    <dd>{{difference_from_national_average}}</dd>
    <dt>Amount paid</dt>
    <dd>{{amount_paid}}</dd>
  </dl>

{{/council_tax}}

{{#benefit_sanctions}}
  <h3>Benefit sanctions</h3>

   <dl>
    <dt>Number of JSA claimants</dt>
    <dd>{{number_JSA_claimants}}</dd>
    <dt>Referrals per claimant</dt>
    <dd>{{referrals_per_claimant}}</dd>
    <dt>Total cases referred per 1000</dt>
    <dd>{{total_cases_referred_per_000}}</dd>
    <dt>Non adverse decisions per 1000</dt>
    <dd>{{non_adverse_decisions_per_000}}</dd>
    <dt>No decision per 1000</dt>
    <dd>{{no_decision_per_000}}</dd>
    <dt>Adverse decisions per 1000</dt>
    <dd>{{adverse_decisions_per_000}}</dd>
    <dt>Population in 1000s</dt>
    <dd>{{population_in_000s}}</dd>
    <dt>Working age population in 000s</dt>
    <dd>{{working_age_population_in_000s}}</dd>
  </dl>

{{/benefit_sanctions}}

{{#life_expectancy}}

<h3>Life Expectancy</h3>

<dl>
  <dt>Male Area Life Expectancy (UK)</dt>
  <dd>{{male_area_life_expectancy}} ({{UK_male_average}})</dd>
  <dt>Female Area Life Expectancy (UK)</dt>
  <dd>{{women_area_life_expectancy}} ({{UK_women_average}})</dd>
</dl>

{{/life_expectancy}}

{{#deprivation}}
<h3>Social Deprivation</h3>
<dl>
  <dt>Income Scale</dt>
  <dd>{{income_scale}}</dd>

</dl>

{{/deprivation}}
