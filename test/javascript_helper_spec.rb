require 'minitest/autorun'
require 'spec_helper'

class Stripe::JavascriptHelperTest < ActionView::TestCase
  test "should default to v1 if no options are passed" do
    assert_includes stripe_javascript_tag, 'https://js.stripe.com/v1/'
  end

  test "should render v3 if v3 option is passed" do
    assert_includes stripe_javascript_tag(:v3), 'https://js.stripe.com/v3/'
  end

  test 'should render debug js if debug flag is enabled' do
    Rails.application.config.stripe.debug_js = true

    assert_includes stripe_javascript_tag, 'https://js.stripe.com/v1/stripe-debug.js'
  end

  test 'should not render debug js if debug flag is enabled and v3 is selected' do
    Rails.application.config.stripe.debug_js = true

    assert_includes stripe_javascript_tag(:v3), 'https://js.stripe.com/v3/'
  end
end
