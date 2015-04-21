require 'rails_helper'

describe SaveAccount do
  describe '#call' do
    let(:context) { interactor.context }

    context 'when given valid credentials' do
      let(:interactor) { described_class.new(twitter_name: 'foo', twitter_id: '123') }
      let(:account) { double(:account) }

      it 'succeeds' do
        interactor.call

        expect(context).to be_a_success
      end

      it 'provides saved account' do
        interactor.call
        expect(context.account).to be_kind_of(Account)
      end
    end

    context 'when given invalid credentials' do
      let(:interactor) { described_class.new() }

      it 'fails' do
        expect {
          interactor.call
        }.to raise_error(Interactor::Failure)
        expect(context.message).to be_present
      end
    end
  end

  describe '#rollback' do
    let(:account) { double(:account) }
    let(:context) { double(:context, account: account) }
    let(:interactor) { described_class.new(name: 'foo') }

    before do
      expect(interactor).to receive(:context).and_return(context)
    end

    it 'deletes created account' do
      expect(account).to receive(:destroy)
      interactor.rollback
    end
  end
end
