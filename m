Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6141C83F1A
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Jul 2025 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOJfOS/pa6dnAf7HZouv8gVKFvC2fHcFjziqZ63cvCY=; b=QwBYDGghfv6YqA
	sEx/KIIL72ZBlO2z0D3Hm7hsD30kVUdKPm6hS0dfrezZzwvZM7rivWEW6LR8WolzKoTAOUUKw6qdY
	YvkQyV0O3lSFFkKRmfFJIv11kT9mNeP+F+EbJimr7fzdFhSpu5KVs2znIdvVk8QNw2sjwhmIxP/T+
	x4Ou6Sri2qTkddH6jn8bJQg/Lx2/OXLPBZSdfQi96PVshaKmdoaYA6YyL5fQorSHC7bEXw4N1l0gJ
	p2LRejrjImbqLLDysvEvOiEj0MY7piqc0kH8iCovviGrYiKkpAgGAvZb/T9G8wEYgy/JrCSsuSM2V
	rJ2+jz4luMmgu7+O2saA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udSrD-0000000FEaZ-1J5h;
	Sun, 20 Jul 2025 12:09:31 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udSrB-0000000FEZs-0CJm
	for linux-i3c@lists.infradead.org;
	Sun, 20 Jul 2025 12:09:30 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-607247169c0so544691a12.0
        for <linux-i3c@lists.infradead.org>; Sun, 20 Jul 2025 05:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753013367; x=1753618167; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5dngmF7RxUnwp2FFulLPbgAhN03C1hWVB9WfkRY014U=;
        b=ZyaxPu/H6WKsJRJc90uIpH+JP48SZOYUDcnAso9mvcK1hysZFAyw2S554PReQ4kHGM
         hANyLl8wvO2OPm2C9VrR0hgTTFoSacfUQubkTLGPegEsBmu/Cu/EiFqO+bPtt7RGfr/0
         aiaD2E4oqHOXeaJBN/NOvstknBEaI2LxVM0b10T8XS5nd5Vw59qM5LVTe7nmaAryuC61
         O+B8yrRQacAI37y9X8e43sGeKiVhFMXCtP7Y5UNS/S/DbAnMIQkX7Y0/gvAKDb7Opl4R
         MF0usBz/EMYH/V21lIxO9vP9l9Lz0Jn3nSkPun1tG33R4nPU1yOhpPzvGZbPxnWoKQjR
         XF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013367; x=1753618167;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dngmF7RxUnwp2FFulLPbgAhN03C1hWVB9WfkRY014U=;
        b=k+YYZc//Qk/PBz6U8IJtqYppSTsDAkHoeiuRXpwNNn7NQOjUjKcpntmDqyAU94NCB5
         SYvBDrMUQ8MX/nJPAtEcA2QpuwmX1VUSHlGT6t3mHevxxlFZzMVAY7/DXTXA/YIsM5D1
         ejWYBunVlZImZBkwDUzCjgZlL9PKpUanVd2bOqSJc81nXnoGODoMPnsH0IpU0zlBTjRR
         CVxhed2HFVaeAHNKgqtjXgfoZ1Bq0vAs0rtyJfJ4wVNUr7LNDI+bl5GIs7pMqMx91yaE
         iLDFjr0w/LBpfJBctE+26R3omFV4MSsi+wzGMwQF5HjUzr9HHHhinWIIaSg7oX4iuBn3
         3+SA==
X-Forwarded-Encrypted: i=1; AJvYcCVhRwKEKKOZaKj9WAlnjnbOG3H19EMqbg1nUbfyQcvWKcPNXuBt8vIy05iTwaeR59esh2luksQVTyM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRr9hdHpTkPMdTAy/LzjqFKxJY8QqGrqymyUVnv3oM6IzYIpmD
	64ALCoyFmjbwQnHSBDN4t9DDYJX/qfdKISFGBmQ241IxmHJS79Xb99BkRcc8k9c5sNg=
X-Gm-Gg: ASbGncuCufTFPqcRu9giQE9ts58wGKm0zHRtUnEjkfoe/UA+ltj26vbzce2PFvaydX1
	5mwDWUX4vyEljcqDB3QWZlxn6kfWdcoSvpRsoh82EOWy8Qnp0SprPet3eH4xs8foBFETSos/Xto
	xKJn01ZzM56kbBQTc282FjqXFDlZf+sIePqu00tcwaUN4bEN1FuVM5OGeepJA+C/5HkUMzLYke9
	BL/NDyxiXtb98bIhXJc2ndVa8qr5r2Ph5SbN/tkL3Y4OCLVxybmTi00MH3UKh3YBtUsUPn5EbdR
	zFGEIADln7FtaBNBdWDxRwXclyUe0DqbH15hZC2py+JZ/E34/UA82qwchJQBegRIma8mFgkzkrK
	g7vLL1kaYt+CdtwjYPzbWkBoSXsleJ4wOlkV1dbmRdg==
