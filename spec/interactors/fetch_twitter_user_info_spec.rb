require 'rails_helper'

describe FetchTwitterUserInfo do
  describe '#call' do
    let(:context) { interactor.context }

    context 'when given invalid credentials' do
      let(:interactor) { described_class.new() }

      it 'fails when Twitter user does not exists' do
        expect(Twitter).to receive(:client).and_raise(Twitter::Error::NotFound)
        expect {
          interactor.call
        }.to raise_error(Interactor::Failure)

        expect(context.message).to eql('Twitter account does not exists')
      end

      it 'fails when Twitter API rate limit exceeded' do
        expect(Twitter).to receive(:client).and_raise(Twitter::Error::TooManyRequests.new('', {'x-rate-limit-reset' => Time.now.to_i + 10000}))
        expect {
          interactor.call
        }.to raise_error(Interactor::Failure)

        expect(context.message).to eql('Twitter API rate limit exceeded. Please try in 10000 seconds')
      end

      it 'fails when some other exception raised' do
        expect(Twitter).to receive(:client).and_raise(StandardError)
        expect {
          interactor.call
        }.to raise_error(Interactor::Failure)

        expect(context.message).to eql('Could not get twitter user info')
      end
    end
  end
end
