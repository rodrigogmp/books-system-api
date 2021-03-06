require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { described_class.new(name: 'Autor Teste') }
  
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid because dont have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid because exists another with the same name' do
    subject.save

    another = Author.new(name: 'Autor Teste')
    expect(another).to_not be_valid
  end

  it 'finds an author record using the name filter' do
    subject.save
    Author.filter(by_name: 'Aut').count.should be == 1
  end
end
