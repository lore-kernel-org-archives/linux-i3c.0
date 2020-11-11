Return-Path: <SRS0=t7CV=ER=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4621C56201
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2020 22:05:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57522087D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2020 22:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a+BgKEyK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="lIits12J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="2cUEqRoh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57522087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MsZa121WO9/Dd16lLHnXwgHnNvHXAWGLcY1IotJuzx0=; b=a+BgKEyKPPpoJQ3I+Me4XzA0P
	xe0E6xyCXLltbus4ZU3ewbf3OGmasTpUZQyziZRP6nykue+88530eFHpBxfC/vAGKuFphPlafuVvw
	VSK8wCsCwPJ6WfEb593G1fL2uDk+6jU4r5cEV2Wn0WwDVpJmnzJ1WhXd4sUKDDez4mY1ibVKJDd1x
	oa4HmfmwfjfM0+ZXHo51ZrEtPZuR5iB0hLt+0CNiuV8RzPh7G6B4VBU2zV3tE/YNtnlq6FJP6C8cn
	qotZ9bP8BiFQw+g/gDwkttxHF6qhs/buMLqQh5FEGHbjDuakc7RniyEOD8X1+tXkqRjNAs9+mpPw4
	n2xmX9q+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcyF7-0005oH-MX; Wed, 11 Nov 2020 22:05:29 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcyF2-0005mN-Fd
 for linux-i3c@lists.infradead.org; Wed, 11 Nov 2020 22:05:27 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id BEA2810F7D6;
 Wed, 11 Nov 2020 17:05:21 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=sasl; bh=TuN8ApbUSUnTUVxatS+os0Kx7
 YQ=; b=lIits12JW3Zx5RgskCccpOgSlYJFTkjOYHUlg0NkucQDPYyI5ZzVo77T7
 y0WQmFvR4bx5Duzf9aB8kZPiod1xfNaOIEzDGBVgR6uIcmavJf3DZ2mexqIUVOHI
 rpOHOY1CS9uKufsf0QyfLqueawF/6NMJvGaXueqbnt4sCEj3dE=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id AE53110F7D5;
 Wed, 11 Nov 2020 17:05:21 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=sEXbIEUyVT2xYHRvLu544Uh8wIM9A8YF0BVD7unVYbU=;
 b=2cUEqRoherMSrBrR5tSmkWadrx6I020NLLFkBQy0j3ranyTScR0El/l4AmPJibaflQEdm+TGUPaYzPxvOnxNPN5H5/m/NwVOCufkPVEUtMFYmQnrrMB5YI3wGXAO08igS+1jTpjLzW6Zj1UW6xcnqS1LyOz9W3DdYkb/LFUqKqY=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 36E0710F7D4;
 Wed, 11 Nov 2020 17:05:18 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTP id 49A1B2DA0D09;
 Wed, 11 Nov 2020 17:05:16 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org
Subject: [PATCH v4 2/2] i3c/master: introduce the mipi-i3c-hci driver
Date: Wed, 11 Nov 2020 17:05:10 -0500
Message-Id: <20201111220510.3622216-3-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111220510.3622216-1-nico@fluxnic.net>
References: <20201111220510.3622216-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: FBF7C1AC-2469-11EB-A429-E43E2BB96649-78420484!pb-smtp20.pobox.com
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Laura Nixon <laura.nixon@team.mipi.org>, Rob Herring <robh+dt@kernel.org>,
 Robert Gough <robert.gough@intel.com>, Sakari Ailus <sakari.ailus@iki.fi>,
 Nicolas Pitre <npitre@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Nicolas Pitre <npitre@baylibre.com>

This adds basic support for hardware implementing the MIPI I3C HCI
specification. This driver is currently limited by the capabilities
of the I3C subsystem, meaning things like scheduled commands,
auto-commands and NCM mode are not yet supported.

This supports version 1.0 of the MIPI I3C HCI spec, as well as the
imminent release of version 1.1. Support for draft version 2.0 of the
spec is also largely included with the caveat that future adjustments
to this code are likely as the spec is still a work in progress.

This is also lightly tested as actual hardware is still very scarce,
even for HCI v1.0. Hence the EXPERIMENTAL tag. Further contributions
to this driver are expected once vendor implementations and new I3C
devices become available.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/i3c/master/Kconfig                    |   13 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/mipi-i3c-hci/Makefile      |    6 +
 drivers/i3c/master/mipi-i3c-hci/cmd.h         |   67 ++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c      |  378 ++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c      |  316 +++++
 drivers/i3c/master/mipi-i3c-hci/core.c        |  798 +++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h         |   32 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  184 +++
 drivers/i3c/master/mipi-i3c-hci/dct.h         |   16 +
 drivers/i3c/master/mipi-i3c-hci/dct_v1.c      |   36 +
 drivers/i3c/master/mipi-i3c-hci/dma.c         |  784 +++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c    |  308 +++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h    |   19 +
 drivers/i3c/master/mipi-i3c-hci/hci.h         |  144 +++
 drivers/i3c/master/mipi-i3c-hci/ibi.h         |   42 +
 drivers/i3c/master/mipi-i3c-hci/pio.c         | 1041 +++++++++++++++++
 .../i3c/master/mipi-i3c-hci/xfer_mode_rate.h  |   79 ++
 18 files changed, 4264 insertions(+)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/Makefile
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/core.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dma.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ibi.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/pio.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/xfer_mode_rate.h

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 4e80a1fcbf..e68f15f4b4 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -21,3 +21,16 @@ config DW_I3C_MASTER
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called dw-i3c-master.
+
+config MIPI_I3C_HCI
+	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
+	depends on I3C
+	help
+	  Support for hardware following the MIPI Aliance's I3C Host Controller
+	  Interface specification.
+
+	  For details please see:
+	  https://www.mipi.org/specifications/i3c-hci
+
+	  This driver can also be built as a module.  If so, the module will be
+	  called mipi-i3c-hci.
diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index 7eea9e0861..b892fd4caf 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
 obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
+obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
new file mode 100644
index 0000000000..a658e7b826
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: BSD-3-Clause
+
+obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
+mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
+					   cmd_v1.o cmd_v2.o \
+					   dat_v1.o dct_v1.o
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
new file mode 100644
index 0000000000..1d6dd2c5d0
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common command/response related stuff
+ */
+
+#ifndef CMD_H
+#define CMD_H
+
+/*
+ * Those bits are common to all descriptor formats and
+ * may be manipulated by the core code.
+ */
+#define CMD_0_TOC			W0_BIT_(31)
+#define CMD_0_ROC			W0_BIT_(30)
+#define CMD_0_ATTR			W0_MASK(2, 0)
+
+/*
+ * Response Descriptor Structure
+ */
+#define RESP_STATUS(resp)		FIELD_GET(GENMASK(31, 28), resp)
+#define RESP_TID(resp)			FIELD_GET(GENMASK(27, 24), resp)
+#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(21,  0), resp)
+
+#define RESP_ERR_FIELD			GENMASK(31, 28)
+
+enum hci_resp_err {
+	RESP_SUCCESS			= 0x0,
+	RESP_ERR_CRC			= 0x1,
+	RESP_ERR_PARITY			= 0x2,
+	RESP_ERR_FRAME			= 0x3,
+	RESP_ERR_ADDR_HEADER		= 0x4,
+	RESP_ERR_BCAST_NACK_7E		= 0x4,
+	RESP_ERR_NACK			= 0x5,
+	RESP_ERR_OVL			= 0x6,
+	RESP_ERR_I3C_SHORT_READ		= 0x7,
+	RESP_ERR_HC_TERMINATED		= 0x8,
+	RESP_ERR_I2C_WR_DATA_NACK	= 0x9,
+	RESP_ERR_BUS_XFER_ABORTED	= 0x9,
+	RESP_ERR_NOT_SUPPORTED		= 0xa,
+	RESP_ERR_ABORTED_WITH_CRC	= 0xb,
+	/* 0xc to 0xf are reserved for transfer specific errors */
+};
+
+/* TID generation (4 bits wide in all cases) */
+#define hci_get_tid(bits) \
+	(atomic_inc_return_relaxed(&hci->next_cmd_tid) % (1U << 4))
+
+/* This abstracts operations with our command descriptor formats */
+struct hci_cmd_ops {
+	int (*prep_ccc)(struct i3c_hci *hci, struct hci_xfer *xfer,
+			u8 ccc_addr, u8 ccc_cmd, bool raw);
+	void (*prep_i3c_xfer)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+			      struct hci_xfer *xfer);
+	void (*prep_i2c_xfer)(struct i3c_hci *hci, struct i2c_dev_desc *dev,
+			      struct hci_xfer *xfer);
+	int (*perform_daa)(struct i3c_hci *hci);
+};
+
+/* Our various instances */
+extern const struct hci_cmd_ops mipi_i3c_hci_cmd_v1;
+extern const struct hci_cmd_ops mipi_i3c_hci_cmd_v2;
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
new file mode 100644
index 0000000000..6dd234a828
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * I3C HCI v1.0/v1.1 Command Descriptor Handling
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i3c/master.h>
+
+#include "hci.h"
+#include "cmd.h"
+#include "dat.h"
+#include "dct.h"
+
+
+/*
+ * Address Assignment Command
+ */
+
+#define CMD_0_ATTR_A			FIELD_PREP(CMD_0_ATTR, 0x2)
+
+#define CMD_A0_TOC				   W0_BIT_(31)
+#define CMD_A0_ROC				   W0_BIT_(30)
+#define CMD_A0_DEV_COUNT(v)		FIELD_PREP(W0_MASK(29, 26), v)
+#define CMD_A0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_A0_CMD(v)			FIELD_PREP(W0_MASK(14,  7), v)
+#define CMD_A0_TID(v)			FIELD_PREP(W0_MASK( 6,  3), v)
+
+/*
+ * Immediate Data Transfer Command
+ */
+
+#define CMD_0_ATTR_I			FIELD_PREP(CMD_0_ATTR, 0x1)
+
+#define CMD_I1_DATA_BYTE_4(v)		FIELD_PREP(W1_MASK(63, 56), v)
+#define CMD_I1_DATA_BYTE_3(v)		FIELD_PREP(W1_MASK(55, 48), v)
+#define CMD_I1_DATA_BYTE_2(v)		FIELD_PREP(W1_MASK(47, 40), v)
+#define CMD_I1_DATA_BYTE_1(v)		FIELD_PREP(W1_MASK(39, 32), v)
+#define CMD_I1_DEF_BYTE(v)		FIELD_PREP(W1_MASK(39, 32), v)
+#define CMD_I0_TOC				   W0_BIT_(31)
+#define CMD_I0_ROC				   W0_BIT_(30)
+#define CMD_I0_RNW				   W0_BIT_(29)
+#define CMD_I0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
+#define CMD_I0_DTT(v)			FIELD_PREP(W0_MASK(25, 23), v)
+#define CMD_I0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_I0_CP				   W0_BIT_(15)
+#define CMD_I0_CMD(v)			FIELD_PREP(W0_MASK(14,  7), v)
+#define CMD_I0_TID(v)			FIELD_PREP(W0_MASK( 6,  3), v)
+
+/*
+ * Regular Data Transfer Command
+ */
+
+#define CMD_0_ATTR_R			FIELD_PREP(CMD_0_ATTR, 0x0)
+
+#define CMD_R1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(63, 48), v)
+#define CMD_R1_DEF_BYTE(v)		FIELD_PREP(W1_MASK(39, 32), v)
+#define CMD_R0_TOC				   W0_BIT_(31)
+#define CMD_R0_ROC				   W0_BIT_(30)
+#define CMD_R0_RNW				   W0_BIT_(29)
+#define CMD_R0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
+#define CMD_R0_DBP				   W0_BIT_(25)
+#define CMD_R0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_R0_CP				   W0_BIT_(15)
+#define CMD_R0_CMD(v)			FIELD_PREP(W0_MASK(14,  7), v)
+#define CMD_R0_TID(v)			FIELD_PREP(W0_MASK( 6,  3), v)
+
+/*
+ * Combo Transfer (Write + Write/Read) Command
+ */
+
+#define CMD_0_ATTR_C			FIELD_PREP(CMD_0_ATTR, 0x3)
+
+#define CMD_C1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(63, 48), v)
+#define CMD_C1_OFFSET(v)		FIELD_PREP(W1_MASK(47, 32), v)
+#define CMD_C0_TOC				   W0_BIT_(31)
+#define CMD_C0_ROC				   W0_BIT_(30)
+#define CMD_C0_RNW				   W0_BIT_(29)
+#define CMD_C0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
+#define CMD_C0_16_BIT_SUBOFFSET			   W0_BIT_(25)
+#define CMD_C0_FIRST_PHASE_MODE			   W0_BIT_(24)
+#define CMD_C0_DATA_LENGTH_POSITION(v)	FIELD_PREP(W0_MASK(23, 22), v)
+#define CMD_C0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_C0_CP				   W0_BIT_(15)
+#define CMD_C0_CMD(v)			FIELD_PREP(W0_MASK(14,  7), v)
+#define CMD_C0_TID(v)			FIELD_PREP(W0_MASK( 6,  3), v)
+
+/*
+ * Internal Control Command
+ */
+
+#define CMD_0_ATTR_M			FIELD_PREP(CMD_0_ATTR, 0x7)
+
+#define CMD_M1_VENDOR_SPECIFIC			   W1_MASK(63, 32)
+#define CMD_M0_MIPI_RESERVED			   W0_MASK(31, 12)
+#define CMD_M0_MIPI_CMD				   W0_MASK(11,  8)
+#define CMD_M0_VENDOR_INFO_PRESENT		   W0_BIT_( 7)
+#define CMD_M0_TID(v)			FIELD_PREP(W0_MASK( 6,  3), v)
+
+
+/* Data Transfer Speed and Mode */
+enum hci_cmd_mode {
+	MODE_I3C_SDR0		= 0x0,
+	MODE_I3C_SDR1		= 0x1,
+	MODE_I3C_SDR2		= 0x2,
+	MODE_I3C_SDR3		= 0x3,
+	MODE_I3C_SDR4		= 0x4,
+	MODE_I3C_HDR_TSx	= 0x5,
+	MODE_I3C_HDR_DDR	= 0x6,
+	MODE_I3C_HDR_BT		= 0x7,
+	MODE_I3C_Fm_FmP		= 0x8,
+	MODE_I2C_Fm		= 0x0,
+	MODE_I2C_FmP		= 0x1,
+	MODE_I2C_UD1		= 0x2,
+	MODE_I2C_UD2		= 0x3,
+	MODE_I2C_UD3		= 0x4,
+};
+
+static enum hci_cmd_mode get_i3c_mode(struct i3c_hci *hci)
+{
+	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
+
+	if (bus->scl_rate.i3c >= 12500000)
+		return MODE_I3C_SDR0;
+	if (bus->scl_rate.i3c > 8000000)
+		return MODE_I3C_SDR1;
+	if (bus->scl_rate.i3c > 6000000)
+		return MODE_I3C_SDR2;
+	if (bus->scl_rate.i3c > 4000000)
+		return MODE_I3C_SDR3;
+	if (bus->scl_rate.i3c > 2000000)
+		return MODE_I3C_SDR4;
+	return MODE_I3C_Fm_FmP;
+}
+
+static enum hci_cmd_mode get_i2c_mode(struct i3c_hci *hci)
+{
+	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
+
+	if (bus->scl_rate.i2c >= 1000000)
+		return MODE_I2C_FmP;
+	return MODE_I2C_Fm;
+}
+
+static void fill_data_bytes(struct hci_xfer *xfer, u8 *data,
+			    unsigned int data_len)
+{
+	xfer->cmd_desc[1] = 0;
+	switch (data_len) {
+	case 4:
+		xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_4(data[3]);
+		fallthrough;
+	case 3:
+		xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_3(data[2]);
+		fallthrough;
+	case 2:
+		xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_2(data[1]);
+		fallthrough;
+	case 1:
+		xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_1(data[0]);
+		fallthrough;
+	case 0:
+		break;
+	}
+	/* we consumed all the data with the cmd descriptor */
+	xfer->data = NULL;
+}
+
+static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
+			       struct hci_xfer *xfer,
+			       u8 ccc_addr, u8 ccc_cmd, bool raw)
+{
+	unsigned int dat_idx = 0;
+	enum hci_cmd_mode mode = get_i3c_mode(hci);
+	u8 *data = xfer->data;
+	unsigned int data_len = xfer->data_len;
+	bool rnw = xfer->rnw;
+	int ret;
+
+	/* this should never happen */
+	if (WARN_ON(raw))
+		return -EINVAL;
+
+	if (ccc_addr != I3C_BROADCAST_ADDR) {
+		ret = mipi_i3c_hci_dat_v1.get_index(hci, ccc_addr);
+		if (ret < 0)
+			return ret;
+		dat_idx = ret;
+	}
+
+	xfer->cmd_tid = hci_get_tid();
+
+	if (!rnw && data_len <= 4) {
+		/* we use an Immediate Data Transfer Command */
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_I |
+			CMD_I0_TID(xfer->cmd_tid) |
+			CMD_I0_CMD(ccc_cmd) | CMD_I0_CP |
+			CMD_I0_DEV_INDEX(dat_idx) |
+			CMD_I0_DTT(data_len) |
+			CMD_I0_MODE(mode);
+		fill_data_bytes(xfer, data, data_len);
+	} else {
+		/* we use a Regular Data Transfer Command */
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_R |
+			CMD_R0_TID(xfer->cmd_tid) |
+			CMD_R0_CMD(ccc_cmd) | CMD_R0_CP |
+			CMD_R0_DEV_INDEX(dat_idx) |
+			CMD_R0_MODE(mode) |
+			(rnw ? CMD_R0_RNW : 0);
+		xfer->cmd_desc[1] =
+			CMD_R1_DATA_LENGTH(data_len);
+	}
+
+	return 0;
+}
+
+static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
+				     struct i3c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	unsigned int dat_idx = dev_data->dat_idx;
+	enum hci_cmd_mode mode = get_i3c_mode(hci);
+	u8 *data = xfer->data;
+	unsigned int data_len = xfer->data_len;
+	bool rnw = xfer->rnw;
+
+	xfer->cmd_tid = hci_get_tid();
+
+	if (!rnw && data_len <= 4) {
+		/* we use an Immediate Data Transfer Command */
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_I |
+			CMD_I0_TID(xfer->cmd_tid) |
+			CMD_I0_DEV_INDEX(dat_idx) |
+			CMD_I0_DTT(data_len) |
+			CMD_I0_MODE(mode);
+		fill_data_bytes(xfer, data, data_len);
+	} else {
+		/* we use a Regular Data Transfer Command */
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_R |
+			CMD_R0_TID(xfer->cmd_tid) |
+			CMD_R0_DEV_INDEX(dat_idx) |
+			CMD_R0_MODE(mode) |
+			(rnw ? CMD_R0_RNW : 0);
+		xfer->cmd_desc[1] =
+			CMD_R1_DATA_LENGTH(data_len);
+	}
+}
+
+static void hci_cmd_v1_prep_i2c_xfer(struct i3c_hci *hci,
+				     struct i2c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	struct i3c_hci_dev_data *dev_data = i2c_dev_get_master_data(dev);
+	unsigned int dat_idx = dev_data->dat_idx;
+	enum hci_cmd_mode mode = get_i2c_mode(hci);
+	u8 *data = xfer->data;
+	unsigned int data_len = xfer->data_len;
+	bool rnw = xfer->rnw;
+
+	xfer->cmd_tid = hci_get_tid();
+
+	if (!rnw && data_len <= 4) {
+		/* we use an Immediate Data Transfer Command */
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_I |
+			CMD_I0_TID(xfer->cmd_tid) |
+			CMD_I0_DEV_INDEX(dat_idx) |
+			CMD_I0_DTT(data_len) |
+			CMD_I0_MODE(mode);
+		fill_data_bytes(xfer, data, data_len);
+	} else {
+		/* we use a Regular Data Transfer Command */
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_R |
+			CMD_R0_TID(xfer->cmd_tid) |
+			CMD_R0_DEV_INDEX(dat_idx) |
+			CMD_R0_MODE(mode) |
+			(rnw ? CMD_R0_RNW : 0);
+		xfer->cmd_desc[1] =
+			CMD_R1_DATA_LENGTH(data_len);
+	}
+}
+
+static int hci_cmd_v1_daa(struct i3c_hci *hci)
+{
+	struct hci_xfer *xfer;
+	int ret, dat_idx = -1;
+	u8 next_addr;
+	u64 pid;
+	unsigned int dcr, bcr;
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	xfer = hci_alloc_xfer(2);
+	if (!xfer)
+		return -ENOMEM;
+
+	/*
+	 * Simple for now: we allocate a temporary DAT entry, do a single
+	 * DAA, register the device which will allocate its own DAT entry
+	 * via the core callback, then free the temporary DAT entry.
+	 * Loop until there is no more devices to assign an address to.
+	 * Yes, there is room for improvements.
+	 */
+	for (;;) {
+		ret = mipi_i3c_hci_dat_v1.alloc_entry(hci);
+		if (ret < 0)
+			break;
+		dat_idx = ret;
+		ret = i3c_master_get_free_addr(&hci->master, next_addr);
+		if (ret < 0)
+			break;
+		next_addr = ret;
+
+		DBG("next_addr = 0x%02x, DAA using DAT %d", next_addr, dat_idx);
+		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, dat_idx, next_addr);
+		mipi_i3c_hci_dct_index_reset(hci);
+
+		xfer->cmd_tid = hci_get_tid();
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_A |
+			CMD_A0_TID(xfer->cmd_tid) |
+			CMD_A0_CMD(I3C_CCC_ENTDAA) |
+			CMD_A0_DEV_INDEX(dat_idx) |
+			CMD_A0_DEV_COUNT(1) |
+			CMD_A0_ROC | CMD_A0_TOC;
+		xfer->cmd_desc[1] = 0;
+		hci->io->queue_xfer(hci, xfer, 1);
+		if (!wait_for_completion_timeout(&done, HZ) &&
+		    hci->io->dequeue_xfer(hci, xfer, 1)) {
+			ret = -ETIME;
+			break;
+		}
+		if (RESP_STATUS(xfer[0].response) == RESP_ERR_NACK &&
+		    RESP_STATUS(xfer[0].response) == 1) {
+			ret = 0;  /* no more devices to be assigned */
+			break;
+		}
+		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
+			ret = -EIO;
+			break;
+		}
+
+		i3c_hci_dct_get_val(hci, 0, &pid, &dcr, &bcr);
+		DBG("assigned address %#x to device PID=0x%llx DCR=%#x BCR=%#x",
+		    next_addr, pid, dcr, bcr);
+
+		mipi_i3c_hci_dat_v1.free_entry(hci, dat_idx);
+		dat_idx = -1;
+
+		/*
+		 * TODO: Extend the subsystem layer to allow for registering
+		 * new device and provide BCR/DCR/PID at the same time.
+		 */
+		ret = i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
+		if (ret)
+			break;
+	}
+
+	if (dat_idx >= 0)
+		mipi_i3c_hci_dat_v1.free_entry(hci, dat_idx);
+	hci_free_xfer(xfer, 1);
+	return ret;
+}
+
+const struct hci_cmd_ops mipi_i3c_hci_cmd_v1 = {
+	.prep_ccc		= hci_cmd_v1_prep_ccc,
+	.prep_i3c_xfer		= hci_cmd_v1_prep_i3c_xfer,
+	.prep_i2c_xfer		= hci_cmd_v1_prep_i2c_xfer,
+	.perform_daa		= hci_cmd_v1_daa,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
new file mode 100644
index 0000000000..4493b2b067
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * I3C HCI v2.0 Command Descriptor Handling
+ *
+ * Note: The I3C HCI v2.0 spec is still in flux. The code here will change.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i3c/master.h>
+
+#include "hci.h"
+#include "cmd.h"
+#include "xfer_mode_rate.h"
+
+
+/*
+ * Unified Data Transfer Command
+ */
+
+#define CMD_0_ATTR_U			FIELD_PREP(CMD_0_ATTR, 0x4)
+
+#define CMD_U3_HDR_TSP_ML_CTRL(v)	FIELD_PREP(W3_MASK(107, 104), v)
+#define CMD_U3_IDB4(v)			FIELD_PREP(W3_MASK(103,  96), v)
+#define CMD_U3_HDR_CMD(v)		FIELD_PREP(W3_MASK(103,  96), v)
+#define CMD_U2_IDB3(v)			FIELD_PREP(W2_MASK( 95,  88), v)
+#define CMD_U2_HDR_BT(v)		FIELD_PREP(W2_MASK( 95,  88), v)
+#define CMD_U2_IDB2(v)			FIELD_PREP(W2_MASK( 87,  80), v)
+#define CMD_U2_BT_CMD2(v)		FIELD_PREP(W2_MASK( 87,  80), v)
+#define CMD_U2_IDB1(v)			FIELD_PREP(W2_MASK( 79,  72), v)
+#define CMD_U2_BT_CMD1(v)		FIELD_PREP(W2_MASK( 79,  72), v)
+#define CMD_U2_IDB0(v)			FIELD_PREP(W2_MASK( 71,  64), v)
+#define CMD_U2_BT_CMD0(v)		FIELD_PREP(W2_MASK( 71,  64), v)
+#define CMD_U1_ERR_HANDLING(v)		FIELD_PREP(W1_MASK( 63,  62), v)
+#define CMD_U1_ADD_FUNC(v)		FIELD_PREP(W1_MASK( 61,  56), v)
+#define CMD_U1_COMBO_XFER			   W1_BIT_( 55)
+#define CMD_U1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK( 53,  32), v)
+#define CMD_U0_TOC				   W0_BIT_( 31)
+#define CMD_U0_ROC				   W0_BIT_( 30)
+#define CMD_U0_MAY_YIELD			   W0_BIT_( 29)
+#define CMD_U0_NACK_RCNT(v)		FIELD_PREP(W0_MASK( 28,  27), v)
+#define CMD_U0_IDB_COUNT(v)		FIELD_PREP(W0_MASK( 26,  24), v)
+#define CMD_U0_MODE_INDEX(v)		FIELD_PREP(W0_MASK( 22,  18), v)
+#define CMD_U0_XFER_RATE(v)		FIELD_PREP(W0_MASK( 17,  15), v)
+#define CMD_U0_DEV_ADDRESS(v)		FIELD_PREP(W0_MASK( 14,   8), v)
+#define CMD_U0_RnW				   W0_BIT_(  7)
+#define CMD_U0_TID(v)			FIELD_PREP(W0_MASK(  6,   3), v)
+
+/*
+ * Address Assignment Command
+ */
+
+#define CMD_0_ATTR_A			FIELD_PREP(CMD_0_ATTR, 0x2)
+
+#define CMD_A1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK( 53,  32), v)
+#define CMD_A0_TOC				   W0_BIT_( 31)
+#define CMD_A0_ROC				   W0_BIT_( 30)
+#define CMD_A0_XFER_RATE(v)		FIELD_PREP(W0_MASK( 17,  15), v)
+#define CMD_A0_ASSIGN_ADDRESS(v)	FIELD_PREP(W0_MASK( 14,   8), v)
+#define CMD_A0_TID(v)			FIELD_PREP(W0_MASK(  6,   3), v)
+
+
+static unsigned int get_i3c_rate_idx(struct i3c_hci *hci)
+{
+	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
+
+	if (bus->scl_rate.i3c >= 12000000)
+		return XFERRATE_I3C_SDR0;
+	if (bus->scl_rate.i3c > 8000000)
+		return XFERRATE_I3C_SDR1;
+	if (bus->scl_rate.i3c > 6000000)
+		return XFERRATE_I3C_SDR2;
+	if (bus->scl_rate.i3c > 4000000)
+		return XFERRATE_I3C_SDR3;
+	if (bus->scl_rate.i3c > 2000000)
+		return XFERRATE_I3C_SDR4;
+	return XFERRATE_I3C_SDR_FM_FMP;
+}
+
+static unsigned int get_i2c_rate_idx(struct i3c_hci *hci)
+{
+	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
+
+	if (bus->scl_rate.i2c >= 1000000)
+		return XFERRATE_I2C_FMP;
+	return XFERRATE_I2C_FM;
+}
+
+static void hci_cmd_v2_prep_private_xfer(struct i3c_hci *hci,
+					 struct hci_xfer *xfer,
+					 u8 addr, unsigned int mode,
+					 unsigned int rate)
+{
+	u8 *data = xfer->data;
+	unsigned int data_len = xfer->data_len;
+	bool rnw = xfer->rnw;
+
+	xfer->cmd_tid = hci_get_tid();
+
+	if (!rnw && data_len <= 5) {
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			CMD_U0_DEV_ADDRESS(addr) |
+			CMD_U0_XFER_RATE(rate) |
+			CMD_U0_MODE_INDEX(mode) |
+			CMD_U0_IDB_COUNT(data_len);
+		xfer->cmd_desc[1] =
+			CMD_U1_DATA_LENGTH(0);
+		xfer->cmd_desc[2] = 0;
+		xfer->cmd_desc[3] = 0;
+		switch (data_len) {
+		case 5:
+			xfer->cmd_desc[3] |= CMD_U3_IDB4(data[4]);
+			fallthrough;
+		case 4:
+			xfer->cmd_desc[2] |= CMD_U2_IDB3(data[3]);
+			fallthrough;
+		case 3:
+			xfer->cmd_desc[2] |= CMD_U2_IDB2(data[2]);
+			fallthrough;
+		case 2:
+			xfer->cmd_desc[2] |= CMD_U2_IDB1(data[1]);
+			fallthrough;
+		case 1:
+			xfer->cmd_desc[2] |= CMD_U2_IDB0(data[0]);
+			fallthrough;
+		case 0:
+			break;
+		}
+		/* we consumed all the data with the cmd descriptor */
+		xfer->data = NULL;
+	} else {
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			(rnw ? CMD_U0_RnW : 0) |
+			CMD_U0_DEV_ADDRESS(addr) |
+			CMD_U0_XFER_RATE(rate) |
+			CMD_U0_MODE_INDEX(mode);
+		xfer->cmd_desc[1] =
+			CMD_U1_DATA_LENGTH(data_len);
+		xfer->cmd_desc[2] = 0;
+		xfer->cmd_desc[3] = 0;
+	}
+}
+
+static int hci_cmd_v2_prep_ccc(struct i3c_hci *hci, struct hci_xfer *xfer,
+			       u8 ccc_addr, u8 ccc_cmd, bool raw)
+{
+	unsigned int mode = XFERMODE_IDX_I3C_SDR;
+	unsigned int rate = get_i3c_rate_idx(hci);
+	u8 *data = xfer->data;
+	unsigned int data_len = xfer->data_len;
+	bool rnw = xfer->rnw;
+
+	if (raw && ccc_addr != I3C_BROADCAST_ADDR) {
+		hci_cmd_v2_prep_private_xfer(hci, xfer, ccc_addr, mode, rate);
+		return 0;
+	}
+
+	xfer->cmd_tid = hci_get_tid();
+
+	if (!rnw && data_len <= 4) {
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			CMD_U0_DEV_ADDRESS(ccc_addr) |
+			CMD_U0_XFER_RATE(rate) |
+			CMD_U0_MODE_INDEX(mode) |
+			CMD_U0_IDB_COUNT(data_len + (!raw ? 0 : 1));
+		xfer->cmd_desc[1] =
+			CMD_U1_DATA_LENGTH(0);
+		xfer->cmd_desc[2] =
+			CMD_U2_IDB0(ccc_cmd);
+		xfer->cmd_desc[3] = 0;
+		switch (data_len) {
+		case 4:
+			xfer->cmd_desc[3] |= CMD_U3_IDB4(data[3]);
+			fallthrough;
+		case 3:
+			xfer->cmd_desc[2] |= CMD_U2_IDB3(data[2]);
+			fallthrough;
+		case 2:
+			xfer->cmd_desc[2] |= CMD_U2_IDB2(data[1]);
+			fallthrough;
+		case 1:
+			xfer->cmd_desc[2] |= CMD_U2_IDB1(data[0]);
+			fallthrough;
+		case 0:
+			break;
+		}
+		/* we consumed all the data with the cmd descriptor */
+		xfer->data = NULL;
+	} else {
+		xfer->cmd_desc[0] =
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			(rnw ? CMD_U0_RnW : 0) |
+			CMD_U0_DEV_ADDRESS(ccc_addr) |
+			CMD_U0_XFER_RATE(rate) |
+			CMD_U0_MODE_INDEX(mode) |
+			CMD_U0_IDB_COUNT(!raw ? 0 : 1);
+		xfer->cmd_desc[1] =
+			CMD_U1_DATA_LENGTH(data_len);
+		xfer->cmd_desc[2] =
+			CMD_U2_IDB0(ccc_cmd);
+		xfer->cmd_desc[3] = 0;
+	}
+
+	return 0;
+}
+
+static void hci_cmd_v2_prep_i3c_xfer(struct i3c_hci *hci,
+				     struct i3c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	unsigned int mode = XFERMODE_IDX_I3C_SDR;
+	unsigned int rate = get_i3c_rate_idx(hci);
+	u8 addr = dev->info.dyn_addr;
+
+	hci_cmd_v2_prep_private_xfer(hci, xfer, addr, mode, rate);
+}
+
+static void hci_cmd_v2_prep_i2c_xfer(struct i3c_hci *hci,
+				     struct i2c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	unsigned int mode = XFERMODE_IDX_I2C;
+	unsigned int rate = get_i2c_rate_idx(hci);
+	u8 addr = dev->addr;
+
+	hci_cmd_v2_prep_private_xfer(hci, xfer, addr, mode, rate);
+}
+
+static int hci_cmd_v2_daa(struct i3c_hci *hci)
+{
+	struct hci_xfer *xfer;
+	int ret;
+	u8 next_addr = 0;
+	u32 device_id[2];
+	u64 pid;
+	unsigned int dcr, bcr;
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	xfer = hci_alloc_xfer(2);
+	if (!xfer)
+		return -ENOMEM;
+
+	xfer[0].data = &device_id;
+	xfer[0].data_len = 8;
+	xfer[0].rnw = true;
+	xfer[0].cmd_desc[1] = CMD_A1_DATA_LENGTH(8);
+	xfer[1].completion = &done;
+
+	for (;;) {
+		ret = i3c_master_get_free_addr(&hci->master, next_addr);
+		if (ret < 0)
+			break;
+		next_addr = ret;
+		DBG("next_addr = 0x%02x", next_addr);
+		xfer[0].cmd_tid = hci_get_tid();
+		xfer[0].cmd_desc[0] =
+			CMD_0_ATTR_A |
+			CMD_A0_TID(xfer[0].cmd_tid) |
+			CMD_A0_ROC;
+		xfer[1].cmd_tid = hci_get_tid();
+		xfer[1].cmd_desc[0] =
+			CMD_0_ATTR_A |
+			CMD_A0_TID(xfer[1].cmd_tid) |
+			CMD_A0_ASSIGN_ADDRESS(next_addr) |
+			CMD_A0_ROC |
+			CMD_A0_TOC;
+		hci->io->queue_xfer(hci, xfer, 2);
+		if (!wait_for_completion_timeout(&done, HZ) &&
+		    hci->io->dequeue_xfer(hci, xfer, 2)) {
+			ret = -ETIME;
+			break;
+		}
+		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
+			ret = 0;  /* no more devices to be assigned */
+			break;
+		}
+		if (RESP_STATUS(xfer[1].response) != RESP_SUCCESS) {
+			ret = -EIO;
+			break;
+		}
+
+		pid = FIELD_GET(W1_MASK(47, 32), device_id[1]);
+		pid = (pid << 32) | device_id[0];
+		bcr = FIELD_GET(W1_MASK(55, 48), device_id[1]);
+		dcr = FIELD_GET(W1_MASK(63, 56), device_id[1]);
+		DBG("assigned address %#x to device PID=0x%llx DCR=%#x BCR=%#x",
+		    next_addr, pid, dcr, bcr);
+		/*
+		 * TODO: Extend the subsystem layer to allow for registering
+		 * new device and provide BCR/DCR/PID at the same time.
+		 */
+		ret = i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
+		if (ret)
+			break;
+	}
+
+	hci_free_xfer(xfer, 2);
+	return ret;
+}
+
+const struct hci_cmd_ops mipi_i3c_hci_cmd_v2 = {
+	.prep_ccc		= hci_cmd_v2_prep_ccc,
+	.prep_i3c_xfer		= hci_cmd_v2_prep_i3c_xfer,
+	.prep_i2c_xfer		= hci_cmd_v2_prep_i2c_xfer,
+	.perform_daa		= hci_cmd_v2_daa,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
new file mode 100644
index 0000000000..113c4c9054
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -0,0 +1,798 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Core driver code with main interface to the I3C subsystem.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "hci.h"
+#include "ext_caps.h"
+#include "cmd.h"
+#include "dat.h"
+
+
+/*
+ * Host Controller Capabilities and Operation Registers
+ */
+
+#define reg_read(r)		readl(hci->base_regs + (r))
+#define reg_write(r, v)		writel(v, hci->base_regs + (r))
+#define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
+#define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
+
+#define HCI_VERSION			0x00	/* HCI Version (in BCD) */
+
+#define HC_CONTROL			0x04
+#define HC_CONTROL_BUS_ENABLE		BIT(31)
+#define HC_CONTROL_RESUME		BIT(30)
+#define HC_CONTROL_ABORT		BIT(29)
+#define HC_CONTROL_HALT_ON_CMD_TIMEOUT	BIT(12)
+#define HC_CONTROL_HOT_JOIN_CTRL	BIT(8)	/* Hot-Join ACK/NACK Control */
+#define HC_CONTROL_I2C_TARGET_PRESENT	BIT(7)
+#define HC_CONTROL_PIO_MODE		BIT(6)	/* DMA/PIO Mode Selector */
+#define HC_CONTROL_DATA_BIG_ENDIAN	BIT(4)
+#define HC_CONTROL_IBA_INCLUDE		BIT(0)	/* Include I3C Broadcast Address */
+
+#define MASTER_DEVICE_ADDR		0x08	/* Master Device Address */
+#define MASTER_DYNAMIC_ADDR_VALID	BIT(31)	/* Dynamic Address is Valid */
+#define MASTER_DYNAMIC_ADDR(v)		FIELD_PREP(GENMASK(22, 16), v)
+
+#define HC_CAPABILITIES			0x0c
+#define HC_CAP_SG_DC_EN			BIT(30)
+#define HC_CAP_SG_IBI_EN		BIT(29)
+#define HC_CAP_SG_CR_EN			BIT(28)
+#define HC_CAP_MAX_DATA_LENGTH		GENMASK(24, 22)
+#define HC_CAP_CMD_SIZE			GENMASK(21, 20)
+#define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
+#define HC_CAP_MULTI_LANE_EN		BIT(15)
+#define HC_CAP_CMD_CCC_DEFBYTE		BIT(10)
+#define HC_CAP_HDR_BT_EN		BIT(8)
+#define HC_CAP_HDR_TS_EN		BIT(7)
+#define HC_CAP_HDR_DDR_EN		BIT(6)
+#define HC_CAP_NON_CURRENT_MASTER_CAP	BIT(5)	/* master handoff capable */
+#define HC_CAP_DATA_BYTE_CFG_EN		BIT(4)	/* endian selection possible */
+#define HC_CAP_AUTO_COMMAND		BIT(3)
+#define HC_CAP_COMBO_COMMAND		BIT(2)
+
+#define RESET_CONTROL			0x10
+#define BUS_RESET			BIT(31)
+#define BUS_RESET_TYPE			GENMASK(30, 29)
+#define IBI_QUEUE_RST			BIT(5)
+#define RX_FIFO_RST			BIT(4)
+#define TX_FIFO_RST			BIT(3)
+#define RESP_QUEUE_RST			BIT(2)
+#define CMD_QUEUE_RST			BIT(1)
+#define SOFT_RST			BIT(0)	/* Core Reset */
+
+#define PRESENT_STATE			0x14
+#define STATE_CURRENT_MASTER		BIT(2)
+
+#define INTR_STATUS			0x20
+#define INTR_STATUS_ENABLE		0x24
+#define INTR_SIGNAL_ENABLE		0x28
+#define INTR_FORCE			0x2c
+#define INTR_HC_CMD_SEQ_UFLOW_STAT	BIT(12)	/* Cmd Sequence Underflow */
+#define INTR_HC_RESET_CANCEL		BIT(11)	/* HC Cancelled Reset */
+#define INTR_HC_INTERNAL_ERR		BIT(10)	/* HC Internal Error */
+#define INTR_HC_PIO			BIT(8)	/* cascaded PIO interrupt */
+#define INTR_HC_RINGS			GENMASK(7, 0)
+
+#define DAT_SECTION			0x30	/* Device Address Table */
+#define DAT_ENTRY_SIZE			GENMASK(31, 28)
+#define DAT_TABLE_SIZE			GENMASK(18, 12)
+#define DAT_TABLE_OFFSET		GENMASK(11, 0)
+
+#define DCT_SECTION			0x34	/* Device Characteristics Table */
+#define DCT_ENTRY_SIZE			GENMASK(31, 28)
+#define DCT_TABLE_INDEX			GENMASK(23, 19)
+#define DCT_TABLE_SIZE			GENMASK(18, 12)
+#define DCT_TABLE_OFFSET		GENMASK(11, 0)
+
+#define RING_HEADERS_SECTION		0x38
+#define RING_HEADERS_OFFSET		GENMASK(15, 0)
+
+#define PIO_SECTION			0x3c
+#define PIO_REGS_OFFSET			GENMASK(15, 0)	/* PIO Offset */
+
+#define EXT_CAPS_SECTION		0x40
+#define EXT_CAPS_OFFSET			GENMASK(15, 0)
+
+#define IBI_NOTIFY_CTRL			0x58	/* IBI Notify Control */
+#define IBI_NOTIFY_SIR_REJECTED		BIT(3)	/* Rejected Target Interrupt Request */
+#define IBI_NOTIFY_MR_REJECTED		BIT(1)	/* Rejected Master Request Control */
+#define IBI_NOTIFY_HJ_REJECTED		BIT(0)	/* Rejected Hot-Join Control */
+
+#define DEV_CTX_BASE_LO			0x60
+#define DEV_CTX_BASE_HI			0x64
+
+
+static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
+{
+	return container_of(m, struct i3c_hci, master);
+}
+
+static int i3c_hci_bus_init(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_device_info info;
+	int ret;
+
+	DBG("");
+
+	if (hci->cmd == &mipi_i3c_hci_cmd_v1) {
+		ret = mipi_i3c_hci_dat_v1.init(hci);
+		if (ret)
+			return ret;
+	}
+
+	ret = i3c_master_get_free_addr(m, 0);
+	if (ret < 0)
+		return ret;
+	reg_write(MASTER_DEVICE_ADDR,
+		  MASTER_DYNAMIC_ADDR(ret) | MASTER_DYNAMIC_ADDR_VALID);
+	memset(&info, 0, sizeof(info));
+	info.dyn_addr = ret;
+	ret = i3c_master_set_info(m, &info);
+	if (ret)
+		return ret;
+
+	ret = hci->io->init(hci);
+	if (ret)
+		return ret;
+
+	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	DBG("HC_CONTROL = %#x", reg_read(HC_CONTROL));
+
+	return 0;
+}
+
+static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+
+	DBG("");
+
+	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	hci->io->cleanup(hci);
+	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
+		mipi_i3c_hci_dat_v1.cleanup(hci);
+}
+
+void mipi_i3c_hci_resume(struct i3c_hci *hci)
+{
+	/* the HC_CONTROL_RESUME bit is R/W1C so just read and write back */
+	reg_write(HC_CONTROL, reg_read(HC_CONTROL));
+}
+
+/* located here rather than pio.c because needed bits are in core reg space */
+void mipi_i3c_hci_pio_reset(struct i3c_hci *hci)
+{
+	reg_write(RESET_CONTROL, RX_FIFO_RST | TX_FIFO_RST | RESP_QUEUE_RST);
+}
+
+/* located here rather than dct.c because needed bits are in core reg space */
+void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci)
+{
+	reg_write(DCT_SECTION, FIELD_PREP(DCT_TABLE_INDEX, 0));
+}
+
+static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
+				struct i3c_ccc_cmd *ccc)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct hci_xfer *xfer;
+	bool raw = !!(hci->quirks & HCI_QUIRK_RAW_CCC);
+	bool prefixed = raw && !!(ccc->id & I3C_CCC_DIRECT);
+	unsigned int nxfers = ccc->ndests + prefixed;
+	DECLARE_COMPLETION_ONSTACK(done);
+	int i, last, ret = 0;
+
+	DBG("cmd=%#x rnw=%d ndests=%d data[0].len=%d",
+	    ccc->id, ccc->rnw, ccc->ndests, ccc->dests[0].payload.len);
+
+	xfer = hci_alloc_xfer(nxfers);
+	if (!xfer)
+		return -ENOMEM;
+
+	if (prefixed) {
+		xfer->data = NULL;
+		xfer->data_len = 0;
+		xfer->rnw = false;
+		hci->cmd->prep_ccc(hci, xfer, I3C_BROADCAST_ADDR,
+				   ccc->id, true);
+		xfer++;
+	}
+
+	for (i = 0; i < nxfers - prefixed; i++) {
+		xfer[i].data = ccc->dests[i].payload.data;
+		xfer[i].data_len = ccc->dests[i].payload.len;
+		xfer[i].rnw = ccc->rnw;
+		ret = hci->cmd->prep_ccc(hci, &xfer[i], ccc->dests[i].addr,
+					 ccc->id, raw);
+		if (ret)
+			goto out;
+		xfer[i].cmd_desc[0] |= CMD_0_ROC;
+	}
+	last = i - 1;
+	xfer[last].cmd_desc[0] |= CMD_0_TOC;
+	xfer[last].completion = &done;
+
+	if (prefixed)
+		xfer--;
+
+	ret = hci->io->queue_xfer(hci, xfer, nxfers);
+	if (ret)
+		goto out;
+	if (!wait_for_completion_timeout(&done, HZ) &&
+	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
+		ret = -ETIME;
+		goto out;
+	}
+	for (i = prefixed; i < nxfers; i++) {
+		if (ccc->rnw)
+			ccc->dests[i - prefixed].payload.len =
+				RESP_DATA_LENGTH(xfer[i].response);
+		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
+			ret = -EIO;
+			goto out;
+		}
+	}
+
+	if (ccc->rnw)
+		DBG("got: %*ph",
+		    ccc->dests[0].payload.len, ccc->dests[0].payload.data);
+
+out:
+	hci_free_xfer(xfer, nxfers);
+	return ret;
+}
+
+static int i3c_hci_daa(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci = to_i3c_hci(m);
+
+	DBG("");
+
+	return hci->cmd->perform_daa(hci);
+}
+
+static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
+			      struct i3c_priv_xfer *i3c_xfers,
+			      int nxfers)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct hci_xfer *xfer;
+	DECLARE_COMPLETION_ONSTACK(done);
+	unsigned int size_limit;
+	int i, last, ret = 0;
+
+	DBG("nxfers = %d", nxfers);
+
+	xfer = hci_alloc_xfer(nxfers);
+	if (!xfer)
+		return -ENOMEM;
+
+	size_limit = 1U << (16 + FIELD_GET(HC_CAP_MAX_DATA_LENGTH, hci->caps));
+
+	for (i = 0; i < nxfers; i++) {
+		xfer[i].data_len = i3c_xfers[i].len;
+		ret = -EFBIG;
+		if (xfer[i].data_len >= size_limit)
+			goto out;
+		xfer[i].rnw = i3c_xfers[i].rnw;
+		if (i3c_xfers[i].rnw) {
+			xfer[i].data = i3c_xfers[i].data.in;
+		} else {
+			/* silence the const qualifier warning with a cast */
+			xfer[i].data = (void *) i3c_xfers[i].data.out;
+		}
+		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
+		xfer[i].cmd_desc[0] |= CMD_0_ROC;
+	}
+	last = i - 1;
+	xfer[last].cmd_desc[0] |= CMD_0_TOC;
+	xfer[last].completion = &done;
+
+	ret = hci->io->queue_xfer(hci, xfer, nxfers);
+	if (ret)
+		goto out;
+	if (!wait_for_completion_timeout(&done, HZ) &&
+	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
+		ret = -ETIME;
+		goto out;
+	}
+	for (i = 0; i < nxfers; i++) {
+		if (i3c_xfers[i].rnw)
+			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
+		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
+			ret = -EIO;
+			goto out;
+		}
+	}
+
+out:
+	hci_free_xfer(xfer, nxfers);
+	return ret;
+}
+
+static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
+			     const struct i2c_msg *i2c_xfers, int nxfers)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct hci_xfer *xfer;
+	DECLARE_COMPLETION_ONSTACK(done);
+	int i, last, ret = 0;
+
+	DBG("nxfers = %d", nxfers);
+
+	xfer = hci_alloc_xfer(nxfers);
+	if (!xfer)
+		return -ENOMEM;
+
+	for (i = 0; i < nxfers; i++) {
+		xfer[i].data = i2c_xfers[i].buf;
+		xfer[i].data_len = i2c_xfers[i].len;
+		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
+		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
+		xfer[i].cmd_desc[0] |= CMD_0_ROC;
+	}
+	last = i - 1;
+	xfer[last].cmd_desc[0] |= CMD_0_TOC;
+	xfer[last].completion = &done;
+
+	ret = hci->io->queue_xfer(hci, xfer, nxfers);
+	if (ret)
+		goto out;
+	if (!wait_for_completion_timeout(&done, HZ) &&
+	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
+		ret = -ETIME;
+		goto out;
+	}
+	for (i = 0; i < nxfers; i++) {
+		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
+			ret = -EIO;
+			goto out;
+		}
+	}
+
+out:
+	hci_free_xfer(xfer, nxfers);
+	return ret;
+}
+
+static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data;
+	int ret;
+
+	DBG("");
+
+	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
+	if (!dev_data)
+		return -ENOMEM;
+	if (hci->cmd == &mipi_i3c_hci_cmd_v1) {
+		ret = mipi_i3c_hci_dat_v1.alloc_entry(hci);
+		if (ret < 0) {
+			kfree(dev_data);
+			return ret;
+		}
+		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, ret, dev->info.dyn_addr);
+		dev_data->dat_idx = ret;
+	}
+	i3c_dev_set_master_data(dev, dev_data);
+	return 0;
+}
+
+static int i3c_hci_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn_addr)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+
+	DBG("");
+
+	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
+		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, dev_data->dat_idx,
+					     dev->info.dyn_addr);
+	return 0;
+}
+
+static void i3c_hci_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+
+	DBG("");
+
+	i3c_dev_set_master_data(dev, NULL);
+	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
+		mipi_i3c_hci_dat_v1.free_entry(hci, dev_data->dat_idx);
+	kfree(dev_data);
+}
+
+static int i3c_hci_attach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data;
+	int ret;
+
+	DBG("");
+
+	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
+		return 0;
+	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
+	if (!dev_data)
+		return -ENOMEM;
+	ret = mipi_i3c_hci_dat_v1.alloc_entry(hci);
+	if (ret < 0) {
+		kfree(dev_data);
+		return ret;
+	}
+	mipi_i3c_hci_dat_v1.set_static_addr(hci, ret, dev->addr);
+	mipi_i3c_hci_dat_v1.set_flags(hci, ret, DAT_0_I2C_DEVICE, 0);
+	dev_data->dat_idx = ret;
+	i2c_dev_set_master_data(dev, dev_data);
+	return 0;
+}
+
+static void i3c_hci_detach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data = i2c_dev_get_master_data(dev);
+
+	DBG("");
+
+	if (dev_data) {
+		i2c_dev_set_master_data(dev, NULL);
+		if (hci->cmd == &mipi_i3c_hci_cmd_v1)
+			mipi_i3c_hci_dat_v1.free_entry(hci, dev_data->dat_idx);
+		kfree(dev_data);
+	}
+}
+
+static int i3c_hci_request_ibi(struct i3c_dev_desc *dev,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	unsigned int dat_idx = dev_data->dat_idx;
+
+	if (req->max_payload_len != 0)
+		mipi_i3c_hci_dat_v1.set_flags(hci, dat_idx, DAT_0_IBI_PAYLOAD, 0);
+	else
+		mipi_i3c_hci_dat_v1.clear_flags(hci, dat_idx, DAT_0_IBI_PAYLOAD, 0);
+	return hci->io->request_ibi(hci, dev, req);
+}
+
+static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+
+	hci->io->free_ibi(hci, dev);
+}
+
+static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+
+	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+}
+
+static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+
+	mipi_i3c_hci_dat_v1.set_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	return i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+}
+
+static void i3c_hci_recycle_ibi_slot(struct i3c_dev_desc *dev,
+				     struct i3c_ibi_slot *slot)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct i3c_hci *hci = to_i3c_hci(m);
+
+	hci->io->recycle_ibi_slot(hci, dev, slot);
+}
+
+static const struct i3c_master_controller_ops i3c_hci_ops = {
+	.bus_init		= i3c_hci_bus_init,
+	.bus_cleanup		= i3c_hci_bus_cleanup,
+	.do_daa			= i3c_hci_daa,
+	.send_ccc_cmd		= i3c_hci_send_ccc_cmd,
+	.priv_xfers		= i3c_hci_priv_xfers,
+	.i2c_xfers		= i3c_hci_i2c_xfers,
+	.attach_i3c_dev		= i3c_hci_attach_i3c_dev,
+	.reattach_i3c_dev	= i3c_hci_reattach_i3c_dev,
+	.detach_i3c_dev		= i3c_hci_detach_i3c_dev,
+	.attach_i2c_dev		= i3c_hci_attach_i2c_dev,
+	.detach_i2c_dev		= i3c_hci_detach_i2c_dev,
+	.request_ibi		= i3c_hci_request_ibi,
+	.free_ibi		= i3c_hci_free_ibi,
+	.enable_ibi		= i3c_hci_enable_ibi,
+	.disable_ibi		= i3c_hci_disable_ibi,
+	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
+};
+
+static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
+{
+	struct i3c_hci *hci = dev_id;
+	irqreturn_t result = IRQ_NONE;
+	u32 val;
+
+	val = reg_read(INTR_STATUS);
+	DBG("INTR_STATUS = %#x", val);
+
+	if (val) {
+		reg_write(INTR_STATUS, val);
+	} else {
+		/* v1.0 does not have PIO cascaded notification bits */
+		val |= INTR_HC_PIO;
+	}
+
+	if (val & INTR_HC_RESET_CANCEL) {
+		DBG("cancelled reset");
+		val &= ~INTR_HC_RESET_CANCEL;
+	}
+	if (val & INTR_HC_INTERNAL_ERR) {
+		dev_err(&hci->master.dev, "Host Controller Internal Error\n");
+		val &= ~INTR_HC_INTERNAL_ERR;
+	}
+	if (val & INTR_HC_PIO) {
+		hci->io->irq_handler(hci, 0);
+		val &= ~INTR_HC_PIO;
+	}
+	if (val & INTR_HC_RINGS) {
+		hci->io->irq_handler(hci, val & INTR_HC_RINGS);
+		val &= ~INTR_HC_RINGS;
+	}
+	if (val)
+		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
+	else
+		result = IRQ_HANDLED;
+
+	return result;
+}
+
+static int i3c_hci_init(struct i3c_hci *hci)
+{
+	u32 regval, offset;
+	int ret;
+
+	/* Validate HCI hardware version */
+	regval = reg_read(HCI_VERSION);
+	hci->version_major = (regval >> 8) & 0xf;
+	hci->version_minor = (regval >> 4) & 0xf;
+	hci->revision = regval & 0xf;
+	dev_notice(&hci->master.dev, "MIPI I3C HCI v%u.%u r%02u\n",
+		   hci->version_major, hci->version_minor, hci->revision);
+	/* known versions */
+	switch (regval & ~0xf) {
+	case 0x100:	/* version 1.0 */
+	case 0x110:	/* version 1.1 */
+	case 0x200:	/* version 2.0 */
+		break;
+	default:
+		dev_err(&hci->master.dev, "unsupported HCI version\n");
+		return -EPROTONOSUPPORT;
+	}
+
+	hci->caps = reg_read(HC_CAPABILITIES);
+	DBG("caps = %#x", hci->caps);
+
+	regval = reg_read(DAT_SECTION);
+	offset = FIELD_GET(DAT_TABLE_OFFSET, regval);
+	hci->DAT_regs = offset ? hci->base_regs + offset : NULL;
+	hci->DAT_entries = FIELD_GET(DAT_TABLE_SIZE, regval);
+	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval);
+	dev_info(&hci->master.dev, "DAT: %u %u-bytes entries at offset %#x\n",
+		 hci->DAT_entries, hci->DAT_entry_size * 4, offset);
+
+	regval = reg_read(DCT_SECTION);
+	offset = FIELD_GET(DCT_TABLE_OFFSET, regval);
+	hci->DCT_regs = offset ? hci->base_regs + offset : NULL;
+	hci->DCT_entries = FIELD_GET(DCT_TABLE_SIZE, regval);
+	hci->DCT_entry_size = FIELD_GET(DCT_ENTRY_SIZE, regval);
+	dev_info(&hci->master.dev, "DCT: %u %u-bytes entries at offset %#x\n",
+		 hci->DCT_entries, hci->DCT_entry_size * 4, offset);
+
+	regval = reg_read(RING_HEADERS_SECTION);
+	offset = FIELD_GET(RING_HEADERS_OFFSET, regval);
+	hci->RHS_regs = offset ? hci->base_regs + offset : NULL;
+	dev_info(&hci->master.dev, "Ring Headers at offset %#x\n", offset);
+
+	regval = reg_read(PIO_SECTION);
+	offset = FIELD_GET(PIO_REGS_OFFSET, regval);
+	hci->PIO_regs = offset ? hci->base_regs + offset : NULL;
+	dev_info(&hci->master.dev, "PIO section at offset %#x\n", offset);
+
+	regval = reg_read(EXT_CAPS_SECTION);
+	offset = FIELD_GET(EXT_CAPS_OFFSET, regval);
+	hci->EXTCAPS_regs = offset ? hci->base_regs + offset : NULL;
+	dev_info(&hci->master.dev, "Extended Caps at offset %#x\n", offset);
+
+	ret = i3c_hci_parse_ext_caps(hci);
+	if (ret)
+		return ret;
+
+	/*
+	 * Now let's reset the hardware.
+	 * SOFT_RST must be clear before we write to it.
+	 * Then we must wait until it clears again.
+	 */
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 1, 10000);
+	if (ret)
+		return -ENXIO;
+	reg_write(RESET_CONTROL, SOFT_RST);
+	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 1, 10000);
+	if (ret)
+		return -ENXIO;
+
+	/* Disable all interrupts and allow all signal updates */
+	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+
+	/* Make sure our data ordering fits the host's */
+	regval = reg_read(HC_CONTROL);
+	if (IS_ENABLED(CONFIG_BIG_ENDIAN)) {
+		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval = reg_read(HC_CONTROL);
+			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+				dev_err(&hci->master.dev, "cannot set BE mode\n");
+				return -EOPNOTSUPP;
+			}
+		}
+	} else {
+		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval = reg_read(HC_CONTROL);
+			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+				dev_err(&hci->master.dev, "cannot clear BE mode\n");
+				return -EOPNOTSUPP;
+			}
+		}
+	}
+
+	/* Select our command descriptor model */
+	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
+	case 0:
+		hci->cmd = &mipi_i3c_hci_cmd_v1;
+		break;
+	case 1:
+		hci->cmd = &mipi_i3c_hci_cmd_v2;
+		break;
+	default:
+		dev_err(&hci->master.dev, "wrong CMD_SIZE capability value\n");
+		return -EINVAL;
+	}
+
+	/* Try activating DMA operations first */
+	if (hci->RHS_regs) {
+		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
+		if (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE) {
+			dev_err(&hci->master.dev, "PIO mode is stuck\n");
+			ret = -EIO;
+		} else {
+			hci->io = &mipi_i3c_hci_dma;
+			dev_info(&hci->master.dev, "Using DMA\n");
+		}
+	}
+
+	/* If no DMA, try PIO */
+	if (!hci->io && hci->PIO_regs) {
+		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
+		if (!(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
+			dev_err(&hci->master.dev, "DMA mode is stuck\n");
+			ret = -EIO;
+		} else {
+			hci->io = &mipi_i3c_hci_pio;
+			dev_info(&hci->master.dev, "Using PIO\n");
+		}
+	}
+
+	if (!hci->io) {
+		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
+		if (!ret)
+			ret = -EINVAL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int i3c_hci_probe(struct platform_device *pdev)
+{
+	struct i3c_hci *hci;
+	int irq, ret;
+
+	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
+	if (!hci)
+		return -ENOMEM;
+	hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hci->base_regs))
+		return PTR_ERR(hci->base_regs);
+
+	platform_set_drvdata(pdev, hci);
+	/* temporary for dev_printk's, to be replaced in i3c_master_register */
+	hci->master.dev.init_name = dev_name(&pdev->dev);
+
+	ret = i3c_hci_init(hci);
+	if (ret)
+		return ret;
+
+	irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
+			       0, NULL, hci);
+	if (ret)
+		return ret;
+
+	ret = i3c_master_register(&hci->master, &pdev->dev,
+				  &i3c_hci_ops, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int i3c_hci_remove(struct platform_device *pdev)
+{
+	struct i3c_hci *hci = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = i3c_master_unregister(&hci->master);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id i3c_hci_of_match[] = {
+	{ .compatible = "mipi-i3c-hci", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
+
+static struct platform_driver i3c_hci_driver = {
+	.probe = i3c_hci_probe,
+	.remove = i3c_hci_remove,
+	.driver = {
+		.name = "mipi-i3c-hci",
+		.of_match_table = of_match_ptr(i3c_hci_of_match),
+	},
+};
+module_platform_driver(i3c_hci_driver);
+
+MODULE_AUTHOR("Nicolas Pitre <npitre@baylibre.com>");
+MODULE_DESCRIPTION("MIPI I3C HCI driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
new file mode 100644
index 0000000000..1f0f345c3d
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common DAT related stuff
+ */
+
+#ifndef DAT_H
+#define DAT_H
+
+/* Global DAT flags */
+#define DAT_0_I2C_DEVICE		W0_BIT_(31)
+#define DAT_0_SIR_REJECT		W0_BIT_(13)
+#define DAT_0_IBI_PAYLOAD		W0_BIT_(12)
+
+struct hci_dat_ops {
+	int (*init)(struct i3c_hci *hci);
+	void (*cleanup)(struct i3c_hci *hci);
+	int (*alloc_entry)(struct i3c_hci *hci);
+	void (*free_entry)(struct i3c_hci *hci, unsigned int dat_idx);
+	void (*set_dynamic_addr)(struct i3c_hci *hci, unsigned int dat_idx, u8 addr);
+	void (*set_static_addr)(struct i3c_hci *hci, unsigned int dat_idx, u8 addr);
+	void (*set_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
+	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
+	int (*get_index)(struct i3c_hci *hci, u8 address);
+};
+
+extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
new file mode 100644
index 0000000000..783e551a2c
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "dat.h"
+
+
+/*
+ * Device Address Table Structure
+ */
+
+#define DAT_1_AUTOCMD_HDR_CODE		W1_MASK(58, 51)
+#define DAT_1_AUTOCMD_MODE		W1_MASK(50, 48)
+#define DAT_1_AUTOCMD_VALUE		W1_MASK(47, 40)
+#define DAT_1_AUTOCMD_MASK		W1_MASK(39, 32)
+/*	DAT_0_I2C_DEVICE		W0_BIT_(31) */
+#define DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29)
+#define DAT_0_RING_ID			W0_MASK(28, 26)
+#define DAT_0_DYNADDR_PARITY		W0_BIT_(23)
+#define DAT_0_DYNAMIC_ADDRESS		W0_MASK(22, 16)
+#define DAT_0_TS			W0_BIT_(15)
+#define DAT_0_MR_REJECT			W0_BIT_(14)
+/*	DAT_0_SIR_REJECT		W0_BIT_(13) */
+/*	DAT_0_IBI_PAYLOAD		W0_BIT_(12) */
+#define DAT_0_STATIC_ADDRESS		W0_MASK(6, 0)
+
+#define dat_w0_read(i)		readl(hci->DAT_regs + (i) * 8)
+#define dat_w1_read(i)		readl(hci->DAT_regs + (i) * 8 + 4)
+#define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
+#define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
+
+static inline bool dynaddr_parity(unsigned int addr)
+{
+	addr |= 1 << 7;
+	addr += addr >> 4;
+	addr += addr >> 2;
+	addr += addr >> 1;
+	return (addr & 1);
+}
+
+static int hci_dat_v1_init(struct i3c_hci *hci)
+{
+	unsigned int dat_idx;
+
+	if (!hci->DAT_regs) {
+		dev_err(&hci->master.dev,
+			"only DAT in register space is supported at the moment\n");
+		return -EOPNOTSUPP;
+	}
+	if (hci->DAT_entry_size != 8) {
+		dev_err(&hci->master.dev,
+			"only 8-bytes DAT entries are supported at the moment\n");
+		return -EOPNOTSUPP;
+	}
+
+	/* use a bitmap for faster free slot search */
+	hci->DAT_data = bitmap_zalloc(hci->DAT_entries, GFP_KERNEL);
+	if (!hci->DAT_data)
+		return -ENOMEM;
+
+	/* clear them */
+	for (dat_idx = 0; dat_idx < hci->DAT_entries; dat_idx++) {
+		dat_w0_write(dat_idx, 0);
+		dat_w1_write(dat_idx, 0);
+	}
+
+	return 0;
+}
+
+static void hci_dat_v1_cleanup(struct i3c_hci *hci)
+{
+	bitmap_free(hci->DAT_data);
+	hci->DAT_data = NULL;
+}
+
+static int hci_dat_v1_alloc_entry(struct i3c_hci *hci)
+{
+	unsigned int dat_idx;
+
+	dat_idx = find_first_zero_bit(hci->DAT_data, hci->DAT_entries);
+	if (dat_idx >= hci->DAT_entries)
+		return -ENOENT;
+	__set_bit(dat_idx, hci->DAT_data);
+
+	/* default flags */
+	dat_w0_write(dat_idx, DAT_0_SIR_REJECT | DAT_0_MR_REJECT);
+
+	return dat_idx;
+}
+
+static void hci_dat_v1_free_entry(struct i3c_hci *hci, unsigned int dat_idx)
+{
+	dat_w0_write(dat_idx, 0);
+	dat_w1_write(dat_idx, 0);
+	__clear_bit(dat_idx, hci->DAT_data);
+}
+
+static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
+					unsigned int dat_idx, u8 address)
+{
+	u32 dat_w0;
+
+	dat_w0 = dat_w0_read(dat_idx);
+	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
+	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
+		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
+	dat_w0_write(dat_idx, dat_w0);
+}
+
+static void hci_dat_v1_set_static_addr(struct i3c_hci *hci,
+				       unsigned int dat_idx, u8 address)
+{
+	u32 dat_w0;
+
+	dat_w0 = dat_w0_read(dat_idx);
+	dat_w0 &= ~DAT_0_STATIC_ADDRESS;
+	dat_w0 |= FIELD_PREP(DAT_0_STATIC_ADDRESS, address);
+	dat_w0_write(dat_idx, dat_w0);
+}
+
+static void hci_dat_v1_set_flags(struct i3c_hci *hci, unsigned int dat_idx,
+				 u32 w0_flags, u32 w1_flags)
+{
+	u32 dat_w0, dat_w1;
+
+	dat_w0 = dat_w0_read(dat_idx);
+	dat_w1 = dat_w1_read(dat_idx);
+	dat_w0 |= w0_flags;
+	dat_w1 |= w1_flags;
+	dat_w0_write(dat_idx, dat_w0);
+	dat_w1_write(dat_idx, dat_w1);
+}
+
+static void hci_dat_v1_clear_flags(struct i3c_hci *hci, unsigned int dat_idx,
+				   u32 w0_flags, u32 w1_flags)
+{
+	u32 dat_w0, dat_w1;
+
+	dat_w0 = dat_w0_read(dat_idx);
+	dat_w1 = dat_w1_read(dat_idx);
+	dat_w0 &= ~w0_flags;
+	dat_w1 &= ~w1_flags;
+	dat_w0_write(dat_idx, dat_w0);
+	dat_w1_write(dat_idx, dat_w1);
+}
+
+static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
+{
+	unsigned int dat_idx;
+	u32 dat_w0;
+
+	for (dat_idx = find_first_bit(hci->DAT_data, hci->DAT_entries);
+	     dat_idx < hci->DAT_entries;
+	     dat_idx = find_next_bit(hci->DAT_data, hci->DAT_entries, dat_idx)) {
+		dat_w0 = dat_w0_read(dat_idx);
+		if (FIELD_GET(DAT_0_DYNAMIC_ADDRESS, dat_w0) == dev_addr)
+			return dat_idx;
+	}
+
+	return -ENODEV;
+}
+
+const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
+	.init			= hci_dat_v1_init,
+	.cleanup		= hci_dat_v1_cleanup,
+	.alloc_entry		= hci_dat_v1_alloc_entry,
+	.free_entry		= hci_dat_v1_free_entry,
+	.set_dynamic_addr	= hci_dat_v1_set_dynamic_addr,
+	.set_static_addr	= hci_dat_v1_set_static_addr,
+	.set_flags		= hci_dat_v1_set_flags,
+	.clear_flags		= hci_dat_v1_clear_flags,
+	.get_index		= hci_dat_v1_get_index,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/dct.h b/drivers/i3c/master/mipi-i3c-hci/dct.h
new file mode 100644
index 0000000000..1028e0b40d
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dct.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common DCT related stuff
+ */
+
+#ifndef DCT_H
+#define DCT_H
+
+void i3c_hci_dct_get_val(struct i3c_hci *hci, unsigned int dct_idx,
+			 u64 *pid, unsigned int *dcr, unsigned int *bcr);
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/dct_v1.c b/drivers/i3c/master/mipi-i3c-hci/dct_v1.c
new file mode 100644
index 0000000000..acfd4d60f7
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dct_v1.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/device.h>
+#include <linux/bitfield.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "dct.h"
+
+/*
+ * Device Characteristic Table
+ */
+
+void i3c_hci_dct_get_val(struct i3c_hci *hci, unsigned int dct_idx,
+			 u64 *pid, unsigned int *dcr, unsigned int *bcr)
+{
+	void __iomem *reg = hci->DCT_regs + dct_idx * 4 * 4;
+	u32 dct_entry_data[4];
+	unsigned int i;
+
+	for (i = 0; i < 4; i++) {
+		dct_entry_data[i] = readl(reg);
+		reg += 4;
+	}
+
+	*pid = ((u64)dct_entry_data[0]) << (47 - 32 + 1) |
+	       FIELD_GET(W1_MASK(47, 32), dct_entry_data[1]);
+	*dcr = FIELD_GET(W2_MASK(71, 64), dct_entry_data[2]);
+	*bcr = FIELD_GET(W2_MASK(79, 72), dct_entry_data[2]);
+}
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
new file mode 100644
index 0000000000..af873a9be0
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -0,0 +1,784 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Note: The I3C HCI v2.0 spec is still in flux. The IBI support is based on
+ * v1.x of the spec and v2.0 will likely be split out.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "cmd.h"
+#include "ibi.h"
+
+
+/*
+ * Software Parameter Values (somewhat arb itrary for now).
+ * Some of them could be determined at run time eventually.
+ */
+
+#define XFER_RINGS			1	/* max: 8 */
+#define XFER_RING_ENTRIES		16	/* max: 255 */
+
+#define IBI_RINGS			1	/* max: 8 */
+#define IBI_STATUS_RING_ENTRIES		32	/* max: 255 */
+#define IBI_CHUNK_CACHELINES		1	/* max: 256 bytes equivalent */
+#define IBI_CHUNK_POOL_SIZE		128	/* max: 1023 */
+
+/*
+ * Ring Header Preamble
+ */
+
+#define rhs_reg_read(r)		readl(hci->RHS_regs + (RHS_##r))
+#define rhs_reg_write(r, v)	writel(v, hci->RHS_regs + (RHS_##r))
+
+#define RHS_CONTROL			0x00
+#define PREAMBLE_SIZE			GENMASK(31, 24)	/* Preamble Section Size */
+#define HEADER_SIZE			GENMASK(23, 16)	/* Ring Header Size */
+#define MAX_HEADER_COUNT_CAP		GENMASK(7, 4) /* HC Max Header Count */
+#define MAX_HEADER_COUNT		GENMASK(3, 0) /* Driver Max Header Count */
+
+#define RHS_RHn_OFFSET(n)		(0x04 + (n)*4)
+
+/*
+ * Ring Header (Per-Ring Bundle)
+ */
+
+#define rh_reg_read(r)		readl(rh->regs + (RH_##r))
+#define rh_reg_write(r, v)	writel(v, rh->regs + (RH_##r))
+
+#define RH_CR_SETUP			0x00	/* Command/Response Ring */
+#define CR_XFER_STRUCT_SIZE		GENMASK(31, 24)
+#define CR_RESP_STRUCT_SIZE		GENMASK(23, 16)
+#define CR_RING_SIZE			GENMASK(8, 0)
+
+#define RH_IBI_SETUP			0x04
+#define IBI_STATUS_STRUCT_SIZE		GENMASK(31, 24)
+#define IBI_STATUS_RING_SIZE		GENMASK(23, 16)
+#define IBI_DATA_CHUNK_SIZE		GENMASK(12, 10)
+#define IBI_DATA_CHUNK_COUNT		GENMASK(9, 0)
+
+#define RH_CHUNK_CONTROL			0x08
+
+#define RH_INTR_STATUS			0x10
+#define RH_INTR_STATUS_ENABLE		0x14
+#define RH_INTR_SIGNAL_ENABLE		0x18
+#define RH_INTR_FORCE			0x1c
+#define INTR_IBI_READY			BIT(12)
+#define INTR_TRANSFER_COMPLETION	BIT(11)
+#define INTR_RING_OP			BIT(10)
+#define INTR_TRANSFER_ERR		BIT(9)
+#define INTR_WARN_INS_STOP_MODE		BIT(7)
+#define INTR_IBI_RING_FULL		BIT(6)
+#define INTR_TRANSFER_ABORT		BIT(5)
+
+#define RH_RING_STATUS			0x20
+#define RING_STATUS_LOCKED		BIT(3)
+#define RING_STATUS_ABORTED		BIT(2)
+#define RING_STATUS_RUNNING		BIT(1)
+#define RING_STATUS_ENABLED		BIT(0)
+
+#define RH_RING_CONTROL			0x24
+#define RING_CTRL_ABORT			BIT(2)
+#define RING_CTRL_RUN_STOP		BIT(1)
+#define RING_CTRL_ENABLE		BIT(0)
+
+#define RH_RING_OPERATION1		0x28
+#define RING_OP1_IBI_DEQ_PTR		GENMASK(23, 16)
+#define RING_OP1_CR_SW_DEQ_PTR		GENMASK(15, 8)
+#define RING_OP1_CR_ENQ_PTR		GENMASK(7, 0)
+
+#define RH_RING_OPERATION2		0x2c
+#define RING_OP2_IBI_ENQ_PTR		GENMASK(23, 16)
+#define RING_OP2_CR_DEQ_PTR		GENMASK(7, 0)
+
+#define RH_CMD_RING_BASE_LO		0x30
+#define RH_CMD_RING_BASE_HI		0x34
+#define RH_RESP_RING_BASE_LO		0x38
+#define RH_RESP_RING_BASE_HI		0x3c
+#define RH_IBI_STATUS_RING_BASE_LO	0x40
+#define RH_IBI_STATUS_RING_BASE_HI	0x44
+#define RH_IBI_DATA_RING_BASE_LO	0x48
+#define RH_IBI_DATA_RING_BASE_HI	0x4c
+
+#define RH_CMD_RING_SG			0x50	/* Ring Scatter Gather Support */
+#define RH_RESP_RING_SG			0x54
+#define RH_IBI_STATUS_RING_SG		0x58
+#define RH_IBI_DATA_RING_SG		0x5c
+#define RING_SG_BLP			BIT(31)	/* Buffer Vs. List Pointer */
+#define RING_SG_LIST_SIZE		GENMASK(15, 0)
+
+/*
+ * Data Buffer Descriptor (in memory)
+ */
+
+#define DATA_BUF_BLP			BIT(31)	/* Buffer Vs. List Pointer */
+#define DATA_BUF_IOC			BIT(30)	/* Interrupt on Completion */
+#define DATA_BUF_BLOCK_SIZE		GENMASK(15, 0)
+
+
+struct hci_rh_data {
+	void __iomem *regs;
+	void *xfer, *resp, *ibi_status, *ibi_data;
+	dma_addr_t xfer_dma, resp_dma, ibi_status_dma, ibi_data_dma;
+	unsigned int xfer_entries, ibi_status_entries, ibi_chunks_total;
+	unsigned int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
+	unsigned int done_ptr, ibi_chunk_ptr;
+	struct hci_xfer **src_xfers;
+	spinlock_t lock;
+	struct completion op_done;
+};
+
+struct hci_rings_data {
+	unsigned int total;
+	struct hci_rh_data headers[];
+};
+
+struct hci_dma_dev_ibi_data {
+	struct i3c_generic_ibi_pool *pool;
+	unsigned int max_len;
+};
+
+static inline u32 lo32(dma_addr_t physaddr)
+{
+	return physaddr;
+}
+
+static inline u32 hi32(dma_addr_t physaddr)
+{
+	/* trickery to avoid compiler warnings on 32-bit build targets */
+	if (sizeof(dma_addr_t) > 4) {
+		u64 hi = physaddr;
+		return hi >> 32;
+	}
+	return 0;
+}
+
+static void hci_dma_cleanup(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	struct hci_rh_data *rh;
+	unsigned int i;
+
+	if (!rings)
+		return;
+
+	for (i = 0; i < rings->total; i++) {
+		rh = &rings->headers[i];
+
+		rh_reg_write(RING_CONTROL, 0);
+		rh_reg_write(CR_SETUP, 0);
+		rh_reg_write(IBI_SETUP, 0);
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+
+		if (rh->xfer)
+			dma_free_coherent(&hci->master.dev,
+					  rh->xfer_struct_sz * rh->xfer_entries,
+					  rh->xfer, rh->xfer_dma);
+		if (rh->resp)
+			dma_free_coherent(&hci->master.dev,
+					  rh->resp_struct_sz * rh->xfer_entries,
+					  rh->resp, rh->resp_dma);
+		kfree(rh->src_xfers);
+		if (rh->ibi_status)
+			dma_free_coherent(&hci->master.dev,
+					  rh->ibi_status_sz * rh->ibi_status_entries,
+					  rh->ibi_status, rh->ibi_status_dma);
+		if (rh->ibi_data_dma)
+			dma_unmap_single(&hci->master.dev, rh->ibi_data_dma,
+					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
+					 DMA_FROM_DEVICE);
+		kfree(rh->ibi_data);
+	}
+
+	rhs_reg_write(CONTROL, 0);
+
+	kfree(rings);
+	hci->io_data = NULL;
+}
+
+static int hci_dma_init(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings;
+	struct hci_rh_data *rh;
+	u32 regval;
+	unsigned int i, nr_rings, xfers_sz, resps_sz;
+	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
+	int ret;
+
+	regval = rhs_reg_read(CONTROL);
+	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
+	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
+	if (unlikely(nr_rings > 8)) {
+		dev_err(&hci->master.dev, "number of rings should be <= 8\n");
+		nr_rings = 8;
+	}
+	if (nr_rings > XFER_RINGS)
+		nr_rings = XFER_RINGS;
+	rings = kzalloc(sizeof(*rings) + nr_rings * sizeof(*rh), GFP_KERNEL);
+	if (!rings)
+		return -ENOMEM;
+	hci->io_data = rings;
+	rings->total = nr_rings;
+
+	for (i = 0; i < rings->total; i++) {
+		u32 offset = rhs_reg_read(RHn_OFFSET(i));
+
+		dev_info(&hci->master.dev, "Ring %d at offset %#x\n", i, offset);
+		ret = -EINVAL;
+		if (!offset)
+			goto err_out;
+		rh = &rings->headers[i];
+		rh->regs = hci->base_regs + offset;
+		spin_lock_init(&rh->lock);
+		init_completion(&rh->op_done);
+
+		rh->xfer_entries = XFER_RING_ENTRIES;
+
+		regval = rh_reg_read(CR_SETUP);
+		rh->xfer_struct_sz = FIELD_GET(CR_XFER_STRUCT_SIZE, regval);
+		rh->resp_struct_sz = FIELD_GET(CR_RESP_STRUCT_SIZE, regval);
+		DBG("xfer_struct_sz = %d, resp_struct_sz = %d",
+		    rh->xfer_struct_sz, rh->resp_struct_sz);
+		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
+		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
+
+		rh->xfer = dma_alloc_coherent(&hci->master.dev, xfers_sz,
+					      &rh->xfer_dma, GFP_KERNEL);
+		rh->resp = dma_alloc_coherent(&hci->master.dev, resps_sz,
+					      &rh->resp_dma, GFP_KERNEL);
+		rh->src_xfers =
+			kmalloc_array(rh->xfer_entries, sizeof(*rh->src_xfers),
+				      GFP_KERNEL);
+		ret = -ENOMEM;
+		if (!rh->xfer || !rh->resp || !rh->src_xfers)
+			goto err_out;
+
+		rh_reg_write(CMD_RING_BASE_LO, lo32(rh->xfer_dma));
+		rh_reg_write(CMD_RING_BASE_HI, hi32(rh->xfer_dma));
+		rh_reg_write(RESP_RING_BASE_LO, lo32(rh->resp_dma));
+		rh_reg_write(RESP_RING_BASE_HI, hi32(rh->resp_dma));
+
+		regval = FIELD_PREP(CR_RING_SIZE, rh->xfer_entries);
+		rh_reg_write(CR_SETUP, regval);
+
+		rh_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+		rh_reg_write(INTR_SIGNAL_ENABLE, INTR_IBI_READY |
+						 INTR_TRANSFER_COMPLETION |
+						 INTR_RING_OP |
+						 INTR_TRANSFER_ERR |
+						 INTR_WARN_INS_STOP_MODE |
+						 INTR_IBI_RING_FULL |
+						 INTR_TRANSFER_ABORT);
+
+		/* IBIs */
+
+		if (i >= IBI_RINGS)
+			goto ring_ready;
+
+		regval = rh_reg_read(IBI_SETUP);
+		rh->ibi_status_sz = FIELD_GET(IBI_STATUS_STRUCT_SIZE, regval);
+		rh->ibi_status_entries = IBI_STATUS_RING_ENTRIES;
+		rh->ibi_chunks_total = IBI_CHUNK_POOL_SIZE;
+
+		rh->ibi_chunk_sz = dma_get_cache_alignment();
+		rh->ibi_chunk_sz *= IBI_CHUNK_CACHELINES;
+		BUG_ON(rh->ibi_chunk_sz > 256);
+
+		ibi_status_ring_sz = rh->ibi_status_sz * rh->ibi_status_entries;
+		ibi_data_ring_sz = rh->ibi_chunk_sz * rh->ibi_chunks_total;
+
+		rh->ibi_status =
+			dma_alloc_coherent(&hci->master.dev, ibi_status_ring_sz,
+					   &rh->ibi_status_dma, GFP_KERNEL);
+		rh->ibi_data = kmalloc(ibi_data_ring_sz, GFP_KERNEL);
+		ret = -ENOMEM;
+		if (!rh->ibi_status || !rh->ibi_data)
+			goto err_out;
+		rh->ibi_data_dma =
+			dma_map_single(&hci->master.dev, rh->ibi_data,
+				       ibi_data_ring_sz, DMA_FROM_DEVICE);
+		if (dma_mapping_error(&hci->master.dev, rh->ibi_data_dma)) {
+			rh->ibi_data_dma = 0;
+			ret = -ENOMEM;
+			goto err_out;
+		}
+
+		regval = FIELD_PREP(IBI_STATUS_RING_SIZE,
+				    rh->ibi_status_entries) |
+			 FIELD_PREP(IBI_DATA_CHUNK_SIZE,
+				    ilog2(rh->ibi_chunk_sz) - 2) |
+			 FIELD_PREP(IBI_DATA_CHUNK_COUNT,
+				    rh->ibi_chunks_total);
+		rh_reg_write(IBI_SETUP, regval);
+
+		regval = rh_reg_read(INTR_SIGNAL_ENABLE);
+		regval |= INTR_IBI_READY;
+		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
+
+ring_ready:
+		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+	}
+
+	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
+	rhs_reg_write(CONTROL, regval);
+	return 0;
+
+err_out:
+	hci_dma_cleanup(hci);
+	return ret;
+}
+
+static void hci_dma_unmap_xfer(struct i3c_hci *hci,
+			       struct hci_xfer *xfer_list, unsigned int n)
+{
+	struct hci_xfer *xfer;
+	unsigned int i;
+
+	for (i = 0; i < n; i++) {
+		xfer = xfer_list + i;
+		dma_unmap_single(&hci->master.dev,
+				 xfer->data_dma, xfer->data_len,
+				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+	}
+}
+
+static int hci_dma_queue_xfer(struct i3c_hci *hci,
+			      struct hci_xfer *xfer_list, int n)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	struct hci_rh_data *rh;
+	unsigned int i, ring, enqueue_ptr;
+	u32 op1_val, op2_val;
+
+	/* For now we only use ring 0 */
+	ring = 0;
+	rh = &rings->headers[ring];
+
+	op1_val = rh_reg_read(RING_OPERATION1);
+	enqueue_ptr = FIELD_GET(RING_OP1_CR_ENQ_PTR, op1_val);
+	for (i = 0; i < n; i++) {
+		struct hci_xfer *xfer = xfer_list + i;
+		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
+
+		/* store cmd descriptor */
+		*ring_data++ = xfer->cmd_desc[0];
+		*ring_data++ = xfer->cmd_desc[1];
+		if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
+			*ring_data++ = xfer->cmd_desc[2];
+			*ring_data++ = xfer->cmd_desc[3];
+		}
+
+		/* first word of Data Buffer Descriptor Structure */
+		if (!xfer->data)
+			xfer->data_len = 0;
+		*ring_data++ =
+			FIELD_PREP(DATA_BUF_BLOCK_SIZE, xfer->data_len) |
+			((i == n - 1) ? DATA_BUF_IOC : 0);
+
+		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
+		if (xfer->data) {
+			xfer->data_dma =
+				dma_map_single(&hci->master.dev,
+					       xfer->data,
+					       xfer->data_len,
+					       xfer->rnw ?
+						  DMA_FROM_DEVICE :
+						  DMA_TO_DEVICE);
+			if (dma_mapping_error(&hci->master.dev,
+					      xfer->data_dma)) {
+				hci_dma_unmap_xfer(hci, xfer_list, i);
+				return -ENOMEM;
+			}
+			*ring_data++ = lo32(xfer->data_dma);
+			*ring_data++ = hi32(xfer->data_dma);
+		} else {
+			*ring_data++ = 0;
+			*ring_data++ = 0;
+		}
+
+		/* remember corresponding xfer struct */
+		rh->src_xfers[enqueue_ptr] = xfer;
+		/* remember corresponding ring/entry for this xfer structure */
+		xfer->ring_number = ring;
+		xfer->ring_entry = enqueue_ptr;
+
+		enqueue_ptr = (enqueue_ptr + 1) % rh->xfer_entries;
+
+		/*
+		 * We may update the hardware view of the enqueue pointer
+		 * only if we didn't reach its dequeue pointer.
+		 */
+		op2_val = rh_reg_read(RING_OPERATION2);
+		if (enqueue_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val)) {
+			/* the ring is full */
+			hci_dma_unmap_xfer(hci, xfer_list, i + 1);
+			return -EBUSY;
+		}
+	}
+
+	/* take care to update the hardware enqueue pointer atomically */
+	spin_lock_irq(&rh->lock);
+	op1_val = rh_reg_read(RING_OPERATION1);
+	op1_val &= ~RING_OP1_CR_ENQ_PTR;
+	op1_val |= FIELD_PREP(RING_OP1_CR_ENQ_PTR, enqueue_ptr);
+	rh_reg_write(RING_OPERATION1, op1_val);
+	spin_unlock_irq(&rh->lock);
+
+	return 0;
+}
+
+static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
+				 struct hci_xfer *xfer_list, int n)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring_number];
+	unsigned int i;
+	bool did_unqueue = false;
+
+	/* stop the ring */
+	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
+	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
+		/*
+		 * We're deep in it if ever this condition is ever met.
+		 * Hardware might still be writing to memory, etc.
+		 * Better suspend the world than risking silent corruption.
+		 */
+		dev_crit(&hci->master.dev, "unable to abort the ring\n");
+		BUG();
+	}
+
+	for (i = 0; i < n; i++) {
+		struct hci_xfer *xfer = xfer_list + i;
+		int idx = xfer->ring_entry;
+
+		/*
+		 * At the time the abort happened, the xfer might have
+		 * completed already. If not then replace corresponding
+		 * descriptor entries with a no-op.
+		 */
+		if (idx >= 0) {
+			u32 *ring_data = rh->xfer + rh->xfer_struct_sz * idx;
+
+			/* store no-op cmd descriptor */
+			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7);
+			*ring_data++ = 0;
+			if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
+				*ring_data++ = 0;
+				*ring_data++ = 0;
+			}
+
+			/* disassociate this xfer struct */
+			rh->src_xfers[idx] = NULL;
+
+			/* and unmap it */
+			hci_dma_unmap_xfer(hci, xfer, 1);
+
+			did_unqueue = true;
+		}
+	}
+
+	/* restart the ring */
+	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+
+	return did_unqueue;
+}
+
+static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	u32 op1_val, op2_val, resp, *ring_resp;
+	unsigned int tid, done_ptr = rh->done_ptr;
+	struct hci_xfer *xfer;
+
+	for (;;) {
+		op2_val = rh_reg_read(RING_OPERATION2);
+		if (done_ptr == FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val))
+			break;
+
+		ring_resp = rh->resp + rh->resp_struct_sz * done_ptr;
+		resp = *ring_resp;
+		tid = RESP_TID(resp);
+		DBG("resp = 0x%08x", resp);
+
+		xfer = rh->src_xfers[done_ptr];
+		if (!xfer) {
+			DBG("orphaned ring entry");
+		} else {
+			hci_dma_unmap_xfer(hci, xfer, 1);
+			xfer->ring_entry = -1;
+			xfer->response = resp;
+			if (tid != xfer->cmd_tid) {
+				dev_err(&hci->master.dev,
+					"response tid=%d when expecting %d\n",
+					tid, xfer->cmd_tid);
+				/* TODO: do something about it? */
+			}
+			if (xfer->completion)
+				complete(xfer->completion);
+		}
+
+		done_ptr = (done_ptr + 1) % rh->xfer_entries;
+		rh->done_ptr = done_ptr;
+	}
+
+	/* take care to update the software dequeue pointer atomically */
+	spin_lock(&rh->lock);
+	op1_val = rh_reg_read(RING_OPERATION1);
+	op1_val &= ~RING_OP1_CR_SW_DEQ_PTR;
+	op1_val |= FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
+	rh_reg_write(RING_OPERATION1, op1_val);
+	spin_unlock(&rh->lock);
+}
+
+static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	struct i3c_generic_ibi_pool *pool;
+	struct hci_dma_dev_ibi_data *dev_ibi;
+
+	dev_ibi = kmalloc(sizeof(*dev_ibi), GFP_KERNEL);
+	if (!dev_ibi)
+		return -ENOMEM;
+	pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(pool)) {
+		kfree(dev_ibi);
+		return PTR_ERR(pool);
+	}
+	dev_ibi->pool = pool;
+	dev_ibi->max_len = req->max_payload_len;
+	dev_data->ibi_data = dev_ibi;
+	return 0;
+}
+
+static void hci_dma_free_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	struct hci_dma_dev_ibi_data *dev_ibi = dev_data->ibi_data;
+
+	dev_data->ibi_data = NULL;
+	i3c_generic_ibi_free_pool(dev_ibi->pool);
+	kfree(dev_ibi);
+}
+
+static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
+				     struct i3c_dev_desc *dev,
+				     struct i3c_ibi_slot *slot)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	struct hci_dma_dev_ibi_data *dev_ibi = dev_data->ibi_data;
+
+	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
+}
+
+static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
+{
+	struct i3c_dev_desc *dev;
+	struct i3c_hci_dev_data *dev_data;
+	struct hci_dma_dev_ibi_data *dev_ibi;
+	struct i3c_ibi_slot *slot;
+	u32 op1_val, op2_val, ibi_status_error;
+	unsigned int ptr, enq_ptr, deq_ptr;
+	unsigned int ibi_size, ibi_chunks, ibi_data_offset, first_part;
+	int ibi_addr, last_ptr;
+	void *ring_ibi_data;
+	dma_addr_t ring_ibi_data_dma;
+
+	op1_val = rh_reg_read(RING_OPERATION1);
+	deq_ptr = FIELD_GET(RING_OP1_IBI_DEQ_PTR, op1_val);
+
+	op2_val = rh_reg_read(RING_OPERATION2);
+	enq_ptr = FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
+
+	ibi_status_error = 0;
+	ibi_addr = -1;
+	ibi_chunks = 0;
+	ibi_size = 0;
+	last_ptr = -1;
+
+	/* let's find all we can about this IBI */
+	for (ptr = deq_ptr; ptr != enq_ptr;
+	     ptr = (ptr + 1) % rh->ibi_status_entries) {
+		u32 ibi_status, *ring_ibi_status;
+		unsigned int chunks;
+
+		ring_ibi_status = rh->ibi_status + rh->ibi_status_sz * ptr;
+		ibi_status = *ring_ibi_status;
+		DBG("status = %#x", ibi_status);
+
+		if (ibi_status_error) {
+			/* we no longer care */
+		} else if (ibi_status & IBI_ERROR) {
+			ibi_status_error = ibi_status;
+		} else if (ibi_addr ==  -1) {
+			ibi_addr = FIELD_GET(IBI_TARGET_ADDR, ibi_status);
+		} else if (ibi_addr != FIELD_GET(IBI_TARGET_ADDR, ibi_status)) {
+			/* the address changed unexpectedly */
+			ibi_status_error = ibi_status;
+		}
+
+		chunks = FIELD_GET(IBI_CHUNKS, ibi_status);
+		ibi_chunks += chunks;
+		if (!(ibi_status & IBI_LAST_STATUS)) {
+			ibi_size += chunks * rh->ibi_chunk_sz;
+		} else {
+			ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+			last_ptr = ptr;
+			break;
+		}
+	}
+
+	/* validate what we've got */
+
+	if (last_ptr == -1) {
+		/* this IBI sequence is not yet complete */
+		DBG("no LAST_STATUS available (e=%d d=%d)", enq_ptr, deq_ptr);
+		return;
+	}
+	deq_ptr = last_ptr + 1;
+	deq_ptr %= rh->ibi_status_entries;
+
+	if (ibi_status_error) {
+		dev_err(&hci->master.dev, "IBI error from %#x\n", ibi_addr);
+		goto done;
+	}
+
+	/* determine who this is for */
+	dev = i3c_hci_addr_to_dev(hci, ibi_addr);
+	if (!dev) {
+		dev_err(&hci->master.dev,
+			"IBI for unknown device %#x\n", ibi_addr);
+		goto done;
+	}
+
+	dev_data = i3c_dev_get_master_data(dev);
+	dev_ibi = dev_data->ibi_data;
+	if (ibi_size > dev_ibi->max_len) {
+		dev_err(&hci->master.dev, "IBI payload too big (%d > %d)\n",
+			ibi_size, dev_ibi->max_len);
+		goto done;
+	}
+
+	/*
+	 * This ring model is not suitable for zero-copy processing of IBIs.
+	 * We have the data chunk ring wrap-around to deal with, meaning
+	 * that the payload might span multiple chunks beginning at the
+	 * end of the ring and wrap to the start of the ring. Furthermore
+	 * there is no guarantee that those chunks will be released in order
+	 * and in a timely manner by the upper driver. So let's just copy
+	 * them to a discrete buffer. In practice they're supposed to be
+	 * small anyway.
+	 */
+	slot = i3c_generic_ibi_get_free_slot(dev_ibi->pool);
+	if (!slot) {
+		dev_err(&hci->master.dev, "no free slot for IBI\n");
+		goto done;
+	}
+
+	/* copy first part of the payload */
+	ibi_data_offset = rh->ibi_chunk_sz * rh->ibi_chunk_ptr;
+	ring_ibi_data = rh->ibi_data + ibi_data_offset;
+	ring_ibi_data_dma = rh->ibi_data_dma + ibi_data_offset;
+	first_part = (rh->ibi_chunks_total - rh->ibi_chunk_ptr)
+			* rh->ibi_chunk_sz;
+	if (first_part > ibi_size)
+		first_part = ibi_size;
+	dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
+				first_part, DMA_FROM_DEVICE);
+	memcpy(slot->data, ring_ibi_data, first_part);
+
+	/* copy second part if any */
+	if (ibi_size > first_part) {
+		/* we wrap back to the start and copy remaining data */
+		ring_ibi_data = rh->ibi_data;
+		ring_ibi_data_dma = rh->ibi_data_dma;
+		dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_dma,
+					ibi_size - first_part, DMA_FROM_DEVICE);
+		memcpy(slot->data + first_part, ring_ibi_data,
+		       ibi_size - first_part);
+	}
+
+	/* submit it */
+	slot->dev = dev;
+	slot->len = ibi_size;
+	i3c_master_queue_ibi(dev, slot);
+
+done:
+	/* take care to update the ibi dequeue pointer atomically */
+	spin_lock(&rh->lock);
+	op1_val = rh_reg_read(RING_OPERATION1);
+	op1_val &= ~RING_OP1_IBI_DEQ_PTR;
+	op1_val |= FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
+	rh_reg_write(RING_OPERATION1, op1_val);
+	spin_unlock(&rh->lock);
+
+	/* update the chunk pointer */
+	rh->ibi_chunk_ptr += ibi_chunks;
+	rh->ibi_chunk_ptr %= rh->ibi_chunks_total;
+
+	/* and tell the hardware about freed chunks */
+	rh_reg_write(CHUNK_CONTROL, rh_reg_read(CHUNK_CONTROL) + ibi_chunks);
+}
+
+static bool hci_dma_irq_handler(struct i3c_hci *hci, unsigned int mask)
+{
+	struct hci_rings_data *rings = hci->io_data;
+	unsigned int i;
+	bool handled = false;
+
+	for (i = 0; mask && i < 8; i++) {
+		struct hci_rh_data *rh;
+		u32 status;
+
+		if (!(mask & BIT(i)))
+			continue;
+		mask &= ~BIT(i);
+
+		rh = &rings->headers[i];
+		status = rh_reg_read(INTR_STATUS);
+		DBG("rh%d status: %#x", i, status);
+		if (!status)
+			continue;
+		rh_reg_write(INTR_STATUS, status);
+
+		if (status & INTR_IBI_READY)
+			hci_dma_process_ibi(hci, rh);
+		if (status & (INTR_TRANSFER_COMPLETION | INTR_TRANSFER_ERR))
+			hci_dma_xfer_done(hci, rh);
+		if (status & INTR_RING_OP)
+			complete(&rh->op_done);
+
+		if (status & INTR_TRANSFER_ABORT)
+			dev_notice_ratelimited(&hci->master.dev,
+				"ring %d: Transfer Aborted\n", i);
+		if (status & INTR_WARN_INS_STOP_MODE)
+			dev_warn_ratelimited(&hci->master.dev,
+				"ring %d: Inserted Stop on Mode Change\n", i);
+		if (status & INTR_IBI_RING_FULL)
+			dev_err_ratelimited(&hci->master.dev,
+				"ring %d: IBI Ring Full Condition\n", i);
+
+		handled = true;
+	}
+
+	return handled;
+}
+
+const struct hci_io_ops mipi_i3c_hci_dma = {
+	.init			= hci_dma_init,
+	.cleanup		= hci_dma_cleanup,
+	.queue_xfer		= hci_dma_queue_xfer,
+	.dequeue_xfer		= hci_dma_dequeue_xfer,
+	.irq_handler		= hci_dma_irq_handler,
+	.request_ibi		= hci_dma_request_ibi,
+	.free_ibi		= hci_dma_free_ibi,
+	.recycle_ibi_slot	= hci_dma_recycle_ibi_slot,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
new file mode 100644
index 0000000000..2e9b23efdc
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/kernel.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "ext_caps.h"
+#include "xfer_mode_rate.h"
+
+
+/* Extended Capability Header */
+#define CAP_HEADER_LENGTH		GENMASK(23, 8)
+#define CAP_HEADER_ID			GENMASK(7, 0)
+
+static int hci_extcap_hardware_id(struct i3c_hci *hci, void __iomem *base)
+{
+	hci->vendor_mipi_id	= readl(base + 0x04);
+	hci->vendor_version_id	= readl(base + 0x08);
+	hci->vendor_product_id	= readl(base + 0x0c);
+
+	dev_info(&hci->master.dev, "vendor MIPI ID: %#x\n", hci->vendor_mipi_id);
+	dev_info(&hci->master.dev, "vendor version ID: %#x\n", hci->vendor_version_id);
+	dev_info(&hci->master.dev, "vendor product ID: %#x\n", hci->vendor_product_id);
+
+	/* ought to go in a table if this grows too much */
+	switch (hci->vendor_mipi_id) {
+	case MIPI_VENDOR_NXP:
+		hci->quirks |= HCI_QUIRK_RAW_CCC;
+		DBG("raw CCC quirks set");
+		break;
+	}
+
+	return 0;
+}
+
+static int hci_extcap_master_config(struct i3c_hci *hci, void __iomem *base)
+{
+	u32 master_config = readl(base + 0x04);
+	unsigned int operation_mode = FIELD_GET(GENMASK(5, 4), master_config);
+	static const char * const functionality[] = {
+		"(unknown)", "master only", "target only",
+		"primary/secondary master" };
+	dev_info(&hci->master.dev, "operation mode: %s\n", functionality[operation_mode]);
+	if (operation_mode & 0x1)
+		return 0;
+	dev_err(&hci->master.dev, "only master mode is currently supported\n");
+	return -EOPNOTSUPP;
+}
+
+static int hci_extcap_multi_bus(struct i3c_hci *hci, void __iomem *base)
+{
+	u32 bus_instance = readl(base + 0x04);
+	unsigned int count = FIELD_GET(GENMASK(3, 0), bus_instance);
+
+	dev_info(&hci->master.dev, "%d bus instances\n", count);
+	return 0;
+}
+
+static int hci_extcap_xfer_modes(struct i3c_hci *hci, void __iomem *base)
+{
+	u32 header = readl(base);
+	u32 entries = FIELD_GET(CAP_HEADER_LENGTH, header) - 1;
+	unsigned int index;
+
+	dev_info(&hci->master.dev, "transfer mode table has %d entries\n",
+		 entries);
+	base += 4;  /* skip header */
+	for (index = 0; index < entries; index++) {
+		u32 mode_entry = readl(base);
+
+		DBG("mode %d: 0x%08x", index, mode_entry);
+		/* TODO: will be needed when I3C core does more than SDR */
+		base += 4;
+	}
+
+	return 0;
+}
+
+static int hci_extcap_xfer_rates(struct i3c_hci *hci, void __iomem *base)
+{
+	u32 header = readl(base);
+	u32 entries = FIELD_GET(CAP_HEADER_LENGTH, header) - 1;
+	u32 rate_entry;
+	unsigned int index, rate, rate_id, mode_id;
+
+	base += 4;  /* skip header */
+
+	dev_info(&hci->master.dev, "available data rates:\n");
+	for (index = 0; index < entries; index++) {
+		rate_entry = readl(base);
+		DBG("entry %d: 0x%08x", index, rate_entry);
+		rate = FIELD_GET(XFERRATE_ACTUAL_RATE_KHZ, rate_entry);
+		rate_id = FIELD_GET(XFERRATE_RATE_ID, rate_entry);
+		mode_id = FIELD_GET(XFERRATE_MODE_ID, rate_entry);
+		dev_info(&hci->master.dev, "rate %d for %s = %d kHz\n",
+			 rate_id,
+			 mode_id == XFERRATE_MODE_I3C ? "I3C" :
+			 mode_id == XFERRATE_MODE_I2C ? "I2C" :
+			 "unknown mode",
+			 rate);
+		base += 4;
+	}
+
+	return 0;
+}
+
+static int hci_extcap_auto_command(struct i3c_hci *hci, void __iomem *base)
+{
+	u32 autocmd_ext_caps = readl(base + 0x04);
+	unsigned int max_count = FIELD_GET(GENMASK(3, 0), autocmd_ext_caps);
+	u32 autocmd_ext_config = readl(base + 0x08);
+	unsigned int count = FIELD_GET(GENMASK(3, 0), autocmd_ext_config);
+
+	dev_info(&hci->master.dev, "%d/%d active auto-command entries\n",
+		 count, max_count);
+	/* remember auto-command register location for later use */
+	hci->AUTOCMD_regs = base;
+	return 0;
+}
+
+static int hci_extcap_debug(struct i3c_hci *hci, void __iomem *base)
+{
+	dev_info(&hci->master.dev, "debug registers present\n");
+	hci->DEBUG_regs = base;
+	return 0;
+}
+
+static int hci_extcap_scheduled_cmd(struct i3c_hci *hci, void __iomem *base)
+{
+	dev_info(&hci->master.dev, "scheduled commands available\n");
+	/* hci->schedcmd_regs = base; */
+	return 0;
+}
+
+static int hci_extcap_non_curr_master(struct i3c_hci *hci, void __iomem *base)
+{
+	dev_info(&hci->master.dev, "Non-Current Master support available\n");
+	/* hci->NCM_regs = base; */
+	return 0;
+}
+
+static int hci_extcap_ccc_resp_conf(struct i3c_hci *hci, void __iomem *base)
+{
+	dev_info(&hci->master.dev, "CCC Response Configuration available\n");
+	return 0;
+}
+
+static int hci_extcap_global_DAT(struct i3c_hci *hci, void __iomem *base)
+{
+	dev_info(&hci->master.dev, "Global DAT available\n");
+	return 0;
+}
+
+static int hci_extcap_multilane(struct i3c_hci *hci, void __iomem *base)
+{
+	dev_info(&hci->master.dev, "Master Multi-Lane support available\n");
+	return 0;
+}
+
+static int hci_extcap_ncm_multilane(struct i3c_hci *hci, void __iomem *base)
+{
+	dev_info(&hci->master.dev, "NCM Multi-Lane support available\n");
+	return 0;
+}
+
+struct hci_ext_caps {
+	u8  id;
+	u16 min_length;
+	int (*parser)(struct i3c_hci *hci, void __iomem *base);
+};
+
+#define EXT_CAP(_id, _highest_mandatory_reg_offset, _parser) \
+	{ .id = (_id), .parser = (_parser), \
+	  .min_length = (_highest_mandatory_reg_offset)/4 + 1 }
+
+static const struct hci_ext_caps ext_capabilities[] = {
+	EXT_CAP(0x01, 0x0c, hci_extcap_hardware_id),
+	EXT_CAP(0x02, 0x04, hci_extcap_master_config),
+	EXT_CAP(0x03, 0x04, hci_extcap_multi_bus),
+	EXT_CAP(0x04, 0x24, hci_extcap_xfer_modes),
+	EXT_CAP(0x05, 0x08, hci_extcap_auto_command),
+	EXT_CAP(0x08, 0x40, hci_extcap_xfer_rates),
+	EXT_CAP(0x0c, 0x10, hci_extcap_debug),
+	EXT_CAP(0x0d, 0x0c, hci_extcap_scheduled_cmd),
+	EXT_CAP(0x0e, 0x80, hci_extcap_non_curr_master), /* TODO confirm size */
+	EXT_CAP(0x0f, 0x04, hci_extcap_ccc_resp_conf),
+	EXT_CAP(0x10, 0x08, hci_extcap_global_DAT),
+	EXT_CAP(0x9d, 0x04,	hci_extcap_multilane),
+	EXT_CAP(0x9e, 0x04, hci_extcap_ncm_multilane),
+};
+
+static int hci_extcap_vendor_NXP(struct i3c_hci *hci, void __iomem *base)
+{
+	hci->vendor_data = (__force void *)base;
+	dev_info(&hci->master.dev, "Build Date Info = %#x\n", readl(base + 1*4));
+	/* reset the FPGA */
+	writel(0xdeadbeef, base + 1*4);
+	return 0;
+}
+
+struct hci_ext_cap_vendor_specific {
+	u32 vendor;
+	u8  cap;
+	u16 min_length;
+	int (*parser)(struct i3c_hci *hci, void __iomem *base);
+};
+
+#define EXT_CAP_VENDOR(_vendor, _cap, _highest_mandatory_reg_offset) \
+	{ .vendor = (MIPI_VENDOR_##_vendor), .cap = (_cap), \
+	  .parser = (hci_extcap_vendor_##_vendor), \
+	  .min_length = (_highest_mandatory_reg_offset)/4 + 1 }
+
+static const struct hci_ext_cap_vendor_specific vendor_ext_caps[] = {
+	EXT_CAP_VENDOR(NXP, 0xc0, 0x20),
+};
+
+static int hci_extcap_vendor_specific(struct i3c_hci *hci, void __iomem *base,
+				      u32 cap_id, u32 cap_length)
+{
+	const struct hci_ext_cap_vendor_specific *vendor_cap_entry;
+	int i;
+
+	vendor_cap_entry = NULL;
+	for (i = 0; i < ARRAY_SIZE(vendor_ext_caps); i++) {
+		if (vendor_ext_caps[i].vendor == hci->vendor_mipi_id &&
+		    vendor_ext_caps[i].cap == cap_id) {
+			vendor_cap_entry = &vendor_ext_caps[i];
+			break;
+		}
+	}
+
+	if (!vendor_cap_entry) {
+		dev_notice(&hci->master.dev,
+			   "unknown ext_cap 0x%02x for vendor 0x%02x\n",
+			   cap_id, hci->vendor_mipi_id);
+		return 0;
+	}
+	if (cap_length < vendor_cap_entry->min_length) {
+		dev_err(&hci->master.dev,
+			"ext_cap 0x%02x has size %d (expecting >= %d)\n",
+			cap_id, cap_length, vendor_cap_entry->min_length);
+		return -EINVAL;
+	}
+	return vendor_cap_entry->parser(hci, base);
+}
+
+int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
+{
+	void __iomem *curr_cap = hci->EXTCAPS_regs;
+	void __iomem *end = curr_cap + 0x1000; /* some arbitrary limit */
+	u32 cap_header, cap_id, cap_length;
+	const struct hci_ext_caps *cap_entry;
+	int i, err = 0;
+
+	if (!curr_cap)
+		return 0;
+
+	for (; !err && curr_cap < end; curr_cap += cap_length * 4) {
+		cap_header = readl(curr_cap);
+		cap_id = FIELD_GET(CAP_HEADER_ID, cap_header);
+		cap_length = FIELD_GET(CAP_HEADER_LENGTH, cap_header);
+		DBG("id=0x%02x length=%d", cap_id, cap_length);
+		if (!cap_length)
+			break;
+		if (curr_cap + cap_length * 4 >= end) {
+			dev_err(&hci->master.dev,
+				"ext_cap 0x%02x has size %d (too big)\n",
+				cap_id, cap_length);
+			err = -EINVAL;
+			break;
+		}
+
+		if (cap_id >= 0xc0 && cap_id <= 0xcf) {
+			err = hci_extcap_vendor_specific(hci, curr_cap,
+							 cap_id, cap_length);
+			continue;
+		}
+
+		cap_entry = NULL;
+		for (i = 0; i < ARRAY_SIZE(ext_capabilities); i++) {
+			if (ext_capabilities[i].id == cap_id) {
+				cap_entry = &ext_capabilities[i];
+				break;
+			}
+		}
+		if (!cap_entry) {
+			dev_notice(&hci->master.dev,
+				   "unknown ext_cap 0x%02x\n", cap_id);
+		} else if (cap_length < cap_entry->min_length) {
+			dev_err(&hci->master.dev,
+				"ext_cap 0x%02x has size %d (expecting >= %d)\n",
+				cap_id, cap_length, cap_entry->min_length);
+			err = -EINVAL;
+		} else {
+			err = cap_entry->parser(hci, curr_cap);
+		}
+	}
+	return err;
+}
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.h b/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
new file mode 100644
index 0000000000..9df17822fd
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Extended Capability Definitions
+ */
+
+#ifndef EXTCAPS_H
+#define EXTCAPS_H
+
+/* MIPI vendor IDs */
+#define MIPI_VENDOR_NXP			0x11b
+
+
+int i3c_hci_parse_ext_caps(struct i3c_hci *hci);
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
new file mode 100644
index 0000000000..80beb1d5be
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common HCI stuff
+ */
+
+#ifndef HCI_H
+#define HCI_H
+
+
+/* Handy logging macro to save on line length */
+#define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
+
+/* 32-bit word aware bit and mask macros */
+#define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
+#define W1_MASK(h, l)  GENMASK((h) - 32, (l) - 32)
+#define W2_MASK(h, l)  GENMASK((h) - 64, (l) - 64)
+#define W3_MASK(h, l)  GENMASK((h) - 96, (l) - 96)
+
+/* Same for single bit macros (trailing _ to align with W*_MASK width) */
+#define W0_BIT_(x)  BIT((x) - 0)
+#define W1_BIT_(x)  BIT((x) - 32)
+#define W2_BIT_(x)  BIT((x) - 64)
+#define W3_BIT_(x)  BIT((x) - 96)
+
+
+struct hci_cmd_ops;
+
+/* Our main structure */
+struct i3c_hci {
+	struct i3c_master_controller master;
+	void __iomem *base_regs;
+	void __iomem *DAT_regs;
+	void __iomem *DCT_regs;
+	void __iomem *RHS_regs;
+	void __iomem *PIO_regs;
+	void __iomem *EXTCAPS_regs;
+	void __iomem *AUTOCMD_regs;
+	void __iomem *DEBUG_regs;
+	const struct hci_io_ops *io;
+	void *io_data;
+	const struct hci_cmd_ops *cmd;
+	atomic_t next_cmd_tid;
+	u32 caps;
+	unsigned int quirks;
+	unsigned int DAT_entries;
+	unsigned int DAT_entry_size;
+	void *DAT_data;
+	unsigned int DCT_entries;
+	unsigned int DCT_entry_size;
+	u8 version_major;
+	u8 version_minor;
+	u8 revision;
+	u32 vendor_mipi_id;
+	u32 vendor_version_id;
+	u32 vendor_product_id;
+	void *vendor_data;
+};
+
+
+/*
+ * Structure to represent a master initiated transfer.
+ * The rnw, data and data_len fields must be initialized before calling any
+ * hci->cmd->*() method. The cmd method will initialize cmd_desc[] and
+ * possibly modify (clear) the data field. Then xfer->cmd_desc[0] can
+ * be augmented with CMD_0_ROC and/or CMD_0_TOC.
+ * The completion field needs to be initialized before queueing with
+ * hci->io->queue_xfer(), and requires CMD_0_ROC to be set.
+ */
+struct hci_xfer {
+	u32 cmd_desc[4];
+	u32 response;
+	bool rnw;
+	void *data;
+	unsigned int data_len;
+	unsigned int cmd_tid;
+	struct completion *completion;
+	union {
+		struct {
+			/* PIO specific */
+			struct hci_xfer *next_xfer;
+			struct hci_xfer *next_data;
+			struct hci_xfer *next_resp;
+			unsigned int data_left;
+			u32 data_word_before_partial;
+		};
+		struct {
+			/* DMA specific */
+			dma_addr_t data_dma;
+			int ring_number;
+			int ring_entry;
+		};
+	};
+};
+
+static inline struct hci_xfer *hci_alloc_xfer(unsigned int n)
+{
+	return kzalloc(sizeof(struct hci_xfer) * n, GFP_KERNEL);
+}
+
+static inline void hci_free_xfer(struct hci_xfer *xfer, unsigned int n)
+{
+	kfree(xfer);
+}
+
+
+/* This abstracts PIO vs DMA operations */
+struct hci_io_ops {
+	bool (*irq_handler)(struct i3c_hci *hci, unsigned int mask);
+	int (*queue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
+	bool (*dequeue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
+	int (*request_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+			   const struct i3c_ibi_setup *req);
+	void (*free_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev);
+	void (*recycle_ibi_slot)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+				struct i3c_ibi_slot *slot);
+	int (*init)(struct i3c_hci *hci);
+	void (*cleanup)(struct i3c_hci *hci);
+};
+
+extern const struct hci_io_ops mipi_i3c_hci_pio;
+extern const struct hci_io_ops mipi_i3c_hci_dma;
+
+
+/* Our per device master private data */
+struct i3c_hci_dev_data {
+	int dat_idx;
+	void *ibi_data;
+};
+
+
+/* list of quirks */
+#define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
+
+
+/* global functions */
+void mipi_i3c_hci_resume(struct i3c_hci *hci);
+void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
+void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/ibi.h b/drivers/i3c/master/mipi-i3c-hci/ibi.h
new file mode 100644
index 0000000000..e1f98e264d
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/ibi.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common IBI related stuff
+ */
+
+#ifndef IBI_H
+#define IBI_H
+
+/*
+ * IBI Status Descriptor bits
+ */
+#define IBI_STS				BIT(31)
+#define IBI_ERROR			BIT(30)
+#define IBI_STATUS_TYPE			BIT(29)
+#define IBI_HW_CONTEXT			GENMASK(28, 26)
+#define IBI_TS				BIT(25)
+#define IBI_LAST_STATUS			BIT(24)
+#define IBI_CHUNKS			GENMASK(23, 16)
+#define IBI_ID				GENMASK(15, 8)
+#define IBI_TARGET_ADDR			GENMASK(15, 9)
+#define IBI_TARGET_RNW			BIT(8)
+#define IBI_DATA_LENGTH			GENMASK(7, 0)
+
+/*  handy helpers */
+static inline struct i3c_dev_desc *
+i3c_hci_addr_to_dev(struct i3c_hci *hci, unsigned int addr)
+{
+	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
+	struct i3c_dev_desc *dev;
+
+	i3c_bus_for_each_i3cdev(bus, dev) {
+		if (dev->info.dyn_addr == addr)
+			return dev;
+	}
+	return NULL;
+}
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
new file mode 100644
index 0000000000..d0272aa935
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -0,0 +1,1041 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "cmd.h"
+#include "ibi.h"
+
+
+/*
+ * PIO Access Area
+ */
+
+#define pio_reg_read(r)		readl(hci->PIO_regs + (PIO_##r))
+#define pio_reg_write(r, v)	writel(v, hci->PIO_regs + (PIO_##r))
+
+#define PIO_COMMAND_QUEUE_PORT		0x00
+#define PIO_RESPONSE_QUEUE_PORT		0x04
+#define PIO_XFER_DATA_PORT		0x08
+#define PIO_IBI_PORT			0x0c
+
+#define PIO_QUEUE_THLD_CTRL		0x10
+#define QUEUE_IBI_STATUS_THLD		GENMASK(31, 24)
+#define QUEUE_IBI_DATA_THLD		GENMASK(23, 16)
+#define QUEUE_RESP_BUF_THLD		GENMASK(15, 8)
+#define QUEUE_CMD_EMPTY_BUF_THLD	GENMASK(7, 0)
+
+#define PIO_DATA_BUFFER_THLD_CTRL	0x14
+#define DATA_RX_START_THLD		GENMASK(26, 24)
+#define DATA_TX_START_THLD		GENMASK(18, 16)
+#define DATA_RX_BUF_THLD		GENMASK(10, 8)
+#define DATA_TX_BUF_THLD		GENMASK(2, 0)
+
+#define PIO_QUEUE_SIZE			0x18
+#define TX_DATA_BUFFER_SIZE		GENMASK(31, 24)
+#define RX_DATA_BUFFER_SIZE		GENMASK(23, 16)
+#define IBI_STATUS_SIZE			GENMASK(15, 8)
+#define CR_QUEUE_SIZE			GENMASK(7, 0)
+
+#define PIO_INTR_STATUS			0x20
+#define PIO_INTR_STATUS_ENABLE		0x24
+#define PIO_INTR_SIGNAL_ENABLE		0x28
+#define PIO_INTR_FORCE			0x2c
+#define STAT_TRANSFER_BLOCKED		BIT(25)
+#define STAT_PERR_RESP_UFLOW		BIT(24)
+#define STAT_PERR_CMD_OFLOW		BIT(23)
+#define STAT_PERR_IBI_UFLOW		BIT(22)
+#define STAT_PERR_RX_UFLOW		BIT(21)
+#define STAT_PERR_TX_OFLOW		BIT(20)
+#define STAT_ERR_RESP_QUEUE_FULL	BIT(19)
+#define STAT_WARN_RESP_QUEUE_FULL	BIT(18)
+#define STAT_ERR_IBI_QUEUE_FULL		BIT(17)
+#define STAT_WARN_IBI_QUEUE_FULL	BIT(16)
+#define STAT_ERR_RX_DATA_FULL		BIT(15)
+#define STAT_WARN_RX_DATA_FULL		BIT(14)
+#define STAT_ERR_TX_DATA_EMPTY		BIT(13)
+#define STAT_WARN_TX_DATA_EMPTY		BIT(12)
+#define STAT_TRANSFER_ERR		BIT(9)
+#define STAT_WARN_INS_STOP_MODE		BIT(7)
+#define STAT_TRANSFER_ABORT		BIT(5)
+#define STAT_RESP_READY			BIT(4)
+#define STAT_CMD_QUEUE_READY		BIT(3)
+#define STAT_IBI_STATUS_THLD		BIT(2)
+#define STAT_RX_THLD			BIT(1)
+#define STAT_TX_THLD			BIT(0)
+
+#define PIO_QUEUE_CUR_STATUS		0x38
+#define CUR_IBI_Q_LEVEL			GENMASK(28, 20)
+#define CUR_RESP_Q_LEVEL		GENMASK(18, 10)
+#define CUR_CMD_Q_EMPTY_LEVEL		GENMASK(8, 0)
+
+#define PIO_DATA_BUFFER_CUR_STATUS	0x3c
+#define CUR_RX_BUF_LVL			GENMASK(26, 16)
+#define CUR_TX_BUF_LVL			GENMASK(10, 0)
+
+/*
+ * Handy status bit combinations
+ */
+
+#define STAT_LATENCY_WARNINGS		(STAT_WARN_RESP_QUEUE_FULL | \
+					 STAT_WARN_IBI_QUEUE_FULL | \
+					 STAT_WARN_RX_DATA_FULL | \
+					 STAT_WARN_TX_DATA_EMPTY | \
+					 STAT_WARN_INS_STOP_MODE)
+
+#define STAT_LATENCY_ERRORS		(STAT_ERR_RESP_QUEUE_FULL | \
+					 STAT_ERR_IBI_QUEUE_FULL | \
+					 STAT_ERR_RX_DATA_FULL | \
+					 STAT_ERR_TX_DATA_EMPTY)
+
+#define STAT_PROG_ERRORS		(STAT_TRANSFER_BLOCKED | \
+					 STAT_PERR_RESP_UFLOW | \
+					 STAT_PERR_CMD_OFLOW | \
+					 STAT_PERR_IBI_UFLOW | \
+					 STAT_PERR_RX_UFLOW | \
+					 STAT_PERR_TX_OFLOW)
+
+#define STAT_ALL_ERRORS			(STAT_TRANSFER_ABORT | \
+					 STAT_TRANSFER_ERR | \
+					 STAT_LATENCY_ERRORS | \
+					 STAT_PROG_ERRORS)
+
+struct hci_pio_dev_ibi_data {
+	struct i3c_generic_ibi_pool *pool;
+	unsigned int max_len;
+};
+
+struct hci_pio_ibi_data {
+	struct i3c_ibi_slot *slot;
+	void *data_ptr;
+	unsigned int addr;
+	unsigned int seg_len, seg_cnt;
+	unsigned int max_len;
+	bool last_seg;
+};
+
+struct hci_pio_data {
+	spinlock_t lock;
+	struct hci_xfer *curr_xfer, *xfer_queue;
+	struct hci_xfer *curr_rx, *rx_queue;
+	struct hci_xfer *curr_tx, *tx_queue;
+	struct hci_xfer *curr_resp, *resp_queue;
+	struct hci_pio_ibi_data ibi;
+	unsigned int rx_thresh_size, tx_thresh_size;
+	unsigned int max_ibi_thresh;
+	u32 reg_queue_thresh;
+	u32 enabled_irqs;
+};
+
+static int hci_pio_init(struct i3c_hci *hci)
+{
+	struct hci_pio_data *pio;
+	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
+
+	pio = kzalloc(sizeof(*pio), GFP_KERNEL);
+	if (!pio)
+		return -ENOMEM;
+
+	hci->io_data = pio;
+	spin_lock_init(&pio->lock);
+
+	size_val = pio_reg_read(QUEUE_SIZE);
+	dev_info(&hci->master.dev, "CMD/RESP FIFO = %ld entries\n",
+		 FIELD_GET(CR_QUEUE_SIZE, size_val));
+	dev_info(&hci->master.dev, "IBI FIFO = %ld bytes\n",
+		 4 * FIELD_GET(IBI_STATUS_SIZE, size_val));
+	dev_info(&hci->master.dev, "RX data FIFO = %d bytes\n",
+		 4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
+	dev_info(&hci->master.dev, "TX data FIFO = %d bytes\n",
+		 4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
+
+	/*
+	 * Let's initialize data thresholds to half of the actual FIFO size.
+	 * The start thresholds aren't used (set to 0) as the FIFO is always
+	 * serviced before the corresponding command is queued.
+	 */
+	rx_thresh = FIELD_GET(RX_DATA_BUFFER_SIZE, size_val);
+	tx_thresh = FIELD_GET(TX_DATA_BUFFER_SIZE, size_val);
+	if (hci->version_major == 1) {
+		/* those are expressed as 2^[n+1), so just sub 1 if not 0 */
+		if (rx_thresh)
+			rx_thresh -= 1;
+		if (tx_thresh)
+			tx_thresh -= 1;
+		pio->rx_thresh_size = 2 << rx_thresh;
+		pio->tx_thresh_size = 2 << tx_thresh;
+	} else {
+		/* size is 2^(n+1) and threshold is 2^n i.e. already halved */
+		pio->rx_thresh_size = 1 << rx_thresh;
+		pio->tx_thresh_size = 1 << tx_thresh;
+	}
+	val = FIELD_PREP(DATA_RX_BUF_THLD,   rx_thresh) |
+	      FIELD_PREP(DATA_TX_BUF_THLD,   tx_thresh);
+	pio_reg_write(DATA_BUFFER_THLD_CTRL, val);
+
+	/*
+	 * Let's raise an interrupt as soon as there is one free cmd slot
+	 * or one available response or IBI. For IBI data let's use half the
+	 * IBI queue size within allowed bounds.
+	 */
+	ibi_val = FIELD_GET(IBI_STATUS_SIZE, size_val);
+	pio->max_ibi_thresh = clamp_val(ibi_val/2, 1, 63);
+	val = FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
+	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
+	      FIELD_PREP(QUEUE_RESP_BUF_THLD, 1) |
+	      FIELD_PREP(QUEUE_CMD_EMPTY_BUF_THLD, 1);
+	pio_reg_write(QUEUE_THLD_CTRL, val);
+	pio->reg_queue_thresh = val;
+
+	/* Disable all IRQs but allow all status bits */
+	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+
+	/* Always accept error interrupts (will be activated on first xfer) */
+	pio->enabled_irqs = STAT_ALL_ERRORS;
+
+	return 0;
+}
+
+static void hci_pio_cleanup(struct i3c_hci *hci)
+{
+	struct hci_pio_data *pio = hci->io_data;
+
+	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
+
+	if (pio) {
+		DBG("status = %#x/%#x",
+		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+		BUG_ON(pio->curr_xfer);
+		BUG_ON(pio->curr_rx);
+		BUG_ON(pio->curr_tx);
+		BUG_ON(pio->curr_resp);
+		kfree(pio);
+		hci->io_data = NULL;
+	}
+}
+
+static void hci_pio_write_cmd(struct i3c_hci *hci, struct hci_xfer *xfer)
+{
+	DBG("cmd_desc[%d] = 0x%08x", 0, xfer->cmd_desc[0]);
+	DBG("cmd_desc[%d] = 0x%08x", 1, xfer->cmd_desc[1]);
+	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[0]);
+	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[1]);
+	if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
+		DBG("cmd_desc[%d] = 0x%08x", 2, xfer->cmd_desc[2]);
+		DBG("cmd_desc[%d] = 0x%08x", 3, xfer->cmd_desc[3]);
+		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[2]);
+		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[3]);
+	}
+}
+
+static bool hci_pio_do_rx(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_xfer *xfer = pio->curr_rx;
+	unsigned int nr_words;
+	u32 *p;
+
+	p = xfer->data;
+	p += (xfer->data_len - xfer->data_left) / 4;
+
+	while (xfer->data_left >= 4) {
+		/* bail out if FIFO hasn't reached the threshold value yet */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_RX_THLD))
+			return false;
+		nr_words = min(xfer->data_left / 4, pio->rx_thresh_size);
+		/* extract data from FIFO */
+		xfer->data_left -= nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		while (nr_words--)
+			*p++ = pio_reg_read(XFER_DATA_PORT);
+	}
+
+	/* trailing data is retrieved upon response reception */
+	return !xfer->data_left;
+}
+
+static void hci_pio_do_trailing_rx(struct i3c_hci *hci,
+				   struct hci_pio_data *pio, unsigned int count)
+{
+	struct hci_xfer *xfer = pio->curr_rx;
+	u32 *p;
+
+	DBG("%d remaining", count);
+
+	p = xfer->data;
+	p += (xfer->data_len - xfer->data_left) / 4;
+
+	if (count >= 4) {
+		unsigned int nr_words = count / 4;
+		/* extract data from FIFO */
+		xfer->data_left -= nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		while (nr_words--)
+			*p++ = pio_reg_read(XFER_DATA_PORT);
+	}
+
+	count &= 3;
+	if (count) {
+		/*
+		 * There are trailing bytes in the last word.
+		 * Fetch it and extract bytes in an endian independent way.
+		 * Unlike the TX case, we must not write memory past the
+		 * end of the destination buffer.
+		 */
+		u8 *p_byte = (u8 *)p;
+		u32 data = pio_reg_read(XFER_DATA_PORT);
+
+		xfer->data_word_before_partial = data;
+		xfer->data_left -= count;
+		data = (__force u32) cpu_to_le32(data);
+		while (count--) {
+			*p_byte++ = data;
+			data >>= 8;
+		}
+	}
+}
+
+static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_xfer *xfer = pio->curr_tx;
+	unsigned int nr_words;
+	u32 *p;
+
+	p = xfer->data;
+	p += (xfer->data_len - xfer->data_left) / 4;
+
+	while (xfer->data_left >= 4) {
+		/* bail out if FIFO free space is below set threshold */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+			return false;
+		/* we can fill up to that TX threshold */
+		nr_words = min(xfer->data_left / 4, pio->tx_thresh_size);
+		/* push data into the FIFO */
+		xfer->data_left -= nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		while (nr_words--)
+			pio_reg_write(XFER_DATA_PORT, *p++);
+	}
+
+	if (xfer->data_left) {
+		/*
+		 * There are trailing bytes to send. We can simply load
+		 * them from memory as a word which will keep those bytes
+		 * in their proper place even on a BE system. This will
+		 * also get some bytes past the actual buffer but no one
+		 * should care as they won't be sent out.
+		 */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+			return false;
+		DBG("trailing %d", xfer->data_left);
+		pio_reg_write(XFER_DATA_PORT, *p);
+		xfer->data_left = 0;
+	}
+
+	return true;
+}
+
+static bool hci_pio_process_rx(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	while (pio->curr_rx && hci_pio_do_rx(hci, pio))
+		pio->curr_rx = pio->curr_rx->next_data;
+	return !pio->curr_rx;
+}
+
+static bool hci_pio_process_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	while (pio->curr_tx && hci_pio_do_tx(hci, pio))
+		pio->curr_tx = pio->curr_tx->next_data;
+	return !pio->curr_tx;
+}
+
+static void hci_pio_queue_data(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_xfer *xfer = pio->curr_xfer;
+	struct hci_xfer *prev_queue_tail;
+
+	if (!xfer->data) {
+		xfer->data_len = xfer->data_left = 0;
+		return;
+	}
+
+	if (xfer->rnw) {
+		prev_queue_tail = pio->rx_queue;
+		pio->rx_queue = xfer;
+		if (pio->curr_rx) {
+			prev_queue_tail->next_data = xfer;
+		} else {
+			pio->curr_rx = xfer;
+			if (!hci_pio_process_rx(hci, pio))
+				pio->enabled_irqs |= STAT_RX_THLD;
+		}
+	} else {
+		prev_queue_tail = pio->tx_queue;
+		pio->tx_queue = xfer;
+		if (pio->curr_tx) {
+			prev_queue_tail->next_data = xfer;
+		} else {
+			pio->curr_tx = xfer;
+			if (!hci_pio_process_tx(hci, pio))
+				pio->enabled_irqs |= STAT_TX_THLD;
+		}
+	}
+}
+
+static void hci_pio_push_to_next_rx(struct i3c_hci *hci, struct hci_xfer *xfer,
+				    unsigned int words_to_keep)
+{
+	u32 *from = xfer->data;
+	u32 from_last;
+	unsigned int received, count;
+
+	received = (xfer->data_len - xfer->data_left) / 4;
+	if ((xfer->data_len - xfer->data_left) & 3) {
+		from_last = xfer->data_word_before_partial;
+		received += 1;
+	} else {
+		from_last = from[received];
+	}
+	from += words_to_keep;
+	count = received - words_to_keep;
+
+	while (count) {
+		unsigned int room, left, chunk, bytes_to_move;
+		u32 last_word;
+
+		xfer = xfer->next_data;
+		if (!xfer) {
+			dev_err(&hci->master.dev, "pushing RX data to unexistent xfer\n");
+			return;
+		}
+
+		room = DIV_ROUND_UP(xfer->data_len, 4);
+		left = DIV_ROUND_UP(xfer->data_left, 4);
+		chunk = min(count, room);
+		if (chunk > left) {
+			hci_pio_push_to_next_rx(hci, xfer, chunk - left);
+			left = chunk;
+			xfer->data_left = left * 4;
+		}
+
+		bytes_to_move = xfer->data_len - xfer->data_left;
+		if (bytes_to_move & 3) {
+			/* preserve word  to become partial */
+			u32 *p = xfer->data;
+
+			xfer->data_word_before_partial = p[bytes_to_move / 4];
+		}
+		memmove(xfer->data + chunk, xfer->data, bytes_to_move);
+
+		/* treat last word specially because of partial word issues */
+		chunk -= 1;
+
+		memcpy(xfer->data, from, chunk * 4);
+		xfer->data_left -= chunk * 4;
+		from += chunk;
+		count -= chunk;
+
+		last_word = (count == 1) ? from_last : *from++;
+		if (xfer->data_left < 4) {
+			/*
+			 * Like in hci_pio_do_trailing_rx(), preserve original
+			 * word to be stored partially then store bytes it
+			 * in an endian independent way.
+			 */
+			u8 *p_byte = xfer->data;
+
+			p_byte += chunk * 4;
+			xfer->data_word_before_partial = last_word;
+			last_word = (__force u32) cpu_to_le32(last_word);
+			while (xfer->data_left--) {
+				*p_byte++ = last_word;
+				last_word >>= 8;
+			}
+		} else {
+			u32 *p = xfer->data;
+
+			p[chunk] = last_word;
+			xfer->data_left -= 4;
+		}
+		count--;
+	}
+}
+
+static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
+			u32 status);
+
+static bool hci_pio_process_resp(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	while (pio->curr_resp &&
+	       (pio_reg_read(INTR_STATUS) & STAT_RESP_READY)) {
+		struct hci_xfer *xfer = pio->curr_resp;
+		u32 resp = pio_reg_read(RESPONSE_QUEUE_PORT);
+		unsigned int tid = RESP_TID(resp);
+
+		DBG("resp = 0x%08x", resp);
+		if (tid != xfer->cmd_tid) {
+			dev_err(&hci->master.dev,
+				"response tid=%d when expecting %d\n",
+				tid, xfer->cmd_tid);
+			/* let's pretend it is a prog error... any of them  */
+			hci_pio_err(hci, pio, STAT_PROG_ERRORS);
+			return false;
+		}
+		xfer->response = resp;
+
+		if (pio->curr_rx == xfer) {
+			/*
+			 * Response availability implies RX completion.
+			 * Retrieve trailing RX data if any.
+			 * Note that short reads are possible.
+			 */
+			unsigned int received, expected, to_keep;
+
+			received = xfer->data_len - xfer->data_left;
+			expected = RESP_DATA_LENGTH(xfer->response);
+			if (expected > received) {
+				hci_pio_do_trailing_rx(hci, pio,
+						       expected - received);
+			} else if (received > expected) {
+				/* we consumed data meant for next xfer */
+				to_keep = DIV_ROUND_UP(expected, 4);
+				hci_pio_push_to_next_rx(hci, xfer, to_keep);
+			}
+
+			/* then process the RX list pointer */
+			if (hci_pio_process_rx(hci, pio))
+				pio->enabled_irqs &= ~STAT_RX_THLD;
+		}
+
+		/*
+		 * We're about to give back ownership of the xfer structure
+		 * to the waiting instance. Make sure no reference to it
+		 * still exists.
+		 */
+		if (pio->curr_rx == xfer) {
+			DBG("short RX ?");
+			pio->curr_rx = pio->curr_rx->next_data;
+		} else if (pio->curr_tx == xfer) {
+			DBG("short TX ?");
+			pio->curr_tx = pio->curr_tx->next_data;
+		} else if (xfer->data_left) {
+			DBG("PIO xfer count = %d after response",
+			    xfer->data_left);
+		}
+
+		pio->curr_resp = xfer->next_resp;
+		if (xfer->completion)
+			complete(xfer->completion);
+	}
+	return !pio->curr_resp;
+}
+
+static void hci_pio_queue_resp(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_xfer *xfer = pio->curr_xfer;
+	struct hci_xfer *prev_queue_tail;
+
+	if (!(xfer->cmd_desc[0] & CMD_0_ROC))
+		return;
+
+	prev_queue_tail = pio->resp_queue;
+	pio->resp_queue = xfer;
+	if (pio->curr_resp) {
+		prev_queue_tail->next_resp = xfer;
+	} else {
+		pio->curr_resp = xfer;
+		if (!hci_pio_process_resp(hci, pio))
+			pio->enabled_irqs |= STAT_RESP_READY;
+	}
+}
+
+static bool hci_pio_process_cmd(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	while (pio->curr_xfer &&
+	       (pio_reg_read(INTR_STATUS) & STAT_CMD_QUEUE_READY)) {
+		/*
+		 * Always process the data FIFO before sending the command
+		 * so needed TX data or RX space is available upfront.
+		 */
+		hci_pio_queue_data(hci, pio);
+		/*
+		 * Then queue our response request. This will also process
+		 * the response FIFO in case it got suddenly filled up
+		 * with results from previous commands.
+		 */
+		hci_pio_queue_resp(hci, pio);
+		/*
+		 * Finally send the command.
+		 */
+		hci_pio_write_cmd(hci, pio->curr_xfer);
+		/*
+		 * And move on.
+		 */
+		pio->curr_xfer = pio->curr_xfer->next_xfer;
+	}
+	return !pio->curr_xfer;
+}
+
+static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
+{
+	struct hci_pio_data *pio = hci->io_data;
+	struct hci_xfer *prev_queue_tail;
+	int i;
+
+	DBG("n = %d", n);
+
+	/* link xfer instances together and initialize data count */
+	for (i = 0; i < n; i++) {
+		xfer[i].next_xfer = (i + 1 < n) ? &xfer[i + 1] : NULL;
+		xfer[i].next_data = NULL;
+		xfer[i].next_resp = NULL;
+		xfer[i].data_left = xfer[i].data_len;
+	}
+
+	spin_lock_irq(&pio->lock);
+	prev_queue_tail = pio->xfer_queue;
+	pio->xfer_queue = &xfer[n - 1];
+	if (pio->curr_xfer) {
+		prev_queue_tail->next_xfer = xfer;
+	} else {
+		pio->curr_xfer = xfer;
+		if (!hci_pio_process_cmd(hci, pio))
+			pio->enabled_irqs |= STAT_CMD_QUEUE_READY;
+		pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
+		DBG("status = %#x/%#x",
+		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	}
+	spin_unlock_irq(&pio->lock);
+	return 0;
+}
+
+static bool hci_pio_dequeue_xfer_common(struct i3c_hci *hci,
+					struct hci_pio_data *pio,
+					struct hci_xfer *xfer, int n)
+{
+	struct hci_xfer *p, **p_prev_next;
+	int i;
+
+	/*
+	 * To safely dequeue a transfer request, it must be either entirely
+	 * processed, or not yet processed at all. If our request tail is
+	 * reachable from either the data or resp list that means the command
+	 * was submitted and not yet completed.
+	 */
+	for (p = pio->curr_resp; p; p = p->next_resp)
+		for (i = 0; i < n; i++)
+			if (p == &xfer[i])
+				goto pio_screwed;
+	for (p = pio->curr_rx; p; p = p->next_data)
+		for (i = 0; i < n; i++)
+			if (p == &xfer[i])
+				goto pio_screwed;
+	for (p = pio->curr_tx; p; p = p->next_data)
+		for (i = 0; i < n; i++)
+			if (p == &xfer[i])
+				goto pio_screwed;
+
+	/*
+	 * The command was completed, or wasn't yet submitted.
+	 * Unlink it from the que if the later.
+	 */
+	p_prev_next = &pio->curr_xfer;
+	for (p = pio->curr_xfer; p; p = p->next_xfer) {
+		if (p == &xfer[0]) {
+			*p_prev_next = xfer[n - 1].next_xfer;
+			break;
+		}
+		p_prev_next = &p->next_xfer;
+	}
+
+	/* return true if we actually unqueued something */
+	return !!p;
+
+pio_screwed:
+	/*
+	 * Life is tough. We must invalidate the hardware state and
+	 * discard everything that is still queued.
+	 */
+	for (p = pio->curr_resp; p; p = p->next_resp) {
+		p->response = FIELD_PREP(RESP_ERR_FIELD, RESP_ERR_HC_TERMINATED);
+		if (p->completion)
+			complete(p->completion);
+	}
+	for (p = pio->curr_xfer; p; p = p->next_xfer) {
+		p->response = FIELD_PREP(RESP_ERR_FIELD, RESP_ERR_HC_TERMINATED);
+		if (p->completion)
+			complete(p->completion);
+	}
+	pio->curr_xfer = pio->curr_rx = pio->curr_tx = pio->curr_resp = NULL;
+
+	return true;
+}
+
+static bool hci_pio_dequeue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
+{
+	struct hci_pio_data *pio = hci->io_data;
+	int ret;
+
+	spin_lock_irq(&pio->lock);
+	DBG("n=%d status=%#x/%#x", n,
+	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	DBG("main_status = %#x/%#x",
+	    readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
+
+	ret = hci_pio_dequeue_xfer_common(hci, pio, xfer, n);
+	spin_unlock_irq(&pio->lock);
+	return ret;
+}
+
+static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
+			u32 status)
+{
+	/* TODO: this ought to be more sophisticated eventually */
+
+	if (pio_reg_read(INTR_STATUS) & STAT_RESP_READY) {
+		/* this may happen when an error is signaled with ROC unset */
+		u32 resp = pio_reg_read(RESPONSE_QUEUE_PORT);
+
+		dev_err(&hci->master.dev,
+			"orphan response (%#x) on error\n", resp);
+	}
+
+	/* dump states on programming errors */
+	if (status & STAT_PROG_ERRORS) {
+		u32 queue = pio_reg_read(QUEUE_CUR_STATUS);
+		u32 data = pio_reg_read(DATA_BUFFER_CUR_STATUS);
+
+		dev_err(&hci->master.dev,
+			"prog error %#lx (C/R/I = %ld/%ld/%ld, TX/RX = %ld/%ld)\n",
+			status & STAT_PROG_ERRORS,
+			FIELD_GET(CUR_CMD_Q_EMPTY_LEVEL, queue),
+			FIELD_GET(CUR_RESP_Q_LEVEL, queue),
+			FIELD_GET(CUR_IBI_Q_LEVEL, queue),
+			FIELD_GET(CUR_TX_BUF_LVL, data),
+			FIELD_GET(CUR_RX_BUF_LVL, data));
+	}
+
+	/* just bust out everything with pending responses for now */
+	hci_pio_dequeue_xfer_common(hci, pio, pio->curr_resp, 1);
+	/* ... and half-way TX transfers if any */
+	if (pio->curr_tx && pio->curr_tx->data_left != pio->curr_tx->data_len)
+		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
+	/* then reset the hardware */
+	mipi_i3c_hci_pio_reset(hci);
+	mipi_i3c_hci_resume(hci);
+
+	DBG("status=%#x/%#x",
+	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+}
+
+static void hci_pio_set_ibi_thresh(struct i3c_hci *hci,
+				   struct hci_pio_data *pio,
+				   unsigned int thresh_val)
+{
+	u32 regval = pio->reg_queue_thresh;
+
+	regval &= ~QUEUE_IBI_STATUS_THLD;
+	regval |= FIELD_PREP(QUEUE_IBI_STATUS_THLD, thresh_val);
+	/* write the threshold reg only if it changes */
+	if (regval != pio->reg_queue_thresh) {
+		pio_reg_write(QUEUE_THLD_CTRL, regval);
+		pio->reg_queue_thresh = regval;
+		DBG("%d", thresh_val);
+	}
+}
+
+static bool hci_pio_get_ibi_segment(struct i3c_hci *hci,
+				    struct hci_pio_data *pio)
+{
+	struct hci_pio_ibi_data *ibi = &pio->ibi;
+	unsigned int nr_words, thresh_val;
+	u32 *p;
+
+	p = ibi->data_ptr;
+	p += (ibi->seg_len - ibi->seg_cnt) / 4;
+
+	while ((nr_words = ibi->seg_cnt/4)) {
+		/* determine our IBI queue threshold value */
+		thresh_val = min(nr_words, pio->max_ibi_thresh);
+		hci_pio_set_ibi_thresh(hci, pio, thresh_val);
+		/* bail out if we don't have that amount of data ready */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+			return false;
+		/* extract the data from the IBI port */
+		nr_words = thresh_val;
+		ibi->seg_cnt -= nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, ibi->seg_cnt);
+		while (nr_words--)
+			*p++ = pio_reg_read(IBI_PORT);
+	}
+
+	if (ibi->seg_cnt) {
+		/*
+		 * There are trailing bytes in the last word.
+		 * Fetch it and extract bytes in an endian independent way.
+		 * Unlike the TX case, we must not write past the end of
+		 * the destination buffer.
+		 */
+		u32 data;
+		u8 *p_byte = (u8 *)p;
+
+		hci_pio_set_ibi_thresh(hci, pio, 1);
+		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+			return false;
+		DBG("trailing %d", ibi->seg_cnt);
+		data = pio_reg_read(IBI_PORT);
+		data = (__force u32) cpu_to_le32(data);
+		while (ibi->seg_cnt--) {
+			*p_byte++ = data;
+			data >>= 8;
+		}
+	}
+
+	return true;
+}
+
+static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_pio_ibi_data *ibi = &pio->ibi;
+	struct i3c_dev_desc *dev;
+	struct i3c_hci_dev_data *dev_data;
+	struct hci_pio_dev_ibi_data *dev_ibi;
+	u32 ibi_status;
+
+	/*
+	 * We have a new IBI. Try to set up its payload retrieval.
+	 * When returning true, the IBI data has to be consumed whether
+	 * or not we are set up to capture it. If we return true with
+	 * ibi->slot == NULL that means the data payload has to be
+	 * drained out of the IBI port and dropped.
+	 */
+
+	ibi_status = pio_reg_read(IBI_PORT);
+	DBG("status = %#x", ibi_status);
+	ibi->addr = FIELD_GET(IBI_TARGET_ADDR, ibi_status);
+	if (ibi_status & IBI_ERROR) {
+		dev_err(&hci->master.dev, "IBI error from %#x\n", ibi->addr);
+		return false;
+	}
+
+	ibi->last_seg = ibi_status & IBI_LAST_STATUS;
+	ibi->seg_len = FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+	ibi->seg_cnt = ibi->seg_len;
+
+	dev = i3c_hci_addr_to_dev(hci, ibi->addr);
+	if (!dev) {
+		dev_err(&hci->master.dev,
+			"IBI for unknown device %#x\n", ibi->addr);
+		return true;
+	}
+
+	dev_data = i3c_dev_get_master_data(dev);
+	dev_ibi = dev_data->ibi_data;
+	ibi->max_len = dev_ibi->max_len;
+
+	if (ibi->seg_len > ibi->max_len) {
+		dev_err(&hci->master.dev, "IBI payload too big (%d > %d)\n",
+			ibi->seg_len, ibi->max_len);
+		return true;
+	}
+
+	ibi->slot = i3c_generic_ibi_get_free_slot(dev_ibi->pool);
+	if (!ibi->slot) {
+		dev_err(&hci->master.dev, "no free slot for IBI\n");
+	} else {
+		ibi->slot->len = 0;
+		ibi->data_ptr = ibi->slot->data;
+	}
+	return true;
+}
+
+static void hci_pio_free_ibi_slot(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_pio_ibi_data *ibi = &pio->ibi;
+	struct hci_pio_dev_ibi_data *dev_ibi;
+
+	if (ibi->slot) {
+		dev_ibi = ibi->slot->dev->common.master_priv;
+		i3c_generic_ibi_recycle_slot(dev_ibi->pool, ibi->slot);
+		ibi->slot = NULL;
+	}
+}
+
+static bool hci_pio_process_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_pio_ibi_data *ibi = &pio->ibi;
+
+	if (!ibi->slot && !ibi->seg_cnt && ibi->last_seg)
+		if (!hci_pio_prep_new_ibi(hci, pio))
+			return false;
+
+	for (;;) {
+		u32 ibi_status;
+		unsigned int ibi_addr;
+
+		if (ibi->slot) {
+			if (!hci_pio_get_ibi_segment(hci, pio))
+				return false;
+			ibi->slot->len += ibi->seg_len;
+			ibi->data_ptr += ibi->seg_len;
+			if (ibi->last_seg) {
+				/* was the last segment: submit it and leave */
+				i3c_master_queue_ibi(ibi->slot->dev, ibi->slot);
+				ibi->slot = NULL;
+				hci_pio_set_ibi_thresh(hci, pio, 1);
+				return true;
+			}
+		} else if (ibi->seg_cnt) {
+			/*
+			 * No slot but a non-zero count. This is the result
+			 * of some error and the payload must be drained.
+			 * This normally does not happen therefore no need
+			 * to be extra optimized here.
+			 */
+			hci_pio_set_ibi_thresh(hci, pio, 1);
+			do {
+				if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+					return false;
+				pio_reg_read(IBI_PORT);
+			} while (--ibi->seg_cnt);
+			if (ibi->last_seg)
+				return true;
+		}
+
+		/* try to move to the next segment right away */
+		hci_pio_set_ibi_thresh(hci, pio, 1);
+		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+			return false;
+		ibi_status = pio_reg_read(IBI_PORT);
+		ibi_addr = FIELD_GET(IBI_TARGET_ADDR, ibi_status);
+		if (ibi->addr != ibi_addr) {
+			/* target address changed before last segment */
+			dev_err(&hci->master.dev,
+				"unexp IBI address changed from %d to %d\n",
+				ibi->addr, ibi_addr);
+			hci_pio_free_ibi_slot(hci, pio);
+		}
+		ibi->last_seg = ibi_status & IBI_LAST_STATUS;
+		ibi->seg_len = FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+		ibi->seg_cnt = ibi->seg_len;
+		if (ibi->slot && ibi->slot->len + ibi->seg_len > ibi->max_len) {
+			dev_err(&hci->master.dev,
+				"IBI payload too big (%d > %d)\n",
+				ibi->slot->len + ibi->seg_len, ibi->max_len);
+			hci_pio_free_ibi_slot(hci, pio);
+		}
+	}
+
+	return false;
+}
+
+static int hci_pio_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	struct i3c_generic_ibi_pool *pool;
+	struct hci_pio_dev_ibi_data *dev_ibi;
+
+	dev_ibi = kmalloc(sizeof(*dev_ibi), GFP_KERNEL);
+	if (!dev_ibi)
+		return -ENOMEM;
+	pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(pool)) {
+		kfree(dev_ibi);
+		return PTR_ERR(pool);
+	}
+	dev_ibi->pool = pool;
+	dev_ibi->max_len = req->max_payload_len;
+	dev_data->ibi_data = dev_ibi;
+	return 0;
+}
+
+static void hci_pio_free_ibi(struct i3c_hci *hci, struct i3c_dev_desc *dev)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	struct hci_pio_dev_ibi_data *dev_ibi = dev_data->ibi_data;
+
+	dev_data->ibi_data = NULL;
+	i3c_generic_ibi_free_pool(dev_ibi->pool);
+	kfree(dev_ibi);
+}
+
+static void hci_pio_recycle_ibi_slot(struct i3c_hci *hci,
+				    struct i3c_dev_desc *dev,
+				    struct i3c_ibi_slot *slot)
+{
+	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	struct hci_pio_dev_ibi_data *dev_ibi = dev_data->ibi_data;
+
+	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
+}
+
+static bool hci_pio_irq_handler(struct i3c_hci *hci, unsigned int unused)
+{
+	struct hci_pio_data *pio = hci->io_data;
+	u32 status;
+
+	spin_lock(&pio->lock);
+	status = pio_reg_read(INTR_STATUS);
+	DBG("(in) status: %#x/%#x", status, pio->enabled_irqs);
+	status &= pio->enabled_irqs | STAT_LATENCY_WARNINGS;
+	if (!status) {
+		spin_unlock(&pio->lock);
+		return false;
+	}
+
+	if (status & STAT_IBI_STATUS_THLD)
+		hci_pio_process_ibi(hci, pio);
+
+	if (status & STAT_RX_THLD)
+		if (hci_pio_process_rx(hci, pio))
+			pio->enabled_irqs &= ~STAT_RX_THLD;
+	if (status & STAT_TX_THLD)
+		if (hci_pio_process_tx(hci, pio))
+			pio->enabled_irqs &= ~STAT_TX_THLD;
+	if (status & STAT_RESP_READY)
+		if (hci_pio_process_resp(hci, pio))
+			pio->enabled_irqs &= ~STAT_RESP_READY;
+
+	if (unlikely(status & STAT_LATENCY_WARNINGS)) {
+		pio_reg_write(INTR_STATUS, status & STAT_LATENCY_WARNINGS);
+		dev_warn_ratelimited(&hci->master.dev,
+				     "encountered warning condition %#lx\n",
+				     status & STAT_LATENCY_WARNINGS);
+	}
+
+	if (unlikely(status & STAT_ALL_ERRORS)) {
+		pio_reg_write(INTR_STATUS, status & STAT_ALL_ERRORS);
+		hci_pio_err(hci, pio, status & STAT_ALL_ERRORS);
+	}
+
+	if (status & STAT_CMD_QUEUE_READY)
+		if (hci_pio_process_cmd(hci, pio))
+			pio->enabled_irqs &= ~STAT_CMD_QUEUE_READY;
+
+	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
+	DBG("(out) status: %#x/%#x",
+	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	spin_unlock(&pio->lock);
+	return true;
+}
+
+const struct hci_io_ops mipi_i3c_hci_pio = {
+	.init			= hci_pio_init,
+	.cleanup		= hci_pio_cleanup,
+	.queue_xfer		= hci_pio_queue_xfer,
+	.dequeue_xfer		= hci_pio_dequeue_xfer,
+	.irq_handler		= hci_pio_irq_handler,
+	.request_ibi		= hci_pio_request_ibi,
+	.free_ibi		= hci_pio_free_ibi,
+	.recycle_ibi_slot	= hci_pio_recycle_ibi_slot,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/xfer_mode_rate.h b/drivers/i3c/master/mipi-i3c-hci/xfer_mode_rate.h
new file mode 100644
index 0000000000..1e36b75afb
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/xfer_mode_rate.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Transfer Mode/Rate Table definitions as found in extended capability
+ * sections 0x04 and 0x08.
+ * This applies starting from I3C HCI v2.0.
+ */
+
+#ifndef XFER_MODE_RATE_H
+#define XFER_MODE_RATE_H
+
+/*
+ * Master Transfer Mode Table Fixed Indexes.
+ *
+ * Indexes 0x0 and 0x8 are mandatory. Availability for the rest must be
+ * obtained from the mode table in the extended capability area.
+ * Presence and definitions for indexes beyond these ones may vary.
+ */
+#define XFERMODE_IDX_I3C_SDR		0x00	/* I3C SDR Mode */
+#define XFERMODE_IDX_I3C_HDR_DDR	0x01	/* I3C HDR-DDR Mode */
+#define XFERMODE_IDX_I3C_HDR_T		0x02	/* I3C HDR-Ternary Mode */
+#define XFERMODE_IDX_I3C_HDR_BT		0x03	/* I3C HDR-BT Mode */
+#define XFERMODE_IDX_I2C		0x08	/* Legacy I2C Mode */
+
+/*
+ * Transfer Mode Table Entry Bits Definitions
+ */
+#define XFERMODE_VALID_XFER_ADD_FUNC	GENMASK(21, 16)
+#define XFERMODE_ML_DATA_XFER_CODING	GENMASK(15, 11)
+#define XFERMODE_ML_ADDL_LANES		GENMASK(10, 8)
+#define XFERMODE_SUPPORTED		BIT(7)
+#define XFERMODE_MODE			GENMASK(3, 0)
+
+/*
+ * Master Data Transfer Rate Selector Values.
+ *
+ * These are the values to be used in the command descriptor XFER_RATE field
+ * and found in the RATE_ID field below.
+ * The I3C_SDR0, I3C_SDR1, I3C_SDR2, I3C_SDR3, I3C_SDR4 and I2C_FM rates
+ * are required, everything else is optional and discoverable in the
+ * Data Transfer Rate Table. Indicated are typical rates. The actual
+ * rates may vary slightly and are also specified in the Data Transfer
+ * Rate Table.
+ */
+#define XFERRATE_I3C_SDR0		0x00	/* 12.5 MHz */
+#define XFERRATE_I3C_SDR1		0x01	/* 8 MHz */
+#define XFERRATE_I3C_SDR2		0x02	/* 6 MHz */
+#define XFERRATE_I3C_SDR3		0x03	/* 4 MHz */
+#define XFERRATE_I3C_SDR4		0x04	/* 2 MHz */
+#define XFERRATE_I3C_SDR_FM_FMP		0x05	/* 400 KHz / 1 MHz */
+#define XFERRATE_I3C_SDR_USER6		0x06	/* User Defined */
+#define XFERRATE_I3C_SDR_USER7		0x07	/* User Defined */
+
+#define XFERRATE_I2C_FM			0x00	/* 400 KHz */
+#define XFERRATE_I2C_FMP		0x01	/* 1 MHz */
+#define XFERRATE_I2C_USER2		0x02	/* User Defined */
+#define XFERRATE_I2C_USER3		0x03	/* User Defined */
+#define XFERRATE_I2C_USER4		0x04	/* User Defined */
+#define XFERRATE_I2C_USER5		0x05	/* User Defined */
+#define XFERRATE_I2C_USER6		0x06	/* User Defined */
+#define XFERRATE_I2C_USER7		0x07	/* User Defined */
+
+/*
+ * Master Data Transfer Rate Table Mode ID values.
+ */
+#define XFERRATE_MODE_I3C		0x00
+#define XFERRATE_MODE_I2C		0x08
+
+/*
+ * Master Data Transfer Rate Table Entry Bits Definitions
+ */
+#define XFERRATE_MODE_ID		GENMASK(31, 28)
+#define XFERRATE_RATE_ID		GENMASK(22, 20)
+#define XFERRATE_ACTUAL_RATE_KHZ	GENMASK(19, 0)
+
+#endif
-- 
2.26.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
