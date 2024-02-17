Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0DEC48BC3
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Feb 2024 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSbiLtDI/27TAlv5ZXyQoSdaV1zkwqxYlCwOQ2Ba88g=; b=dqAlkb5JGDV8IL
	Icq/XAyqi+IqLzWTWYWxAne3EerHHiQbo4XyXVa11VC9WMBN6UcZvZr0FWMHBRj3ojIXMPL0X6Sts
	u2MiufsriDxkwm1GdgRrtr0DslY5MPabifWs3micnf1BJESaOEtZ7JlRflrirfSuFWk36+C/uIha+
	nMuj26SvkvWa1NGZSDCECxny4+EMi+Qu8FU8ge/+R7yQp+AfJEH2gRrOpOO/J1WXPAmy89B/Z0BDm
	AVm9BStgvqVSVnv2djKDW2HIgWz+815Lny6qJk1EH9660jC3AEle4P4XZ9IDzb/HnxJcNipCZ0dj2
	MTaeugvfMMNRgPNOPv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbL8P-00000005m7b-3tdi;
	Sat, 17 Feb 2024 13:53:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbL8N-00000005m78-2WQI
	for linux-i3c@lists.infradead.org;
	Sat, 17 Feb 2024 13:53:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so1697239a12.0
        for <linux-i3c@lists.infradead.org>; Sat, 17 Feb 2024 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708178017; x=1708782817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZohGu2e2iIhy6SzBVjdcju7mdpti3WpKjjDeXsxYXVg=;
        b=JHKHzaI/H5bWGrvA2etly8zjwyXYLeS/lSn09CU3uN57tMIa5snC4n2PoS3l11eXuz
         O77mrtQ3ClGBsPowr5zV8n8dyc/8vyhn6xtlu5nOjoFf1R/OFyaeGu6cwsgh81rxff0d
         5FUUZ3jH9/shcxafvezAziOck2/UaWu4r+EvjIPc6o4xaOe2A8LWnZk47kgR14rr/w+v
         IN88qJ2hAywdGefp0W6N12n8DyQQEJ1mOb//mZBBdGXhGchyhjTRmJNo63/Hq3+Jb9G6
         qhCCts5NwnCjJ+8Ib8Joym1AOM0+uaD/LYqd+7vsRBS7b00Fku1Tb7LmK9THe4ulJg2i
         jm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708178017; x=1708782817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZohGu2e2iIhy6SzBVjdcju7mdpti3WpKjjDeXsxYXVg=;
        b=XLdXPUxh8IPgiu9ytT6GizcupoKkCkZV3GMDroEvu23LYx/pFOqZTawBZrBjsGsCz/
         b27R+6naJ40w22dkEiKOnkUiGr/9jV0R92F0QBW3evKtP3unxjn5GaaNFNal4rIyAs6c
         70oL/RAWnhMsuXOmx7wTsCSGKiEduDtUvivvJ79gHc/oMrgTI8nNG+vLJwjt1oYG3J0X
         isKnAoHaKMYZOEAhvYeUfBOQXzQZNdhbaqJIjR4Q17NQueY2ejyoDOFWf8f9TevyFrnD
         BXUVFc1gTzEWiMCuiEsidA/3TKAtg73IDXhpKPFKFZHCBcLbS2WlwV+85IB9PLupEd6M
         AbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFObS9P4zKrnF7+bgMo8YslPF95y/Fhkty8xrX/iikhlY2/tREpeAU3YEGgdfFnytXhfEEQl4COu8FeuFmvXeh4Na3GoEim8GLYq8n+g==
X-Gm-Message-State: AOJu0Ywvxfjia7VmV2ayHLYLfJE2r5ocpWwzSia/2WzX+1SR0NLNn1zX
	cie2YeEaG4moSUVZ2kvXnHVoxqz02SqomYhrCZamcPMQaY8BMtq0WPooODClJtg=
X-Google-Smtp-Source: AGHT+IFMpLpjPDnHqV+NyQgA0ob+EMAJJemzdBvE3uOdnNKMMNHExuV7w/4ypJPED+hxkXLYzRKPPw==
X-Received: by 2002:a17:906:d932:b0:a3e:34ec:ee1a with SMTP id rn18-20020a170906d93200b00a3e34ecee1amr691365ejb.18.1708178017548;
        Sat, 17 Feb 2024 05:53:37 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id se25-20020a170906ce5900b00a3e2bb9981fsm471371ejb.96.2024.02.17.05.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 05:53:37 -0800 (PST)
