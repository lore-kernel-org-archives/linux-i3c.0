Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16531C48BC4
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Feb 2024 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bM0W68Utc6/bm0ZjjdKL57czLVCQE9dD+4nHTMEUKA=; b=3poDs+OhpxC4iE
	3oQUq5zkMlWmo7TujsvTbBREU52dUzmu7ab130DOrV5tETo8bdojETjABMn47D364bIXFdWArOQUa
	dd/DnVwwDerxTKScfRjFpfrvmhNnBhVLk0a6kDvPErYOH/Is7bDHxc1eOx+Cw1cV5drgac0DTe27p
	J2D9fCHLoC5AZpY3Hc5ewQrMbhjexBDde0Kvl9rcBR2R/0G+l7HDOWSClHjs9972M/9acINwlUJIZ
	zeRwATwJlPFAM8q2E5vsaBA3ZnirsEfXu7ZH8OHHU3+HWOi0dKDbIrlbQPuOM4rieboQyo3LRi8Jb
	8SD2lxbyKPjjEGAbmiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbLMQ-00000005nmZ-2NZb;
	Sat, 17 Feb 2024 14:08:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbLMM-00000005nlG-1K9R
	for linux-i3c@lists.infradead.org;
	Sat, 17 Feb 2024 14:08:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-563cf3087cfso2769733a12.3
        for <linux-i3c@lists.infradead.org>; Sat, 17 Feb 2024 06:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708178878; x=1708783678; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7NC3tYoyPTBgemlrVbpnH3XzfX6cV2+ygPeW+YoIfw=;
        b=hbYUM7CyxYUud1VKRNBg5coUjWkJQillzYFG14iPFixHlO3z2gAXRQcU7k6q9VkoXK
         D1c6ix0XPqfOjbl8AJNEtwVMwH10BUyYnghMLjheM2ucAkNnCFfS1Fe2uvJA+fLI82JS
         j/ws0xOiOrq80mannbIR3twUORRuiufTSe+frbMuCS519h6VpwwzIIId2iaIEyWeHHlO
         q3pNFyid9H0gVlU961VQOjJpPBRUCidHHtkeShBHwhIVybDfgbL8MGqIYtSdKD3ZKFV1
         8NEO583s2hydevuq4mYZKlPYLrmU1+bC1CscaQl7QsG7A1/T3am07WM0h98v8rrqbedF
         uE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708178878; x=1708783678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7NC3tYoyPTBgemlrVbpnH3XzfX6cV2+ygPeW+YoIfw=;
        b=CL10a1xwXl1zQ77MwlXfTMPFzmxLX0q3rDgvjTKSgrImRezueNv44kSsP7aNr2FCKn
         qmGiJi+puggjc+MqgUG1DOeI27LhGyCistRLoKFw67C6DFOgqBWy+ZGuMdXqaUYt4AT5
         1QTTb63jg3LmLPEc+8cZZOfg/cUsBGiS85C3xbWjpL2GUIscZgx/YxGIut0H1bD9FuK/
         HK09auk5Lte7xFQUFTTK+bY6T9ekgdlXu7ZDaxeEezJUfVFNWfPzGkXAHRZStwGT8wTG
         o97nNGfZINTVLiz8QOhwRch/7ycqu/Fc98Yd2SepMQ+Tb+uFprYdunAfyPefsyPIlEnm
         Tr8A==
X-Forwarded-Encrypted: i=1; AJvYcCXsK74FgIeDFCbS5imhjo1xPAeUKocf5I2HAcHMbnIxdalI4z9soN/8rI41lqR1/tjqOkpliHcSfflgXwwOxElqI5LUeKYU6jqllZmTiA==
X-Gm-Message-State: AOJu0YyBQZk14PiRZUa1YTE0RPTCGKlvIlonjbCNrAEMejYbrT9t10Mv
	GtPOKYOrGu8Nlgrg9lSVluwz8g20OlO6LaHi5iHNQSGCE/L++GKBZ+49PcPWtsI=
X-Google-Smtp-Source: AGHT+IE2CrfygV8ZRxLhm1A6C3Dn6YrV/nZhwB2YkGYorpjwvjIVZiVNrFrjOC0KpD1VYr31iz0q1A==
X-Received: by 2002:a17:906:2a91:b0:a3d:7532:15ad with SMTP id l17-20020a1709062a9100b00a3d753215admr5113208eje.39.1708178878679;
        Sat, 17 Feb 2024 06:07:58 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id mp16-20020a1709071b1000b00a3ce8093f6esm1018500ejc.179.2024.02.17.06.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 06:07:58 -0800 (PST)
Message-ID: <b6182318-7d49-4002-b2c8-6701e6052510@linaro.org>
Date: Sat, 17 Feb 2024 15:07:57 +0100
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
X-CRM114-CacheID: sfid-20240217_060807_709885_BD48EBD3 
X-CRM114-Status: GOOD (  14.41  )
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
> @@ -0,0 +1,400 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I3C HUB
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
> +
> +  Having such big number of features, there is a need to have some DT knobs to tell the I3C HUB
> +  driver which features shall be enabled and how they shall be configured. I3C HUB driver read,
> +  validate DT knobs and set corresponding registers with the right way to satisfy user requests from
> +  DT.

Ah, now I understand. Instead of doing proper schema for specific
device, you want binding for generic driver.

Sorry, that's a clear NAK and clear reason why Intel did not upstream this.

Bindings are not for drivers. Bindings are for hardware. Describe
specific device and that's it. Any non-device, but driver-related,
property is NAKed.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
