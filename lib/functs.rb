    def encrypt(value)
        secret = Digest::SHA1.hexdigest('ocd')
        code = ActiveSupport::MessageEncryptor.new(secret)
        return code.encrypt_and_sign(value.to_s)
    end

    def decrypt(value)
        begin
            secret = Digest::SHA1.hexdigest('ocd')
            code = ActiveSupport::MessageEncryptor.new(secret)
            return code.decrypt_and_verify(value.to_s)
        rescue
            #sign_out
        end
    end

