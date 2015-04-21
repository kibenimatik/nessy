require 'rails_helper'

describe AccountsController do
  describe '#create' do
    before do
      expect(CreateAccount).to receive(:call).once.with(name: 'foo').and_return(context)
    end

    context 'when successful' do
      let(:context) { double(:context, success?: true) }

      it 'redirects to the homepage' do
        response = post :create, account: { name: 'foo' }

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when unsuccessful' do
      let(:context) { double(:context, success?: false, message: 'message') }

      it 'sets a flash message' do
        expect {
          post :create, account: { name: 'foo' }
        }.to change {
          flash[:alert]
        }.from(nil).to('message')
      end

      it 'redirects to the homepage' do
        response = post :create, account: { name: 'foo' }

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
