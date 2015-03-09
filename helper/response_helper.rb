module ResponseHelper
  
  module RESPONSE_CODE 
    UNKNOWN = {code: 100, msg: 'UNKNOWN'}
    PARAMS_ILLEGAL = {code: 101, msg: 'PARAMS_ILLEGAL'}
    PWD_ILLEGAL = {code: 102, msg: 'PWD_ILLEGAL'}
    LOGIN_ERROR = {code: 103, msg: 'LOGIN_ERROR'}
  end

end