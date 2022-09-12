# dapr-actors-experiment
This is an experiment that use Dapr actors on booking movie scenario

# Run it on tye
```shell
> tye run
```

# Run it on dapr
```shell
> dapr run --app-id myapp --app-port 5003  --dapr-http-port 3500 -- dotnet run --project src/Server/Server.csproj
```

### tye dashoard
```shell
> open localhost:8000
```

### Dapr dashoard
```shell
> open localhost:8080
```

# Run it at terminal

```shell
> curl -X POST http://127.0.0.1:<actor port>/v1.0/actors/BookingMovieActor/adeaaf18-80da-49ae-bf16-83a4ef4783ff/method/Book -d "{ \"userId\": \"3fa85f64-5717-4562-b3fc-2c963f66afa6\", \"showId\": \"adeaaf18-80da-49ae-bf16-83a4ef4783ff\", \"seatNumber\": 1, \"price\": 100 }"
```

<actor port>: the middle row of `Bindings` column in tye or dapr dashboard . Default setted as 3500

## PerTestClient project

If you want to run with NBommer, try to un-comment the code at

```csharp
var response = await httpClient.PostAsJsonAsync(
  "http://127.0.0.1:<actor port>/v1.0/actors/BookingMovieActor/adeaaf18-80da-49ae-bf16-83a4ef4783ff/method/Book",
  request, context.CancellationToken);
```

and you can open report folder that was putted of the results as html.

```shell
> dotnet run
```

# Articles
- [Dapr with Actor model](https://dev.to/thangchung/dapr-with-actor-model-1635)


# Note
- you have to use selfhost dapr on local machine or k8s because actor does not work on docker compose as sidecar


# Useful Links
1. https://docs.dapr.io/concepts/dapr-services/sidecar/
2. https://docs.dapr.io/operations/hosting/self-hosted/self-hosted-overview/
3. https://en.wikipedia.org/wiki/Conflict-free_replicated_data_type#Background
4. https://docs.dapr.io/developing-applications/building-blocks/actors/actors-overview/#actor-placement-service
5. https://github.com/dotnet/tye/blob/main/docs/getting_started.md
6. https://docs.dapr.io/developing-applications/building-blocks/actors/actors-overview/
7. https://docs.dapr.io/developing-applications/sdks/dotnet/dotnet-actors/dotnet-actors-howto/
8. https://github.com/dotnet/docs/blob/main/docs/architecture/dapr-for-net-developers/actors.md
