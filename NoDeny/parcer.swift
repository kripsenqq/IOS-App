//
//  parcer.swift
//  NoDeny
//
//  Created by Евгений Подъячев on 22.04.2023.
//

import Foundation


var url_bill_web = ""

var billUrl = ""

//var defaults = UserDefaults.standard

var login = ""

var password = ""

var apiUrlAuth = ""


class NetworkServiceWithAsync {

    static let shared = NetworkServiceWithAsync(); private init () { }
    
    func ReadError() async throws -> NoError {//проверка правильности url
        guard let webburll = URL(string: billUrl) else {
            throw NetworkingError.badUrl
        }
        let responce = try await URLSession.shared.data(from: webburll)
        let decoder = JSONDecoder()
        let res_error = try decoder.decode(NoError.self, from: responce.0)
        
        return res_error
    }
    func ReadOk() async throws -> NoKey {//проверка авторизации
        guard let webburll = URL(string: billUrl) else{
            throw NetworkingError.badUrl
        }
        let responce = try await URLSession.shared.data(from: webburll)
        let decoder = JSONDecoder()
        let res_ok = try decoder.decode(NoKey.self, from: responce.0)
        return res_ok
    }
    func ReadNoData() async throws -> NoData {//Получение всех данных
        guard let webburll1 = URL(string: billUrl) else{
            throw NetworkingError.badUrl
        }
        let responce = try await URLSession.shared.data(from: webburll1)
        let decoder = JSONDecoder()
        let res_ok = try decoder.decode(NoKey.self, from: responce.0)
        let ses_ses = res_ok.ses
        func createSesURL()->URL?{
            let url_1 = apiUrlAuth
            let url_2 = "/cgi-bin/noapi.pl?a=u_main&_ses="
            let url_3 = ses_ses
            let url_4 = url_1 + url_2 + url_3
            
            let url_result = URL(string: url_4)
            return url_result
        }
        guard let webburll2 = createSesURL() else{
            throw NetworkingError.badUrl
        }
        let responce2 = try await URLSession.shared.data(from: webburll2)
        let decoder2 = JSONDecoder()
        let res_NoData = try decoder2.decode(NoData.self, from: responce2.0)
        return res_NoData
    }
    enum NetworkingError: Error {
        case badUrl, badRequest, badResponse}
}

