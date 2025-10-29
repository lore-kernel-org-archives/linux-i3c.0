Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B65ACCF9F0
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Oct 2025 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMZi7jJX1sqHN14UkkvUq7IVBIqjadjCfnVPUuewKGk=; b=TpuMU2qtI4+g8G
	EC0EyLpOJXPAFUvfeuVFADuS/fTJuJy/mTHCAU0uEbg9W4KQIZrtzWVPqMJFwi9OipAUl99P5DCoG
	J9tQ5X7eOva3xQJG1+roKRc8shRmm3ToWIofsxGNCZ7MnWc/thIwUDpmHIwy452oPdWqn/pqUJA5H
	U3uKFfBinEfi4cZPkIRVvskZCXXkKDLom28hDb4CA4CdMxQ01J6H60Gjo3tOWLndNTaTRDtSZIiYl
	coY5ixeAc77F7C7C12dO+Dwtg7tioIAhjHV81O5rCTboXCoJhMRuHds52i2VQcZ5slvqcCVdMR5ds
	1f6XBnB9hv0qvmdxuLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Xy-00000001tI6-0YyX;
	Wed, 29 Oct 2025 15:57:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Xv-00000001tH2-2nIE
	for linux-i3c@lists.infradead.org;
	Wed, 29 Oct 2025 15:57:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-781997d195aso51405b3a.3
        for <linux-i3c@lists.infradead.org>; Wed, 29 Oct 2025 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753430; x=1762358230; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YHKaCHVvW4pAa4aGkUydgPlkht3aebf1HBtV+L4fUbI=;
        b=AYyCvT6dDgQjohEkeo8Jbbk2xaoWiLfmX0Gz4RmMvFwMYXXXgo5TUSvPDIt2q8BhMr
         M/f2SzQdihaw5M73fMkIuimwvqASBLYY+NLBwc3ibGM2/MLVYnz362jeXwYWilupPZpt
         8XY59ray0x8aQeu36oRf0g3Snu2IqivUDdlsenCC1Fak/KOTW0FHRgxygqvVmCHxROjJ
         V12urzknUD/FvvNu+Vm4XCG5fk5q9EEYzcFpCFXGqctBqTN11xl9/JMRo//hDY0ln5TE
         z5pbjkiw8PdVGQRJfdnDEG20Tnre/EfuKEVXKVjbyCvZwvtheEP0DwMxFQ/4FQ7hYjCM
         5EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753430; x=1762358230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHKaCHVvW4pAa4aGkUydgPlkht3aebf1HBtV+L4fUbI=;
        b=n3b57VlV5Rf0TcnhKddxh5n6sdQ7SA/yqaacVo/xP5XZwnNC1q2qxVyS8YiOKmxo7b
         iAAbLsKeebZdkHUz6sNxjwd+K0uPcRXlHrWtuBf9T1wNP+loF1zOM5hU9FI/HCwNSVu+
         /6lPXgmES6vMfRwUdPPzKaR6tjOxuXjo2SHesn05ddy989NYKSzDN6jedfFYUK42Obw8
         413mk2T/zkzJTp0Jw9unLc/Rt9XyVviMxjrYmguKJWQk2o6H2AS7hZu1TUHArFo3bqOR
         JEs2tY4bvNDWrV1GkoGekgX9/LX1yEIDf4qb6Xev7yyTyw4oOBzpGzTSgosBrW92WO8U
         wU3w==
X-Forwarded-Encrypted: i=1; AJvYcCVva8rIdqAUTcwux/F3dMNMsByFuyxCwLZWi7UeCKfXn72zPAWxJwi18hC/I9PpmYUlia44qqVe504=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmesVcZTC8jFPi48q4XyG/OzE7g0xNayDj9/B4cL29FFLO+flH
	Nei474Ziv6K5wSS4TaUqFIOmYUvlovLGrSN/u6VvSh0iFrXIfZQQR7dh
X-Gm-Gg: ASbGncsTx20L9M2kDi1D1/qp9JggZ86rukL59mazCwr8R7NuhwhMYzsUUKqBxttG1er
	QI4GrTLOMCZkR8A/wYYoLFFpTLBSQ2AoKTLmCD0xxU7GLD/e5zW8Gm4JRTutOSEF6KA3Nsl9PHD
	aik5AhSFdBEAlFiY1ni0YwN6hDQfw0yg8ow9pyTxVLsWZMInVwObYmHaVFY83RTL/sOl6c6O3X4
	f5lH7u8wtB5Waj5obYDtNyduuyp/TujgvrQ/ZFA8f9MekMFNtYr9rDUXatZvFd5IMOPE/pbGTEQ
	X8FoStHceO/B6zjDqSTh44nqK0DDqF+zZnb89xBI/iUpR2KpBn4F260aCpPDxMyX6yLSZnVoLDR
	9EF50Ap1Ih/AJXEb0WF9SWeGzyWdlMq32EffL3k9kRbAh0ibTFvn3BThG6WRMYnPJe+mh1n1lnT
	oEzv8dfrE+EskyDwyod1odXuxRuto4ZjeP+R3esYCUWd0nm/tf
X-Google-Smtp-Source: AGHT+IGf0JH6EjTEscJDZCE1UX51LztZustHvoXPPNnJE/xXANxakASKFDeS86f8TvevOGkVeEuG3g==
X-Received: by 2002:a05:6a20:3ca2:b0:343:af1:9a57 with SMTP id adf61e73a8af0-346558e2944mr4231242637.56.1761753430231;
        Wed, 29 Oct 2025 08:57:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712d4f12f2sm14601971a12.30.2025.10.29.08.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:57:09 -0700 (PDT)
Message-ID: <88a23acc-9dc2-42c1-b9c4-95fbb077cc9d@roeck-us.net>
Date: Wed, 29 Oct 2025 08:57:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hwmon: (lm75): switch to use i3c_xfer from
 i3c_priv_xfer
To: Frank Li <Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-i3c@lists.infradead.org
References: <20251028-lm75-v1-0-9bf88989c49c@nxp.com>
 <20251028-lm75-v1-1-9bf88989c49c@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251028-lm75-v1-1-9bf88989c49c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_085711_722178_3EE78AB9 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 10/28/25 07:57, Frank Li wrote:
> Switch to use i3c_xfer instead of i3c_priv_xfer because framework will
> update to support HDR mode. i3c_priv_xfer is now an alias of i3c_xfer.
> 
> Replace i3c_device_do_priv_xfers() with i3c_device_do_xfers(..., I3C_SDR)
> to align with the new API.
> 
> Prepare for removal of i3c_priv_xfer and i3c_device_do_priv_xfers().
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I assume this will be submitted through the i2c/i3c tree when ready.

Acked-by: Guenter Roeck <linux@roeck-us.net>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
