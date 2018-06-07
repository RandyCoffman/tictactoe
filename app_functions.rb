def choose_ai(size=3,marker,difficulty1)
    if difficulty1 == "1"
        Random_ai.new(size,marker)
    elsif difficulty1 == "2"
        Sequential_ai.new(size,marker)
    else difficulty1 == "3"
        Unbeatable_ai.new(size,marker)
    end
end

def choose_ai2(player,size=3,marker,difficulty2)
    if difficulty2 == "1"
        Random_ai.new(size,marker)
    elsif difficulty2 == "2"
        Sequential_ai.new(size,marker)
    else difficulty2 == "3"
        Unbeatable_ai.new(size,marker)
    end
end