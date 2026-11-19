Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFCE606A320
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KyYoeHds
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fwzQthdVVCEaw56d8NlLbLXoRpfNHHabKB2x3QApj+U=; b=KyYoeHdsxz0roL70nczM4d4GJG
	zMedlwX6SDUFa3qdWBjTsThvcDrygn5EHxKluHk9gyjNnBKxC+8hmo+le8TBLfNbDKNuvyD900ZXo
	TAr8lj6yGp6IHeMArunVEj/KXqDXYmtJ6KeMLKwi0TuNOe70wxYLm+Gz2Nfpt+c/sNs+7DtXIt+eK
	z01ASWTTHr9F9cb3FOTM8BVGbl7RHPREwmkSv3Gs5WKj8UTJ6R1UUm/pPlYLp+Au94chpTb4usENe
	rrIqOH77clKVeCr3Uw+l0C05iOiZByxND4yKfKEgUW6vxHyGsy2tD2ae+95FYw5nreITdTfrM4lAW
	lrxmgHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyrB-0000000BSOX-3aPT;
	Thu, 19 Nov 2026 09:55:05 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyr9-0000000BSNb-1nPB
	for linux-i3c@lists.infradead.org;
	Thu, 19 Nov 2026 09:55:05 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6418620000B;
	Thu, 19 Nov 2026 10:54:59 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2F77E200003;
	Thu, 19 Nov 2026 10:54:59 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 79914180006C;
	Thu, 19 Nov 2026 17:54:56 +0800 (+08)
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
Subject: [PATCH v22 0/5] Add support for NXP P3H2x4x I3C hub driver
Date: Thu, 19 Nov 2026 15:24:44 +0530
Message-Id: <20261119095449.555593-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_015503_745029_9D2E9F4F 
X-CRM114-Status: GOOD (  13.48  )
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
(patches 1-3 and 6) are already in mainline. This revision adds a
generic I3C address-slot fix and addresses the Sashiko findings and
review feedback reported against v21. The series is rebased onto
v7.4-rc3.

The earlier v20 Sashiko reports concerning the location of p3h2840.h
in the MFD and regulator patches appear to be false positives.

Changes in v22:

Sashiko fixes and review feedback

- Factor the common I2C and I3C MFD probe initialization into a shared
  helper, leaving transport-specific validation and regmap setup in
  the respective probe functions.
- Replace the generic I2C device ID "nxp-i3c-hub" with "p3h2x4x".
- Use platform_device_set_of_node_from_dev() in the regulator driver
  to avoid leaking the inherited Device Tree node reference.
- Initialize TP_NET_CON_CONF to a known disconnected state during
  probe, preventing stale routing state from connecting unintended
  target ports.
- Mark downstream DT-assigned addresses as I3C_ADDR_SLOT_EXT_DESIRED
  instead of I3C_ADDR_SLOT_I3C_DEV on the parent bus. This prevents
  DAA reconciliation from treating downstream devices as orphaned
  parent-bus devices and probing them again.
- Connect each I3C target port before registering its virtual
  controller, rather than connecting all ports after registration.
  Keep the ports connected to prevent downstream device probes
  and IBI operations from accessing disconnected targets.
- Advertise supported SMBus emulation operations and reject
  I2C_M_RECV_LEN, avoiding unsupported variable-length block reads.
- Add combined write-then-read adapter quirks and reject transfers
  exceeding the shared controller-agent payload capacity.
- Reject empty SMBus receive buffers before reading their address
  or delivering slave callbacks.
- Clear pending SMBus receive and overflow flags before enabling
  the slave IBI, without clearing the controller transaction-finish
  flag.
- Reject unsupported 10-bit I2C slave address registration.

Additional changes

- Add managed cleanup to disconnect I3C target ports after virtual
  controller teardown.
- Keep port routing updates serialized under the hub routing mutex,
  marking ports permanently connected only after successful writes.
- Document SETDASA/ENTDAA handling and the shared parent dynamic
  address space.

Changes in v21:

Sashiko fixes

- Keep I3C routing callbacks active during virtual controller
  registration. Serialize routing updates under the hub mutex and
  mark ports permanently connected only after successful routing.
- Filter both DT parsing passes to "i3c" and "smbus" target-port
  nodes, preventing unrelated child nodes from claiming ports.
- Process pending SMBus receive buffers independently and clear
  only the overflow flag after servicing them, preserving new
  buffer-refill events.

Additional fixes

- Reject duplicate target-port indices in Device Tree.
- Reserve DT-assigned addresses for all I3C target ports before
  the first virtual controller starts DAA.
- Clear only the SMBus controller transaction-finish flag before
  starting a transfer, preserving pending RX and overflow flags.
- Initialize optional IBI support without holding the routing
  mutex, avoiding an error path that could leave it locked.

Previous posting (v21)
https://lore.kernel.org/linux-i3c/20261112124437.3367252-1-lakshay.piplani@nxp.com/

Previously merged upstream patches from v20

[1/8] I3C core hub support
https://git.kernel.org/i3c/c/9d60a0eafae1

[2/8] I3C controller-only operations
https://git.kernel.org/i3c/c/8d0008260c32

[3/8] NXP P3H2x4x Device Tree binding
https://git.kernel.org/i3c/c/58c018414635

[6/8] Generic I3C hub support
https://git.kernel.org/i3c/c/b0cfe49a2e3b

Aman Kumar Pandey (3):
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (2):
  i3c: hub: Mark downstream DT addresses as desired on parent bus
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 MAINTAINERS                                   |   6 +
 drivers/i3c/Kconfig                           |   1 +
 drivers/i3c/Makefile                          |   1 +
 drivers/i3c/hub.c                             |  18 +-
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 358 +++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 437 +++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 247 +++++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 685 ++++++++++++++++++
 drivers/i3c/master.c                          |  20 +
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 156 ++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 289 ++++++++
 include/linux/i3c/device.h                    |   2 +
 include/linux/i3c/master.h                    |   2 +
 include/linux/mfd/p3h2840.h                   |  41 ++
 20 files changed, 2296 insertions(+), 7 deletions(-)
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
