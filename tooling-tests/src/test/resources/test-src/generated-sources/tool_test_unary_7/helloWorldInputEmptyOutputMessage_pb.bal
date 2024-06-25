import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;

public const string HELLOWORLDINPUTEMPTYOUTPUTMESSAGE_DESC = "0A2768656C6C6F576F726C64496E707574456D7074794F75747075744D6573736167652E70726F746F120C6772706373657276696365731A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F22290A0D48656C6C6F526573706F6E736512180A076D65737361676518012001280952076D657373616765325C0A0A68656C6C6F576F726C64124E0A17746573744E6F496E7075744F757470757453747275637412162E676F6F676C652E70726F746F6275662E456D7074791A1B2E6772706373657276696365732E48656C6C6F526573706F6E7365620670726F746F33";

public isolated client class helloWorldClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, HELLOWORLDINPUTEMPTYOUTPUTMESSAGE_DESC);
    }

    isolated remote function testNoInputOutputStruct() returns HelloResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("grpcservices.helloWorld/testNoInputOutputStruct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <HelloResponse>result;
    }

    isolated remote function testNoInputOutputStructContext() returns ContextHelloResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("grpcservices.helloWorld/testNoInputOutputStruct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <HelloResponse>result, headers: respHeaders};
    }
}

public isolated client class HelloWorldHelloResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendHelloResponse(HelloResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextHelloResponse(ContextHelloResponse response) returns grpc:Error? {
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

public type ContextHelloResponse record {|
    HelloResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: HELLOWORLDINPUTEMPTYOUTPUTMESSAGE_DESC}
public type HelloResponse record {|
    string message = "";
|};

