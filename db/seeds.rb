require 'faker'

# Criar 10 barbeiros
10.times do
  Barber.create(
    name: Faker::Name.name,
    shift: %w[first second].sample,
    level: %w[starter middle senior].sample
  )
end

# Criar 20 clientes
20.times do
  Client.create(
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    active: true
  )
end

# Criar 30 pagamentos
30.times do
  Payment.create(
    client: Client.all.sample,
    barber: Barber.all.sample,
    value: [25.00, 30.00, 35.00].sample
  )
end
