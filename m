Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D1CAC59A
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W76jujQrWV7UCx10skmOXftsWmZtKgVvjAoSdx+es3k=; b=UJr09MMPmoWEcyFAsMLl3T2Byh
	CbD4ujpLcnT9FnE78WxBUjx7OGzBr1uqDg0dFCEKFD12HSS7pelH+Yv4kmBx0hcwNueBXSl3hVtXy
	VI4v4jDEqMggGoM3Voz0QiHcVYIpLppvKBXxHOnX43LmmdKt/Nc3fAd+gfcz2xJBdiZ7D+m9peoNi
	ojwZAyBQmTeH1QyT1GQiJnkfC8XH/fewwMp0FxJsjOVAapNZKoWjsIW6t59X8Er15MCQxsRRmk8lE
	JJjFHNYjJOkvgICS5LW0uEITeKyy29cqm/qpEe8YGj1TbfOlpoDTYQCqtQroy0KpbNm+Id8i1TZs5
	ddzeCfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFxj-00000000CxP-2kWk;
	Thu, 18 Sep 2025 14:50:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFxj-00000000Cwr-01AG
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 14:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13B45601BC;
	Thu, 18 Sep 2025 14:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE42C4CEEB;
	Thu, 18 Sep 2025 14:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758207017;
	bh=dFFUTKsb5HmnpUVQ50VCJETlKPYAb86qPFm7HVjesZM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=knajWF5j1gTQ1MVKy8Gzhy257IxELviuKIwoockJVZbRYuzCOEdkHbpwCfEVytJvV
	 2InH+G5SioxlDQfSa7qqJadKvOtOApdmWqwff/Wj0TYA2OCUtDLZe9zOSlTbTHl+ou
	 YOKZi6cyOhZFOJsC7kanejGBQ5xJNg4Z5ZQ+bLtBKwRJ2ykWUUyHaU5r3njiFNhpLE
	 6Yx0/sCxMTo0bO7iqkzG8Z5P04ppv2lq/JSKQFn+QjSepki2frcL7lqJnszqLkEA4Z
	 T9I3NPNlXKpQfna1pxUw6uazMYgamdsuka2h3J7IbO4wfI29M2+hHNt32NJ4+DRYPc
	 /gWXGw4RLakPw==
Date: Thu, 18 Sep 2025 09:50:16 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
 krzk+dt@kernel.org, alexandre.belloni@bootlin.com, 
 devicetree@vger.kernel.org, balamanikandan.gunasundar@microchip.com, 
 conor+dt@kernel.org, Frank.Li@nxp.com, nicolas.ferre@microchip.com
To: Durai Manickam KR <durai.manickamkr@microchip.com>
In-Reply-To: <20250918095429.232710-1-durai.manickamkr@microchip.com>
References: <20250918095429.232710-1-durai.manickamkr@microchip.com>
Message-Id: <175820686358.1653800.8373809331040324947.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add microchip sama7d65 SoC I3C support
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


On Thu, 18 Sep 2025 15:24:25 +0530, Durai Manickam KR wrote:
> Add support for microchip sama7d65 SoC I3C master only IP which is based on
> mipi-i3c-hci from synopsys implementing version 1.0 specification. The platform
> specific changes are integrated in the existing mipi-i3c-hci driver by introducing
> a quirk and SoC specific config option.
> 
> I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
> mixed bus mode (I2C and I3C target devices on same i3c bus).
> 
> Testing done:
> With this patch we are able to fully configure the lsm6dso I3C slave
> device. Unlike I2C, I hope there is no linux utility to check the
> various transactions supported in the host controller. These features
> will be tested later probably with I3C analyser KIT.
> 
> Durai Manickam KR (4):
>   clk: at91: sama7d65: add peripheral clock for I3C
>   i3c: mipi-i3c-hci: add microchip sama7d65 SoC
>   ARM: configs: at91: sama7: add sama7d65 i3c-hci
>   ARM: dts: microchip: add I3C controller
> 
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     | 12 ++++++
>  arch/arm/configs/sama7_defconfig              |  2 +
>  drivers/clk/at91/sama7d65.c                   |  5 ++-
>  drivers/i3c/master/mipi-i3c-hci/Makefile      |  3 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c        | 28 ++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h         | 12 ++++++
>  .../i3c/master/mipi-i3c-hci/hci_quirks_mchp.c | 43 +++++++++++++++++++
>  7 files changed, 102 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.17-rc1-3-g0b9dcd02ea93 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250918095429.232710-1-durai.manickamkr@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/i3c@e9000000: failed to match any schema with compatible: ['mchp,sama7d65-i3c-hci']






-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
