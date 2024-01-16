Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E793C4706C
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jan 2024 07:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cwd5y0guat3lFtyPFCYL/SgqdBEa4E7ZsMA/eW3KVuU=; b=hN8HLBd/6sD7n5
	uwCDtcB4lD0pPkTntgxXMa9S8cba8tj0DMlHJ4OVvWI5bCTNpjehMfBJbpSwVn+rNeJXtfoYohCEe
	W24OBijuLnKo472oca70eDYaLXRT91NXKjWWPkfLHHS+PzGqEv0HL+8MUfJSnLKbyTcHBdlFjln0s
	Feiv7ZXwIZqkGxaHlGRbHB4nsjZ2c944YtpwiPH0pmjjjymNLzvsQR3UcNnGVfuHV3XfTlxfd2qhE
	TZp53msABJH6U/BdE0fiRFeKR4O/djBUddjTb69iRt0srmdC77UbAMzxjFAh6YEa/43RzBr4Q7qr4
	H3ttnMJdsXaXpT/Zt8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdoE-00BCm4-2I;
	Tue, 16 Jan 2024 07:24:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdoB-00BCjt-0B
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jan 2024 07:24:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a28da6285c1so1707073466b.0
        for <linux-i3c@lists.infradead.org>; Mon, 15 Jan 2024 23:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705389862; x=1705994662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JgRjMNs+e9DgLVdT4/phU8KY385TQI72vtZoArIQpM=;
        b=xmugWXdUwqqamBpzNVQRMUjf7w//nDklvzBu1rjJkabrenOkaSKPB+ciSLG4YbsUXZ
         us9OGplhtsQTZ8ypUlvYKumvtcpNdpy2T51zPHW1tvpkAJbWisKQNCSTLGcgAc3L/QGC
         j7uJ2XTCDFZC9lKBjM+gHdW5nerrIhstGdUypUEjTpXitTmdvYLWjF3KYqY+MK1l7CzO
         Jm09rOusyCcE4yax58TrUA59n44OaS2kfRpvfqPfIuQd5cHBR44ieBVEoUOp0F2dxWRm
         Ajb93pN7HSdZBW73MDlR2BIa+pNUQC+rLhOtm0FsYWY1p90t/twuemM6tBbF6CL4QOrz
         Qk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705389862; x=1705994662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JgRjMNs+e9DgLVdT4/phU8KY385TQI72vtZoArIQpM=;
        b=PfmeYdSCG8zZazoCX31h4FBx9NdnYq1aZUuTdgDVGXHxo6ibEiUjugOuuN6cHyMhQt
         exyPDmM1YRCFinPgzN0HX5RxBDe5BQv+qsYh65ZbvS8obVy2/ILKJ2wJU80j1Hz//PYm
         GpSTBpXXmp+NkX2gz7zf6ClJVviRxkYgvjK9Zgadd1JTHdb3aCdN0QBsnuPdaWvlHapk
         /BlBvw/WkfR6IUkk+oW3aaoq3fCCDiqDZeA2C4IkzQ8F49WHWYgWX1gGEuhs4L69uVPQ
         47QkngTGH71meNVxk9An1kD0zw1LyIlOTASdgvxchjrXs/pZPSA8A1f5ntFcmtzB7U7l
         EE2A==
X-Gm-Message-State: AOJu0YyuDyHuz2LNzms3emeeTfGP2jvI7kYZ/RB2bH3nSHa6ZVo2oC+m
	yxGNxtrNy7Z/qA4X/UMPd7w96o3xKoUhuQ==
X-Google-Smtp-Source: AGHT+IEM49xmCazIzhhAaJcBTvlIYT3qzttjLgk+gc5Adx4ymvmbJPObcL4w9NIyBRAbJFB15Kt2aA==
X-Received: by 2002:a17:906:bf47:b0:a2c:f62d:a598 with SMTP id ps7-20020a170906bf4700b00a2cf62da598mr6858249ejb.0.1705389862525;
        Mon, 15 Jan 2024 23:24:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id cw1-20020a170907160100b00a2dae4e408bsm2554928ejd.15.2024.01.15.23.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 23:24:22 -0800 (PST)
Message-ID: <d45e31c4-914e-4cea-a145-9775b6f516ab@linaro.org>
Date: Tue, 16 Jan 2024 08:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-target-v1
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, alexandre.belloni@bootlin.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 jirislaby@kernel.org, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 miquel.raynal@bootlin.com, zbigniew.lukwinski@linux.intel.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20240110175221.2335480-1-Frank.Li@nxp.com>
 <20240110175221.2335480-3-Frank.Li@nxp.com>
 <3c0be658-e7a6-4231-b206-86ffb47e0cb2@linaro.org>
 <ZaFbbeQrC7o2dchO@lizhi-Precision-Tower-5810>
 <e3b9aa63-25a5-41cc-9eb7-6e7d1eacb136@linaro.org>
 <ZaFjaWCA6k+tiCSJ@lizhi-Precision-Tower-5810>
 <ZaWLCrWJEMtFx8cR@lizhi-Precision-Tower-5810>
 <1b628901-7f71-4c97-9a16-723912988417@linaro.org>
 <ZaXqCoCHPWER94Hh@lizhi-Precision-Tower-5810>
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
In-Reply-To: <ZaXqCoCHPWER94Hh@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_232427_096878_916013A3 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

On 16/01/2024 03:29, Frank Li wrote:
>>> 	Patches were accepted after discussion, what you ponit to. So I
>>> think everyone agree on the name 'silvaco,i3c-master-v1'.
>>> 	I plan send next version to fix auto build error. Any additional
>>> comments about this?
>>
>> I still do not see how did you address Rob's comment and his point is
>> valid. You just did not reply to it.
> 
> See https://lore.kernel.org/imx/ZXCiaKfMYYShoiXK@lizhi-Precision-Tower-5810/

First of all, that's not the answer to Rob's email, but some other
thread which is 99% ignored by Rob (unless he has filters for
"@Rob"...). Therefore no, it does not count as valid answer.

Second, explanation does not make sense. There is no argument granting
you exception from SoC specific compatibles.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
