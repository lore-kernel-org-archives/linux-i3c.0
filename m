Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE38BD4661F
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jan 2026 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI0PUcarzng87v5Toj8NIM6E/Dh5ibanzkWybSzzCBE=; b=a4LupAdAoDm1vh
	qgampIjM9JZYqTHx2VkSFx2ORCXDL27uSIDywDSPFyp6uZAY/PSQNoHVW1T3qqTnusX5RCzK0RHmC
	ASx54xBDon7Vyr/IkR9U4fAR9BY4c8+0lPfy4rEquq9pbpeou6BgZ5ZHyoWFD3UqrHkt0n1xASaHD
	AaAhERl7JJQ74BGtzotX07WbO3fmcfkVsH8uYjnh4EvZBcZmoUdIE+Qimh6ZOTf+PDL6HLztpdo/f
	q6YVYCMjO0sM7kbgvLmUOgYdPB0eSofLIGHESD49IPaQRxBqfXryj5vewJNidMAX4MuHF0nw6R4r/
	FGrGKxpaGWE4qBPwxVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUSv-0000000DC2n-2uk7;
	Thu, 15 Jan 2026 21:01:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUSs-0000000DC1M-1TXY
	for linux-i3c@lists.infradead.org;
	Thu, 15 Jan 2026 21:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A32BD44572;
	Thu, 15 Jan 2026 21:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AE6C16AAE;
	Thu, 15 Jan 2026 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768510869;
	bh=QfsMNmFCztsyq6fZJ7VSMdsgX/l/Es58sdOM/qNqfSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rid881U+QmflYLG6vrqUL26x7HkadOcPMi61652uLkFOrAQUoH7zNCC62Vwg+b8XC
	 +OlZqBHcKHik5yo9rqpu/ZkS4+KLY0/kuak3yWw1wdGByxGY48REjZ9F3fcrhHPfXz
	 MgrxZlyzsA5rdbOh1/Qr59fNRW4PA0pqHLvmkni5HRhP9Q3SlqPSFulwMhVsy6URLh
	 LlAKmWarpVTRj0BYSp+eXJ9vOT2XLTQ/Rf5YJ10p7gBTBdN6+ODxE/xCJEIFm+wZoa
	 GqPTmYiNPQwM/q3L6jDAFzgUPaaIrUzXOP+yS3FIcbPuF1s8UEgpJnkV36FnfP4jfc
	 3OerY28QpsSaw==
Message-ID: <ecbb2dc3-7895-434d-b502-cbc82150fe01@kernel.org>
Date: Thu, 15 Jan 2026 22:01:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 2/5] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "lee@kernel.org"
 <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
 <priyanka.jain@nxp.com>,
 Shashank Rebbapragada <shashank.rebbapragada@nxp.com>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-2-aman.kumarpandey@nxp.com>
 <20260114-wonderful-vermilion-starfish-ad6ec9@quoll>
 <GVXPR04MB97786A5E118F5D12A9BA591B998CA@GVXPR04MB9778.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <GVXPR04MB97786A5E118F5D12A9BA591B998CA@GVXPR04MB9778.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_130110_445212_83B36B3F 
X-CRM114-Status: GOOD (  15.53  )
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

On 15/01/2026 13:21, Aman Kumar Pandey wrote:
> 
> On Tue, Jan 13, 2026 at 01:45:26PM +0200, Aman Kumar Pandey wrote: 
>> +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
>>> +cetree.org%2Fschemas%2Fmfd%2Fnxp%2Cp3h2840-i3c-
>> hub.yaml%23&data=05%7C
>>>
>> +02%7Caman.kumarpandey%40nxp.com%7C75a7d6f1f8b74fd3ac5808de5346
>> 3133%7C
>>>
>> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639039758104017624%7
>> CUnkno
>>>
>> +wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM
>> CIsIlAiOiJX
>>>
>> +aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Ze
>> GSgy3cF
>>> +whQbcO%2BserynVrrrqYGOIwBMgVjgdY25Lg%3D&reserved=0
>>
>> This is not a MFD device. Place it in appropriate place, e.g. i2c or i3c
>> controllers directory.
>>
> 
> Thanks for the review and the comment.
> 
> I would like to clarify why I modeled the P3H2840 as an MFD.

I do not see any model as MFD. You placed it in MFD directory and this
is what I contest.

Otherwise please point me to any hardware description what "MFD" is,
because for sure your I3C hub is not this:
https://en.wikipedia.org/wiki/MFD - scroll down to "Multifunction
device" in "Computing".

> While the primary function of the chip is an I3C hub, 

Wrap your emails so it will be possible to reply and read it.

So there you have your primary function.

> this device also contains a programmable regulator which is exposed externally and can be used to power downstream devices on the board, not only the internal hub logic. This regulator has:
> - Independent enable/disable control
> - Independent voltage configuration
> 
> From the board and hardware point of view, this block is not only a "hub-internal" power control, but a board-level power resource that other devices depend on. 
> hub logic and the regulator block have distinct roles and different Linux subsystems (I3C hub vs regulator framework), I modeled this as an MFD with two child devices.

Linux subsystems do not matter. We speak about bindings, not drivers.

You ignored some of my other comments. Your email is completely
unreadable, so answer is still NAK. Read my comments fully, fix your
email setup and then answer without all this messed quotes.

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
