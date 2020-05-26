require 'test_helper'

class ValidateDefaultImei
  include ActiveModel::Validations
  attr_accessor :imei

  validates :imei, imei: true
end

describe 'RailsImeiValidator' do
  attr_reader :object
  let(:good_imei) { '990000862471853' }
  let(:bad_imei)  { '990000862471850' }
  let(:error_msg) { 'Imei is invalid' }

  subject { ValidateDefaultImei.new }

  describe 'default imei validation' do
    describe 'when imei is missing' do
      before do
        subject.imei = ''
      end

      it 'is invalid' do
        _(subject).wont_be :valid?
        _(subject.errors).wont_be_empty
        _(subject.errors.full_messages).must_include error_msg
      end
    end

    describe 'when imei is good' do
      before do
        subject.imei = good_imei
      end

      it 'is valid' do
        _(subject).must_be :valid?
        _(subject.errors).must_be_empty
      end
    end

    describe 'when imei is bad' do
      before do
        subject.imei = bad_imei
      end

      it 'is invalid' do
        _(subject).wont_be :valid?
        _(subject.errors).wont_be_empty
        _(subject.errors.full_messages).must_include error_msg
      end
    end
  end
end
