Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F953C55164
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qh+Bs01Zf13bpu11fCbHFHu9iPYVjczVxgLfwyUW4nU=; b=HNTIHPCbHxBQww
	figiFUbkAuIuMtpkAVdGiHOaIOs87tVQQUswaEDzNP+1hXZwPfGHjsduUClRE3jiADavS9FROCIk4
	4Pz66YLiENG1MesTSKZZHNWwNiRBDuh0+sfyecpxvyqfhTMNzT1kHSjwkCSssBrso6UI2urq+YmLh
	OOI1Q467FhuoHw1j+etr/6tGtVzzGPN2IfLk4PM7tx3VQpKPhevLrvwrpH8qPydxGbb3WTDSEulsd
	bjH8K2e4+/PKIsIE5tCLKOGZrL85lwdlqknsex3Trz5oWJSNCZlq1a5i/NUdCqaSOgn5rAI5UI49H
	Zew+D62GYicysl9+Gkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRyF-0000000AmGK-3OCx;
	Thu, 30 Jul 2026 14:42:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRyD-0000000AmFm-3lx8
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 14:42:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 716431A1323;
	Thu, 30 Jul 2026 14:42:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 448EE602B8;
	Thu, 30 Jul 2026 14:42:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63BF011C15D15;
	Thu, 30 Jul 2026 16:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785422567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=B3Xem/yd6HxdRrGpt5FQHo1+1rP6Hx2c/XYOfq5hXmI=;
	b=dzchbbPxKMn58sxhDW2/1rbG7yRh2+LuNtjeSqJYJArQfhmH04HU4fRUGFjq2cFrxlxF/q
	NThYMHk5+E5+QGQv6VZ9o6y/iWCQ8rlWOiFJmgNzL8aNbmLg8YokqKqTOqhv1JcXhXnuoK
	ILxT9+Q3E7jLtlv7Lc7eXYcjf5d/ITQPyx1NFLvYxoSQx4Tan/jSg0sEUYQ8xaMJIdu4FH
	/P5woihU9F55wwh4pyOKiZLQP/qa6AT3s+qERz6Hmt8WOtgUnFHYprAFdANNrAjbuYd5L3
	kPyiA6MoPqISedoQYQljEBmZJvk8P+qMeCHNLrez4coPDcPp6X8yWo6++Ilk/A==
Date: Thu, 30 Jul 2026 16:42:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 00/12] Support ACPI and SETAASA device
 discovery
Message-ID: <178542243604.1793527.10239518847754179179.b4-ty@b4>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_074250_078363_36E2F5DD 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue, 28 Jul 2026 06:59:42 +0000, Akhil R wrote:
> This patch series adds SETAASA device discovery to the I3C subsystem,
> enabling support for SPD5118 temperature sensors found on DDR5 memory
> modules. The changes also add ACPI support for all existing DAA
> methods like SETDASA, SETNEWDA as well as I2C devices on I3C bus.
> 
> SPD5118 and similar devices on DDR5 memory modules differ from typical
> I3C devices in their initialization. They use SETAASA broadcast CCC
> instead of ENTDAA for address assignment, and per JEDEC specification,
> are not required to have a Provisioned ID or implement standard device
> information CCC commands (GETPID, GETDCR, GETBCR).
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
        https://git.kernel.org/i3c/c/29593f94a91c
[02/12] i3c: master: Use unified device property interface
        https://git.kernel.org/i3c/c/f1e00dcda80f
[03/12] i3c: master: Support ACPI enumeration of child devices
        https://git.kernel.org/i3c/c/c5cc24aebe83
[04/12] i3c: master: Add support for devices using SETAASA
        https://git.kernel.org/i3c/c/46276c855815
[05/12] i3c: master: Add support for devices without PID
        https://git.kernel.org/i3c/c/9885e8c54210
[06/12] i3c: master: match I3C device through DT and ACPI
        https://git.kernel.org/i3c/c/95bc66704fd5
[07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
        https://git.kernel.org/i3c/c/d3aa6f594db2
[08/12] i3c: dw-i3c-master: Add ACPI core clock frequency quirk
        https://git.kernel.org/i3c/c/581cca59b5fa
[09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
        https://git.kernel.org/i3c/c/77de3d43f74d
[10/12] hwmon: spd5118: Remove 16-bit addressing
        https://git.kernel.org/i3c/c/89eee0b30226
[11/12] hwmon: spd5118: Add I3C support
        https://git.kernel.org/i3c/c/f76be53203bb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
