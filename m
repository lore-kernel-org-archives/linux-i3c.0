Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A94606A31D
	for <linux-i3c@archiver.kernel.org>; Wed, 28 Oct 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5GBxR3Pn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Y32I/9WL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AnsO1nZA9cXxxhtuwMrzCxJ/KY/3XurW1mVLQ1Yw7ro=; b=5GBxR3PnO7qGUxDht5rLhd5tnD
	1NGrOl2slnI3BzE/bHC8nfyblnG4C3jqR0yqqZMMaPWSarwSQlqJjkyySA9rLhPztCoKBdgcSArYQ
	LzHzeyC7DEfsSj1Urqtqye/33ifFCX5IZ1FgDnp6Hgl+yTyJStjxUnvuo/9PPtj374RQvLvi2hp6Y
	mQ77J1sdSZBxDyVMh2NuJaPFfnEW0AnqLP3LPGS1/aoHD79NV8Sus/9CVDPSP2uUj0ZjUB7vcshoy
	x7+Avwv7Cx2GYN3ydORXWN1oB2aKsiThKxno8Fv38lQ7UyatwLkK3sM8XHbRoA+w+paJtxBYuZ07T
	/r41Fiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0ee-00000006jTp-0GtF;
	Wed, 28 Oct 2026 10:13:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0eZ-00000006jTT-2Tr3
	for linux-i3c@lists.infradead.org;
	Wed, 28 Oct 2026 10:13:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 93FDF1A1377
	for <linux-i3c@lists.infradead.org>; Wed, 28 Oct 2026 10:13:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6021D60769;
	Wed, 28 Oct 2026 10:13:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E68910329092;
	Wed, 28 Oct 2026 11:13:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793182381; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=ubjEcerpRYPkrBmSQwo5V4W5j9UQ8STAOxq9l3KgdhY=;
	b=Y32I/9WLzaPlwIj+mxfZ/HpWH7Un45e7Ahgutq1FG6U2toCHBXBGO14FoK3dsBY/0j9WWk
	y187cJNvUOe3o2z29mEPbpsXFSQ3lUa21MggROM8RxLR16bxf3Y/8uQvMOlpKlYHe961Ws
	QITSz4QfWsLmHSD6zQkv6gzbmIVY0u4Mdzv2m7kBiJ+tajt5y14PMkfWKcC+1qpSoHWC6A
	v0jF9LVBHrkBSBKmcc7tWkAxWfZf9MG/NCfeG1LXx8GnP35sAXOzyWJNZx8mMGTWFrUgwI
	VKdIUmsZdENydcaY1mse15Sbx56oNy+21pfBMn/NiigbTScV8/c1ZOfjht746w==
Date: Wed, 28 Oct 2026 11:12:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 7.4
Message-ID: <20261028101259ce32989d@mail.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_031307_934423_DC542319 
X-CRM114-Status: GOOD (  14.34  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Linus,

Here is the i3c subsystem pull request for 7.4. It introduces the I3C
hub support in the core with drivers still being worked on. Then we have
the usual fixes and cleanups.


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-7.4

for you to fetch changes up to fc5eb1b0631aa3b34c530ae962d01699ed22a0ae:

  dt-bindings: i3c: Add Synaptics sl2610 i3c (2026-10-08 14:21:37 +0200)

----------------------------------------------------------------
I3C for 7.4

Subsystem:
 - Add APIs for I3C hub support
 - Restrict HDR modes to those supported by the bus and target
 - Fix ACPI target enumeration on multi-instance controllers by extracting the
   bus-controller instance number and PID from the correct _ADR fields.
 - allocate IBI workqueue with WQ_HIGHPRI

Drivers:
 - dw: Synaptics sl2610 support
 - mipi-i3c-hci: HDR-DDR support, cleanup and fixes

----------------------------------------------------------------
Adrian Hunter (17):
      i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
      i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
      i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
      i3c: master: Match ACPI targets to the correct bus controller instance
      i3c: master: Remove stale GETSTATUS length check
      i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
      i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
      i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
      i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
      i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
      i3c: mipi-i3c-hci: Stop rings gracefully when suspending
      i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
      i3c: mipi-i3c-hci: Remove invalid transfer size limit
      i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
      i3c: mipi-i3c-hci: Support configurable device NACK retries
      i3c: Restrict HDR modes to those supported by the bus and target
      i3c: mipi-i3c-hci: Add HDR-DDR support

Aman Kumar Pandey (2):
      i3c: master: Add APIs for I3C hub support
      dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support

Fan Wu (1):
      i3c: master: adi: free the IRQ before unregistering the master

Jisheng Zhang (3):
      dt-bindings: i3c: dw: support up to two reset lines
      i3c: dw: switch to array-based exclusive reset control
      dt-bindings: i3c: Add Synaptics sl2610 i3c

Lakshay Piplani (2):
      i3c: master: Add controller-only device operation helpers
      i3c: hub: Add support for the I3C interface in the I3C hub

Pawel Zalewski (1):
      i3c: master: use named initializers for acpi_device_id

Shubham Patil (1):
      i3c: master: amd: Report direct CCC read length in payload.actual_len

Stanley Chu (1):
      i3c: master: allocate IBI workqueue with WQ_HIGHPRI

 .../devicetree/bindings/i3c/nxp,p3h2840.yaml       | 330 ++++++++
 .../bindings/i3c/snps,dw-i3c-master.yaml           |  16 +-
 MAINTAINERS                                        |   9 +
 drivers/i3c/Kconfig                                |  14 +
 drivers/i3c/Makefile                               |   1 +
 drivers/i3c/device.c                               |  15 +-
 drivers/i3c/hub.c                                  | 832 +++++++++++++++++++++
 drivers/i3c/internals.h                            |  16 +
 drivers/i3c/master.c                               | 476 ++++++++++--
 drivers/i3c/master/adi-i3c-master.c                |   4 +
 drivers/i3c/master/amd-i3c-master.c                |   4 +-
 drivers/i3c/master/dw-i3c-master.c                 |  28 +-
 drivers/i3c/master/dw-i3c-master.h                 |   2 +-
 drivers/i3c/master/mipi-i3c-hci/cmd.h              |   4 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c           |  28 +-
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c           |   4 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             | 112 ++-
 drivers/i3c/master/mipi-i3c-hci/dat.h              |   2 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c           |  13 +-
 drivers/i3c/master/mipi-i3c-hci/dma.c              | 136 +++-
 drivers/i3c/master/mipi-i3c-hci/hci.h              |   9 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |   5 +-
 include/linux/i3c/device.h                         |   4 +
 include/linux/i3c/hub.h                            |  92 +++
 include/linux/i3c/master.h                         |  20 +
 include/linux/platform_data/mipi-i3c-hci.h         |   4 +
 26 files changed, 2024 insertions(+), 156 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 include/linux/i3c/hub.h

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
