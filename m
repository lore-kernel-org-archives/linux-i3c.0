Return-Path: <SRS0=aOFA=53=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B10C2BA19
	for <linux-i3c@archiver.kernel.org>; Sat, 11 Apr 2020 20:38:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC7720708
	for <linux-i3c@archiver.kernel.org>; Sat, 11 Apr 2020 20:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hYKAe3D2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC7720708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcTkTcX36fDsOror5nkBxmjUOEsauwEeB1SyfHx/AZc=; b=hYKAe3D2JWZaqx
	KeAxWam5RK3SYzl2oY8fehOc7p006LPObVV21ZDF9u0okR0L9H/3bM40aQIQWgiMWfHu/IpWwYd2h
	zLpitjsYhXLQiSNE2uofLG4PGwajpewzQsfn2/oAsOueqmNpuuRURBC9DCjroQELm7b2+IBu2IYOD
	86ufIxyG6RfFWc+OmnRfmuYbrPq+w38r9ZA0vrg8JkNuEIOyVgY6ptfzV60ZBRSC/Dz5OE3fBUFMb
	KMnmj+z/UwJfdHAwElo1PYJtAXwwsj9AV31iulg02wufbqfirRdEG5c+qDTSvyJxrAhxR31HSVESL
	ktomvaBc1LE/VJ2VfeBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNMty-0000Y0-0t; Sat, 11 Apr 2020 20:38:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNMtu-0000X6-A8
 for linux-i3c@lists.infradead.org; Sat, 11 Apr 2020 20:38:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B466F2A07BF;
 Sat, 11 Apr 2020 21:38:46 +0100 (BST)
Date: Sat, 11 Apr 2020 22:38:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Conor Culhane <conor.culhane@silvaco.com>
Subject: Re: [PATCH] i3c: master: Add driver for Silvaco I3C Dual-Role
 Master IP
Message-ID: <20200411223843.631c7710@collabora.com>
In-Reply-To: <20200411140353.16872a7f@collabora.com>
References: <20200325160047.11082-1-conor.culhane@silvaco.com>
 <20200411140353.16872a7f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_133850_619066_237D0596 
