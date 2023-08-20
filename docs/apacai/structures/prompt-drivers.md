# Prompt Drivers

Prompt drivers are used by Swarms structures to make calls to the underlying foundation models. **OpenAiPromptDriver** is the default prompt driver used in all structures.

You can instantiate drivers and pass them to structures:

```python
Pipeline(
    prompt_driver=OpenAiPromptDriver(
        temperature=0.3
    )
)
```

Or use them independently:

```python
OpenAiPromptDriver(
    temperature=1
).run("Q: give me some ideas for writing a fantasy book\nA:")
```

!!! info
    More prompt drivers are coming soon.

## OpenAI

This driver connects to OpenAI [Text Completion](https://platform.openai.com/docs/guides/completion) and [Chat Completion](https://platform.openai.com/docs/guides/chat) APIs.

The **OpenAiPromptDriver** uses the following parameters:

| Parameter    | Description                                                                                                         | Required |
|--------------|---------------------------------------------------------------------------------------------------------------------|----------|
| api_type     | Can be changed to use OpenAI models on Azure.                                                                       | NO       |
| api_version  | API version.                                                                                                        | NO       |
| api_base     | API URL.                                                                                                            | NO       |
| api_key      | API key to pass directly; by default uses `OPENAI_API_KEY_PATH` environment variable.                               | NO       |
| max_tokens   | Optional maximum return tokens. If not specified, the value will be automatically generated based by the tokenizer. | NO       |
| model        | OpenAI model name. Uses `gpt-4` by default.                                                                         | NO       |
| organization | OpenAI organization.                                                                                                | NO       |
| tokenizer    | Custom `TiktokenTokenizer`                                                                                          | NO       |
| user         | OpenAI user.                                                                                                        | NO       |

## Azure OpenAI

This driver connects to Azure OpenAI [Text Completion](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference) and [Chat Completion](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference) APIs.

The **AzureOpenAiPromptDriver** uses the same parameters as **OpenAiPromptDriver** with updated defaults. In addition to those parameters, **AzureOpenAiPromptDriver** has the following additional and modified parameters:

| Parameter     | Description                 | Required |
|---------------|-----------------------------|----------|
| api_base      | API URL.                    | YES      |
| deployment_id | Azure OpenAI deployment ID. | YES      |
| model         | OpenAI model name.          | YES      |

## Cohere

This driver connects to the Cohere [Generate](https://docs.cohere.ai/reference/generate) API.

The **CoherePromptDriver** uses the following parameters:

| Parameter | Description                              | Required |
|-----------|------------------------------------------|----------|
| api_key   | Cohere API key.                          | YES      |
| model     | Cohere model name. Defaults to `xlarge`. | NO       |
| client    | Custom `cohere.Client`.                  | NO       |
| tokenizer | Custom `CohereTokenizer`.                | NO       |

## Anthropic

This driver connects to the Anthropic [Completions](https://docs.anthropic.com/claude/reference/complete_post) API..

The **AnthropicPromptDriver** uses the following parameters:

| Parameter | Description                              | Required |
|-----------|------------------------------------------|----------|
| api_key   | Cohere API key.                          | YES      |
| model     | Cohere model name. Defaults to `xlarge`. | NO       |
| tokenizer | Custom `AnthropicTokenizer`.             | NO       |

## Hugging Face Hub

This driver connects to the [Hugging Face API](https://huggingface.co/docs/hub/api). It supports models with the following tasks:

* text2text-generation
* text-generation

The **HuggingFaceHubPromptDriver** uses the following parameters:

| Parameter | Description                    | Required |
|-----------|--------------------------------|----------|
| repo_id   | Repository ID on Hugging Face. | YES      |
| api_token | Hugging Face Hub API token     | YES      |
| use_gpu   | Use GPU during model run.      | NO       |
| params    | Custom model run parameters.   | NO       |
| model     | Custom `CohereTokenizer`.      | NO       |
| client    | Custom `InferenceApi`.         | NO       |
| tokenizer | Custom `HuggingFaceTokenizer`. | NO       |

## Hugging Face Pipeline

This driver uses [Hugging Face Pipelines](https://huggingface.co/docs/transformers/main_classes/pipelines) for inference locally. It supports models with the following tasks:

* text2text-generation
* text-generation

The **HuggingFacePipelinePromptDriver** uses the following parameters:

| Parameter | Description                    | Required |
|-----------|--------------------------------|----------|
| model     | Hugging Face model name.       | YES      |
| params    | Custom model run parameters.   | NO       |
| tokenizer | Custom `HuggingFaceTokenizer`. | NO       |

## Text Generation Web UI

This driver uses [Text Generation Web UI API](https://github.com/oobabooga/text-generation-webui) to run LLM models locally.

The **TextGenPromptDriver** uses the following parameters:

| Parameter    | Description                                   | Required |
|--------------|-----------------------------------------------|----------|
| preset       | Text Generation Web UI preset.                | NO       |
| params       | Custom params dict to use in place of preset. | NO       |
| model_url    | URL of the running model.                     | NO       |
| generate_uri | API URI of the generate call.                 | NO       |
| tokenizer    | Custom `TextGenTokenizer`.                    | YES      |