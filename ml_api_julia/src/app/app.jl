using Genie, Genie.Requests, Genie.Router, Genie.Renderer
using SVM, JLD

model = load("model/model.jld", "model")

Genie.config.run_as_server = true
Genie.config.cors_allowed_origins = ["*"]
#Genie.config.cors_allowed_origins = ["Origin", "X-Requested-With", "Content-Type", "Accept"]
#Genie.config.cors_headers["Access-Control-Allow-Origin"] = "*"
#Genie.config.cors_headers["Access-Control-Allow-Credentials"] = "false"
#Genie.config.cors_headers["Access-Control-Allow-Methods"] = "POST"
#Genie.config.cors_headers["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"

route("/predict", method = "POST") do
    message = jsonpayload()
    print(Genie.config.cors_headers)
    #print(message["feature"])
    #print(message["feature"][1])
    #parse(Int, message["feature"][1])
    (:message => "POST success") |> json
end

Genie.AppServer.startup(7000, "0.0.0.0")