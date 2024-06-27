import ballerina/grpc;
import ballerina/grpc.types.wrappers as swrappers;
import ballerina/protobuf;
import ballerina/protobuf.types.wrappers;

public const string EMPTY_MESSAGE_TYPES_DESC = "0A19656D7074795F6D6573736167655F74797065732E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22070A05456D70747922050A03416E79220A0A084475726174696F6E22080A06537472756374220B0A0954696D657374616D70329E060A1A5365727669636557697468507265646566696E65644E616D6573123D0A13556E61727943616C6C456D707479496E70757412062E456D7074791A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652200123E0A14556E61727943616C6C456D7074794F7574707574121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A062E456D707479220012400A14436C69656E7443616C6C456D707479496E70757412062E456D7074791A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652200280112410A15436C69656E7443616C6C456D7074794F7574707574121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A062E456D7074792200280112400A1453657276657243616C6C456D707479496E70757412062E456D7074791A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652200300112410A1553657276657243616C6C456D7074794F7574707574121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A062E456D7074792200300112400A124269646943616C6C456D707479496E70757412062E456D7074791A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756522002801300112410A134269646943616C6C456D7074794F7574707574121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A062E456D70747922002801300112340A0C556E61727943616C6C416E79121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A042E416E792200123E0A11556E61727943616C6C4475726174696F6E121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A092E4475726174696F6E2200123A0A0F556E61727943616C6C537472756374121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A072E537472756374220012400A12556E61727943616C6C54696D657374616D70121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A0A2E54696D657374616D702200620670726F746F33";

public isolated client class ServiceWithPredefinedNamesClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, EMPTY_MESSAGE_TYPES_DESC);
    }

    isolated remote function UnaryCallEmptyInput(Empty|ContextEmpty req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallEmptyInput", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function UnaryCallEmptyInputContext(Empty|ContextEmpty req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallEmptyInput", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function UnaryCallEmptyOutput(string|wrappers:ContextString req) returns Empty|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallEmptyOutput", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Empty>result;
    }

    isolated remote function UnaryCallEmptyOutputContext(string|wrappers:ContextString req) returns ContextEmpty|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallEmptyOutput", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Empty>result, headers: respHeaders};
    }

    isolated remote function UnaryCallAny(string|wrappers:ContextString req) returns Any|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallAny", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Any>result;
    }

    isolated remote function UnaryCallAnyContext(string|wrappers:ContextString req) returns ContextAny|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallAny", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Any>result, headers: respHeaders};
    }

    isolated remote function UnaryCallDuration(string|wrappers:ContextString req) returns Duration|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallDuration", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Duration>result;
    }

    isolated remote function UnaryCallDurationContext(string|wrappers:ContextString req) returns ContextDuration|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallDuration", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Duration>result, headers: respHeaders};
    }

    isolated remote function UnaryCallStruct(string|wrappers:ContextString req) returns Struct|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallStruct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Struct>result;
    }

    isolated remote function UnaryCallStructContext(string|wrappers:ContextString req) returns ContextStruct|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallStruct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Struct>result, headers: respHeaders};
    }

    isolated remote function UnaryCallTimestamp(string|wrappers:ContextString req) returns Timestamp|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallTimestamp", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Timestamp>result;
    }

    isolated remote function UnaryCallTimestampContext(string|wrappers:ContextString req) returns ContextTimestamp|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ServiceWithPredefinedNames/UnaryCallTimestamp", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Timestamp>result, headers: respHeaders};
    }

    isolated remote function ClientCallEmptyInput() returns ClientCallEmptyInputStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("ServiceWithPredefinedNames/ClientCallEmptyInput");
        return new ClientCallEmptyInputStreamingClient(sClient);
    }

    isolated remote function ClientCallEmptyOutput() returns ClientCallEmptyOutputStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("ServiceWithPredefinedNames/ClientCallEmptyOutput");
        return new ClientCallEmptyOutputStreamingClient(sClient);
    }

    isolated remote function ServerCallEmptyInput(Empty|ContextEmpty req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ServiceWithPredefinedNames/ServerCallEmptyInput", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function ServerCallEmptyInputContext(Empty|ContextEmpty req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ServiceWithPredefinedNames/ServerCallEmptyInput", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function ServerCallEmptyOutput(string|wrappers:ContextString req) returns stream<Empty, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ServiceWithPredefinedNames/ServerCallEmptyOutput", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        EmptyStream outputStream = new EmptyStream(result);
        return new stream<Empty, grpc:Error?>(outputStream);
    }

    isolated remote function ServerCallEmptyOutputContext(string|wrappers:ContextString req) returns ContextEmptyStream|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ServiceWithPredefinedNames/ServerCallEmptyOutput", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        EmptyStream outputStream = new EmptyStream(result);
        return {content: new stream<Empty, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function BidiCallEmptyInput() returns BidiCallEmptyInputStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("ServiceWithPredefinedNames/BidiCallEmptyInput");
        return new BidiCallEmptyInputStreamingClient(sClient);
    }

    isolated remote function BidiCallEmptyOutput() returns BidiCallEmptyOutputStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("ServiceWithPredefinedNames/BidiCallEmptyOutput");
        return new BidiCallEmptyOutputStreamingClient(sClient);
    }
}

