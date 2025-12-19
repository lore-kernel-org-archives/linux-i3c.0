Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF28D78783
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFZiYyYIPAcy4J/VAYjkKYFopPX44N1Vu6/ewStmZ5c=; b=azNjK6URfj5ndJ
	WiMA8RNbn2Ux9iGmyNVC0y5EKnVJ3nk6LXZGjY060di6S3gXRSa33ODeT36kvHBA6PGj65ubUhcEa
	h9yjYA7c5H0wmvaXErmzEY8R0dRAsJ2mcvTirfZju+BwxdyZutHFsuKyjPCWfAJFgww9LpArL4fOg
	yR3R/3pAHYa+v0iaz9YAKdmuOHAQFisqmXLtjnI0BameRHMtpPESJMUEgH+faOvsTQXgaXBof8Fi1
	QDEDQc/sl26xfQuv/vuUiC+52L+FS0uhrQemG4cqXyYl82ELZ/OjGbyS5LIyKLxNmJHgwJPVoMBXf
	z9MJQS0sRkTf45dDFiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbkA-0000000ARXU-3JyX;
	Fri, 19 Dec 2025 14:46:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbk8-0000000ARND-2o2E
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 14:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155569; x=1797691569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jgGvQMvsR0W5t/Pp7kTuPsJ5Q9Q5bG+cv80rR4apcfE=;
  b=HlBis6IXzw4hFlcRvDu88QwIIjd/2RS2dl266couTezMEuITpR0YEmOp
   dH+ESGMt+dU4kB9AAdn1YwrsSXTKu/jiaNjChrFuK8KLlMc+CIaq+K3QH
   5kyBNwpCJNI78bJ2AaC2xkIxHDeh1PN8GUO3LmO3/lI8A8Z8JsQ/JqH2K
   nhI6v2UH91HMK5Y2z9X3hj9ye24EN5ShsCqn0Ja1KsmwkBfFnO+G/AuZK
   1xSIOslS/+iqJlXtfOJrsT0e7eoRQ//xHm6s6oshfEEammXoYPJIYXdVV
   fzT/yug0SL5lZlD+yIy35B7d5zdnRjcJ67iTByOJqn9Hs44qB2/oPXSci
   w==;
X-CSE-ConnectionGUID: JDCBGAoiQCKMKfbZ6LB88g==
X-CSE-MsgGUID: 4clsPa+qSoyAaA/TNiTzdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93588960"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="93588960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:08 -0800
X-CSE-ConnectionGUID: 01tN+wDgQRqTYAKyeUdEFg==
X-CSE-MsgGUID: w+bi00WIRHe9cftMua67VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229564028"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.200])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:46:06 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 09/17] i3c: mipi-i3c-hci: Introduce helper to restore DAT
Date: Fri, 19 Dec 2025 16:45:26 +0200
Message-ID: <20251219144534.84391-10-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219144534.84391-1-adrian.hunter@intel.com>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_064608_724103_2DF5B434 
X-CRM114-Status: GOOD (  10.13  )
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

Add a dedicated function to restore the Device Address Table (DAT) in
preparation for Runtime PM support.  This will allow reprogramming the DAT
after the controller resumes from a low-power state.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dat.h    | 1 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
index 5277c65fc601..6881f19da77f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat.h
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -24,6 +24,7 @@ struct hci_dat_ops {
 	void (*set_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
 	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
 	int (*get_index)(struct i3c_hci *hci, u8 address);
+	void (*restore)(struct i3c_hci *hci);
 };
 
 extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 644ab939be1c..852966aa20d9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -181,6 +181,14 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
 	return -ENODEV;
 }
 
+static void hci_dat_v1_restore(struct i3c_hci *hci)
+{
+	for (int i = 0; i < hci->DAT_entries; i++) {
+		writel(hci->DAT[i].w0, hci->DAT_regs + i * 8);
+		writel(hci->DAT[i].w1, hci->DAT_regs + i * 8 + 4);
+	}
+}
+
 const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.init			= hci_dat_v1_init,
 	.alloc_entry		= hci_dat_v1_alloc_entry,
@@ -190,4 +198,5 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
 	.set_flags		= hci_dat_v1_set_flags,
 	.clear_flags		= hci_dat_v1_clear_flags,
 	.get_index		= hci_dat_v1_get_index,
+	.restore		= hci_dat_v1_restore,
 };
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
