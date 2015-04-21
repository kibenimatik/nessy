require 'rails_helper'

describe CreateAccount do
  describe '#call' do


    let(:context) { interactor.context }

    context 'when given valid credentials' do
      let(:interactor) { CreateAccount.new(name: 'foo') }
      let(:account) { double(:account) }

      it 'succeeds' do
        interactor.call

        expect(context).to be_a_success
      end
    end

    context 'when given invalid credentials' do
      let(:interactor) { CreateAccount.new() }

      it 'fails' do
        expect {
          interactor.call
        }.to raise_error(Interactor::Failure)
        expect(context.message).to be_present
      end
    end
  end
end
