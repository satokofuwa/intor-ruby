
require 'byebug'
# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
  def hand
   
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
     input_hand=gets.chomp
    
    # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
        while true
           if input_hand =="0"||input_hand=="1"||input_hand=="2"
              return input_hand
             else
              puts "0〜2の数字を入力してください"
              puts "0:グー, 1:チョキ, 2:パー"
             input_hand=gets.chomp
          end
        end
      
  end
end

      


# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
  def hand
    enemy_hand=rand(3)
    # グー、チョキ、パーの値をランダムに取得する。
    return enemy_hand

  end
end

# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand,enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{相手の手}です。」と出力させます。
    puts "相手の手は#{janken[enemy_hand.to_i]}です。"

    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。

    i=(((player_hand.to_i)-(enemy_hand.to_i))+3)%3
    puts i
    if i==2 
        puts "あなたの勝ちです"
        return false
      elsif i==1
        puts "あなたの負けです"
        return false
     else
        puts "あいこです"
        return true
    end
  end
end
# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  # selfを使用することで、GameStartをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。

  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    
    janken.pon(player.hand,enemy.hand)

    # 変数「next_game」に「true」を代入しましょう。
    # 「next_game」が「false」だと繰り返し処理を終了し、「true」だと繰り返し処理を継続します。
    next_game=true
    while next_game 
      # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
      #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon
