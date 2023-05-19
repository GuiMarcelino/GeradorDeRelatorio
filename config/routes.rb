Rails.application.routes.draw do
  get 'reports/generate_payments_report', to: 'reports#generate_payments_report'
end