/* 
     ReadError
 
 func ReadError() async throws -> NoError: Это объявление функции с именем ReadError(). Оно указывает, что эта функция будет асинхронной (async) и может бросать ошибки (throws). Она возвращает объект типа NoError.
 guard let webburll = URL(string: billUrl) else { throw NetworkingError.badUrl }: В этой строке кода создается объект URL из строки billUrl. Если billUrl не может быть преобразовано в объект URL, то срабатывает блок guard, и функция бросает ошибку типа NetworkingError.badUrl. В противном случае, webburll становится действительным URL.
 let responce = try await URLSession.shared.data(from: webburll): Здесь выполняется асинхронный запрос к серверу с использованием URLSession. Метод data(from:) получает данные с указанного URL (webburll). Этот вызов также может бросить ошибку, поэтому он находится в блоке try. Результат запроса сохраняется в responce.
 let decoder = JSONDecoder(): Создается экземпляр JSONDecoder, который будет использоваться для декодирования данных JSON.
 let res_error = try decoder.decode(NoError.self, from: responce.0): Здесь выполняется декодирование данных из responce в объект типа NoError с использованием JSONDecoder. Этот вызов также находится в блоке try, так как декодирование может вызвать ошибку.
 оздает URL из строки billUrl.
 Выполняет асинхронный запрос к серверу с использованием URLSession, чтобы получить данные.
 Декодирует полученные данные в объект типа NoError с помощью JSONDecoder.
 
 
    ReadOk
 func ReadOk() async throws -> NoKey: Это объявление функции ReadOk(). Она также асинхронная (async) и может бросать ошибки (throws). Результат ее выполнения - объект типа NoKey.
 guard let webburll = URL(string: billUrl) else { throw NetworkingError.badUrl }: Здесь создается URL из строки billUrl. Если billUrl не может быть преобразовано в действительный URL, то срабатывает блок guard, и функция бросает ошибку NetworkingError.badUrl.
 let responce = try await URLSession.shared.data(from: webburll): В этой строке выполняется асинхронный запрос к серверу с использованием URLSession. Метод data(from:) получает данные с указанного URL (webburll). Этот вызов также может бросить ошибку, поэтому он находится в блоке try. Результат запроса сохраняется в responce.
 let decoder = JSONDecoder(): Создается экземпляр JSONDecoder, который будет использоваться для декодирования данных JSON.
 let res_ok = try decoder.decode(NoKey.self, from: responce.0): Здесь выполняется декодирование данных из responce в объект типа NoKey с использованием JSONDecoder. Этот вызов также находится в блоке try, так как декодирование может вызвать ошибку.
 Итак, этот код выполняет следующие действия:

 Создает URL из строки billUrl.
 Выполняет асинхронный запрос к серверу с использованием URLSession, чтобы получить данные.
 Декодирует полученные данные в объект типа NoKey с помощью JSONDecoder.
 
 
 
    ReadNoData
 func ReadNoData() async throws -> NoData: Это объявление функции ReadNoData(). Эта функция также асинхронная (async) и может бросать ошибки (throws). Результат выполнения этой функции - объект типа NoData.
 guard let webburll1 = URL(string: billUrl) else { throw NetworkingError.badUrl }: Здесь создается URL из строки billUrl. Если billUrl не может быть преобразовано в действительный URL, то срабатывает блок guard, и функция бросает ошибку NetworkingError.badUrl.
 let responce = try await URLSession.shared.data(from: webburll1): Это асинхронный запрос к серверу, чтобы получить данные с URL webburll1. Результат запроса сохраняется в responce.
 let decoder = JSONDecoder(): Создается экземпляр JSONDecoder, который будет использоваться для декодирования данных JSON.
 let res_ok = try decoder.decode(NoKey.self, from: responce.0): Здесь выполняется декодирование данных из responce в объект типа NoKey с использованием JSONDecoder. Этот вызов также находится в блоке try, так как декодирование может вызвать ошибку.
 let ses_ses = res_ok.ses: Значение ses из объекта NoKey сохраняется в переменной ses_ses.
 func createSesURL()->URL?: Это объявление функции createSesURL(), которая возвращает опциональный URL. Эта функция создает URL на основе apiUrlAuth и ses_ses. URL составляется из нескольких частей и затем преобразуется в URL.
 guard let webburll2 = createSesURL() else { throw NetworkingError.badUrl }: Здесь вызывается функция createSesURL() для создания второго URL (webburll2). Если URL не может быть создан, то срабатывает блок guard, и функция бросает ошибку NetworkingError.badUrl.
 let responce2 = try await URLSession.shared.data(from: webburll2): Это второй асинхронный запрос к серверу, чтобы получить данные с URL webburll2. Результат запроса сохраняется в responce2.
 let decoder2 = JSONDecoder(): Создается второй экземпляр JSONDecoder, который будет использоваться для декодирования данных JSON.
 let res_NoData = try decoder2.decode(NoData.self, from: responce2.0): Здесь выполняется декодирование данных из responce2 в объект типа NoData с использованием второго JSONDecoder. Этот вызов также находится в блоке try, так как декодирование может вызвать ошибку.
 Итак, этот код выполняет следующие действия:

 Создает URL из строки billUrl.
 Выполняет асинхронный запрос к серверу, чтобы получить данные.
 Декодирует полученные данные в объект типа NoKey с помощью JSONDecoder.
 Создает второй URL с использованием apiUrlAuth и ses_ses.
 Выполняет второй асинхронный запрос к серверу, чтобы получить данные.
 Декодирует полученные данные в объект типа NoData с помощью второго JSONDecoder.
 */
