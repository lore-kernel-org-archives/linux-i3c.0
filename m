Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B75D41143
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jan 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztjTRaQQw5SzIXV+sLGsl6a/gfQ7ovcjr3fqd2oLMxQ=; b=mI6axG/O3yNNjZ
	l5fgh9dh+YNFrQasrSYB/aBwFsCILFmO9pXxYMKWSLO3O5NBMgqzZrxk8qsm32sXjjuZFO6cw06Cg
	0haKptVdU3S142b7aYJM1UINlk3I6xz8JSdGFcv4C3CFW1tvf9TaQwmrWENVnQumokidyxTbuvk/Y
	ZTFC4tYT+WZjxPHgSJJFJJCf4Qbix6aapyzbrwe1YSzt2716ZY7+Bmf51Jw+NVP38MT6dLVIO++1Z
	394rBJBF3Jhabf9rQaycWzWibYxqJyw5iVBxnFlmXWS14GoTzTW64BNJmmMnuZkjNVLDrcKFdtGJy
	Qy5fOP9dasDeQDkbl1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIuk-0000000C0fE-3Guo;
	Thu, 15 Jan 2026 08:41:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIui-0000000C0et-2Evg
	for linux-i3c@lists.infradead.org;
	Thu, 15 Jan 2026 08:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4235844233;
	Thu, 15 Jan 2026 08:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0C4C116D0;
	Thu, 15 Jan 2026 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768466467;
	bh=nV4x3vpxUwlh1oOro3heNdmGg3EyGD4ZoC4sV7U5ApA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UvqQhx+pjZh1Oe+q+kL7Gu0ar19zQS8RNvkcmQREWtdIfca850o/o56F1DUobQ0bp
	 cA4vVWWvX4fC5tJqwRWRM//2bzUD2SEUhZq85+aHXc4l1+Xy38fnQcJiRmlSn82arq
	 dtgmhjtgvl6nyX7iH27ONZDSjJfPobILq4kX2hC8VPnhyDD6HZUNl2EBI5OXX/IU80
	 KCooyQgosVTMsafymUsGWPcXdGDwiKCYY5uh/afBxS42s+gCOGMItg6kQmQLDLHtWA
	 FMiGCBK+YekuoOeC7alLsp1KETOn1M6sDD65SYWULHFiIX/qU08Vzqu/U/W6HLWIKo
	 I2btgweAuHqKA==
Message-ID: <c5d2d4af-41f6-4cbe-8754-deb5a06253c7@kernel.org>
Date: Thu, 15 Jan 2026 09:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
 Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
 priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-3-aman.kumarpandey@nxp.com>
 <20260114-refreshing-groovy-buzzard-af2eeb@quoll>
 <20260114171732470bd389@mail.local>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260114171732470bd389@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_004108_644505_1286ED2D 
X-CRM114-Status: GOOD (  13.15  )
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

On 14/01/2026 18:17, Alexandre Belloni wrote:
> On 14/01/2026 09:28:53+0100, Krzysztof Kozlowski wrote:
>>> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
>>> +{
>>> +	struct p3h2x4x_dev *p3h2x4x;
>>> +	int ret;
>>> +
>>> +	p3h2x4x = devm_kzalloc(&i3cdev->dev, sizeof(*p3h2x4x), GFP_KERNEL);
>>> +	if (!p3h2x4x)
>>> +		return -ENOMEM;
>>> +
>>> +	i3cdev_set_drvdata(i3cdev, p3h2x4x);
>>> +
>>> +	p3h2x4x->regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
>>> +	if (IS_ERR(p3h2x4x->regmap)) {
>>> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(p3h2x4x->regmap),
>>
>> Look here...
>>
>>> +				     "Failed to register I3C HUB regmap\n");
>>> +	}
>>> +
>>> +	p3h2x4x->is_p3h2x4x_in_i3c = true;
>>> +	p3h2x4x->i3cdev = i3cdev;
>>> +
>>> +	ret = devm_mfd_add_devices(&i3cdev->dev, PLATFORM_DEVID_NONE,
>>> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
>>> +				   NULL, 0, NULL);
>>> +	if (ret)
>>> +		return dev_err_probe(&i3cdev->dev, ret, "Failed to add sub devices\n");
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
>>> +{
>>> +	struct p3h2x4x_dev *p3h2x4x;
>>> +	int ret;
>>> +
>>> +	p3h2x4x = devm_kzalloc(&client->dev, sizeof(*p3h2x4x), GFP_KERNEL);
>>> +	if (!p3h2x4x)
>>> +		return -ENOMEM;
>>> +
>>> +	i2c_set_clientdata(client, p3h2x4x);
>>> +
>>> +	p3h2x4x->regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
>>> +	if (IS_ERR(p3h2x4x->regmap)) {
>>> +		ret = PTR_ERR(p3h2x4x->regmap);
>>
>> And here!
>>
>> Drop. This is completely redundant. How is it that in one place you use
>> one syntax and in other place completely different syntax?
> 
> I don't think it is redundant, one is for i2c and the other one for i3c
> and the other i2c so I guess the hub can be sitting on any of those bus.
> 
> I guess the driver could be made so that we could only compile the i2c
> part though.

I am speaking about ret assignment. This is where my comment was placed.



Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
