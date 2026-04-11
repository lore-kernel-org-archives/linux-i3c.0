Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D39F36BA6
	for <linux-i3c@archiver.kernel.org>; Sat, 11 Apr 2026 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yoeRJja7BKqVXlAzVBa+n8CaiKYWaw11Ses/ZMm7xs=; b=IpTFlY3tp6CpD+
	dq0CPN7QnLXVe7168o9QoRvnn9fGjN/HB06lAm6MsOsjvcpZLZcJMyQOAbmd2j9oTxHFFAx5gVLqW
	hpFB5N5o45HfAtngVilf6RUnoHx+1Kp0oWdDzC8F4DEpA5yW7zlmWRLqE3gEV612PU3v1fY6VgFLI
	IHYH2IaFFVjN8cD2vDiT2thEGqdOhb2O8EvVc8iWSvKlI8aER+y7RNe9Z8wF2LSFaltxBkiDc0Xa0
	nnRQ5SkzWNOOo2IrgcnbhSA1CZyduXZaN21wLRg1VWBZ61vAi/fRPS4M7BGH6YtXVh3OJnmzf06sQ
	tmXFymUjnE+E02Xu3OKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBSdu-0000000DEDR-1Ljy;
	Sat, 11 Apr 2026 07:20:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBSdr-0000000DECz-3aBQ
	for linux-i3c@lists.infradead.org;
	Sat, 11 Apr 2026 07:20:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso2190682a91.0
        for <linux-i3c@lists.infradead.org>; Sat, 11 Apr 2026 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775892031; x=1776496831; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VlHFHyv7lotD4cDN/ipcHMLKOy2CDqZhb9XbRaJOH1U=;
        b=NDe+gRfoLlUM020dQeh8AocWGit3jqvPvzkqEXU4uO8Et4WCOxeO0y0P4uEyPR8hW+
         AlZfdsDGaUcygI7q1Jjw1vnt+wxbU4pieJZWYXWJbIRECcFedew1VOvH5lmuAc6VqHHm
         6Nb9dtoiqKgl1N7EnhKJBLWYmcTWvjsupolwP4l4fijZ5RhyknXJthFZlQBON6uPDNcS
         mrxCI1sZ7Fyk6vqP0KnpWelLPYMAx0c2SZxZtLfM++DpTv3WpHm1h8wqFPQ3+chC/wQe
         iCT6CA5DsDMBa8SiXphUX7FqyFJUOv+l+j+SDQlEPfVFiy2F7LNJv0kD2d1bwhur4DmS
         gynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775892031; x=1776496831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlHFHyv7lotD4cDN/ipcHMLKOy2CDqZhb9XbRaJOH1U=;
        b=A8T1788f18ikGcKsGc6QvbdAVW+Yh+totLlB3uLL33VUvIW+9lssv7vk0mwQQYyR0I
         xU3nKyW/6VlF1/vPxpdizGCrvnCJecA+Mqz9pPCYwu52u/kzsENXxvmaqj0kmpJ4yqv6
         TpI81NvegdKvUPls9mM+vHc8ayVWZsX2eLYGkTc6QWxdyEVWaksgzX5qQ5Fj7SD50cXe
         azMop4zXSFV1RCmPjuGLZ2eiOrPlzFcEuV3lu8sdDSyrzNWH9/mKqgqdhE7bkQkgd3B7
         Hk9tPFZFVRsA430iQDZRFwScUe+6EPJDS8F6OCiOtn0uocmP6EgiiNf0qQ8CtMfUyDZY
         CA/A==
X-Forwarded-Encrypted: i=1; AJvYcCWJrATY6jpUPSY5WXs64IAso/DRwku6dtwULTuoYulpD1QUHAAjxmLKrLBmIQFjjOjQLlATDfaH9IA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVkYAvn9QbjuHGy6ffCevlgWRMDTorfByog2pj5uMRFvX+cJNV
	Q6WlFV2XBnMRKtJmT+DKwjN9k07PdjNpmQI6WnwKaf/tIte9DBJQiOGF
