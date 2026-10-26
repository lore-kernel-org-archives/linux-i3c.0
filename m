Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E1606A336
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Oct 2026 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rf7AUPDr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3qz8qhW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tcRiyu0FW8WFPxXGxAORad1DtXwubnnGD5pR8JKLYxM=; b=Rf7AUPDro/vldoRoCR+YKwuzmH
	rVxEE+dhHH4VQlq+xxl53wrbBvs5cO64SurRrDt79YSOpp3FTxPWFKenN0ug1hj+hMZDlNTkWhsXf
	25Hw00AzkTKAK5hA+4DU27lbWjG0aBDKGfllFw5YfkC4PAPPQwXQXII0YfrbJFShDoy51dzOaN0Mw
	PPvTsVAAfUdh4LbdAyzqe672r6Qlnrz3CZkIyB5MbQTdEciAl1UUSV8fNxgolBGjRdtzgabufy05/
	KI3qyPjULZ/GksV8b9bTMbYdzOIZORplBpMP+ESYUSd1/b1lrbDk2wSKtApK86qccpr2IPF+wRb5F
	dKm3UUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMFp-00000002kEg-3IGD;
	Mon, 26 Oct 2026 15:04:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMFp-00000002kEY-0kHY
	for linux-i3c@lists.infradead.org;
	Mon, 26 Oct 2026 15:04:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99C1141453;
	Mon, 26 Oct 2026 15:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781DA1F031E2;
	Mon, 26 Oct 2026 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793027092;
	bh=9XE2j6DUb6n5+qYI4Bd75SEMcPwHROZ60jDXuopARVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l3qz8qhWyTMcNtsxWqOvXSdiIexDlTpz+mnt0gK0cuC05exPRrvBp/Y4p33zXmj+0
	 JqM4JGmm9QT/UdL35MMf0Tsn2bJN4sfvniApV8hcOi506oA1nG6kjv2tCiPpsCV/JB
	 y13Qalef/ToGeb6FFcQzJ2Rz6xTF++/GWeNkOr4rSirhkNtnc+OhD88PCDdBBsJbNF
	 bX/MLFXdwn6vaix51RJiX96VG21VfyLWrA05Gfk9BE4eBmqheAGzcC0vQdBqsory19
	 ktKpAMZERper+2TzZ2JCdVUHTfZzK0Wee269MPWSSpIgVkuRAuOWPNNEdSiZHyB3zH
	 D+Rw2Wizteeqw==
Date: Mon, 26 Oct 2026 15:04:46 +0000
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20261026150446.GB2195460@google.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-5-lakshay.piplani@nxp.com>
 <AS4PR04MB9362E4F3E5E69CE45BE436E9FB642@AS4PR04MB9362.eurprd04.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS4PR04MB9362E4F3E5E69CE45BE436E9FB642@AS4PR04MB9362.eurprd04.prod.outlook.com>
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026, Lakshay Piplani wrote:

> 
> NXP Confidential

Really?

> > -----Original Message-----
> > From: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Sent: Tuesday, September 22, 2026 4:06 PM
> > To: linux-kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> > alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> > conor+dt@kernel.org; devicetree@vger.kernel.org; broonie@kernel.org;
> > mfd@lists.linux.dev; lee@kernel.org; Frank Li <frank.li@nxp.com>;
> > lgirdwood@gmail.com
> > Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> > <priyanka.jain@nxp.com>; Aman Kumar Pandey
> > <aman.kumarpandey@nxp.com>; Lakshay Piplani
> > <lakshay.piplani@nxp.com>
> > Subject: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
> > and on-die regulator

Why is your mailer adding headers?  Please configure it properly.

