Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F99C71137
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jun 2025 16:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rARCbHTbM+Alz8Z5TkeYUgGNM+sFzFd4rO0JYncY4xY=; b=lXtyTe7nxwkEzwRH6EQbSa5QUk
	8wzm71yHW5T1QZ3iAUIms9x1LGr3GnFn3K4TSlVQylB3vpGJa3bGkXne7lq8648pspcLd71Nlx9qR
	C+4un2FjChQJOHEgnL7V9GFOietQvEt5sSY6IFVHVmWrrwy3VZeeqyPgAnT3ilc9kOJKttYmyLEku
	hyy0iPA/fUJSITjWEEDMLmHxAXB3/+oy7pCF5nH8m0rkJJ66/Kb9i1P3A+AtZuUvl0+cKe6QN1vND
	O9fyMmVDq+O/b3LjDlPIZUSHN4oNaVDmYhUgZTI+1rS8zT37gU7i/+nysDyLbshl6BxKsFWlShun8
	dTuqp2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOKx-0000000AcBN-04cm;
	Wed, 11 Jun 2025 16:30:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLF6-00000009vWp-2akn
	for linux-i3c@lists.infradead.org;
	Wed, 11 Jun 2025 13:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5467343E8F;
	Wed, 11 Jun 2025 13:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02C5C4CEEE;
	Wed, 11 Jun 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749647508;
	bh=ZWJSub589iDrGZ+60SCcmXF5iQtLYyYprZ6GcJ4AcI4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VaJrDBYF4KTGovaBs6YwgoZBUq6BRiwemvL7WXoKQJXgVU+rdBs6RfRoCH2EVQ/WE
	 xZpKOz775xPF8adjXJpiOics45NO12ytvIAfPoAy2U12mtYBt0vAcrITiyCjfbBLfY
	 BZEjyN+3u7/vQeZLcTPtavAN00HoP0WE0lVM7zLYOZb+LuDuLpf2EcKCA7HPEBBKrY
	 SLpTyh+Qvq3zBdLc/yDUgPT50OvEMDz5IpCzxHFmn53VAs1li5fP/VSwsX4E4TS9Lw
	 QpZ3pAK/j1g0yMpdijXwiVvqOdUzbWEmM+qWFPLMMwwlhUvkcj+rkdPt3TegcOOPrS
	 GiXazWlEx4+dA==
Date: Wed, 11 Jun 2025 08:11:46 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-hardening@vger.kernel.org, 
 linux-i3c@lists.infradead.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
Message-Id: <174964724485.330045.2181706921272138816.robh@kernel.org>
Subject: Re: [PATCH RFC 0/7] i3c: add driver for the Renesas IP and support
 RZ/G3S+G3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_061148_694701_D3E8A727 
X-CRM114-Status: GOOD (  34.99  )
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


On Wed, 11 Jun 2025 11:39:24 +0200, Wolfram Sang wrote:
> Here is finally the first RFC of a driver for the Renesas I3C IP. It was
> created by merging two versions of it from two different BSPs. Then,
> improved according to code analyzers, cleaned up with regard to coding
> style, and then refactored to hopefully match I3C subsystem standards.
> 
> It is a basic driver for the I3C IP found in various SoCs like RZ/G3S
> and G3E. Missing features to be added incrementally are IBI, HotJoin and
> maybe target support. Other than that, this driver has been tested with
> I3C pure busses (2 targets) and mixed busses (2 I3C + various I2C
> targets). DAA and reading/writing to the temperature sensors worked
> reliably at different speeds. Scoping the bus, the output from the
> protocol analyzer seems reasonable, too. But hey, I am still new to all
> this, so I might have overlooked something.
> 
> The first patches are needed to enable I3C on the RZ/G3S and G3E boards.
> Once this series loses RFC status, they will be sent out individually,
> of course. All is on top of 6.16-rc1. A branch can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
> 
> Why is this still RFC?
> 
> - On G3E (but not G3S), we get a spurious irq during boot. We are
>   working on it. This is just platform dependent, though, kind of
>   independent of the high level design of the driver. For this, we
>   would love to get comments already. So, we can fix things in parallel
> 
> - G3S has 17 irqs, G3E only 16. The way we handle this might need
>   discussion (see patch 3)
> 
> - On G3S, clocks are named 'i3c' while on G3E they are named 'i3c0'
>   I don't have all the needed docs for this, but Tommaso can surely
>   figure this out meanwhile
> 
> - There are some open questions regarding the driver itself
>   (see patch 4)
> 
> Really looking forward to comments! This has been quite a ride. Getting
> a suitable test setup was a surprisingly big task. If someone knows an
> off-the-shelf device supporting HotJoin, I am all ears. I couldn't find
> one.
> 
> So much for now here, some patches have more details.
> 
> All the best,
> 
>    Wolfram
> 
> 
> Quynh Nguyen (1):
>   arm64: dts: renesas: r9a08g045: Add I3C node
> 
> Tommaso Merciai (3):
>   clk: renesas: r9a09g047: Add I3C0 clocks and resets
>   dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller
>   arm64: dts: renesas: r9a09g047: Add I3C node
> 
> Wolfram Sang (3):
>   clk: renesas: r9a08g045: Add I3C clocks, resets and power domain
>   i3c: add driver for Renesas I3C IP
>   WIP: arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
> 
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  |  186 +++
>  MAINTAINERS                                   |    7 +
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   35 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   35 +
>  .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   33 +
>  drivers/clk/renesas/r9a08g045-cpg.c           |    7 +
>  drivers/clk/renesas/r9a09g047-cpg.c           |    8 +
>  drivers/i3c/master/Kconfig                    |   10 +
>  drivers/i3c/master/Makefile                   |    1 +
>  drivers/i3c/master/renesas-i3c.c              | 1441 +++++++++++++++++
>  10 files changed, 1763 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>  create mode 100644 drivers/i3c/master/renesas-i3c.c
> 
> --
> 2.47.2
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
 Base: tags/v6.16-rc1 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250611093934.4208-1-wsa+renesas@sang-engineering.com:

arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i3c@1005b000/temp@4a: failed to match any schema with compatible: ['adi,adt7411']






-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
