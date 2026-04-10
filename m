Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2C4E99068
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9t3vt4XliRyensVfapX8S7MePegY6zKhINJnb9ea5E=; b=J6fOHdlhiUfTkJ
	yjpUU/iRXk3fwh0zapsCXJBhH7KOOApbEhtma5VLEW8pPGYnsmV9099CMohb2y1DrwIBLoeIt/GAP
	ir8CeABFDPS5IQe24g43R/Hhb3h5gV9kOa65YSxTQ8JJmAagYtrSpNpjrCPF7/zh5dBdfwrL+o+3x
	1XqPwRnzfwoZzfl/+HYii3R+pm0MWYOe7Tux4/d2/23NqKt9WCAiTazqwUC2cMbLjMlGSkdSSjPGn
	X6VOxDmrbAFKlyQ6eBsBl+7bYqsU8NAZwlxVI8zg3RNdBLtLWY4/TU596fFVBldTXpBgglKhY2+1Z
	ZcLGUkBTUIuamJGVTpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8c4-0000000BxZZ-42nn;
	Fri, 10 Apr 2026 09:57:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8c3-0000000BxZR-13JQ
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 09:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4416160018;
	Fri, 10 Apr 2026 09:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF269C19421;
	Fri, 10 Apr 2026 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775815038;
	bh=T8Dpiclgk8Jf9La7iQF35pp6q30d9rgfaHQL5Rakqjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RX9WLI4y3+csJJcf9jQG8Ba2LLobhbU+ToOw16B9IyN282S8duPvxsvh7qp4QSehp
	 Vv07bLfvMbqQo5WaS63U9QzvWXFFcVh+ZsJgfJw1XmpQGoZOv+MubIowr1jKxoM2Hw
	 7u6saOL9tK0sREeLg+/TuJCSzSmDtjZ2ux8P4Vl+bbftyIImJbr6DqvMaLMsxlBOmy
	 ppeka/25AnYN35ReaHoURS5hjJd7ce4GeujNV1r6GvUbygGyfEKRQU/9n8VQT+OPQF
	 kklpnjwHTPpSG4R/oL8e/M+TaoquHp5ORlVzFC3LobJIeD8yamNQXf548S8ctokRjG
	 YL5AT2swl/7gQ==
Message-ID: <5c751739-5044-4d23-9648-8d46dd0945d1@kernel.org>
Date: Fri, 10 Apr 2026 11:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, miquel.raynal@bootlin.com, p.zabel@pengutronix.de,
 rafael@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
 wsa+renesas@sang-engineering.com
References: <9e1093e6-18f9-4edc-8659-510245c5d6db@kernel.org>
 <20260410083710.54993-1-akhilrajeev@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260410083710.54993-1-akhilrajeev@nvidia.com>
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

On 10/04/2026 10:37, Akhil R wrote:
> On Fri, 10 Apr 2026 09:18:48 +0200, Krzysztof Kozlowski wrote:
>> On 10/04/2026 08:57, Guenter Roeck wrote:
>>> On 4/9/26 23:39, Krzysztof Kozlowski wrote:
>>>> On 09/04/2026 12:57, Akhil R wrote:
>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
>>>>> SPD5118 hwmon sensor as modules to the defconfig and therefore
>>>>> enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
>>>>> Vera platforms.
>>>>
>>>> git grep for "Vera" gave me zero results. Are you sure this is an
>>>> upstream platform? Please point the DTS using this.
>>>>
>>>
>>> I think this is an ACPI based system, or at least that is what Google search
>>> tells me.
>>
>> Thanks. Following Google Vera is either a "CPU" or entire architecture
>> (at least that's how they call it), so it does not have SPD5118 sensor.
> 
> SOCAMM is a Memory Module. SPD5118, as it's Kconfig mentions, is a sensor
> found within such memory modules. I didn't quite get why would you state
> that the SOCAMM present in Vera architecture (or CPU) does not have
> SPD5118 in it.

I said that CPU or entire architecture does not have it.

Commit is pretty vague in helping me to figure out the things I asked
for in last email.


> 
> Pasting the below from the Vera Rubin product page [1] -
> "NVIDIA Vera CPUs add enhanced serviceability with small-outline
> compression-attached memory modules (SOCAMM) LPDDR5X and in-system tests
> for the CPU cores."
> 
> [1]: https://www.nvidia.com/en-us/data-center/technologies/rubin/

So this is for Vera Rubin? For what is this exactly?

> 
>>
>>
>> "Nvidia vera socamm" gives me something about "rubin". It's not me who
>> should be guessing all this.
>>
>> "nvidia vera socamm SPD5118" gives me even less, so justification is flaky.
>>
>> To remind, this commit msg should convince why generic kernel for
>> developers affecting all possible platforms - not end users, because
>> they always use distro kernels - should enable these configs. And it
>> should bring me clear rule what I can or cannot remove from defconfig,
>> if in 2 years I come and start pruning it from symbols.
> 
> I found little details on what we should be adding in the defconfig. It

Then maybe we should not be adding it to defconfig?

We usually do not make changes which we do not know why we are making
them. IOW, every commit must be useful for the community and this is
achieved by either explicit or implicit answer why doing this.

And I gave in the past clear guidelines - this is config for the
upstream kernel developers to use the upstream hardware and/or for
distros to understand what is needed to support that upstream hardware
(although last part in theory, because many distros do variantion of
allmodconfig, so they don't really care about our defconfig).

> would help if you could share some guidance. Do you mean to say that the
> defconfig should include only the configs which are necessary in
> development platforms and not in end-products?

No, the type of product does not matter because upstream supports every
type of product. Upstream does not say "oh, you run end-product, so we
don't care about you". But defconfig is not used by endusers and has
zero meaning to them.

It seems to missed or ignored one more reason I wrote:

>> And it
>> should bring me clear rule what I can or cannot remove from defconfig,
>> if in 2 years I come and start pruning it from symbols.

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