> > From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> >
> > Add core MFD support for the NXP P3H2x4x
> > (P3H2440/P3H2441/P3H2840/P3H2841) family of multiport I3C hub devices.
> > These devices connect to a host via I3C/I2C/SMBus and expose multiple
> > downstream target ports.
> >
> > All variants share the same register interface. Read the implemented target-
> > port count from DEV_CAPAB, so no per-compatible driver data is required.
> >
> > Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > ---
> > Changes in v20:
> >  - No change
> >
> > Changes in v19:
> >  - Retain only nxp,p3h2840 in the OF match table because the other
> >    variants use it as their fallback compatible
> >
> > Changes in v18:
> >  - Rebased onto v7.3-rc1; no intended driver behaviour changes
> >
> > Changes in v17:
> >  - No change
> >
> > Changes in v16:
> >  - Use a named initializer for struct i2c_device_id
> >   ({ .name = "nxp-i3c-hub" })
> >  - Keep the shared header in include/linux/mfd/ (struct p3h2x4x is shared by
> >    the mfd parent and its regulator/i3c-hub children). The i3c_hub_priv
> >    back-pointer is retained for IBI routing, with documented publish/clear
> >    ordering
> >
> > Changes in v15:
> >  - Read the device capability register to determine whether the device has
> >    four or eight target ports
> >  - Store the detected target-port count in the shared MFD data
> >  - Add OF match entries for all P3H2440, P3H2441, P3H2840 and P3H2841
> >    variants
> >  - Add a shared hub-context pointer for use by the IBI handler without
> >    overwriting the MFD parent's driver data
> >
> > Changes in v14:
> >  - Clean up MFD driver comments, formatting, variable names and author
> >    information
> >  - Define and document the I3C hub DCR value in hexadecimal form
> >  - Use direct regmap bit-width values instead of local macros
> >  - Add a shared protected_reg_lock for protected register accesses across
> >    P3H2X4X child drivers
> >
> > Changes in v13:
> >  - Use i3c_device helpers (i3cdev_to_dev()) instead of direct struct access
> >    to maintain API abstraction
> >  - Avoid including internal I3C headers and use public device headers instead
> >  - Ensure proper device matching by relying on manufacturer ID checks in
> > probe
> >
> > Changes in v12:
> >  - No change, added Reviewed-By tag
> >
> > Changes in v11:
> >  - Use MFD_CELL_NAME() for child device registration
> >  - Rename local variables for consistency
> >  - Rename driver names to follow subsystem conventions:
> >    - Use '-' instead of '_' in driver names
> >    - Drop the "_drv" suffix from driver names
> >
> > Changes in v10:
> >  - Drop redundant is_p3h2x4x_in_i3c flag
> >
> > Changes in v9:
> >  - Renamed macros to follow consistent uppercase naming conventions
> >  - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
> >    to avoid I3C/I2C dependency issues
> >
> > Changes in v8:
> >  - No change
> >
> > Changes in v7:
> >  - Use new config I3C_OR_I2C
> >
> > Changes in v6:
> >  - No change
> >
> > Changes in v5:
> >  - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
> >  - Updated dev_err_probe() for regmap_init failure.
> >  - Updated module description
> >
> > Changes in v4:
> >  - Split the driver into three separate patches(mfd, regulator and I3C hub)
> >  - Added support for NXP P3H2x4x MFD functionality
> > ---
> > ---
> >  MAINTAINERS                 |   2 +
> >  drivers/mfd/Kconfig         |  13 +++
> >  drivers/mfd/Makefile        |   1 +
> >  drivers/mfd/p3h2840.c       | 164 ++++++++++++++++++++++++++++++++++++
> >  include/linux/i3c/device.h  |   2 +
> >  include/linux/mfd/p3h2840.h |  41 +++++++++
> >  6 files changed, 223 insertions(+)
> >  create mode 100644 drivers/mfd/p3h2840.c  create mode 100644
> > include/linux/mfd/p3h2840.h
> >
> 
> Hi Lee,
> 
> Alexandre has already applied patches 1/8, 2/8, 3/8 and 6/8 from the v20 series.
> 
> Patches 4/8, 5/8, 7/8 and 8/8 remain outstanding, with patch 4/8 providing the MFD core required by the remaining patches.
> 
> Do you plan to pick patch 4/8 through the MFD tree, or would you prefer it to go through the I3C tree with your Reviewed-by?

I'd be happy to apply the MFD patch and the dependents.

However, right now it looks like you have a bunch of Sahiko issues
pending.  Is that the case?

-- 
Lee Jones

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
