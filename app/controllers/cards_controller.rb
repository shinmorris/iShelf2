class CardsController < ApplicationController

  require "payjp"
  
  protect_from_forgery :except => [:pay]
  before_action :authenticate_user!
  # before_action :set_card
  
  Payjp::api_key = ENV['PAYJP_PRIVATE_KEY']

  

  def self.create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end

  #
  # カードトークンを用いて支払いを作成する
  #
  def self.create_charge_by_token(token, amount)
    Payjp::Charge.create(
      amount:   500,
      card:     payjp-token,
      currency: 'jpy'
    )
    # charge = Payjp::Charge.create(
    #   :amount => 500,
    #   :card => 'payjp-token',
    #   :currency => 'jpy',
    # )
  end

  #
  # 顧客を登録する
  #
  def self.create_customer(number, cvc, exp_month, exp_year)
    token = self.create_token(number, cvc, exp_month, exp_year)
    Payjp::Customer.create(card: token)
  end

  #
  # 顧客を用いて支払いを作成する
  #
  def self.create_charge_by_customer(customer, amount)
    Payjp::Charge.create(
      amount:   500,
      customer: customer,
      currency: 'jpy'
    )
  end

  #
  # プランを作成する
  #
  def self.create_plan(amount, interval = 'month')
    Payjp::Plan.create(
      amount:   500,
      interval: interval,
      currency: 'jpy'
    )
  end

  #
  # 定額課金を作成する
  #
  def self.create_subscription(customer, plan)
    Payjp::Subscription.create(
      customer: customer,
      plan:     plan,
    )
  end

  def pay #クレジットカード登録
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # ここでテスト鍵をセットしてあげる(環境変数にしても良い)
    if params['payjp-token'].blank?
    # paramsの中にjsで作った'payjpTokenが存在するか確かめる
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user}
      )
     # ↑ここでjay.jpに保存
      @card = Card.new(user_id: @current_user.id, customer_token: customer.id)
     # ここでdbに保存
      if @card.save
        redirect_to root_path
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end

end
end
end
