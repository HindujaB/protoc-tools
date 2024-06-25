import ballerina/grpc;
import ballerina/grpc.types.wrappers as swrappers;
import ballerina/protobuf;
import ballerina/protobuf.types.wrappers;

public const string HELLOWORLDWITHDUPLICATEINPUTOUTPUT_DESC = "0A2868656C6C6F576F726C64576974684475706C6963617465496E7075744F75747075742E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22330A034D736712120A046E616D6518012001280952046E616D6512180A076D65737361676518022001280952076D65737361676532FE020A0443686174122B0A0563616C6C3112042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122B0A0563616C6C3212042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122D0A0563616C6C3312042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001122D0A0563616C6C3412042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001122D0A0563616C6C35121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D73672801122D0A0563616C6C36121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D73672801122F0A0563616C6C37121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D736728013001122F0A0563616C6C38121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D73672801300132FF020A054368617432122B0A0563616C6C3112042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122B0A0563616C6C3212042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122D0A0563616C6C3312042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001122D0A0563616C6C3412042E4D73671A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001122D0A0563616C6C35121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D73672801122D0A0563616C6C36121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D73672801122F0A0563616C6C37121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D736728013001122F0A0563616C6C38121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E4D736728013001620670726F746F33";

public isolated client class ChatClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, HELLOWORLDWITHDUPLICATEINPUTOUTPUT_DESC);
    }

    isolated remote function call1(Msg|ContextMsg req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat/call1", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function call1Context(Msg|ContextMsg req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat/call1", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function call2(Msg|ContextMsg req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat/call2", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function call2Context(Msg|ContextMsg req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat/call2", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function call5() returns Call5StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("Chat/call5");
        return new Call5StreamingClient(sClient);
    }

    isolated remote function call6() returns Call6StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("Chat/call6");
        return new Call6StreamingClient(sClient);
    }

    isolated remote function call3(Msg|ContextMsg req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat/call3", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function call3Context(Msg|ContextMsg req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat/call3", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function call4(Msg|ContextMsg req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat/call4", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function call4Context(Msg|ContextMsg req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat/call4", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function call7() returns Call7StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("Chat/call7");
        return new Call7StreamingClient(sClient);
    }

    isolated remote function call8() returns Call8StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("Chat/call8");
        return new Call8StreamingClient(sClient);
    }
}

public isolated client class Chat2Client {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, HELLOWORLDWITHDUPLICATEINPUTOUTPUT_DESC);
    }

    isolated remote function call1(Msg|ContextMsg req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat2/call1", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function call1Context(Msg|ContextMsg req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat2/call1", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function call2(Msg|ContextMsg req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat2/call2", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function call2Context(Msg|ContextMsg req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Chat2/call2", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function call5() returns Call5StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("Chat2/call5");
        return new Call5StreamingClient(sClient);
    }

    isolated remote function call6() returns Call6StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("Chat2/call6");
        return new Call6StreamingClient(sClient);
    }

    isolated remote function call3(Msg|ContextMsg req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat2/call3", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function call3Context(Msg|ContextMsg req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat2/call3", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function call4(Msg|ContextMsg req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat2/call4", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function call4Context(Msg|ContextMsg req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        Msg message;
        if req is ContextMsg {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("Chat2/call4", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function call7() returns Call7StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("Chat2/call7");
        return new Call7StreamingClient(sClient);
    }

    isolated remote function call8() returns Call8StreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("Chat2/call8");
        return new Call8StreamingClient(sClient);
    }
}

public isolated client class Call5StreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendString(string message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextString(wrappers:ContextString message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveMsg() returns Msg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Msg>payload;
        }
    }

    isolated remote function receiveContextMsg() returns ContextMsg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Msg>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class Call6StreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendString(string message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextString(wrappers:ContextString message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveMsg() returns Msg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Msg>payload;
        }
    }

    isolated remote function receiveContextMsg() returns ContextMsg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Msg>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class Call7StreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendString(string message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextString(wrappers:ContextString message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveMsg() returns Msg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Msg>payload;
        }
    }

    isolated remote function receiveContextMsg() returns ContextMsg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Msg>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class Call8StreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendString(string message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextString(wrappers:ContextString message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveMsg() returns Msg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Msg>payload;
        }
    }

    isolated remote function receiveContextMsg() returns ContextMsg|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Msg>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class ChatMsgCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendMsg(Msg response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextMsg(ContextMsg response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class ChatStringCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(wrappers:ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class Chat2StringCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(wrappers:ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class Chat2MsgCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendMsg(Msg response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextMsg(ContextMsg response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextMsgStream record {|
    stream<Msg, error?> content;
    map<string|string[]> headers;
|};

public type ContextMsg record {|
    Msg content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: HELLOWORLDWITHDUPLICATEINPUTOUTPUT_DESC}
public type Msg record {|
    string name = "";
    string message = "";
|};

