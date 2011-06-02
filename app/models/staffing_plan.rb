class StaffingPlan < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER

  ROLES = ["PM", "BA", "Dev", "QA", "UX", "UI", "CP"]
  CURRENCIES = ["$", "INR"]

  property :week_start_date
  property :week_end_date
  property :no_of_pm_onsite
  property :no_of_pm_offshore
  property :no_of_ba_onsite
  property :no_of_ba_offshore
  property :no_of_dev_onsite
  property :no_of_dev_offshore
  property :no_of_qa_onsite
  property :no_of_qa_offshore
  property :no_of_ux_onsite
  property :no_of_ux_offshore
  property :no_of_ui_onsite
  property :no_of_ui_offshore
  property :no_of_cp_onsite
  property :no_of_cp_offshore
  property :onsite_rate
  property :onsite_velocity
  property :onsite_currency
  property :offshore_rate
  property :offshore_velocity
  property :offshore_currency
end
