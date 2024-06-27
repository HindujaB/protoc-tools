import ballerina/grpc;
import ballerina/protobuf.types.timestamp;
import ballerina/time;

public const string TIME_ROOT_DESC = "0A0F74696D655F726F6F742E70726F746F1A1474696D655F646570656E64656E742E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F32430A0A68656C6C6F576F726C6412350A0873656E6454696D65121A2E676F6F676C652E70726F746F6275662E54696D657374616D701A092E4772656574696E6728013001620670726F746F33";
public const map<string> TIME_ROOT_DESCRIPTOR_MAP = {"time_dependent.proto": TIME_DEPENDENT_DESC};

public isolated client class helloWorldClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, TIME_ROOT_DESC, TIME_ROOT_DESCRIPTOR_MAP);
    }

    isolated remote function sendTime() returns SendTimeStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("helloWorld/sendTime");
        return new SendTimeStreamingClient(sClient);
    }
}

public isolated client class SendTimeStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendTimestamp(time:Utc message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextTimestamp(timestamp:ContextTimestamp message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveGreeting() returns Greeting|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <Greeting>payload;
        }
    }

    isolated remote function receiveContextGreeting() returns ContextGreeting|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <Greeting>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class HelloWorldGreetingCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendGreeting(Greeting response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextGreeting(ContextGreeting response) returns grpc:Error? {
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

public type ContextGreetingStream record {|
    stream<Greeting, error?> content;
    map<string|string[]> headers;
|};

public type ContextGreeting record {|
    Greeting content;
    map<string|string[]> headers;
|};

