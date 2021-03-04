class Public::HomesController < ApplicationController
  def top
  	@genres = Genre.where(valid_invalid_status: 0)
  	@items = Item.limit(8).offset(4)
  	# "limit"は、指定したレコード数だけ取得する（最大取得行数）。
  	# "offset"は、指定した位置からレコードを取得する（取得開始位置）。
  end

  def about
  end
end
