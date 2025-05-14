Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0789DC3ABCC
	for <linux-i3c@archiver.kernel.org>; Wed, 14 May 2025 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izJrtGG5MrHFVDkunnaq7Ce7tmV2vy8BdrKAssfYAMA=; b=L1iKuMvzzNrqDu
	ta6GybOyYw8xr/K4lutDNZ0/I0yj4wGXyq1mKp5BGQU7ZS4fmFNuVOmq2Okyqhkq93Cmb+NJ3WfsP
	Cfm+VXe5wjJ8rqNRRQiVZHAQtorWTUI7B9c6Y9itHkN0ITGbvFzvOZ2OIEc3KYp2I0kY5V7nMHkWL
	UzB9I+FRQbsKZKT/et0mhq3iyCwTBRx6lwtsQMD3x/zYKD71HLm5JYWqf+fS0BhL/nZ44lLc4hmPA
	pkP1oZfOlJxxGQ5KjLBoHwawX/TWAJ6fBSEt9SFydGG433Bn65gwtrIQHmy8wgt9WDtedTGiXaZ6T
	JSIwN04BzeLvNevfA7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5j-0000000F3VP-2gCW;
	Wed, 14 May 2025 12:20:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8zH-0000000Ekey-1j2A
	for linux-i3c@lists.infradead.org;
	Wed, 14 May 2025 10:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA2A560008;
	Wed, 14 May 2025 10:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8773C4CEE9;
	Wed, 14 May 2025 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747217118;
	bh=kITsxbCJWQENOnKhbH75PkR8+Js5zmGnIQSaxyrbZS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bhkJtu/YUchVVSclF2fE1TtYPbybleNNZtHAQ9hQchmLkYcIAALhCsZpL/r//HDdL
	 QH9dTU3Lrur+qAs3383SfJ+OmbKuskTBOCiqu4dntYhSCaSK712Zynad0WLzS4kxWF
	 jJulO6hkxCA4YLORUwlug00FJP2KkSZzrlqysKilUPJSKdJq30/s/sbLQXfS3Wn3xw
	 xAEWMmAsZbdJTuN0fCSmo3gKWdPCBSzEipuD+UlYP3bWCvxpFMAT9k1ebgrtP0ql82
	 LFkGT8k4E/cxXp+Hwo9iSBes4PacHK2Tqv3hrJJlq6AVYxoZwMrGVvUFQ5u/ng6Fnb
	 96zGN9qJrFL7w==
Message-ID: <e4317fef-c4e9-405c-9bcb-4d5447dd8367@kernel.org>
Date: Wed, 14 May 2025 12:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x
 i3c-hub device
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Vikash Bansal <vikash.bansal@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Shashank Rebbapragada <shashank.rebbapragada@nxp.com>,
 Frank Li <frank.li@nxp.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <20250508045711.2810207-2-aman.kumarpandey@nxp.com>
 <b46e3766-75b7-4635-a505-3039e4394f07@kernel.org>
 <GVXPR04MB9778CD46464F6BEE25D5D0529997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <GVXPR04MB9778CD46464F6BEE25D5D0529997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
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

On 12/05/2025 13:45, Aman Kumar Pandey wrote:
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, May 8, 2025 11:40 AM
>> To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>; linux-
>> kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
>> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
>> conor+dt@kernel.org; devicetree@vger.kernel.org
>> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
>> <priyanka.jain@nxp.com>; Shashank Rebbapragada
>> <shashank.rebbapragada@nxp.com>; Frank Li <frank.li@nxp.com>
>> Subject: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-
>> hub device
>>
>> [Some people who received this message don't often get email from
>> krzk@kernel.org. Learn why this is important at
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report
>> this email' button
>>
>>
>> On 08/05/2025 06:57, Aman Kumar Pandey wrote:
>>> +
>>> +static void p3h2x4x_of_get_tp_dt_conf(struct device *dev,
>>> +                                   const struct device_node *node) {
>>> +     struct p3h2x4x *priv = dev_get_drvdata(dev);
>>> +     struct device_node *dev_node;
>>> +     u64 tp_port;
>>> +
>>> +     for_each_available_child_of_node(node, dev_node) {
>>> +             if (!dev_node->name || of_node_cmp(dev_node->name,
>>> + "target-port"))
>>
>>
>> Same NAK as before. You ignored the comment and nothing improved.
>>
> 
> Thanks for reviewing the patch.
> As per your comment I have used proper function to get reg instead of sscanf. And our driver is not having direct interface with userspace.

What was the comment - undocumented ABI.

> What should I change here ?

How did you solve that comment?


Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