X-CRM114-Status: GOOD (  18.84  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, 11 Apr 2020 14:03:53 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > +/*
> > + * I3C Master Driver Control Block
> > + *
> > + * Specific to Linux only, this is the control block for the Silvco I3C
> > + * Dual-Role master driver. Provides an abstraction above the hardware
> > + * specific device control block.
> > + */
> > +struct svc_i3c_master {
> > +	struct i3c_master_controller base; // I3C master controller
> > +	spinlock_t access_lock; /* Device access_lock */
> > +
> > +	// IBI Control Block:
> > +	struct {
> > +		unsigned int num_ibi_devices;
> > +		struct i3c_dev_desc **dev_desc;
> > +		spinlock_t lock; /* spinlock */
> > +	} ibi;
> > +
> > +	void __iomem *regs; // Base address for the I3C DRM register map
> > +
> > +	struct clk *pclk; // Main/system clock clock
> > +	struct clk *fclk_i3c; // I3C peripheral clock
> > +	struct clk *clk_slow_12_5; // Fixed 12.5 MHz clock
> > +
> > +	u32 i3c_pp_clk_div;
> > +	u32 i3c_od_clk_div;
> > +	u32 i2c_clk_div;
> > +
> > +	fp_event_handler_t event_handler; // func ptr to handler callback
> > +
> > +	struct svc_i3c_dev_s *p_dev; // Pointer to HAL device control block  
> 
> Not sure what this is, but please note that we don't accept HALs in the
> kernel. If that's what this driver is (a wrapper around a HAL), please
> redesign it to access registers directly. I didn't go through the rest
> of the driver, but it looks like there are a lot of unnecessary
> indirection, and getting rid of those indirections should help shrink
> the driver. 

Okay, let's take a fresh start, otherwise I fear getting this driver
in an upstream-ready will take too much time. Here's a skeleton, it
contains almost nothing but gives hint about how I'd like things to be
done. It's basically all about getting rid of this HAL you have. Feel
free to take inspiration from the cdns and dw drivers.

--->8---
diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 4e80a1fcbf91..032b4de14277 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -21,3 +21,11 @@ config DW_I3C_MASTER
 
          This driver can also be built as a module.  If so, the module
          will be called dw-i3c-master.
+
+config SVC_I3C_MASTER
+       tristate "Silvaco I3C Dual-Role Master driver"
+       depends on I3C
+       depends on HAS_IOMEM
+       depends on !(ALPHA || PARISC)
+       help
+         Support for Silvaco I3C Dual-Role Master Controller.
diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index 7eea9e086144..69e5f5479df9 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)          += i3c-master-cdns.o
 obj-$(CONFIG_DW_I3C_MASTER)            += dw-i3c-master.o
+obj-$(CONFIG_SVC_I3C_MASTER)           += svc-i3c-master.o
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
new file mode 100644
index 000000000000..911ab34d6729
--- /dev/null
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Silvaco, Inc.
+ *
+ * Author: Conor Culhane <conor.culhane@silvaco.com>
+ */
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/*
+ * Master registers are prefixed with I3CM_, slave ones with I3CS_, and those
+ * that are mode agnostic I3C_.
+ */
+#define I3CM_CONFIG                            0x000
+#define I3CM_CONFIG_MODE_DISABLED              (0 << 0)
+#define I3CM_CONFIG_MODE_MASTER                        (1 << 0)
+#define I3CM_CONFIG_MODE_SEC_MASTER            (2 << 0)
+#define I3CM_CONFIG_DISABLE_TIMEOUT            BIT(3)
+#define I3CM_CONFIG_HIGH_KEEPER_NONE           (0 << 4)
+#define I3CM_CONFIG_HIGH_KEEPER_ON_CHIP                (1 << 4)
+#define I3CM_CONFIG_HIGH_KEEPER_EXT_SDA                (2 << 4)
+#define I3CM_CONFIG_HIGH_KEEPER_EXT_SDA_SCL    (3 << 4)
+#define I3CM_CONFIG_OPENDRAIN_STOP_SPEED       BIT(6)
+#define I3CM_CONFIG_PUSHPULL_BAUD(x)           (((x) & GENMASK(3, 0)) << 8)
+#define I3CM_CONFIG_PUSHPULL_LOW(x)            (((x) & GENMASK(3, 0)) << 12)
+#define I3CM_CONFIG_OPENDRAIN_BAUD(x)          (((x) & GENMASK(7, 0)) << 16)
+#define I3CM_CONFIG_OPENDRAIN_HPP              BIT(24)
+#define I3CM_CONFIG_SKEW(x)                    (((x) & GENMASK(2, 0)) << 25)
+#define I3CM_CONFIG_I2C_BAUD(x)                        (((x) & GENMASK(3, 0)) << 28)
+
+#define I3CS_CONFIG                            0x004
+#define I3CS_CONFIG_SLVENA                     BIT(0)
+#define I3CS_CONFIG_NACK                       BIT(1)
+#define I3CS_CONFIG_MATCHSS                    BIT(2)
+#define I3CS_CONFIG_S0IGNORE                   BIT(3)
+#define I3CS_CONFIG_DDROK                      BIT(4)
+#define I3CS_CONFIG_IRAND                      BIT(8)
+#define I3CS_CONFIG_BAMATCH(x)                 (((x) & GENMASK(7, 0)) << 16)
+#define I3CS_CONFIG_SADDR(x)                   (((x) & GENMASK(6, 0)) << 25)
+
+#define I3CS_STATUS                            0x008
+#define I3CS_CTRL                              0x00C
+
+#define I3CS_INT_ENABLE                                0x010
+#define I3CS_INT_CLEAR                         0x014
+#define I3CS_INT_STATUS                                0x018
+#define I3CS_INT_START                         BIT(8)
+#define I3CS_INT_MATCHED                       BIT(9)
+#define I3CS_INT_STOP                          BIT(10)
+#define I3CS_INT_RXPEND                                BIT(11)
+#define I3CS_INT_TXNOTFULL                     BIT(12)
+#define I3CS_INT_DACHG                         BIT(13)
+#define I3CS_INT_CCC                           BIT(14)
+#define I3CS_INT_ERRWARN                       BIT(15)
+#define I3CS_INT_DDRMATCH                      BIT(16)
+#define I3CS_INT_CHANDLED                      BIT(17)
+#define I3CS_INT_EVENT                         BIT(18)
+
+#define I3CS_ERRWARN                           0x01C
+#define I3CS_DMACTRL                           0x020
+#define I3CS_DATACTRL                          0x02C
+#define I3CS_WDATAB                            0x030
+#define I3CS_WDATABE                           0x034
+#define I3CS_WDATAH                            0x038
+#define I3CS_WDATAHE                           0x03C
+#define I3CS_RDATAB                            0x040
+#define I3CS_RDATAH                            0x048
+#define I3CS_CAPABILITIES                      0x060
+#define I3CS_DYNADDR                           0x064
+#define I3CS_MAXLIMITS                         0x068
+#define I3CS_PARTNO                            0x06C
+#define I3CS_IDEXT                             0x070
+#define I3CS_VENDORID                          0x074
+#define I3CS_TCCLOCK                           0x078
+
+#define I3CM_CTRL                              0x084
+#define I3CM_CTRL_REQUEST_NONE                 0
+#define I3CM_CTRL_REQUEST_START_ADDR           1
+#define I3CM_CTRL_REQUEST_STOP                 2
+#define I3CM_CTRL_REQUEST_IBI_ACKNACK          3
+#define I3CM_CTRL_REQUEST_PROC_DAA             4
+#define I3CM_CTRL_REQUEST_RESERVED             5
+#define I3CM_CTRL_REQUEST_FORCE_EXIT           6
+#define I3CM_CTRL_REQUEST_AUTO_IBI             7
+#define I3CM_CTRL_TYPE_I3C_SDR                 (0 << 4)
+#define I3CM_CTRL_TYPE_I2C                     (1 << 4)
+#define I3CM_CTRL_TYPE_I3C_HDR_DDR             (2 << 4)
+#define I3CM_CTRL_IBIRESP_ACK_NO_BYTE          (0 << 6)
+#define I3CM_CTRL_IBIRESP_NACK                 (1 << 6)
+#define I3CM_CTRL_IBIRESP_ACK_WITH_BYTE                (2 << 6)
+#define I3CM_CTRL_IBIRESP_MANUAL               (3 << 6)
+#define I3CM_CTRL_DIR_READ                     BIT(8)
+#define I3CM_CTRL_ADDR(x)                      (((x) & GENMASK(6, 0)) << 9)
+#define I3CM_CTRL_RDTERM(x)                    (((x) & GENMASK(7, 0)) << 16)
+
+#define I3CM_STATUS                            0x088
+#define I3CM_STATUS_STATE(v)                   ((v) & GENMASK(2, 0))
+#define I3CM_STATUS_STATE_IDLE                 0
+#define I3CM_STATUS_STATE_SLVREQ               1
+#define I3CM_STATUS_STATE_MSGSDR               2
+#define I3CM_STATUS_STATE_NORMACT              3
+#define I3CM_STATUS_STATE_DDR                  4
+#define I3CM_STATUS_STATE_DAA                  5
+#define I3CM_STATUS_STATE_IBIACK               6
+#define I3CM_STATUS_STATE_IBIRCV               7
+#define I3CM_STATUS_BETWEEN                    BIT(4)
+#define I3CM_STATUS_NACKED                     BIT(5)
+#define I3CM_STATUS_IBITYPE(v)                 (((v) >> 6) & GENMASK(1, 0))
+#define I3CM_STATUS_IBITYPE_NONE               0
+#define I3CM_STATUS_IBITYPE_NORMAL             1
+#define I3CM_STATUS_IBITYPE_MASTER_REQ         2
+#define I3CM_STATUS_IBITYPE_HOT_JOIN           3
+#define I3CM_STATUS_SLVSTART                   BIT(8)
+#define I3CM_STATUS_MCTRLDONE                  BIT(9)
+#define I3CM_STATUS_COMPLETE                   BIT(10)
+#define I3CM_STATUS_RXPEND                     BIT(11)
+#define I3CM_STATUS_TXNOTFULL                  BIT(12)
+#define I3CM_STATUS_IBIWON                     BIT(13)
+#define I3CM_STATUS_ERRWARN                    BIT(15)
+#define I3CM_STATUS_NOWMASTER                  BIT(19)
+#define I3CM_STATUS_IBIADDR(v)                 (((v) >> 24) & GENMASK(6, 0))
+
+#define I3CM_IBIRULES                          0x08C
+
+#define I3CM_INT_ENABLE                                0x090
+#define I3CM_INT_CLEAR                         0x094
+#define I3CM_INT_STATUS                                0x098
+#define I3CM_INT_SLVSTART                      BIT(8)
+#define I3CM_INT_MCTRLDONE                     BIT(9)
+#define I3CM_INT_COMPLETE                      BIT(10)
+#define I3CM_INT_RXPEND                                BIT(11)
+#define I3CM_INT_TXNOTFULL                     BIT(12)
+#define I3CM_INT_IBIWON                                BIT(13)
+#define I3CM_INT_ERRWARN                       BIT(15)
+#define I3CM_INT_NOWMASTER                     BIT(19)
+
+#define I3CM_ERRWARN                           0x09C
+#define I3CM_ERRWARN_NACK                      BIT(2)
+#define I3CM_ERRWARN_WRABT                     BIT(3)
+#define I3CM_ERRWARN_TERM                      BIT(4)
+#define I3CM_ERRWARN_HPAR                      BIT(5)
+#define I3CM_ERRWARN_HCRC                      BIT(6)
+#define I3CM_ERRWARN_OREAD                     BIT(16)
+#define I3CM_ERRWARN_OWRITE                    BIT(17)
+#define I3CM_ERRWARN_MSGERR                    BIT(18)
+#define I3CM_ERRWARN_INVREQ                    BIT(19)
+#define I3CM_ERRWARN_TIMEOUT                   BIT(20)
+
+#define I3CM_DMACTRL                           0x0A0
+
+#define I3CM_DATACTRL                          0x0AC
+#define I3CM_DATACTRL_FLUSHTB                  BIT(0)
+#define I3CM_DATACTRL_FLUSHRB                  BIT(1)
+#define I3CM_DATACTRL_UNLOCK                   BIT(3)
+#define I3CM_DATACTRL_TXTRIG(nm)               (I3CM_DATACTRL_FIFOTRIG_##nm << 4)
+#define I3CM_DATACTRL_RXTRIG(nm)               (I3CM_DATACTRL_FIFOTRIG_##nm << 6)
+#define I3CM_DATACTRL_FIFOTRIG_EMPTY           0
+#define I3CM_DATACTRL_FIFOTRIG_QTR_FULL                1
+#define I3CM_DATACTRL_FIFOTRIG_HALF_FULL       2
+#define I3CM_DATACTRL_FIFOTRIG_TX_NOT_FULL     3
+#define I3CM_DATACTRL_FIFOTRIG_RX_3QTR_FULL    3
+#define I3CM_DATACTRL_TXCOUNT(x)               (((x) & GENMASK(4, 0)) << 16)
+#define I3CM_DATACTRL_RXCOUNT(x)               (((x) & GENMASK(4, 0)) << 24)
+#define I3CM_DATACTRL_TXFULL                   BIT(30)
+#define I3CM_DATACTRL_RXEMPTY                  BIT(31)
+
+#define I3CM_WDATAB                            0x0B0
+#define I3CM_WDATABE                           0x0B4
+#define I3CM_WDATAH                            0x0B8
+#define I3CM_WDATAHE                           0x0BC
+#define I3CM_RDATAB                            0x0C0
+#define I3CM_RDATAH                            0x0C8
+
+#define I3CM_WMSG_SDR                          0x0D0
+#define I3CM_WMSG_SDR_READ                     BIT(0)
+#define I3CM_WMSG_SDR_ADDR(x)                  (((x) & GENMASK(6, 0)) << 1)
+#define I3CM_WMSG_SDR_END_STOP                 BIT(8)
+#define I3CM_WMSG_SDR_MODE_I2C                 BIT(10)
+#define I3CM_WMSG_SDR_LEN(x)                   (((x) & GENMASK(4, 0)) << 11)
+
+#define I3CM_RMSG_SDR                          0x0D4
+#define I3CM_RMSG_SDR_DATA(v)                  ((v) & GENMASK(15, 0))
+#define I3CM_RMSG_SDR_CLEN(v)                  (((v) & GENMASK(21, 16)) >> 16)
+
+#define I3CM_WMSG_DDR                          0x0D8
+#define I3CM_WMSG_DDR_CTRL_LEN(x)              ((x) & GENMASK(9, 0))
+#define I3CM_WMSG_DDR_CTRL_END_EXIT_HDR                BIT(14)
+#define I3CM_WMSG_DDR_ADDRCMD_CMD(x)           ((x) & GENMASK(6, 0))
+#define I3CM_WMSG_DDR_ADDRCMD_READ             BIT(7)
+#define I3CM_WMSG_DDR_ADDRCMD_ADDR(x)          (((x) & GENMASK(6, 0)) << 9)
+#define I3CM_WMSG_DDR_DATA(x)                  ((x) & GENMASK(15, 0))
+
+#define I3CM_RMSG_DDR                          0x0DC
+#define I3CM_RMSG_DDR_DATA(v)                  ((v) & GENMASK(15, 0))
+#define I3CM_RMSG_DDR_CLEN(v)                  (((v) & GENMASK(25, 16)) >> 16)
+
+#define I3CM_DYNADDR                           0x0E4
+
+#define I3C_ID                                 0xFFC
+
+#define I3C_HW_FIFO_DEPTH 16
+
+/*
+ * Maximum number of devices (slaves and secondary masters) on the I3C bus.
+ * Device table is statically assigned at compile time, so this directly
+ * affects memory usage. Note that this could be increased to 32 if required.
+ * Device available flags can handle up to 32.
+ */
+#define I3C_MAX_DEVICES 16
+
+/* Size of provisional ID reported by I3C slave devices */
+#define I3C_PROV_ID_SIZE 8
+
+/* Max value for the /ref I3C_SCTRL_CFG_PPBAUD setting */
+#define I3C_PPBAUD_MAX 15
+
+/* Max value for the /ref I3C_SCTRL_CFG_PPLOW setting */
+#define I3C_PPLOW_MAX 15
+
+/* Max value for the /ref I3C_SCTRL_CFG_ODHPP setting */
+#define I3C_ODBAUD_MAX 255
+
+/* Max value for the /ref I3C_SCTRL_CFG_SKEW setting */
+#define I3C_SKEW_MAX 7
+
+/* Max value for the /ref I3C_SCTRL_CFG_I2CBAUD setting */
+#define I3C_I2CBAUD_MAX 15
+
+/*
+ * Invalid address value.
+ * used for device table init and unused devices in the device table.
+ */
+#define I3C_INVALID_ADDR 0xFF
+
+/* Maximum number of bytes read from an IBI */
+#define IBI_DATA_MAX_SIZE 4
+
+struct svc_i3c_master {
+       struct i3c_master_controller base;
+       void __iomem *regs;
+
+       struct clk *pclk;
+       struct clk *fclk_i3c;
+       struct clk *clk_slow_12_5;
+
+       struct completion daa_complete; // completion for daa process.
+};
+
+static struct svc_i3c_master *
+to_svc_i3c_master(struct i3c_master_controller *m)
+{
+       return container_of(m, struct svc_i3c_master, base);
+}
+
+static int svc_i3c_master_bus_init(struct i3c_master_controller *m)
+{
+       struct svc_i3c_master *master = to_svc_i3c_master(m);
+       struct i3c_device_info info = {};
+       int ret;
+
+       ret = i3c_master_get_free_addr(m, 0);
+       if (ret)
+               return ret;
+
+       /*
+        * TODO:
+        * Compute the I3CM_CTRL fields and set them here using iowrite32().
+        * No HAL please!
+        */
+
+       /* Set the PID, BCR, ... here */
+       info.dyn_addr = ret;
+       ret = i3c_master_set_info(&master->base, &info);
+       if (ret)
+               return ret;
+
+       /*
+        * TODO:
+        * Activate the I3C master in primary master mode here (iowrite32(I3CM_CONFIG)).
+        * No HAL please!
+        */
+       return 0;
+}
+
+static void svc_i3c_master_dequeue_rx(struct svc_i3c_master *master)
+{
+       u32 status = ioread32(master->regs + I3CM_STATUS);
+
+       /*
+        * TODO: dequeue the RX fifo and update pending request(s).
+        * No HAL please! Just plain register reads/writes and
+        * updates/completion pending xfers.
+        */
+}
+
+static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
+{
+       struct svc_i3c_master *master = dev_id;
+       u32 status;
+
+       status = ioread32(master->regs + I3CM_INT_STATUS);
+
+       if (status & I3CM_INT_RXPEND)
+               svc_i3c_master_dequeue_rx(master);
+
+       /*
+        * FIXME: should we clear the interrupt somewhere, or is it
+        * automatically cleared when reading the INT_STATUS register?
+        * Is it what INT_CLEAR is for?
+        */
+       return IRQ_HANDLED;
+}
+
+static const struct i3c_master_controller_ops svc_i3c_master_ops = {
+       .bus_init = svc_i3c_master_bus_init,
+       /* TODO: add other hooks here. */
+};
+
+static int svc_i3c_master_probe(struct platform_device *pdev)
+{
+       struct svc_i3c_master *master;
+       int ret, irq;
+
+       master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+       if (!master)
+               return -ENOMEM;
+
+       master->regs = devm_platform_ioremap_resource(pdev, 0);
+       if (IS_ERR(master->regs))
+               return PTR_ERR(master->regs);
+
+       master->pclk = devm_clk_get(&pdev->dev, "pclk");
+       if (IS_ERR(master->pclk))
+               return PTR_ERR(master->pclk);
+
+       master->fclk_i3c = devm_clk_get(&pdev->dev, "fclk_i3c_ms");
+       if (IS_ERR(master->fclk_i3c))
+               return PTR_ERR(master->fclk_i3c);
+
+       master->clk_slow_12_5 = devm_clk_get(&pdev->dev, "clk_slow_12p5mhz");
+       if (IS_ERR(master->clk_slow_12_5))
+               return PTR_ERR(master->clk_slow_12_5);
+
+       ret = clk_prepare_enable(master->pclk);
+       if (ret)
+               return ret;
+
+       ret = clk_prepare_enable(master->fclk_i3c);
+       if (ret)
+               goto err_disable_pclk;
+
+       ret = clk_prepare_enable(master->clk_slow_12_5);
+       if (ret)
+               goto err_disable_fclk_i3c;
+
+       irq = platform_get_irq(pdev, 0);
+       ret = devm_request_irq(&pdev->dev, irq, svc_i3c_master_irq_handler, 0,
+                              dev_name(&pdev->dev), master);
+       if (ret)
+               goto err_disable_clk_slow_12p5mhz;
+
+       platform_set_drvdata(pdev, master);
+
+       /* Register the master */
+       ret = i3c_master_register(&master->base, &pdev->dev,
+                                 &svc_i3c_master_ops, false);
+
+       if (ret)
+               goto  err_disable_clk_slow_12p5mhz;
+
+       return 0;
+
+err_disable_clk_slow_12p5mhz:
+       clk_disable_unprepare(master->clk_slow_12_5);
+
+err_disable_fclk_i3c:
+       clk_disable_unprepare(master->fclk_i3c);
+
+err_disable_pclk:
+       clk_disable_unprepare(master->pclk);
+
+       return ret;
+}
+
+/*
+ * Silvaco I3C DRM Driver Removal
+ *
+ * Executed by the kernel upon removal of the master device
+ * driver.
+ */
+static int svc_i3c_master_remove(struct platform_device *pdev)
+{
+       struct svc_i3c_master *master = platform_get_drvdata(pdev);
+       int ret;
+
+       ret = i3c_master_unregister(&master->base);
+       if (ret)
+               return ret;
+
+       clk_disable_unprepare(master->pclk);
+       clk_disable_unprepare(master->fclk_i3c);
+       clk_disable_unprepare(master->clk_slow_12_5);
+
+       return 0;
+}
+
+static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
+       { .compatible = "svc,i3c-master" },
+       { /* sentinel */ },
+};
+
+static struct platform_driver svc_i3c_master = {
+       .probe = svc_i3c_master_probe,
+       .remove = svc_i3c_master_remove,
+       .driver = {
+               .name = "svc-i3c-master",
+               .of_match_table = svc_i3c_master_of_match_tbl,
+       },
+};
+module_platform_driver(svc_i3c_master);
+
+MODULE_AUTHOR("Conor Culhane <conor.culhane@silvaco.com>");
+MODULE_DESCRIPTION("Silvaco I3C master driver");
+MODULE_LICENSE("GPL v2");


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
