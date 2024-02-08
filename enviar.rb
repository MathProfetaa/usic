require 'net/smtp'

# Obter os dados do formulário
nome = params[:nome]
email = params[:email]
mensagem = params[:mensagem]

# Validar os valores
if nome.blank? || email.blank? || mensagem.blank?
  flash[:error] = 'Preencha todos os campos!'
  redirect_to '/'
end

# Criar o corpo da mensagem
corpo_mensagem = <<~MSG
  Nome: #{nome}
  E-mail: #{email}
  Mensagem: #{mensagem}
MSG

# # Configurar o SMTP
# smtp = Net::SMTP.new('sandbox.smtp.mailtrap.io', 2525)
# smtp.start('sandbox.smtp.mailtrap.io', 'b777da751d2726', '0df76af114df84', :plain)

# # Enviar o e-mail
# smtp.send_message("#{mensagem}", "#{email}", 'contato@matheusqa.eu')

# # Fechar a conexão SMTP
# smtp.finish



Net::SMTP.start('smtp.zoho.eu', 465, 'smtp.zoho.eu', 'contato@matheusqa.eu', '020921M@ria', :login) do |smtp|
  smtp.send_message("#{mensagem}", "#{email}", 'contato@matheusqa.eu')
  smtp.finish
end

# Mensagem de sucesso
flash[:success] = 'Mensagem enviada com sucesso!'
redirect_to '/'