require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  #if name, email, password exists, account is valis
  it 'is vaild with a name, email and password' do
    user = User.new(
      name: 'Anakin',
      email: 'anakinskywalker@jedi.com',
      password: 'IamYourFather'
    )
    expect(user).to be_valid
  end

  #if without name , then invalid
  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?

    expect(user.errors[:name]).to include("can't be blank")
  end

  #if without email, then invalid
  it 'is invalid without a email address' do
    user = User.new(email: nil)
    user.valid?

    expect(user.errors[:email]).to include("can't be blank")
  end


  #if email is not unique, then invalid
  it 'is invalid with a duplicate email adress' do
    #first create user email:skywalker@jedi.com
    user = User.create(
      name: 'Luke',
      email: 'skywalker@jedi.com',
      password: 'IamJedi'
    )

    user = User.new(
      name: 'Anakin',
      email: 'skywalker@jedi.com',
      password: 'IamYourFather'
    )

    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
