Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E135A106B526
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Mar 2026 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGJFc8A48vDqgFnfNy8IG8tgoVE0ZecQb+SRDOyYz9Y=; b=Bv3uWnz5eQJz5F
	2uRrvkfecGFpBmai28zhwEBiAc9kjCONTzNVMdoqWzlP/p+yEscaxCEkqNdQR6p8fnbtgF2T+osrV
	r5ilzStd0rO/+31cKFhGIYqRuNgEEVZJ0bPUMy5xFr8DGIJAD7K2DxmTNE1fL29MEyRXhtzEVnZPT
	gb4qa8wtB+PLNEfiyaU+A/YITUkx4DnCfrYnCQozi7OiUy5AWm0nBUqW2kgcpnZ5ksfROFGbVGUvB
	fQN2Kbvl66di6tNv+f9BCJfvrvN8qR4FZOuyx3Yv1hO1QHTQ3KWZdNvXDq9fMOQV2Hvszk3UvFOyM
	G6pHrRHt8+zZSkOlPIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NeN-00000003P4F-2hc4;
	Wed, 25 Mar 2026 12:47:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NeK-00000003P3n-1STI
	for linux-i3c@lists.infradead.org;
	Wed, 25 Mar 2026 12:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9641540A1C;
	Wed, 25 Mar 2026 12:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD65C4CEF7;
	Wed, 25 Mar 2026 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774442871;
	bh=so3rNc4wv7O6c51WnGSvliK/wRCmWQV0QznJ8XONKc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TLahp34x1OALiHg5FE0bIWK8W5uE2yvYD14zbzcPFem2/1upTg+li4uc/YbwuDmmI
	 e01m6PlE813PIOdmEobcPwIKKzih/zS11il/I5Gk9/KvxGq4gPFE0CqfXl1i9qRvkr
	 +Ap1i8LV26FyFxT1gZZMpi10r192n6M2rMJiy+KLYKzcGRg/mFTxjBA315Ccs93mGB
	 PlwL2F9nREEIlfJu+Ie3R8/CfZDr3dwq4zVWH1ZktUJFJLUhu6tie2JAWNXR+xj4he
	 KeN0hBj721anizhtLIsk4zn73+a0ByzdtBN3Sd7j7REkmtm6uxf45at3qfxWaK/vHH
	 rNI7gDH4nAZxw==
Message-ID: <61ec49e8-9b60-467e-8ca9-c1246ae5caa2@kernel.org>
Date: Wed, 25 Mar 2026 13:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank.Li@nxp.com,
 acpica-devel@lists.linux.dev, alexandre.belloni@bootlin.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, ebiggers@kernel.org,
 fredrik.markstrom@est.tech, jonathanh@nvidia.com, krzk+dt@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com,
 p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com,
 robh@kernel.org, smangipudi@nvidia.com
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org> <acO4NKPDUayny-I4@orome>
 <6342b6fd-9802-49d9-a269-ecb3b70b4604@kernel.org> <acPWvjCJ426AyIQh@orome>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <acPWvjCJ426AyIQh@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_054752_436218_F8955E8E 
X-CRM114-Status: GOOD (  21.05  )
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

On 25/03/2026 13:41, Thierry Reding wrote:
> On Wed, Mar 25, 2026 at 11:59:36AM +0100, Krzysztof Kozlowski wrote:
>> On 25/03/2026 11:31, Thierry Reding wrote:
>>> On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
>>>> On 19/03/2026 18:09, Akhil R wrote:
>>>>> On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
>>>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
>>>>>>> SPD5118 hwmon sensor as modules to the defconfig.
>>>>>>
>>>>>> Why? If there is no user of that, why would we want it? Your commit msg
>>>>>> should explain that.
>>>>>
>>>>> Ack. This is for Tegra410 which has a DesignWare I3C host controller.
>>>>> I will add this in the commit message.
>>>>
>>>> Board or products. Not SoCs.
>>>
>>> Is this a new requirement? I see a bit of both in defconfig changes.
>>
>> Almost every review from me has it for 2-3 years... And it is a known
>> thing since always in a bit different wording: we do not care about
>> downstream things and downstream products. defconfig does not serve
>> downstream at all, makes no sense outside of our (upstream) work.
> 
> I don't understand why you're turning this into a downstream vs.
> upstream discussion. This is all code that is being submitted upstream,
> because we want these new platforms with I3C support enabled upstream.
> It's as simple as that.
> 
>>> Some mention specific products, other mention SoCs. Does this
>>> requirement apply to DT platforms or also ACPI platforms?
>>
>> Just like kernel, applies to all platforms, regardless of firmware
>> interface.
> 
> Hm... again, I don't think there's every been a rule to the effect of
> needing to specify a particular platform or product when adding a new
> defconfig change. There's plenty of things that we're enabling in the
> defconfigs because we think they are generally useful.

And the commit msg MUST always explain WHY we are doing it, in this case
- why do you think it is generally useful.

If you add new driver, it is usually obvious why it is generally useful.

If you add defconfig change for dead stuff, it is not obvious. That's
why commit msg must provide arguments WHY do we want it, WHY do you
think it is useful for us.

If you add defconfig change for device which no one (in terms of
upstream) can use, then automatically it is not useful. Whether this
change is like that - I do not know. That's why you have commit msg to
provide argument WHY maintainer should take it. And it is as simple as
one sentence explaining the upstream kernel user/use case of this
defconfig change...

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
