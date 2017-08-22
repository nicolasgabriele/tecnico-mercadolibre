RSpec.describe "webdriver automation(medium)", type: :feature, js: true do
    it "Proceso de compra" do
      visit "http://www.mercadolibre.com.ar/"
      login
      busqueda("item de testeo")
      seleccionar_primer_producto
      comprar
      click_continuar
      click_continuar
      select_payment_method("Rapipago")
      click_continuar
      click_confirmar
      check_page_for("Rapipago")
    end
end

def login
  click_on "Ingresa"
  find("#user_id").set("TEST3JKKR44N")
  click_on "Continuar"
  find("#password").set("qatest2574")
  click_on "Ingresar"
end

def busqueda(item)
  find(".nav-search-input").set(item)
  find(".nav-search-btn").click
end

def seleccionar_primer_producto
  find(".list-view-item-title", match: :first).click
end

def comprar
  find("#BidButtonTop").click
end

def click_continuar
  
  click_on "Continuar"
end

def select_payment_method(payment_method)
  select payment_method, from: "paymentMethodSelect"
end

def click_confirmar
  click_on "Confirmar"
end

def check_page_for(text)
  expect(page).to have_content("Rapipago")
end