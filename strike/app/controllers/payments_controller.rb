class PaymentsController < ApplicationController
    def index
        render json: Payment.all
    end

    def create
        payment = Payment.new(payments_params)

        if payment.save
            render json: payment, status: :created
        else
            render json: { errors: payment.errors }, status: :unprocessable_entity
        end
    end

    def update
        payment = Payment.find(params[:id])
        payment.update(payments_params)

        if payment.save
            render json: payment, status: :ok
        else 
            render json: { errors: payment.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        payment = Payment.find_by(id: params[:id])

        if payment.nil?
            render json: { error: "Payment not found" }, status: :not_found
            return
        end

        if payment.destroy
            render json: { message: "Payment deleted successfully" }, status: :ok
        else
            render json: { errors: payment.errors }, status: :unprocessable_entity
        end
    end

    private

    def payments_params
        params.require(:payment).permit(:description, :amount)
    end
end
