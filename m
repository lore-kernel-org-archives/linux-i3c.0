Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD95CD98E2
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jun 2026 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=He2lVK+ps148LXJn6TWOigYsU81c7Qj0XQnNtESv1OA=; b=JkXIlKtN5fK5vx
	LNE9edTymXvP2vLMK3IihhBZQoScO8vO6svMtvkA1niw2eerACQeDsSby3vXRi+hgO/UGRG/cwwPx
	pQDnT8+BEiGWsCySAC1bL7BT/D52sfaZhVr7ZB7UJy5x5+vC8qs/G5SviLWHPFcbL8o3puhvg3TFb
	TWHLq2Rf3adAYeH9FlZa5dLNrx/dYfKrvWA/wg5YXujHuXSnKbct0nepbJZKJ2YS+KS9ulgw3MuuJ
	7d1HihULNCJvBX7ltq61LzYavQQnQ/mGZxTG2eRgjujrUvq/ovEmdXe+5cRFi9xNR/O5x+yeSUQcK
	AvzFpKP5fveYB6GASkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZo4B-0000000HCYV-0Hjv;
	Wed, 17 Jun 2026 11:04:19 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZo47-0000000HCXC-2tiN
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jun 2026 11:04:17 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9FDE01A0A45;
	Wed, 17 Jun 2026 13:04:11 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6A1921A0A51;
	Wed, 17 Jun 2026 13:04:11 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0E106180007B;
	Wed, 17 Jun 2026 19:04:10 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v12 0/7] Add support for NXP P3H2x4x I3C hub driver
Date: Wed, 17 Jun 2026 16:33:48 +0530
Message-Id: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_040416_009412_93EF42B2 
X-CRM114-Status: GOOD (  16.16  )
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

This is an MFD driver integrating I3C hub and on-die regulators.

The series introduces:
- Core I3C master enhancements required for hub support
- Generic I3C hub framework
- MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub

Patches 1/9 and 2/9 from v11 have already been applied to i3c/next branch:

 - 79c41666b397 ("i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked")
   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=79c41666b397
 - 8d8afa428318 ("i3c: master: Expose the APIs to support I3C hub")
   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git/commit/?id=8d8afa428318

This v12 series is rebased on top of those commits and therefore contains
only the remaining patches, renumbered as 1/7 through 7/7.

Changes in v12:
- Rebased on i3c/next
- Dropped patches 1/9 and 2/9 from v11 as they are already applied
- Add address check in i3c_master_direct_detach_i3c_dev_locked() to skip
  detach for unaddressed devices
- Drop redundant depends on I3C from config I3C_HUB
- Return -EOPNOTSUPP for unsupported I2C transfers in the generic hub ops
- Correct default pull-up and drive-strength values
- Add devm cleanup for the IBI request/enable path
- Remove dead code and simplify cleanup by relying on devm-managed resources
- Fix SMBus slave client NULL handling and unregister cleanup
- Link to v11: https://lore.kernel.org/linux-i3c/20260612111816.3688240-1-lakshay.piplani@nxp.com/T/#u

Changes in v11:
- Convert i3c_master_supports_ccc_cmd() to return bool and align
  semantics with CCC support checks used by the I3C core
- Use MFD_CELL_NAME() for child device registration
- Rename driver names to follow subsystem conventions:
     - Use '-' instead of '_' in driver names
     - Drop the "_drv" suffix from driver names
- Fix virtual hub address reattach handling and parent bus locking
- Fix IBI request and cleanup error paths
- Improve SMBus slave mode payload validation and parsing
- Link to v10: https://lore.kernel.org/linux-i3c/20260525064209.2263045-1-lakshay.piplani@nxp.com/T/#u  

Changes in v10:
- Rename i3c_master_reattach_i3c_dev() to *_locked to reflect required
  bus locking
- Rename i3c_master_direct_attach_i3c_dev() and i3c_master_direct_detach_i3c_dev()
  to *_locked, as these APIs must be called with the bus lock held for write
- Drop redundant is_p3h2x4x_in_i3c flag from p3h2840.h
- Remove unnecessary ibi_lock handling in request/enable/disable/free
  IBI APIs
