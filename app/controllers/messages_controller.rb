class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end


  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    # requireリクワイアメソッド
    # 送信されたパラメーターの情報を持つparamsが、使用できるメソッドです。
    # requireメソッドは、パラメーターからどの情報を取得するか、選択します。
    # ストロングパラメーターとして使用する場合は、主にモデル名を指定します。

# permitパーミットメソッド
# requireメソッドと同様に、paramsが使用できるメソッドです。
# permitメソッドを使用すると、取得したいキーを指定でき、指定したキーと値のセットのみを取得します。

# mergeマージメソッド
# ハッシュを結合させるときに使用するRubyのメソッドです。
# 今回は、tweetの情報を持つハッシュと、user_idを持つハッシュを結合させます。
# 以下の例のように、2つのハッシュを1つにまとめることができます。
  end
end


