Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA466606A31C
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xOyaScZP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gFfuq/2+UrEQldcklbP1FHYn9/SPafMkwZHo98hb/nw=; b=xOyaScZP9pJU5d2Ghi9ukzmaPB
	ptlA7XYfYMbc24g62kXXepT/sBRFBVCMMO/jyg/BXc99xNt493zRgYfZnZ7AbcQWgvUKCcHAHYih7
	Y6Qkl3YTbdgLKonPEpbJsf3aIIsSaLo71pS61m3WjipM6CcV8NuBaLi+k/tFss0DSiVWZMZN/UC/+
	fmA0BqdePNUN3CI7PGdiIpFGhYxPv++zpR6n8dxaCiQAHv5naDp76Udo22kux2eIR6ca3oabUPSHi
	oT4uIK+GSQRLl9qc1KG5V+BIsMb0rh6tj1V7tyY4i7gBMBHhZDm6NWBD2VwPVCvFv+UI4WT1XBcmh
	FIPEeYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUAe-00000009usl-2Mnd;
	Thu, 12 Nov 2026 12:44:52 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUAb-00000009urs-2k4c
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 12:44:51 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A8021A002E;
	Thu, 12 Nov 2026 13:44:45 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5315F1A000D;
	Thu, 12 Nov 2026 13:44:45 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 94ED01800068;
	Thu, 12 Nov 2026 20:44:42 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v21 0/4] Add support for NXP P3H2x4x I3C hub driver
Date: Thu, 12 Nov 2026 18:14:33 +0530
Message-Id: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_044449_992953_B2BA061C 
X-CRM114-Status: GOOD (  11.08  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the MFD parent, regulator and hub drivers for NXP's
four-port and eight-port P3H2x4x I3C hubs. With an I3C host, the hub
driver exposes I3C ports as virtual controllers. SMBus ports appear
as I2C adapters with either an I2C or an I3C host.

The I3C core helpers, DT binding and generic hub support from v20
(patches 1-3 and 6) are in mainline. This revision rebases the four
device-specific patches onto v7.4-rc2.

Sashiko flagged the location of p3h2840.h in both the MFD and regulator
patches (v20 4/8 and 5/8). Both reports appear to be false positives.
The MFD parent and its regulator and hub children share struct p3h2x4x,
so the header stays in include/linux/mfd/.

Changes since v20

Fixes for the three Sashiko findings

- Close the I3C registration race by keeping routing callbacks active
  until all virtual controllers are registered. Under the routing mutex,
  write the route mask and mark the ports permanently connected only if
  the write succeeds.
- Apply the same "i3c" and "smbus" node filter in both DT parsers so
  an unrelated child with a "reg" property cannot claim a target port.
- Service each pending SMBus receive buffer independently. Acknowledge
  overflow by writing only bit 3, so a refilled buffer keeps its new
  receive flag.

Additional fixes

- Reject duplicate target-port numbers in DT.
- Reserve DT-assigned addresses for all I3C ports before the first
  virtual controller runs dynamic address assignment (DAA).
- Clear only the transaction-finish flag when starting an SMBus
  controller transfer, preserving pending target RX and overflow flags.
- Set up the optional IBI before taking the routing mutex so a probe
  error during setup cannot leave the mutex held.

Previous posting (v20)
https://lore.kernel.org/linux-i3c/20260922103551.2754613-1-lakshay.piplani@nxp.com/

Mainline merge
https://git.kernel.org/linus/3ad1536d831a104b4134924d418b072b3f175e81

Aman Kumar Pandey (3):
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (1):
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 MAINTAINERS                                   |   6 +
 drivers/i3c/Kconfig                           |   1 +
 drivers/i3c/Makefile                          |   1 +
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 356 ++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 432 ++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 213 ++++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 648 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 164 +++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 289 ++++++++
 include/linux/i3c/device.h                    |   2 +
 include/linux/mfd/p3h2840.h                   |  41 ++
 17 files changed, 2193 insertions(+)
 create mode 100644 drivers/i3c/hub/Kconfig
 create mode 100644 drivers/i3c/hub/Makefile
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
 create mode 100644 include/linux/mfd/p3h2840.h

-- 
2.25.1

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
