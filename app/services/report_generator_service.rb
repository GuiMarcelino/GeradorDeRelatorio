require 'caxlsx'
require 'axlsx_styler'

class ReportGeneratorService
  def self.generate_payments_report
    workbook = Axlsx::Package.new
    sheet = workbook.workbook.add_worksheet(name: 'Payments Report')

    # Define as cores para os diferentes elementos do relatório
    header_color = 'FFA6A6A6'    # Cinza claro para o cabeçalho
    barber_color = 'FFE5F1FF'    # Azul claro para a coluna de barbeiro
    client_color = 'FFC6E0B4'    # Verde claro para a coluna de cliente
    payment_color = 'FFFFD9B3'   # Laranja claro para a coluna de pagamento

    # Estilo para o cabeçalho
    header_style = sheet.styles.add_style(b: true, sz: 18, bg_color: header_color)

    # Estilo para as colunas
    barber_style = sheet.styles.add_style(bg_color: barber_color)
    client_style = sheet.styles.add_style(bg_color: client_color)
    payment_style = sheet.styles.add_style(bg_color: payment_color)

    sheet.add_row ['Barbeiro', 'Cliente', 'Total Receber'], style: header_style

    Barber.includes(:payments).each do |barber|
      next if barber.payments.empty?  # Ignora barbeiros sem pagamentos

      barber.payments.each do |payment|
        sheet.add_row [barber.name, payment.client.name, payment.value], style: [barber_style, client_style, payment_style]
      end
    end

    # Adiciona bordas em todas as linhas e colunas
    sheet.add_style 'A1:C1', border: { style: :thin, color: '000000' }
    sheet.add_style "A2:C#{Payment.count + 1}", border: { style: :thin, color: '000000' }

    report_file = Rails.root.join('app', 'reports', 'barber_payments_report.xlsx')
    workbook.serialize(report_file)

    return true
  rescue StandardError => e
    e.message
    return false
  end
end
