class ApplicationController < ActionController::Base

    def hello
        render html: "¡Hola, mundo!"
    end

    def goobye
        render html: "Goobye, world!"
    end
end
