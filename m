Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C65EA3C5C
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6F/fQMC9gLeU5Pr4VYLwnzjUhX9J/EV+iQmOxj78Lk=; b=g2fEk0ElBwlv4a/A+eqcDuL4Ub
	eHDA97FfrW1L4hOSzP1xGFQNTFFKl5fw6A4PfSFdeOu5lBitr0NY197il2GYeTJ3QMlwP7mt3M4p0
	9BbqxWfiDLa5NTcf+uaU3iV+zcG4cnFlb+wo57uNhTfMMzmHk+si4ao0bYZ+JIF1/63QmfsT+qPwp
	UAQlIqfSbNM+coz6meQURfyLCJ8xl/Punt8qBmyF6UJrZJF8bNw1WEc4x3THd7HmO+vS4fg/aZ2zQ
	41yPaPw01IPVknvmAcLmlc2kp8ix63qL94e0N69dnpOWoUP1DLqAb7ZxwSVQPqACr1rEmTKewesQz
	X7IeGSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5o7-0000000BhiU-3NbR;
	Fri, 10 Apr 2026 06:57:35 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5o4-0000000BhiC-2muV
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 06:57:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82cec955160so1289247b3a.0
        for <linux-i3c@lists.infradead.org>; Thu, 09 Apr 2026 23:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804251; x=1776409051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BCuVyAE//c6z8z5XxMRPVpCheDMz8TJGAL7Q7eoAANg=;
        b=sGhjwvLUg6OUm3PhbksTmFLc55qBwk9ip4Qiep2/+rizfswTuGHW391hTrCgx9sj9F
         k9jtisr+FERhvrG0jLxzr3qWrUeXx4fiPjnAl5X8DNa0NPC2tGT09fJeskqJZwuMipda
         34DiFO/RzB+Jujmknq00WoIkWcErDR8HpMu9AVU7A0q8apCa/eVs3Xk8Uyw/H01VCQu9
         3EGs7Gm0WNzE/ijoL4EVjqmc9RmNRaCiE5rcmX7N0dReJqlyjD+90Lh2naZ9GHPr+9mC
         PS/bZUXb7o9MSnCvkdIc+I1hfb/28bVsx6dA4oPYag1ROHZ39cyT3s0CXR8UV4VIvpnh
         ZXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804251; x=1776409051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BCuVyAE//c6z8z5XxMRPVpCheDMz8TJGAL7Q7eoAANg=;
        b=DfpdAg/fdfQD8rNN6vzK0Zr/o7BU0V7OIxwlrm3WYhd9fUgfdxHR9s6LOY3lpZazNy
         LqYTefKo85NM9fdjlEqo6v2VpwCNBVo21JxLrW9f0yBQcge98oJtY/C36/KXHLVLBWnp
         ffJCJkXdaDmaKnkSJp+hgiCs6JXlgM/02u2KhhjiLHFfRwE5YV9TE8Keixpu7T9Vq13Y
         BMadkPvA3u39lR8bcn1esNMM3yToQU5C5rW4z4Hhq3sbFPZZUs4ptt/+XExRTfX8L1GD
         Zl3UZ/xmAavy+9flplaKCe6j0DYQIUrFsr17imU5p9Nu2Kqvfb5QCohzio60/OsBGfyf
         FVjg==
X-Forwarded-Encrypted: i=1; AJvYcCWP639dZxEHZO1vJH2XWG5Ri/NmOSzL9VZtjbDCIXNQ6HvsQ+PRQwvlvVhLD87VHJsfW1gc0VqJj5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrJsX8Qu+18RgBHvZKE0IOKEYMnRKFrqtuF1VHTglnGvNlZRCi
	HRi7heAku5dU/EwNe+BrudkP8UeQBIiBpXcEy2hDr8VFLUpy7jJ0CJRh
X-Gm-Gg: AeBDieufs5fmeuHeTYE6ThCed7iDq+2tagpK9zwGmQPbXQXYO9Ot9o2Xd8fvtOZlwpR
	HVc7g+T6NlRQK8HLbtDEDXaInYLV1YfgRnrWv59JAiQuy1XAkO5xPeOoWELsHncYDUyBhWm01D2
	rr65IklKLdPp1qyhVwMWR+WYkZ/ZqqDzEya6YKODMh/DO06vXjXIgwax6tyyrJvuINH8iYHdq0n
	uDLyb+OYWdCGs6XeB6+Bpez+xJJxYm/HjqnuCyNX3xCNdp8XtYxA3GwS6+uBPoUD/sQv8dvv8ZM
	H+WvkCVY5RTAxHk101A6VYV0mXJp3BRQ0Qv1/1Jul3e+xTdcXG0N2orWk2CoGvqhxPf+V/ZKS6C
	/V0kUseBZKb9eoQPOBu0q4lF3Bh7fecby7FcDYa8rjr4Wfk4Gv7C7h7DoiDXRKHu5MPPkEhavpH
	kaylfqyvAub6u8udzD9CoXgkys34C7VV3z6TF4vfvBN459p8H200THMse7TkW74sV9yDrBNHrG
X-Received: by 2002:a05:6a00:278b:b0:82c:9897:70d9 with SMTP id d2e1a72fcca58-82f0c2c8dcemr2350303b3a.38.1775804251348;
        Thu, 09 Apr 2026 23:57:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee3fsm1801229b3a.12.2026.04.09.23.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 23:57:30 -0700 (PDT)
Message-ID: <0a943b31-ca52-4ed7-b455-87fbb98fbc23@roeck-us.net>
Date: Thu, 9 Apr 2026 23:57:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Krzysztof Kozlowski <krzk@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-14-akhilrajeev@nvidia.com>
 <6fd4bb71-90c5-4fe2-a520-97167fba049f@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6fd4bb71-90c5-4fe2-a520-97167fba049f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_235732_734027_560460F2 
X-CRM114-Status: UNSURE (   9.00  )
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

On 4/9/26 23:39, Krzysztof Kozlowski wrote:
> On 09/04/2026 12:57, Akhil R wrote:
>> Add I3C subsystem support, DesignWare I3C master controller, and
>> SPD5118 hwmon sensor as modules to the defconfig and therefore
>> enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
>> Vera platforms.
> 
> git grep for "Vera" gave me zero results. Are you sure this is an
> upstream platform? Please point the DTS using this.
> 

I think this is an ACPI based system, or at least that is what Google search
tells me.

Guenter


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
