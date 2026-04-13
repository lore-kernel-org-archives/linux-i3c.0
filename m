Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BE8EBFD18
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Apr 2026 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YX2Hs1v+WFmJ95FZwFDNmFfPNm1EO/CmIqBJVpDA+GE=; b=cVaeDBTzubgFQX
	MPtGPaWvyAA0jwh3s50HQgvIuZhM4rhZ7ZkXNZES7yyW1T0iVblZqMtF9tA7gtWxPTktLPFlFlCYV
	KmJxg50WhW6OnGDmHxtqn7WTHPhoc81GVEaLwoYcvLJGsbFAxvCLNp+BiXDyD1EJ/EnbkpckAsv+E
	lSFzo4nowO/aqL4kfxwCnKAi/bvYd1wVkJLk5l/0GY3e4CB6J7hfKutiWQfj6sSHkykRK1mN+S4o3
	E0D5RF9Qf8qW/eWAllx2FqKjc/RTbrFVAMs16RnM5QNeZ+fVrif62SVMquVDzqlgd5kh/GfzBDVRy
	CFMGuIDxgAoFgEutl5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCv0-0000000FIGq-1VJA;
	Mon, 13 Apr 2026 08:45:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCuw-0000000FIGQ-2FBG
	for linux-i3c@lists.infradead.org;
	Mon, 13 Apr 2026 08:45:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DADB44E425B6;
	Mon, 13 Apr 2026 08:45:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7AD25FFB9;
	Mon, 13 Apr 2026 08:45:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C75A1045022E;
	Mon, 13 Apr 2026 10:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776069909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OAcntNoyq2S1cVcahMpYXYXm/PDPKoqEbIewOEJeAjU=;
	b=v4e01hq22EDC4/XGzWZC0N932NKIdtmZmagCALKezEcHag8wUtTAHANpsuIN11hBq+shHX
	G5sYe6E0JaLYgooFVPt4Wqgjue55ZOv6lyofk9DSX7fgBAofgaPetE0gCl7cvGg6sX0T4K
	pyzCiinPnNqL8O2DfpF6fgx629SxxgditTjsDVR9mwYD2Ksg0F0OV0f2WCO60Lf3W4ksRk
	HFGI/cGkhSGnTxSP1BHCtY6SjHwxFOcD55x9gPJ9Zeo9bZHTRwpbyl85xh4gJWUKIEKDoq
	g2PR2rFbNcY7o+qoZP/rrr3ChCsTy1q31N1icM9ZZym74WaeI7ODM2cVf8iZzA==
Date: Mon, 13 Apr 2026 10:45:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@nxp.com, acpica-devel@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	miquel.raynal@bootlin.com, p.zabel@pengutronix.de,
	rafael@kernel.org, robert.moore@intel.com, robh@kernel.org,
	sakari.ailus@linux.intel.com, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2 09/13] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
Message-ID: <2026041308450274636352@mail.local>
References: <adhkNYQW73yQ728h@lizhi-Precision-Tower-5810>
 <20260410060712.30377-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410060712.30377-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_014514_708983_BAF3AF0B 
X-CRM114-Status: GOOD (  17.29  )
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

On 10/04/2026 11:37:11+0530, Akhil R wrote:
> On Thu, 9 Apr 2026 22:45:09 -0400, Frank Li wrote:
> > On Thu, Apr 09, 2026 at 04:27:39PM +0530, Akhil R wrote:
> >> Some ACPI-enumerated devices like Tegra410 do not have clock and reset
> >> resources exposed via the clk/reset frameworks. Add a match data for
> > 
> > why not export fix clock at ACPI?
> > 
> >> such devices to skip acquiring clock and reset controls during probe.
> >>
> >> Move match data parsing before clock/reset acquisition so the quirk is
> >> available early enough.  When the quirk is set, fall back to reading
> >> the clock rate from the "clock-frequency" device property instead.
> > 
> > "clock-frequency" is legacy proptery.
> 
> The document ACPI on ARMv8 Servers [1] suggests not to use clock or reset
> framework at all. I also could not find any proper way to export the clock
> to the kernel from the ACPI table. The same document suggests to use only
> _DSD properties, if to pass any data to the kernel.
> 
> I can rename the property to 'default-clock-rate' if that sounds good.
> Please let me know your suggestion.
> 

"clock-frequency" is fine for ACPI

> [1]: https://www.kernel.org/doc/html/v6.1/arm64/arm-acpi.html#programmable-power-control-resources
> 
> Best Regards,
> Akhil

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
