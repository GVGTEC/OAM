module NotaFiscalItensHelper
  def formatQtd(number)
    if number == number.to_i
      number.to_i
    else
      number
    end
  end
end
