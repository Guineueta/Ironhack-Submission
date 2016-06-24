class Lexiconomitron

  def eat_t(word)

    word.tr!("T","")
    word.tr!("t","")
    word
  end
end
