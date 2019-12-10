Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B60C3F68F
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7A22077B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EDt9aOGR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DF9bQBza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7A22077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zIyopAJp5xS2IkV7u6t+zWuIGn94KYcwjAJARo2iuWY=; b=EDt9aOGR7pEju9T7S/fqF9mAzx
	8AYyefWQWRoWLcT/bLbiPPurXK4ojT2kzqffG9Ke2/LHHffm2dw4Gnrg81l0/TEHS1S6QwhdBlXE0
	/8zAnxpVMiULqeVw4E2jcvV3vojePvWUJ2bBKBL3LNKFdd+I3siy6+CfE3oG41kWMz/qMiLF3+ZiO
	zjA6KkF3LLY90Ec7ANEjqf55YXWKRLCo6R0p4Rt009/TE+HrGXoWCp6Mv5d/5gaE+fEnG9ll7X/0t
	96lnWh7beKb095Fy9iex3TVA7+JX9TfL+vsT8BT/EiP0HfvxvJ9FTq/G47p0+Slo5vBfEeUYGoS2N
	bvodLI5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieha7-00044w-3r; Tue, 10 Dec 2019 15:37:47 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieha3-0003zA-Ap
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 15:37:45 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DDBC5405D3;
 Tue, 10 Dec 2019 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575992263; bh=VbA5BxszGxxpBvjX7QPw0ZeM5aDPv05lVfXsQi2i6zo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=DF9bQBzakzmR59p2IBRadN2EejZw/ho/g0KcA9oykCFDBiZmKAv0X0ZaonD17NAj8
 zgMxq4cAwrNLIUk/0N69+D9sadtdO4vPjmfkg95UZbvOQ9r6RUwbcBIihjSPnYSa35
 k62rUCRXIvIlOgFqrbhhDYPMx+RF0lhHOzxk3mtnv3AUAAf41Tq3E0OJ/5QZssC5or
 G3PRKd0M7ijrHXLDXYENXP6NlGb2+r9rb/we67RPWnGoIXZ3Yea6ek7BQgfGx8RCV3
 Z3JOkQCm667xqgPpwCeKYenjkHvAG+yuphC3yRl5GSVl+K+Nr8F9L55+xLdMtJlvMl
 p/DNNFA/6M/VA==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id A2D27A0087;
 Tue, 10 Dec 2019 15:37:36 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 8B6FB3E2D6;
 Tue, 10 Dec 2019 16:37:36 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [RFC 3/5] i3c: device: expose transfer strutures to uapi
Date: Tue, 10 Dec 2019 16:37:31 +0100
Message-Id: <fcc51a2758fd7920e1c0163a818fe7c12bd33765.1575977795.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575977795.git.vitor.soares@synopsys.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1575977795.git.vitor.soares@synopsys.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_073743_400121_5BE22421 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Joao.Pinto@synopsys.com, arnd@arndb.de, wsa@the-dreams.de,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, broonie@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Move i3c transfer related structures to uapi, so they can be access
by userspace.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 include/linux/i3c/device.h      | 54 +--------------------------------
 include/uapi/linux/i3c/device.h | 66 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 53 deletions(-)
 create mode 100644 include/uapi/linux/i3c/device.h

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index de102e4..1df05c2 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -14,59 +14,7 @@
 #include <linux/kconfig.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-
