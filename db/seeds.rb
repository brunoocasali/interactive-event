admin = Role.create(key: :admin, name: 'Admin',
                    description: 'Pode cadastrar usuários além do que o usuário comum pode fazer.')
Role.create!(key: :common, name: 'Common',
             description: 'Pode criar eventos e alterar seu perfil.')
root = Role.create(key: :root, name: 'Root',
                   description: 'Master of System, pode fazer até chover!')

User.create!(
  name: 'Romiel Gralak',
  email: 'rg2producoes@gmail.com',
  password: 'teste123',
  password_confirmation: 'teste123',
  role_id: admin.id,
  phone: '9999-9999'
)

User.create!(
  name: 'Bruno Casali',
  email: 'brunoocasali@gmail.com',
  password: 'teste123',
  password_confirmation: 'teste123',
  role_id: root.id,
  phone: '9999-9999'
)
