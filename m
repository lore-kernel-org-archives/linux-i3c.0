Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3EBCFD635
	for <linux-i3c@archiver.kernel.org>; Thu,  8 Jan 2026 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YcofUwopiZfK+XDEbCHsIYXzig9yBr2jNs5irT9Fuw=; b=cJ5i+k6MTENuKe
	EAtgBdTrOCa7n1YUfssd32Zd/qBSqxlySOD8qPzc18IAbSGsvJU36aBfjil/9umQBpnnqQn0fyT8V
	NYy4Rqims5HEBBs7CufD0IaSNdDQSnJpD/I4r2ExhR4Gm0JX/9T1fqxZ82rgxQCRlOY9zOXivWrci
	lgALvCReAnkjtVmOwpB0Jx+NKkyxSmQ9g5ER+s5PL4MJ5A1HpVCLQz8JRop/va07rzeemS91ZEOyG
	ty0Ryl5zSECjuFobTRPJMF7AZ+Yzc4Z2UFAqcJxjGBiCaeOR9wYYRR5p/3Huh3JeRxvVGay5/VnYp
	oRX0a2lsqPcl+KbwOTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2m-0000000GDQR-2Plr;
	Thu, 08 Jan 2026 08:06:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2l-0000000GDPN-3ASM
	for linux-i3c@bombadil.infradead.org;
	Thu, 08 Jan 2026 08:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jCJpxn/Sx1Xuy3JkiBCK2A/lfl4041pvfg+M89Pix0I=; b=X8qV3/dT9QWroQlHI70G/zF7Hx
	dREu8cIFbBd7XwF65VLc7U6FcVJbhTQ4rbMA5MYU7CtB08npElWOSAnyZ/q9kY4oFvcnvVxif4+iG
	Gqt6Zmg+WQ1DNhA0L9fHdD8hPGHboBvKIU31GsJz1/IKQqnVA0PwukQHxjKnDD8QqSPmjmpTpBGRA
	1W0eFxXS+G/b65R4zF++UO45Jxi7GtvCrd7WBXoy3Bo0f0noye5OEto99EOWhKpmWHF4FELrteOLR
	M6f1EUrlPL1NnjUPaYQu7kj4Qq5qnkaYQg9EAKACFsILCKQZbfwftg3BT2IUWf36toEOO/IMJfZST
	bYhPwfWw==;
Received: from mgamail.intel.com ([192.198.163.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl2e-0000000ChvE-3ecG
	for linux-i3c@lists.infradead.org;
	Thu, 08 Jan 2026 08:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767859609; x=1799395609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4zYKXymbKbGluY2Vb+TSKjxFBMyExSXXnj1CdHlVji0=;
  b=QTNIPjYO9BYCFCx+ilDLBxJRjFegufUEKeXz3cLW+CPSPmuqWs3jlpR7
   zLhEd44BP69XQTG8Awq2rWLZ8lW4+35GFGrAMTVEBmTb93KNkXJGwtY6j
   eYKUc8mWr4jSa5Obwyv8OldI2ObQyMhutxSxfIfr9NpJ8Cg5vmh/oraW9
   9JCJLPutUNssCEw0RfH6N8U29IDweYnzF8U6A0AcQA7xqpBa+sEY43A3a
   8tM9booCGParR2h6TA3QT3jMEAjpQyW7/m7pg3zSHFsDvl9ohzOE29/tt
   P8u//sZ75v9n9exRnSWK2aZvtlkckeekDmTckV5Chgjxt4nxbpYS/8MF3
   w==;
X-CSE-ConnectionGUID: EVc4qeVTTqOn3IJaEkxKvQ==
X-CSE-MsgGUID: xnLLzgxoSTOOarrGNfyMTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56792356"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56792356"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:45 -0800
X-CSE-ConnectionGUID: /uAbthpqRCyDjLmBFDqlbQ==
X-CSE-MsgGUID: ppBJhKt5Qoyu59qDJQ/ICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203413640"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.195])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:06:43 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 17/20] i3c: mipi-i3c-hci: Factor out master dynamic address setting into helper
Date: Thu,  8 Jan 2026 10:05:55 +0200
Message-ID: <20260108080558.21767-18-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108080558.21767-1-adrian.hunter@intel.com>
References: <20260108080558.21767-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_080651_640625_DCA2AC8A 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Prepare for future reuse.  Move master dynamic address setting logic from
i3c_hci_bus_init() into a dedicated helper function,
i3c_hci_set_master_dyn_addr().

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:

	New patch


 drivers/i3c/master/mipi-i3c-hci/core.c | 12 +++++++++---
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index fc0a47a36961..ec5425f07635 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -114,6 +114,12 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
 	return container_of(m, struct i3c_hci, master);
 }
 
+static void i3c_hci_set_master_dyn_addr(struct i3c_hci *hci)
+{
+	reg_write(MASTER_DEVICE_ADDR,
+		  MASTER_DYNAMIC_ADDR(hci->dyn_addr) | MASTER_DYNAMIC_ADDR_VALID);
+}
+
 static int i3c_hci_bus_init(struct i3c_master_controller *m)
 {
 	struct i3c_hci *hci = to_i3c_hci(m);
@@ -129,10 +135,10 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
 		return ret;
-	reg_write(MASTER_DEVICE_ADDR,
-		  MASTER_DYNAMIC_ADDR(ret) | MASTER_DYNAMIC_ADDR_VALID);
+	hci->dyn_addr = ret;
+	i3c_hci_set_master_dyn_addr(hci);
 	memset(&info, 0, sizeof(info));
-	info.dyn_addr = ret;
+	info.dyn_addr = hci->dyn_addr;
 	ret = i3c_master_set_info(m, &info);
 	if (ret)
 		return ret;
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 38f927685d3b..ed89228ea971 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -62,6 +62,7 @@ struct i3c_hci {
 	u8 version_major;
 	u8 version_minor;
 	u8 revision;
+	u8 dyn_addr;
 	u32 vendor_mipi_id;
 	u32 vendor_version_id;
 	u32 vendor_product_id;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
