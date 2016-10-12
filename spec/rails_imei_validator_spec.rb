require 'test_helper'

describe RailsImeiValidator do
  let(:good_imei) { '990000862471853' }
  let(:bad_imei)  { '990000862471850' }
  let(:error_msg) { 'Imei is invalid' }

  before do
    class ValidateImei
      include ActiveModel::Validations
      attr_accessor :imei
    end
  end

  describe 'default imei validation' do
    before do
      class ValidateDefaultImei < ValidateImei
        validates :imei, imei: true
      end
      @object = ValidateDefaultImei.new
    end

    describe 'when imei is missing' do
      it 'is invalid' do
        @object.imei = ''
        @object.wont_be :valid?
        @object.errors.wont_be_empty
        @object.errors.full_messages.must_include error_msg
      end
    end

    describe 'when imei is good' do
      it 'is valid' do
        @object.imei = good_imei
        @object.must_be :valid?
        @object.errors.must_be_empty
      end
    end

    describe 'when imei is bad' do
      it 'is invalid' do
        @object.imei = bad_imei
        @object.wont_be :valid?
        @object.errors.wont_be_empty
        @object.errors.full_messages.must_include error_msg
      end
    end
  end
end