public isolated client class ClientCallEmptyInputStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendEmpty(Empty message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextEmpty(ContextEmpty message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class ClientCallEmptyOutputStreamingClient {
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

    isolated remote function receiveEmpty() returns Empty|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Empty>payload;
        }
    }

    isolated remote function receiveContextEmpty() returns ContextEmpty|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Empty>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public class EmptyStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|Empty value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if streamValue is () {
            return streamValue;
        } else if streamValue is grpc:Error {
            return streamValue;
        } else {
            record {|Empty value;|} nextRecord = {value: <Empty>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public isolated client class BidiCallEmptyInputStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendEmpty(Empty message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextEmpty(ContextEmpty message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class BidiCallEmptyOutputStreamingClient {
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

    isolated remote function receiveEmpty() returns Empty|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Empty>payload;
        }
    }

    isolated remote function receiveContextEmpty() returns ContextEmpty|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Empty>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class ServiceWithPredefinedNamesTimestampCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendTimestamp(Timestamp response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextTimestamp(ContextTimestamp response) returns grpc:Error? {
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

public isolated client class ServiceWithPredefinedNamesAnyCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendAny(Any response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextAny(ContextAny response) returns grpc:Error? {
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

public isolated client class ServiceWithPredefinedNamesStringCaller {
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

public isolated client class ServiceWithPredefinedNamesStructCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendStruct(Struct response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextStruct(ContextStruct response) returns grpc:Error? {
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

public isolated client class ServiceWithPredefinedNamesDurationCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendDuration(Duration response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextDuration(ContextDuration response) returns grpc:Error? {
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

public isolated client class ServiceWithPredefinedNamesEmptyCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendEmpty(Empty response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextEmpty(ContextEmpty response) returns grpc:Error? {
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

public type ContextEmptyStream record {|
    stream<Empty, error?> content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextDuration record {|
    Duration content;
    map<string|string[]> headers;
|};

public type ContextAny record {|
    Any content;
    map<string|string[]> headers;
|};

public type ContextTimestamp record {|
    Timestamp content;
    map<string|string[]> headers;
|};

public type ContextStruct record {|
    Struct content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: EMPTY_MESSAGE_TYPES_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: EMPTY_MESSAGE_TYPES_DESC}
public type Duration record {|
|};

@protobuf:Descriptor {value: EMPTY_MESSAGE_TYPES_DESC}
public type Any record {|
|};

@protobuf:Descriptor {value: EMPTY_MESSAGE_TYPES_DESC}
public type Timestamp record {|
|};

@protobuf:Descriptor {value: EMPTY_MESSAGE_TYPES_DESC}
public type Struct record {|
|};

