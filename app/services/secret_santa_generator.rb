class SecretSantaGenerator
  attr_reader :params, :gift_recipient, :errors, :cookies
  def initialize(params, cookies)
    @params = params
    @cookies = cookies
    @errors = []
  end

  def already_santa?
    gift_recipient.present?
  end

  def generate
    return false if params_not_valid?
    if (@gift_recipient = fetch_gift_recipient).present?
      @errors << "You've already participated! Contact Admin santa for details."
      false
    else
      @gift_recipient = fetch_random_gift_grantor
      @gift_recipient.update_column(:grantor, params[:grantor])
    end
  end

  def valid_names
    all_gift_grantors.map(&:recipient)
  end

  def quote
    @quote ||= Quote.offset(rand(Quote.count)).first
  end

  private

  def params_not_valid?
    @errors << 'Please enter your name!' if params[:grantor].blank?
    @errors << 'Please enter valid name from the list!' if params[:grantor].present? && all_gift_grantors.map(&:recipient).exclude?(params[:grantor])
    @errors << "You've already participated!" if cookies && cookies[:_ga]


    @errors.any?
  end

  def fetch_gift_recipient
    all_gift_grantors.find { |gg| gg.grantor == params[:grantor] }
  end

  def all_gift_grantors
    @all_gift_grantors ||= GiftGrantor.all
  end

  def gift_grantors_without_grantor
    all_gift_grantors.select { |gg| gg.grantor.nil? }
  end

  def fetch_random_gift_grantor
    rand_index = rand(gift_grantors_without_grantor.size - 1)

    gift_grantors_without_grantor.select { |gg| gg.recipient != params[:grantor] }[rand_index]
  end
end
