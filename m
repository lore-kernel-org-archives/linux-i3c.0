Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33823E93800
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRUNU3mLaBeBSOTsT1kaSeNCqv8EBXc/7wn30tFPT+g=; b=5C5HCSch9/TBzz
	NQOksLfrGBCbO4BJUDskRaajBWQOn72TQ2HrbkxXB3EF1Kk2HXrKPBErKh//dvEmZcBtHGOV1YwAg
	FQBIh1qGOz6w595iGF0piqKgC2M9xCZiimEWa/GoWDXDTtO42yAzGG/nR4ntfx9PQ2IOcqA07GbNM
	WxKl/qysaeUZzrfWGSi119fF0/aRW3Yxjgatcs7jAcVIuVLKwQ5fV6vOwY0oG6ONpqm1Uuen87Kpd
	DrbGBsfDU34TGHCdJqnGD4X4QLdNz5wfOroUeAhO2xLOIvc2YXuMKsUcEEyDdjHATsfBSMTrjb/dn
	ils4XZbv2lBiHwJcfxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC1G3-0000000EfUg-3TgD;
	Sun, 12 Apr 2026 20:18:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC1Fw-0000000EfTf-1hM2
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 20:18:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BAB164E429E2;
	Sun, 12 Apr 2026 20:18:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CCA95FFB9;
	Sun, 12 Apr 2026 20:18:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69A491045012A;
	Sun, 12 Apr 2026 22:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776025085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AQaMeJLQws+JogYQcF2TyPERMpXvW6pBtPclJ0LsSvg=;
	b=nWTfwe/lLJQQ6aRVz/kxIj6bZJJgaW2Tuk9pYyyhrgEiL4OZeS/nNw22FgTszcsTwLkWZR
	ruvn3IgA/0OD6kkUq4o0Z/yvNVGSgbysCeiR9B4WRBB/b0CFRqbwPnZNcBhuwF8WInCTTj
	eGFNsloh8SG6OHPgXLS/igSoNhfIaJN92GOVuBySinHMuB/I75fFysrYzlf+lZSSzeLtdj
	QKRcP8RZJ8wlh/hO4u74n8ALgCAe2tBEdhw3CzqdnXO/KJR9zI5TrBgPIVNP0hmAueCtgs
	IFaX+UHS001PdC+pnzTsdYJMFeIIl94WoRJu7bcBJnVE3UGJZcyT1ROI/IoebA==
Date: Sun, 12 Apr 2026 22:18:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@nxp.com, acpica-devel@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	miquel.raynal@bootlin.com, p.zabel@pengutronix.de,
	rafael@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2 04/13] i3c: master: Support ACPI enumeration of child
 devices
Message-ID: <202604122018012539fc7c@mail.local>
References: <adhdsn6u4RAIL9wC@lizhi-Precision-Tower-5810>
 <20260410053147.27344-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410053147.27344-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_131808_587386_965C157A 
X-CRM114-Status: GOOD (  24.97  )
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

On 10/04/2026 11:01:47+0530, Akhil R wrote:
> On Thu, 9 Apr 2026 22:17:22 -0400, Frank Li wrote:
> > On Thu, Apr 09, 2026 at 04:27:34PM +0530, Akhil R wrote:
> >> Although the existing subsystem allows host controllers to register
> >> through the ACPI table, it was not possible to describe I3C or I2C
> >> devices when using ACPI. This is because the driver relied on reg
> >> property to retrieve the PID, static address etc whereas ACPI uses
> >> _ADR or serial resources to describe such devices.
> >>
> >> Read _ADR and LVR from the ACPI resources and extract the data as per the
> >> ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
> >> per the MIPI DISCO specifications [1] to get the static address to be
> >> used. Hence enable describing the I3C or I2C devices in the ACPI
> >> table, which is required if the device is using a static address or if it
> >> needs some specific properties to be attached to it.
> > 
> > Please wrap your commit message at 75 char.
> 
> Ack. Will do.
> 
> > 
> >>
> >> [1] https://www.mipi.org/mipi-disco-for-i3c-download
> >>
> >> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> >> ---
> >>  drivers/i3c/master.c | 140 ++++++++++++++++++++++++++++++++++++++++---
> >>  1 file changed, 132 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index 5e0e926f61f3..08d0fcabd6f1 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -5,6 +5,7 @@
> >>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
> >>   */
> >>
> >> +#include <linux/acpi.h>
> >>  #include <linux/atomic.h>
> >>  #include <linux/bug.h>
> >>  #include <linux/device.h>
> >> @@ -2403,6 +2404,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
> >>
> >>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
> >>
> >> +#ifdef CONFIG_ACPI
> > ...
> > 
> >> +#ifdef CONFIG_ACPI
> >> +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> >> +				   struct fwnode_handle *fwnode)
> > 
> > 
> > Can you move this and below function to previous #ifdef CONFIG_ACPI block.
> 
> Ack. I will update, but there are some cross-dependencies. We may have to
> add a few function prototypes with the headers if we have to move these
> under the same block. Hope that is fine.
> 

If you have cross-dependencies, then I guess they can sty separate
blocks.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