X-Gm-Gg: AeBDiesOfON3vFkaOD/qkSTSpssCFh3f2yIacCp8EpPm0f0V87P1/Rw7CSZuf9p0I2s
	mtJbOcmYfkIHWijLSSs1E5X0z2D0s3m48McVC7lWQNoqTUW3sw0kNg8W5YY9rrwol2gMHkhCjH7
	ED/E2HanLLXkvoqA1JsexE5l8PIwr3EhM/qkG27oCFuMXCf/2ZvzjdZzReLYd7sFRMYra4PhjyW
	2VqF2lqvgjGscUL3OLB64MvF2g7H0Rh+IOGUAfgmSs07UwvibY4Mq7y2hK7CRnkZp93ylwNO6P6
	+tqycGoJ7c6Dfx1eqscF9nTBCiywAn8iJy0c9Ael/0iJhVawKiyvUarhc70AGjkj6ih7XRnt2qr
	obJ28x6+CZ9A30lpbm3A9Z98Pa+qyEmKeInUDkggXR2bfgZ+WWHxzII91de1m6oYnYmI1OtXFAH
	IqD2L9/LJWVoeg2RNtLQfpSbWd6VYbsQp8+htWbzDc/9eqhKkDa/ftOuqrJrh/3WdYFaAlFbAO
X-Received: by 2002:a17:90b:2ccb:b0:35b:c900:79a6 with SMTP id 98e67ed59e1d1-35e4274e341mr5769646a91.4.1775892030776;
        Sat, 11 Apr 2026 00:20:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e35155829sm9191314a91.13.2026.04.11.00.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 00:20:30 -0700 (PDT)
Message-ID: <d0f1f053-589a-4681-8c8f-8e4b5daec145@roeck-us.net>
Date: Sat, 11 Apr 2026 00:20:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Akhil R <akhilrajeev@nvidia.com>, krzk@kernel.org
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, p.zabel@pengutronix.de, rafael@kernel.org,
 robh@kernel.org, sakari.ailus@linux.intel.com,
 wsa+renesas@sang-engineering.com
References: <5c751739-5044-4d23-9648-8d46dd0945d1@kernel.org>
 <20260411053433.49655-1-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260411053433.49655-1-akhilrajeev@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_002031_939011_C2769CC7 
X-CRM114-Status: GOOD (  12.49  )
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

On 4/10/26 22:34, Akhil R wrote:
[ ... ]
>>>> And it
>>>> should bring me clear rule what I can or cannot remove from defconfig,
>>>> if in 2 years I come and start pruning it from symbols.
> 
> I am still a little confused on what information would likely accept (and
> keep) these configs in the defconfig. Would updating the commit message
> as below work?
> 
> "These configs enable the support for SPD5118 within the
> Small-Outline-Compression-Attached Memory Modules (SOCAMM) LPDDR5X found
> in the NVIDIA Vera CPUs. The Vera CPU uses ACPI and is part of platforms
> such as Vera Rubin."
> 

It is quite interesting that we argue about SPD5118 which is mandatory in
DDR5 systems. At the same time, CONFIG_IGB_HWMON, CONFIG_SENSORS_MACSMC_HWMON,
CONFIG_SENSORS_RASPBERRYPI_HWMON, and CONFIG_RTC_DRV_DS3232_HWMON _are_
enabled in arm64:defconfig. CONFIG_IGB_HWMON is even built-in.

It is kind of difficult to understand why those are more important than
the temperature sensor on DDR5 modules (or the temperature sensor on DDR4
modules, for that matter).

I don't know what the policy for defconfig is, but just based on that it does
seem to lack consistency.

A separate question is if it is time to enable I3C in default configurations.
I'd think so - more and more chip vendors support it, and presumably they would
not invest in it if there was no demand, but that is just my personal opinion.

Guenter


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