Message-ID: <6407d78e-8e97-4d83-89c2-fb4532f7861f@linaro.org>
Date: Sat, 17 Feb 2024 14:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i3c-hub: Add Renesas RG3MxxB12A1 I3C HUB
Content-Language: en-US
To: Steven Niu <steven.niu.uj@renesas.com>, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
Cc: zbigniew.lukwinski@linux.intel.com
References: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_055339_701545_46CC6357 
X-CRM114-Status: GOOD (  22.89  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 17/02/2024 14:14, Steven Niu wrote:
> Document the Renesas RG3MxxB12A1 I3C HUB.
> 
> Signed-off-by: Steven Niu <steven.niu.uj@renesas.com>
> ---
>  .../devicetree/bindings/i3c/i3c-hub.yaml      | 400 ++++++++++++++++++
>  1 file changed, 400 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c-hub.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml
> new file mode 100644
> index 000000000000..8ff6ca172975
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml

This does not match at all your device name. Filenames should use
compatibles.

This also sounds like some generic class of schema, but your short
commit msg does no explain here anything. I have no clue what you wanted
to achieve.


> @@ -0,0 +1,400 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +

> +title: I3C HUB

No, you said it is Renesas device...


> +
> +maintainers:
> +  - Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
> +  - Steven Niu <steven.niu.uj@renesas.com>
> +
> +description: |
> +  I3C HUB is smart device which provides multiple functionality:
> +  * enabling voltage compatibility across I3C Controller and Target devices,
> +  * bus capacitance isolation
> +  * address conflict isolation
> +  * I3C port expansion
> +  * two controllers in a single I3C bus
> +  * I3C and SMBus device compatibility
> +  * GPIO expansion

All this only confuses me - do we talk about common schema or specific
device?

> +
> +  Having such big number of features, there is a need to have some DT knobs to tell the I3C HUB

No, there is no. Sorry, don't use such arguments and drop all unrelated
driver things like descriptions from binding.

Also, wrap it according to coding style.


> +  driver which features shall be enabled and how they shall be configured. I3C HUB driver read,
> +  validate DT knobs and set corresponding registers with the right way to satisfy user requests from
> +  DT.
> +
> +  All the DT properties for I3C HUB are located under dedicated (for I3C HUB) DT entry. I3C HUB DT
> +  entry structure is aligned with regular I3C device DT entry described in i3c.yaml.

Drop, instead describe hardware.

> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^hub@0,0$"

No, why?

Where is compatible?

> +
> +  cp0-ldo-en:

No clue what's this... no vendor prefix, no ref, why is is a property of
a board.

> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Controller Port 0 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.

Wrap properly, as asked by Coding Style,

> +
> +      This property is optional. If not provided, LDO will be disabled.

Drop redundant sentence "This property is optional".

> +
> +  cp1-ldo-en:

Why is this a property of a board DTS?

> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Controller Port 1 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  tp0145-ldo-en:

Why is this a property of a board DTS?

> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  tp2367-ldo-en:

None of these make sense to me, sorry.

> +    enum:
> +      - disabled
> +      - enabled
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 LDO disabling/enabling setting. If enabled, voltage produced by
> +      on-die LDO will be available externally on dedicated pin. This option could be used to supply
> +      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
> +
> +      This property is optional. If not provided, LDO will be disabled.
> +
> +  cp0-ldo-volt:
> +    enum:
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Controller Port 0 LDO setting to control the Controller Port 1 voltage level. This
> +      property is optional.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  cp1-ldo-volt:
> +    enum:
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V

OK, that's it. Sorry, stop reimplementing regulators as strings. Use
proper common property suffixes for properties.

> +    description: |
> +      I3C HUB Controller Port 1 LDO setting to control the Controller Port 1 voltage level. This
> +      property is optional.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  tp0145-ldo-volt:
> +    enum:
> +      - disabled
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 LDO setting to control the Target Ports 0/1/4/5 voltage level.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  tp2367-ldo-volt:
> +    enum:
> +      - disabled
> +      - 1.0V
> +      - 1.1V
> +      - 1.2V
> +      - 1.8V
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 LDO setting to control the Target Ports 2/3/6/7 voltage level.
> +
> +      If not provided, LDO configuration is not modified in I3C HUB.
> +
> +  tp0145-pullup:
> +    enum:
> +      - disabled
> +      - 250R
> +      - 500R
> +      - 1k
> +      - 2k
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 pull-up setting to control the Target Ports 0/1/4/5 pull-up
> +      resistance level.
> +
> +      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
> +
> +  tp2367-pullup:
> +    enum:
> +      - disabled
> +      - 250R
> +      - 500R
> +      - 1k
> +      - 2k
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 pull-up setting to control the Target Ports 2/3/6/7 pull-up
> +      resistance level.
> +
> +      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
> +
> +  cp0-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Controller Port 0 IO strength setting to control the Controller Port 0 output driver
> +      strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  cp1-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Controller Port 1 IO strength setting to control the Controller Port 1 output driver
> +      strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  tp0145-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Target Ports 0/1/4/5 IO strength setting to control the Target Ports 0/1/4/5 output
> +      driver strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  tp2367-io-strength:
> +    enum:
> +      - 20Ohms
> +      - 30Ohms
> +      - 40Ohms
> +      - 50Ohms
> +    description: |
> +      I3C HUB Target Ports 2/3/6/7 IO strength setting to control the Target Ports 2/3/6/7 output
> +      driver strength.
> +
> +      This property is optional. If not provided, IO strength configuration is not modified in I3C
> +      HUB.
> +
> +  id:
> +    enum:
> +      - 0
> +      - 1
> +      - 3

NAK, no ID properties.

You try to upstream some really non-upstream style of binding. One
looking like produced by vendor. Don't.


> +    description: |
> +      I3C HUB ID based on CSEL pin. There are three possible values:
> +      0 - CP0 is selected as primary Controller Port
> +      1 - Primary Controller Port is selected by software by writing the REG#56
> +      3 - CP1 is selected as primary Controller Port
> +
> +      I3C HUB driver reads CSEL pin status (REG#121[5:4]) and tries to find DT node with matching
> +      value in 'id' property.
> +
> +      This property is optional. If not provided, DT node can only be used by the I3C HUB driver if
> +      there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes with no
> +      'id' property - the first one will be chosen by I3C HUB driver. If there is a multiple DT
> +      nodes with matching 'id' property - the first one will be chosen by I3C HUB driver.
> +
> +      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
> +      read from I3C HUB.

All these redundant texts are no helping... Encode proper reliationships
in schema.


> +
> +  id-cp1:
> +    enum:
> +      - 0
> +      - 1
> +      - 2
> +      - 3
> +    description: |
> +      I3C HUB ID based on CP1 SDA and SCL pins state probed during power on.
> +
> +      I3C HUB driver reads CP1 SDA and SCL pin status and tries to find DT node with matching value
> +      in 'id-cp1' property.
> +
> +      This property is optional. If not provided, DT node can only be used by the I3C HUB
> +      driver if there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes
> +      with no 'id-cp1' property - the first one will be chosen by I3C HUB driver. If there is a
> +      multiple DT nodes with matching 'id-cp1' property - the first one will be chosen by I3C HUB
> +      driver.
> +
> +      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
> +      read from I3C HUB.
> +
> +patternProperties:
> +  "@[0-9]$":
> +    type: object
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      I3C HUB Target Port child, should be named: target-port@<target-port-id>
> +
> +    properties:
> +      mode:
> +        enum:
> +          - disabled
> +          - i3c
> +          - smbus
> +          - gpio
> +        description: |
> +          I3C HUB Target Port mode setting to control Target Port functionality.
> +
> +          This property is optional. If not provided, Target Port mode configuration is not modified
> +          in I3C HUB.

Not modified? What does it even mean? Not modified from what?

Missing default:

Anyway, now you implement pinctrl here. Sorry, this needs proper
justification but still half of these properties are a clear NAK.

> +
> +      pullup:
> +        enum:
> +          - disabled
> +          - enabled
> +        description: |
> +          I3C HUB Target Port pull-up setting to disable/enable Target Port pull-up.
> +
> +          This property is optional. If not provided, Target Port pull-up configuration is not
> +          modified in I3C HUB.
> +
> +      always-enable:
> +        type: boolean
> +        description: |
> +          I3C HUB Target Port settings to control the port enable/disable policy.
> +
> +          This property is optional. If not provided, Target Port is enabled only on accessing to
> +          the devices connected to it and the port is disabled automatically after the accessing
> +          is done. If provided, the Target Port is always enabled.
> +
> +    patternProperties:
> +      "@0,0$":
> +        type: object
> +        description: |
> +          Backend for handling SMBus mode, should be named: backend@0,0
> +          Adding this node installs the backed for handling SMBus Target mode communication.
> +
> +        properties:
> +          compatible:
> +            description:
> +              Compatible of the I2C/SMBus backend.
> +
> +          target-reg:
> +            description:
> +              Target address used for Target Port in the I3C HUB configured as SMBus Target mode.
> +
> +additionalProperties: true

NAK, please start from basics from example schema.


Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