- Remove redundant parent pointer from struct i3c_hub and derive upstream 
  master from hub_dev
- Split SMBus target/slave mode support, including IBI and MCTP receive handling,
  into a separate patch
- Link to v9: https://lore.kernel.org/linux-i3c/20260420105222.1562243-1-lakshay.piplani@nxp.com/T/#u

Changes in v9:
- Renamed macros to follow consistent uppercase naming conventions
- Made REGMAP selects in the P3H2X4X MFD Kconfig conditional, to avoid I3C/I2C dependency issues
- Referenced i3c.yaml and i2c-controller.yaml for child bus nodes
- Dropped unnecessary #address-cells and #size-cells from child nodes
- Added CONFIG_I2C_SLAVE guards where necessary to avoid build errors when I2C slave support is disabled
- Link to v8: https://lore.kernel.org/linux-i3c/20260323062737.886728-1-lakshay.piplani@nxp.com/T/#u

Changes in v8:
- Add compatible in i3c example
- Link to v7: https://lore.kernel.org/linux-i3c/20260319112441.3888957-1-lakshay.piplani@nxp.com/T/#u

Changes in v7:
- Fix kernel-doc warnings across I3C core and hub code
- Rework DT binding schema and examples to pass dt_binding_check
- Update MFD Kconfig to use I3C_OR_I2C
- Convert CONFIG_I3C_HUB to tristate
- Remove unnecessary CONFIG_I2C_SLAVE guards
- Replace custom helpers with find_closest()
- Use devm_regulator_get_enable_optional()
- Link to v6: https://lore.kernel.org/linux-i3c/64c5070c-aa9e-427a-933e-91e168f0510c@kernel.org/T/#u

Changes in v6:
- Update DT binding with vendor-prefixed properties
- Add generic I3C hub support
- Remove generic code from P3H2x4x driver
- Link to v5: https://lore.kernel.org/linux-i3c/20260206120121.856471-1-aman.kumarpandey@nxp.com/T/#u

Changes in v5:
- Update supply naming and descriptions
- Improve MFD Kconfig/Makefile ordering
- Link to v4: https://lore.kernel.org/linux-i3c/20260113114529.1692213-2-aman.kumarpandey@nxp.com/T/#u

Changes in v4:
- Split driver into MFD, regulator and I3C hub parts
- Update I3C master for hub support
- Fix DT binding issues
- Link to v3: https://lore.kernel.org/linux-i3c/20250811-bittern-of-abstract-prestige-aaeda9@kuoka/T/#u

Changes in v3:
- Add MFD support for hub and regulators
- Add regulator integration
- Link to v2: https://lore.kernel.org/linux-i3c/17145d2f-5d07-4939-8381-74e27cde303c@kernel.org/T/#u

Changes in v2:
- Fix DT binding warnings
- Refine DT parsing logic
- Link to v1: https://lore.kernel.org/linux-i3c/822d6dca-b2c6-4439-ade5-219620ebc435@kernel.org/T/#u

Aman Kumar Pandey (5):
  i3c: master: Add APIs for I3C hub support
  dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (2):
  i3c: hub: Add support for the I3C interface in the I3C hub
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 291 +++++++++++
 MAINTAINERS                                   |  15 +
 drivers/i3c/Kconfig                           |  15 +
 drivers/i3c/Makefile                          |   2 +
 drivers/i3c/hub.c                             | 483 +++++++++++++++++
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 335 ++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 357 +++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 159 ++++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 488 ++++++++++++++++++
 drivers/i3c/master.c                          | 108 ++++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 119 +++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 220 ++++++++
 include/linux/i3c/device.h                    |   1 +
 include/linux/i3c/hub.h                       |  98 ++++
 include/linux/i3c/master.h                    |   7 +
 include/linux/mfd/p3h2840.h                   |  26 +
 22 files changed, 2764 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 create mode 100644 drivers/i3c/hub.c
 create mode 100644 drivers/i3c/hub/Kconfig
 create mode 100644 drivers/i3c/hub/Makefile
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
 create mode 100644 include/linux/i3c/hub.h
 create mode 100644 include/linux/mfd/p3h2840.h

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