X-Google-Smtp-Source: AGHT+IHrzefygyqO9fMmkmrMFf9WOiacpbBxnamcgRCXplTdrv6UqBqckrEEpwbLnx+lw/ADNTQtQQ==
X-Received: by 2002:a17:907:3c8d:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-ae9c99ed384mr626193366b.7.1753013364927;
        Sun, 20 Jul 2025 05:09:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cafa958sm480360466b.166.2025.07.20.05.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 05:09:23 -0700 (PDT)
Message-ID: <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
Date: Sun, 20 Jul 2025 14:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jan Kotas <jank@cadence.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?=
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_050929_103273_0D70F7D2 
X-CRM114-Status: GOOD (  21.26  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gMTkvMDcvMjAyNSAwMzowOSwgSGFyc2hpdCBTaGFoIHdyb3RlOgo+IE9uIDcvMTcvMjAyNSAx
MToxNCBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IEhpIGFsbCwKPj4+Cj4+PiBU
aGlzIHBhdGNoIHNlcmllcyB3YXMgcmV2aWV3ZWQgYnkgS3J6eXN6dG9mLCBhbmQgSSBhbSB3b25k
ZXJpbmcgaWYgaXTigJlzCj4+PiBxdWV1ZWQgZm9yIHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4gVGhh
bmtzIGluIGFkdmFuY2UhCj4+IEl0J3Mgbm90LCB1bmxlc3MgeW91IHJlY2VpdmVkIGNsZWFyIG5v
dGljZSBhYm91dCBpdC4gUGxlYXNlIHJlYWQKPj4gbWFpbnRhaW5lciBzb2MgcHJvZmlsZSBob3cg
dG8gc2VuZCBwYXRjaGVzIGZvciBtZXJnaW5nLgo+IAo+IFRoYW5rIHlvdSBLcnp5c3p0b2YgZm9y
IHRoZSByZWZlcmVuY2UuCj4gCj4gV2Ugd2VudCB0aHJvdWdoIG1haW50YWluZXItc29jLnJzdCAK
PiAoaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21haW50YWluZXItc29jLnJz
dD9oPXY2LjE2LXJjMSNuNzMpIAo+IAo+IAo+IEl0IG1lbnRpb25zIGFib3V0IHRoZSBzcGVjaWFs
IGNhc2Ugd2hlcmUgIkludHJvZHVjaW5nIGEgY29tcGxldGVseSBuZXcgCj4gU29DIHBsYXRmb3Jt
LiIgd2UgY2FuIHN1Ym1pdCBwYXRjaGVzIHRvwqBzb2NAa2VybmVsLm9yZyBkaXJlY3RseS4KPiAK
PiBIb3dldmVyIEkgc2VlIHR3byBkaWZmZXJlbnQgcG9pbnRzIGluIHRoZSBkb2MuCj4gCj4gMS4g
U3VibWl0dGluZyBwYXRjaGVzIGRpcmVjdGx5IHRvIHNvY0BrZXJuZWwub3JnIHdpdGggZW1haWwK
PiAKPiAyLiBUaGVyZSBpcyBhbHNvIG1lbnRpb24gYWJvdXQgdGhlICJCcmFuY2hlcyBhbmQgUHVs
bCByZXF1ZXN0cyIKPiAKPiAoaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21h
aW50YWluZXItc29jLnJzdD9oPXY2LjE2LXJjMSNuMTg2KS4gCj4gCj4gCj4gSSB0aGluayBpZiB3
ZSBuZWVkIHRvIHVzZSB0aGlzIGFwcHJvYWNoIHRoZW4gd2UgbmVlZCB0byBjcmVhdGUgYSBuZXcg
Cj4gYnJhbmNoIG9uIHNvYyBhbmQgY3JlYXRlIGEgcHVsbCByZXF1ZXN0IGJhc2VkIG9uIHRoZSBz
YW1lLiAod2l0aCB0aGUgc29jIAo+IHRyZWVbMV0pCgpZb3UgZG8gbm90IGNyZWF0ZSBicmFuY2hl
cyBvbiBvdGhlciBwb2VwbGUncyB0cmVlcyAobGlrZSBzb2MpLiBZb3UKY3JlYXRlIGJyYW5jaCBv
biB5b3VyIG93biB0cmVlLgoKWW91IGNhbiBnbyB3aXRoIDEgb3IgMiwgdXAgdG8geW91LCBJIGRv
bid0IGtub3cgd2hpY2ggb25lIGlzIHByZWZlcnJlZApieSBBcm5kIGZvciBuZXcgYm9hcmRzLgoK
CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
