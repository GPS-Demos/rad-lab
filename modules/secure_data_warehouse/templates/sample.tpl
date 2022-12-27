{
    "deidentifyTemplate": {
        displayName: "${display_name}",
        description: "${description}",
        "deidentifyConfig": {
            "recordTransformations": {
                "fieldTransformations": [
                    {
                        "fields": [
                                %{for name in names}
                                {
                                "name": "${name}"
                                },
                                %{endfor}                 
                ],
                        "primitiveTransformation": {
                            "cryptoDeterministicConfig": {
                                "cryptoKey": {
                                    "kmsWrapped": {
                                        "cryptoKeyName": "${crypto_key}",
                                        "wrappedKey": "${wrapped_key}"
                                    }
                                },
                            }
                        }
                    }
                ]
            }
        }
    },
    "templateId": "${template_id}"
}