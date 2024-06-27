import ballerina/grpc;
import ballerina/grpc.types.wrappers as swrappers;
import ballerina/protobuf.types.wrappers;

public const string HELLOWORLDFLOAT_DESC = "0A1568656C6C6F576F726C64466C6F61742E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F32510A0A68656C6C6F576F726C6412430A0568656C6C6F121B2E676F6F676C652E70726F746F6275662E466C6F617456616C75651A1B2E676F6F676C652E70726F746F6275662E466C6F617456616C75653001620670726F746F33";

public isolated client class helloWorldClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, HELLOWORLDFLOAT_DESC);
    }

    isolated remote function hello(float|wrappers:ContextFloat req) returns stream<float, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        float message;
        if req is wrappers:ContextFloat {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/hello", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:FloatStream outputStream = new swrappers:FloatStream(result);
        return new stream<float, grpc:Error?>(outputStream);
    }

    isolated remote function helloContext(float|wrappers:ContextFloat req) returns wrappers:ContextFloatStream|grpc:Error {
        map<string|string[]> headers = {};
        float message;
        if req is wrappers:ContextFloat {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("helloWorld/hello", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:FloatStream outputStream = new swrappers:FloatStream(result);
        return {content: new stream<float, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public isolated client class HelloWorldFloatCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendFloat(float response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextFloat(wrappers:ContextFloat response) returns grpc:Error? {
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

