# Loadtesting

This application runs a number of tests against FlagShip - Serverless Edge Feature management application.

## Tools

- k6
- Apple M1 Pro Macbook

## Scenerios considered

The following scenerios were considered for testing the application:

- Using D1 database as a store
- Using KV as a store
- Using LaunchDarkly's SDK at the edge
- Using mock RESTAPI without any store
  - RESTAPI worker within same zone
- Using RPC with worker bindings

Among the above tests, using KV as a store was the fastest approach followed closely by D1.

**for D1**:

| Metric            | avg  | max  | med  |  min | p90  | p95  | p99  |
| ----------------- | ---- | ---- | ---- | ---: | ---- | ---- | ---- |
| http_req_duration | 39ms | 96ms | 39ms | 31ms | 42ms | 45ms | 51ms |

**for KV**:

| Metric            | avg  | max   | med  |  min | p90  | p95  | p99  |
| ----------------- | ---- | ----- | ---- | ---: | ---- | ---- | ---- |
| http_req_duration | 40ms | 338ms | 39ms | 30ms | 44ms | 49ms | 63ms |

### Observations

There's a considerable delay in the first request for both KV and D1. This could be because of the cold start. No comparision between coldstarts has been made yet. 

The above results are as observed on the end devices (browser on a laptop/k6).

The above observations also include the latency between the test machine and the nearest cloudflare edge location. To calculate the latency at the edge itself, the worker returns the calculated latency as seen by the worker during the runtime.

## For future considerations

- What is the imapact of Cloudflare workers smart placement consfiguration on the latency?

- What is the imapact of latency when requests come from different regions?
  - what happens when the requsts come in concurrently from different regions?

- What is the time taken for the KV results to be replicated across different regions?

- What is the propagation delay between updating KV values?
