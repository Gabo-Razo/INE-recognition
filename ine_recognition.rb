require 'rtesseract'

module GR_RECOGNITION
  class Ine
    attr_reader :raw_text

    def initialize(image_path, lang: 'spa')
      @ocr = RTesseract.new(image_path, lang: lang)
      @raw_text = @ocr.to_s
    end

    def name
      lines = @raw_text.split("\n").map(&:strip).reject(&:empty?)
      start_idx = lines.find_index { |l| l.match?(/NOMBRE/i) }
      end_idx = lines.find_index { |l| l.match?(/DOMICILIO/i) }
      start_idx && end_idx ? lines[(start_idx + 1)...end_idx].join(" ") : "No detectado"
    end

    def address
      lines = @raw_text.split("\n").map(&:strip).reject(&:empty?)
      start_idx = lines.find_index { |l| l.match?(/DOMICILIO/i) }
      end_idx = lines.find_index { |l| l.match?(/CLAVE/i) }
      start_idx && end_idx ? lines[(start_idx + 1)...end_idx].join(", ") : "No detectado"
    end

    def section
      matches = @raw_text.scan(/\b\d{4}\b/)
      matches.find { |n| n != "2025" && n != "2035" && n != "2007" } || "Not found"
    end

    def validity
      match = @raw_text.match(/(\d{4})\s*-\s*(\d{4})/)
      match ? match[0] : "Not found"
    end

    def elector_key
      match = @raw_text.match(/CLAVE DE ELECTOR\s+([A-Z0-9]+)/i)
      key = match ? match[1] : @raw_text.match(/[A-Z]{6}[A-Z0-9]{12}/i)&.to_s
      key ? key.tr('O', '0') : "No detectada"
    end

    def curp
      match = @raw_text.gsub(/\s+/, "").match(/[A-Z]{4}\d{6}[A-Z]{6}[A-Z0-9]{2}/i)
      match ? match[0].tr('O', '0') : "No detectado"
    end
  end
end
