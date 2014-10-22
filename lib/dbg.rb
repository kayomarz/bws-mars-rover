class Dbg
  
  @@out = []

  def Dbg.dbg(str)
    @@out << str
  end

  def Dbg.print
    @@out.join("\n")
  end

end
