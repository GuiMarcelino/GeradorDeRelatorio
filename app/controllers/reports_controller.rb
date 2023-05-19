class ReportsController < ApplicationController
  def generate_payments_report
    if ReportGeneratorService.generate_payments_report
      render json: { message: 'Relatório de pagamentos gerado com sucesso!' }
    else
      render json: { error: 'Ocorreu um erro ao gerar o relatório de pagamentos.' },
        status: :unprocessable_entity
    end
  end
end
