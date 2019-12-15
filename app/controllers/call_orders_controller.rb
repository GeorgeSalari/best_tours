class CallOrdersController < ApplicationController
  def create
    call_order = CallOrder.new(call_order_params)
    if call_order.save
      flash[:success] = 'Спасибо за запрос, мы скоро с вами свяжимся!'
      UserMailer.with(call_order: call_order).call_request.deliver_later
      redirect_to success_path
    else
      flash[:error] = 'Что то пошло не так, попробуйте снова.'
      redirect_back fallback_location: root_path
    end
  end

  private
  def call_order_params
    params.require(:call_order).permit(:customer_name, :customer_phone, :call_type => [])
  end
end
