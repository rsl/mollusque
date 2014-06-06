require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  authenticated_context do
    context 'GET :index' do
      setup do
        create(:site)
        get :index
      end

      should respond_with(:success)
      should render_json(:sites, type: Array, required: %w{id name}, forbidden: 'api_token')
    end

    context 'POST :create' do
      context 'when successful' do
        setup do
          post :create, site: attributes_for(:site)
        end

        should respond_with(:created)
        should render_json(:site, required: %w{id name}, forbidden: 'api_token')
      end

      context 'when unsuccessful' do
        setup do
          post :create, site: {name: ''}
        end

        should respond_with(:unprocessable_entity)
        should render_json(:errors, required: 'name')
      end
    end

    context 'GET :show' do
      setup do
        @site = create(:site)
        get :show, id: @site
      end

      should respond_with(:success)
      should render_json(:site, required: %w{id name}, forbidden: 'api_token')
    end

    context 'PATCH :update' do
      setup do
        @site = create(:site)
      end

      context 'when successful' do
        setup do
          patch :update, id: @site, site: {name: 'changed'}
        end

        should respond_with(:no_content)
      end

      context 'when unsuccessful' do
        setup do
          patch :update, id: @site, site: {name: ''}
        end

        should respond_with(:unprocessable_entity)
        should render_json(:errors, required: 'name')
      end
    end

    context 'DELETE :destroy' do
      setup do
        @site = create(:site)
        delete :destroy, id: @site
      end

      should respond_with(:no_content)
    end
  end
end