-/**
- * enum i3c_error_code - I3C error codes
- *
- * These are the standard error codes as defined by the I3C specification.
- * When -EIO is returned by the i3c_device_do_priv_xfers() or
- * i3c_device_send_hdr_cmds() one can check the error code in
- * &struct_i3c_priv_xfer.err or &struct i3c_hdr_cmd.err to get a better idea of
- * what went wrong.
- *
- * @I3C_ERROR_UNKNOWN: unknown error, usually means the error is not I3C
- *		       related
- * @I3C_ERROR_M0: M0 error
- * @I3C_ERROR_M1: M1 error
- * @I3C_ERROR_M2: M2 error
- */
-enum i3c_error_code {
-	I3C_ERROR_UNKNOWN = 0,
-	I3C_ERROR_M0 = 1,
-	I3C_ERROR_M1,
-	I3C_ERROR_M2,
-};
-
-/**
- * enum i3c_hdr_mode - HDR mode ids
- * @I3C_HDR_DDR: DDR mode
- * @I3C_HDR_TSP: TSP mode
- * @I3C_HDR_TSL: TSL mode
- */
-enum i3c_hdr_mode {
-	I3C_HDR_DDR,
-	I3C_HDR_TSP,
-	I3C_HDR_TSL,
-};
-
-/**
- * struct i3c_priv_xfer - I3C SDR private transfer
- * @rnw: encodes the transfer direction. true for a read, false for a write
- * @len: transfer length in bytes of the transfer
- * @data: input/output buffer
- * @data.in: input buffer. Must point to a DMA-able buffer
- * @data.out: output buffer. Must point to a DMA-able buffer
- * @err: I3C error code
- */
-struct i3c_priv_xfer {
-	u8 rnw;
-	u16 len;
-	union {
-		void *in;
-		const void *out;
-	} data;
-	enum i3c_error_code err;
-};
+#include <uapi/linux/i3c/device.h>
 
 /**
  * enum i3c_dcr - I3C DCR values
diff --git a/include/uapi/linux/i3c/device.h b/include/uapi/linux/i3c/device.h
new file mode 100644
index 0000000..edbb14d
--- /dev/null
+++ b/include/uapi/linux/i3c/device.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 Synopsys, Inc. and/or its affiliates.
+ *
+ * Author: Vitor Soares <vitor.soares@synopsys.com>
+ */
+
+#ifndef _UAPI_LINUX_I3C_DEVICE_H
+#define _UAPI_LINUX_I3C_DEVICE_H
+
+#include <linux/types.h>
+
+/**
+ * enum i3c_error_code - I3C error codes
+ *
+ * These are the standard error codes as defined by the I3C specification.
+ * When -EIO is returned by the i3c_device_do_priv_xfers() or
+ * i3c_device_send_hdr_cmds() one can check the error code in
+ * &struct_i3c_priv_xfer.err or &struct i3c_hdr_cmd.err to get a better idea of
+ * what went wrong.
+ *
+ * @I3C_ERROR_UNKNOWN: unknown error, usually means the error is not I3C
+ *		       related
+ * @I3C_ERROR_M0: M0 error
+ * @I3C_ERROR_M1: M1 error
+ * @I3C_ERROR_M2: M2 error
+ */
+enum i3c_error_code {
+	I3C_ERROR_UNKNOWN = 0,
+	I3C_ERROR_M0 = 1,
+	I3C_ERROR_M1,
+	I3C_ERROR_M2,
+};
+
+/**
+ * enum i3c_hdr_mode - HDR mode ids
+ * @I3C_HDR_DDR: DDR mode
+ * @I3C_HDR_TSP: TSP mode
+ * @I3C_HDR_TSL: TSL mode
+ */
+enum i3c_hdr_mode {
+	I3C_HDR_DDR,
+	I3C_HDR_TSP,
+	I3C_HDR_TSL,
+};
+
+/**
+ * struct i3c_priv_xfer - I3C SDR private transfer
+ * @rnw: encodes the transfer direction. true for a read, false for a write
+ * @len: transfer length in bytes of the transfer
+ * @data: input/output buffer
+ * @data.in: input buffer. Must point to a DMA-able buffer
+ * @data.out: output buffer. Must point to a DMA-able buffer
+ * @err: I3C error code
+ */
+struct i3c_priv_xfer {
+	u8 rnw;
+	u16 len;
+	union {
+		void *in;
+		const void *out;
+	} data;
+	enum i3c_error_code err;
+};
+
+#endif /* _UAPI_LINUX_I3C_DEVICE_H */
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
