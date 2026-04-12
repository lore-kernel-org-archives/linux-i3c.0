Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95783E937E7
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/uDcLK/xGLVBLtUhIbuhWeQ9w+zUsTDZqz51BETA4U=; b=Y11YQCKcc2RiaZ
	Noqr53h/y1Y7lK6r5zpp+3/CHElVxwflVkzODhO9NObSBR4DvcNjbnFPd7SYc3AbYkPDpBFb+1AWm
	hjtQ9CcrGZDG5eK2dg4rpnrF4WBYyI6HtJCU7M4eodHrC4gl75rBv1/S4OZyp3L3VVt8JTxdLcpEi
	5GI6ctzGSUjxxjPJW+nUF1fCp9u27VCbfBzGwLHJXpkzqzu8kI/AGPF6rxI/ovSVuCjYT59zVsK6Q
	1WfbhqQT60WmmhD1/sosOJhy+f+iz5tUyDVN5X755zupWp8y+9zUV5gOgY3xkHHHrHuqmPOLg+HmU
	8p3RDIFXQUQU/chao3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC2Jl-0000000EhWh-0rgH;
	Sun, 12 Apr 2026 21:26:09 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC2Jj-0000000EhWM-0JHS
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 21:26:08 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2c156c4a9efso5176537eec.1
        for <linux-i3c@lists.infradead.org>; Sun, 12 Apr 2026 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776029166; x=1776633966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g5YONsemN2vvgZ9asQJIXKdXNxh3MWkRpVIQ/RmrGZw=;
        b=q7e6SJ/Gv0ZbLyYgGTkMVoqwmPMIaOXTfj+3Smohn7imBC4eR4FIC71POvJdv5PS97
         U5N7fQW/J3Wf08Oi7ZptwmpAZheQxWcJmnpziDzl4GjD00vEJ13aKlDs9fpzSiA7mR2s
         LjWN40X327nivwzwje3JhZKG21IszJJ868PDtywS10dke8xLLcaNCq9knz8O09yWBvsa
         30gCMt4pjn83MRq4u+ud0j6+Y21sw0I4oxGbn0Yb90FtzbCg68x0K1e578kon4MqwTus
         1Ej7kbee1R+i05bCEcqq9v6Tv2cjPcTbLlKVfb6XpDq+BfoFaAdcmqa7SXtQduXwyFL3
         PcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776029166; x=1776633966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5YONsemN2vvgZ9asQJIXKdXNxh3MWkRpVIQ/RmrGZw=;
        b=JUEcTmEcxIBKVCgD+LhZTGWWPV7RZEPWwN2/PIbgtyhfgrS0azj/3hWjQaUKFY58iw
         1caBcJPXGmkTTb9sPLw5i5t5uHbbXWV/JFPgRxOY6sWoKC9d/U5Gm4exCoHIcqdh7F92
         CDyPvcycJWJJWs4WqkDB7PmEiLEaeha49v1Rd977Vq2tPyZym5DxbGkUicu4EUcdypfA
         dq4R+3fAjfc/LOSwGuGkpmJBiQW9GCxqvta9Rj3c1qixNdxdPu+/sSVKipaHVSYL9Jka
         BxS0qQNgJwraMMAeONsDLw8ZUo+XO8rIm9+Sik0DgmTxygK0a4OGM18Izc/lIsmqlDq/
         Bv3g==
X-Forwarded-Encrypted: i=1; AFNElJ+plm47UXfPLqiIG3rYY8an+Cew2NMiEgHWHz44YZ7teUqGZR3egvKwdiBeJ/p0lNc0S/CbPx1yqwo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnkmdu9K0v+93rID6xvhS/mgu6S91aOBKphD4utQbhVklMeGcb
	oLw3b7lqBljsW3J7K4hFj03Nk76qAhsgQ4mX5IDJWbH91BWiJZbPsfH8
X-Gm-Gg: AeBDiesb0t94iL7sayTv+r4uJ9ZFCdsPMERKBUIo9sLapGYUP9ZDAc3t7YGqQZIm6Qf
	RGpf5Q2irBVMvMmKK40HTzwxwZ2sa4UZsIeHMfAfeo9Lg1j9SUn6OBN+Jxh7+YAqNVwUh3QNF57
	UeG6r8ovF7/Z7bVD4Q0Fbj4vmADMQRpcEC9ZnelApvDs52/AqSQ0rznHudVwqeSe50YrQiJ9ojC
	mWm2C0T7lR+Kc78o4KDBdqMtPerTFj7oxYzZbglCUE+34INP1wXkTKVMNvKcD/6l7EZf9/vvsMg
	Sg9kLxZbJ+jx7D+4wLqfc1PbQcSZV2BIqvNLDIaoCtSYEdI07Ij1H6dmXFFN6pSJ92ytlRZyvIn
	RiEgl5W5qsxfyZp7x4POjHu04/NOHNurbEHUsKKjfybk/v0MlH1S+zSZKIf5ISjv/8J4Pk/18a8
	tOM/prJTDu7Q+Lc1mi16gbIUysKonYOldqcgdBFIT9jfaHSQSa0D5wC79JtRFkTvJDWEacTpHy
X-Received: by 2002:a05:693c:2c84:b0:2c5:d833:a4f3 with SMTP id 5a478bee46e88-2d58907b4admr6254248eec.18.1776029165814;
        Sun, 12 Apr 2026 14:26:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa42dasm13905817eec.7.2026.04.12.14.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 14:26:05 -0700 (PDT)
Message-ID: <e7418ef5-b41e-489b-b913-aeebcf9a5235@roeck-us.net>
Date: Sun, 12 Apr 2026 14:26:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>,
 Len Brown <lenb@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Eric Biggers <ebiggers@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-13-akhilrajeev@nvidia.com>
 <19218853-499c-46a2-8843-0bafa17c81d5@roeck-us.net>
 <20260412201629345ffec6@mail.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260412201629345ffec6@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_142607_146317_E1E9E588 
X-CRM114-Status: GOOD (  13.41  )
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

Hi Alexandre,

On 4/12/26 13:16, Alexandre Belloni wrote:
> On 09/04/2026 07:19:25-0700, Guenter Roeck wrote:
>> On 4/9/26 03:57, Akhil R wrote:
>>> Add a regmap config and a probe function to support for I3C based
>>> communication to SPD5118 devices.
>>>
>>> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
>>> ACPI or device tree entry. The device matching is hence through the OF
>>> match tables only and do not need an I3C class match table. The device
>>> identity is verified in the type registers before proceeding to the
>>> common probe function.
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>
> 
> Guenter, I guess you can actually take 11/13 and 12/13 for 7.1 if you
> prefer as they don't seem to actually have any dependency on the
> previous patches. The worst that can happen is that the driver won't be
> probed because the I3C subsystem will not enumerate the device.
> 

Thanks, but Linus released 7.0 today, and the 7.1 commit window is open,
so it is a bit late for adding content to it.

I can queue the patches for 7.2 after the commit window closes.

Guenter


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
